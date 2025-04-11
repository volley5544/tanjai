import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _employeeID =
          await secureStorage.getString('ff_employeeID') ?? _employeeID;
    });
    await _safeInitAsync(() async {
      _apiURLLocalState =
          await secureStorage.getString('ff_apiURLLocalState') ??
              _apiURLLocalState;
    });
    await _safeInitAsync(() async {
      _branchCode =
          await secureStorage.getString('ff_branchCode') ?? _branchCode;
    });
    await _safeInitAsync(() async {
      _doNotShowAgain =
          await secureStorage.getBool('ff_doNotShowAgain') ?? _doNotShowAgain;
    });
    await _safeInitAsync(() async {
      _dateDoNotShowAgain =
          await secureStorage.read(key: 'ff_dateDoNotShowAgain') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_dateDoNotShowAgain'))!)
              : _dateDoNotShowAgain;
    });
    await _safeInitAsync(() async {
      _pinCodeAuthen =
          await secureStorage.getString('ff_pinCodeAuthen') ?? _pinCodeAuthen;
    });
    await _safeInitAsync(() async {
      _userLogRef =
          (await secureStorage.getString('ff_userLogRef'))?.ref ?? _userLogRef;
    });
    await _safeInitAsync(() async {
      _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    });
    await _safeInitAsync(() async {
      _userNickname =
          await secureStorage.getString('ff_userNickname') ?? _userNickname;
    });
    await _safeInitAsync(() async {
      _leadIdCalledInApp =
          await secureStorage.getStringList('ff_leadIdCalledInApp') ??
              _leadIdCalledInApp;
    });
    await _safeInitAsync(() async {
      _firstUseApp =
          await secureStorage.getBool('ff_firstUseApp') ?? _firstUseApp;
    });
    await _safeInitAsync(() async {
      _DateHolidayNotShow =
          await secureStorage.read(key: 'ff_DateHolidayNotShow') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_DateHolidayNotShow'))!)
              : _DateHolidayNotShow;
    });
    await _safeInitAsync(() async {
      _firstLogin = await secureStorage.getBool('ff_firstLogin') ?? _firstLogin;
    });
    await _safeInitAsync(() async {
      _brachListNew =
          await secureStorage.getStringList('ff_brachListNew') ?? _brachListNew;
    });
    await _safeInitAsync(() async {
      _brachLatNew =
          await secureStorage.getStringList('ff_brachLatNew') ?? _brachLatNew;
    });
    await _safeInitAsync(() async {
      _brachLngNew =
          await secureStorage.getStringList('ff_brachLngNew') ?? _brachLngNew;
    });
    await _safeInitAsync(() async {
      _BrachRadNew =
          await secureStorage.getStringList('ff_BrachRadNew') ?? _BrachRadNew;
    });
    await _safeInitAsync(() async {
      _brachGroupNew =
          await secureStorage.getString('ff_brachGroupNew') ?? _brachGroupNew;
    });
    await _safeInitAsync(() async {
      _falselistPersistd =
          (await secureStorage.getStringList('ff_falselistPersistd'))
                  ?.map((x) => x == 'true')
                  .toList() ??
              _falselistPersistd;
    });
    await _safeInitAsync(() async {
      _BioAuthCheck =
          await secureStorage.getBool('ff_BioAuthCheck') ?? _BioAuthCheck;
    });
    await _safeInitAsync(() async {
      _profileImage =
          await secureStorage.getString('ff_profileImage') ?? _profileImage;
    });
    await _safeInitAsync(() async {
      _apiUrlInsuranceAppState =
          await secureStorage.getString('ff_apiUrlInsuranceAppState') ??
              _apiUrlInsuranceAppState;
    });
    await _safeInitAsync(() async {
      _fcmToken = await secureStorage.getString('ff_fcmToken') ?? _fcmToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _accessToken = 'access_token';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    secureStorage.setString('ff_accessToken', value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _imei = '123456789012345';
  String get imei => _imei;
  set imei(String value) {
    _imei = value;
  }

  String _employeeID = 'employee_id';
  String get employeeID => _employeeID;
  set employeeID(String value) {
    _employeeID = value;
    secureStorage.setString('ff_employeeID', value);
  }

  void deleteEmployeeID() {
    secureStorage.delete(key: 'ff_employeeID');
  }

  String _apiURLLocalState = 'api_url';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String value) {
    _apiURLLocalState = value;
    secureStorage.setString('ff_apiURLLocalState', value);
  }

  void deleteApiURLLocalState() {
    secureStorage.delete(key: 'ff_apiURLLocalState');
  }

  String _branchCode = 'branch_code';
  String get branchCode => _branchCode;
  set branchCode(String value) {
    _branchCode = value;
    secureStorage.setString('ff_branchCode', value);
  }

  void deleteBranchCode() {
    secureStorage.delete(key: 'ff_branchCode');
  }

  List<String> _vloanServerListTemp = [];
  List<String> get vloanServerListTemp => _vloanServerListTemp;
  set vloanServerListTemp(List<String> value) {
    _vloanServerListTemp = value;
  }

  void addToVloanServerListTemp(String value) {
    vloanServerListTemp.add(value);
  }

  void removeFromVloanServerListTemp(String value) {
    vloanServerListTemp.remove(value);
  }

  void removeAtIndexFromVloanServerListTemp(int index) {
    vloanServerListTemp.removeAt(index);
  }

  void updateVloanServerListTempAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vloanServerListTemp[index] = updateFn(_vloanServerListTemp[index]);
  }

  void insertAtIndexInVloanServerListTemp(int index, String value) {
    vloanServerListTemp.insert(index, value);
  }

  List<String> _leadID = [];
  List<String> get leadID => _leadID;
  set leadID(List<String> value) {
    _leadID = value;
  }

  void addToLeadID(String value) {
    leadID.add(value);
  }

  void removeFromLeadID(String value) {
    leadID.remove(value);
  }

  void removeAtIndexFromLeadID(int index) {
    leadID.removeAt(index);
  }

  void updateLeadIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadID[index] = updateFn(_leadID[index]);
  }

  void insertAtIndexInLeadID(int index, String value) {
    leadID.insert(index, value);
  }

  List<DateTime> _leadTimeRemainList = [];
  List<DateTime> get leadTimeRemainList => _leadTimeRemainList;
  set leadTimeRemainList(List<DateTime> value) {
    _leadTimeRemainList = value;
  }

  void addToLeadTimeRemainList(DateTime value) {
    leadTimeRemainList.add(value);
  }

  void removeFromLeadTimeRemainList(DateTime value) {
    leadTimeRemainList.remove(value);
  }

  void removeAtIndexFromLeadTimeRemainList(int index) {
    leadTimeRemainList.removeAt(index);
  }

  void updateLeadTimeRemainListAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    leadTimeRemainList[index] = updateFn(_leadTimeRemainList[index]);
  }

  void insertAtIndexInLeadTimeRemainList(int index, DateTime value) {
    leadTimeRemainList.insert(index, value);
  }

  List<String> _leadCustomerNameList = [];
  List<String> get leadCustomerNameList => _leadCustomerNameList;
  set leadCustomerNameList(List<String> value) {
    _leadCustomerNameList = value;
  }

  void addToLeadCustomerNameList(String value) {
    leadCustomerNameList.add(value);
  }

  void removeFromLeadCustomerNameList(String value) {
    leadCustomerNameList.remove(value);
  }

  void removeAtIndexFromLeadCustomerNameList(int index) {
    leadCustomerNameList.removeAt(index);
  }

  void updateLeadCustomerNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCustomerNameList[index] = updateFn(_leadCustomerNameList[index]);
  }

  void insertAtIndexInLeadCustomerNameList(int index, String value) {
    leadCustomerNameList.insert(index, value);
  }

  String _coachURL = 'https://hris.srisawadpower.com/COACH';
  String get coachURL => _coachURL;
  set coachURL(String value) {
    _coachURL = value;
  }

  bool _isInApp = false;
  bool get isInApp => _isInApp;
  set isInApp(bool value) {
    _isInApp = value;
  }

  bool _inAppViaNotification = true;
  bool get inAppViaNotification => _inAppViaNotification;
  set inAppViaNotification(bool value) {
    _inAppViaNotification = value;
  }

  bool _doNotShowAgain = false;
  bool get doNotShowAgain => _doNotShowAgain;
  set doNotShowAgain(bool value) {
    _doNotShowAgain = value;
    secureStorage.setBool('ff_doNotShowAgain', value);
  }

  void deleteDoNotShowAgain() {
    secureStorage.delete(key: 'ff_doNotShowAgain');
  }

  DateTime? _dateDoNotShowAgain;
  DateTime? get dateDoNotShowAgain => _dateDoNotShowAgain;
  set dateDoNotShowAgain(DateTime? value) {
    _dateDoNotShowAgain = value;
    value != null
        ? secureStorage.setInt(
            'ff_dateDoNotShowAgain', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateDoNotShowAgain');
  }

  void deleteDateDoNotShowAgain() {
    secureStorage.delete(key: 'ff_dateDoNotShowAgain');
  }

  bool _check = false;
  bool get check => _check;
  set check(bool value) {
    _check = value;
  }

  bool _opsMenuVisible = false;
  bool get opsMenuVisible => _opsMenuVisible;
  set opsMenuVisible(bool value) {
    _opsMenuVisible = value;
  }

  List<String> _bannerSuperAppImgList = [];
  List<String> get bannerSuperAppImgList => _bannerSuperAppImgList;
  set bannerSuperAppImgList(List<String> value) {
    _bannerSuperAppImgList = value;
  }

  void addToBannerSuperAppImgList(String value) {
    bannerSuperAppImgList.add(value);
  }

  void removeFromBannerSuperAppImgList(String value) {
    bannerSuperAppImgList.remove(value);
  }

  void removeAtIndexFromBannerSuperAppImgList(int index) {
    bannerSuperAppImgList.removeAt(index);
  }

  void updateBannerSuperAppImgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bannerSuperAppImgList[index] = updateFn(_bannerSuperAppImgList[index]);
  }

  void insertAtIndexInBannerSuperAppImgList(int index, String value) {
    bannerSuperAppImgList.insert(index, value);
  }

  int _diffDate = -99;
  int get diffDate => _diffDate;
  set diffDate(int value) {
    _diffDate = value;
  }

  bool _isFromAuthenPage = false;
  bool get isFromAuthenPage => _isFromAuthenPage;
  set isFromAuthenPage(bool value) {
    _isFromAuthenPage = value;
  }

  String _pinCodeAuthen = '013972';
  String get pinCodeAuthen => _pinCodeAuthen;
  set pinCodeAuthen(String value) {
    _pinCodeAuthen = value;
    secureStorage.setString('ff_pinCodeAuthen', value);
  }

  void deletePinCodeAuthen() {
    secureStorage.delete(key: 'ff_pinCodeAuthen');
  }

  bool _isFromLoginPage = false;
  bool get isFromLoginPage => _isFromLoginPage;
  set isFromLoginPage(bool value) {
    _isFromLoginPage = value;
  }

  bool _isGotNoti = false;
  bool get isGotNoti => _isGotNoti;
  set isGotNoti(bool value) {
    _isGotNoti = value;
  }

  String _isGottNoti = '';
  String get isGottNoti => _isGottNoti;
  set isGottNoti(String value) {
    _isGottNoti = value;
  }

  List<String> _leadChannelPairColorList = [];
  List<String> get leadChannelPairColorList => _leadChannelPairColorList;
  set leadChannelPairColorList(List<String> value) {
    _leadChannelPairColorList = value;
  }

  void addToLeadChannelPairColorList(String value) {
    leadChannelPairColorList.add(value);
  }

  void removeFromLeadChannelPairColorList(String value) {
    leadChannelPairColorList.remove(value);
  }

  void removeAtIndexFromLeadChannelPairColorList(int index) {
    leadChannelPairColorList.removeAt(index);
  }

  void updateLeadChannelPairColorListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelPairColorList[index] =
        updateFn(_leadChannelPairColorList[index]);
  }

  void insertAtIndexInLeadChannelPairColorList(int index, String value) {
    leadChannelPairColorList.insert(index, value);
  }

  List<String> _leadChannelList = [];
  List<String> get leadChannelList => _leadChannelList;
  set leadChannelList(List<String> value) {
    _leadChannelList = value;
  }

  void addToLeadChannelList(String value) {
    leadChannelList.add(value);
  }

  void removeFromLeadChannelList(String value) {
    leadChannelList.remove(value);
  }

  void removeAtIndexFromLeadChannelList(int index) {
    leadChannelList.removeAt(index);
  }

  void updateLeadChannelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelList[index] = updateFn(_leadChannelList[index]);
  }

  void insertAtIndexInLeadChannelList(int index, String value) {
    leadChannelList.insert(index, value);
  }

  List<String> _leadChannelColor = [];
  List<String> get leadChannelColor => _leadChannelColor;
  set leadChannelColor(List<String> value) {
    _leadChannelColor = value;
  }

  void addToLeadChannelColor(String value) {
    leadChannelColor.add(value);
  }

  void removeFromLeadChannelColor(String value) {
    leadChannelColor.remove(value);
  }

  void removeAtIndexFromLeadChannelColor(int index) {
    leadChannelColor.removeAt(index);
  }

  void updateLeadChannelColorAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelColor[index] = updateFn(_leadChannelColor[index]);
  }

  void insertAtIndexInLeadChannelColor(int index, String value) {
    leadChannelColor.insert(index, value);
  }

  bool _isFromSetPinPage = false;
  bool get isFromSetPinPage => _isFromSetPinPage;
  set isFromSetPinPage(bool value) {
    _isFromSetPinPage = value;
  }

  DocumentReference? _userLogRef =
      FirebaseFirestore.instance.doc('/user_log/[user_log]');
  DocumentReference? get userLogRef => _userLogRef;
  set userLogRef(DocumentReference? value) {
    _userLogRef = value;
    value != null
        ? secureStorage.setString('ff_userLogRef', value.path)
        : secureStorage.remove('ff_userLogRef');
  }

  void deleteUserLogRef() {
    secureStorage.delete(key: 'ff_userLogRef');
  }

  DocumentReference? _checkUserRef;
  DocumentReference? get checkUserRef => _checkUserRef;
  set checkUserRef(DocumentReference? value) {
    _checkUserRef = value;
  }

  String _temp1 = '';
  String get temp1 => _temp1;
  set temp1(String value) {
    _temp1 = value;
  }

  String _temp2 = '';
  String get temp2 => _temp2;
  set temp2(String value) {
    _temp2 = value;
  }

  DateTime? _temp3;
  DateTime? get temp3 => _temp3;
  set temp3(DateTime? value) {
    _temp3 = value;
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? value) {
    _userRef = value;
    value != null
        ? secureStorage.setString('ff_userRef', value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  String _loginStateFirebase = '[loginStateFirebase]';
  String get loginStateFirebase => _loginStateFirebase;
  set loginStateFirebase(String value) {
    _loginStateFirebase = value;
  }

  List<String> _leadCreatedTimeList = [];
  List<String> get leadCreatedTimeList => _leadCreatedTimeList;
  set leadCreatedTimeList(List<String> value) {
    _leadCreatedTimeList = value;
  }

  void addToLeadCreatedTimeList(String value) {
    leadCreatedTimeList.add(value);
  }

  void removeFromLeadCreatedTimeList(String value) {
    leadCreatedTimeList.remove(value);
  }

  void removeAtIndexFromLeadCreatedTimeList(int index) {
    leadCreatedTimeList.removeAt(index);
  }

  void updateLeadCreatedTimeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCreatedTimeList[index] = updateFn(_leadCreatedTimeList[index]);
  }

  void insertAtIndexInLeadCreatedTimeList(int index, String value) {
    leadCreatedTimeList.insert(index, value);
  }

  List<String> _leadCallStatus = [];
  List<String> get leadCallStatus => _leadCallStatus;
  set leadCallStatus(List<String> value) {
    _leadCallStatus = value;
  }

  void addToLeadCallStatus(String value) {
    leadCallStatus.add(value);
  }

  void removeFromLeadCallStatus(String value) {
    leadCallStatus.remove(value);
  }

  void removeAtIndexFromLeadCallStatus(int index) {
    leadCallStatus.removeAt(index);
  }

  void updateLeadCallStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCallStatus[index] = updateFn(_leadCallStatus[index]);
  }

  void insertAtIndexInLeadCallStatus(int index, String value) {
    leadCallStatus.insert(index, value);
  }

  List<String> _leadPhoneNumberList = [];
  List<String> get leadPhoneNumberList => _leadPhoneNumberList;
  set leadPhoneNumberList(List<String> value) {
    _leadPhoneNumberList = value;
  }

  void addToLeadPhoneNumberList(String value) {
    leadPhoneNumberList.add(value);
  }

  void removeFromLeadPhoneNumberList(String value) {
    leadPhoneNumberList.remove(value);
  }

  void removeAtIndexFromLeadPhoneNumberList(int index) {
    leadPhoneNumberList.removeAt(index);
  }

  void updateLeadPhoneNumberListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhoneNumberList[index] = updateFn(_leadPhoneNumberList[index]);
  }

  void insertAtIndexInLeadPhoneNumberList(int index, String value) {
    leadPhoneNumberList.insert(index, value);
  }

  List<String> _leadEmployeeID = [];
  List<String> get leadEmployeeID => _leadEmployeeID;
  set leadEmployeeID(List<String> value) {
    _leadEmployeeID = value;
  }

  void addToLeadEmployeeID(String value) {
    leadEmployeeID.add(value);
  }

  void removeFromLeadEmployeeID(String value) {
    leadEmployeeID.remove(value);
  }

  void removeAtIndexFromLeadEmployeeID(int index) {
    leadEmployeeID.removeAt(index);
  }

  void updateLeadEmployeeIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadEmployeeID[index] = updateFn(_leadEmployeeID[index]);
  }

  void insertAtIndexInLeadEmployeeID(int index, String value) {
    leadEmployeeID.insert(index, value);
  }

  bool _isPassLoginSection = false;
  bool get isPassLoginSection => _isPassLoginSection;
  set isPassLoginSection(bool value) {
    _isPassLoginSection = value;
  }

  List<Color> _leadChannelLabelColor = [];
  List<Color> get leadChannelLabelColor => _leadChannelLabelColor;
  set leadChannelLabelColor(List<Color> value) {
    _leadChannelLabelColor = value;
  }

  void addToLeadChannelLabelColor(Color value) {
    leadChannelLabelColor.add(value);
  }

  void removeFromLeadChannelLabelColor(Color value) {
    leadChannelLabelColor.remove(value);
  }

  void removeAtIndexFromLeadChannelLabelColor(int index) {
    leadChannelLabelColor.removeAt(index);
  }

  void updateLeadChannelLabelColorAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    leadChannelLabelColor[index] = updateFn(_leadChannelLabelColor[index]);
  }

  void insertAtIndexInLeadChannelLabelColor(int index, Color value) {
    leadChannelLabelColor.insert(index, value);
  }

  String _userNickname = '[user_nickname]';
  String get userNickname => _userNickname;
  set userNickname(String value) {
    _userNickname = value;
    secureStorage.setString('ff_userNickname', value);
  }

  void deleteUserNickname() {
    secureStorage.delete(key: 'ff_userNickname');
  }

  List<String> _leadIdCalledInApp = [];
  List<String> get leadIdCalledInApp => _leadIdCalledInApp;
  set leadIdCalledInApp(List<String> value) {
    _leadIdCalledInApp = value;
    secureStorage.setStringList('ff_leadIdCalledInApp', value);
  }

  void deleteLeadIdCalledInApp() {
    secureStorage.delete(key: 'ff_leadIdCalledInApp');
  }

  void addToLeadIdCalledInApp(String value) {
    leadIdCalledInApp.add(value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeFromLeadIdCalledInApp(String value) {
    leadIdCalledInApp.remove(value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeAtIndexFromLeadIdCalledInApp(int index) {
    leadIdCalledInApp.removeAt(index);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void updateLeadIdCalledInAppAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadIdCalledInApp[index] = updateFn(_leadIdCalledInApp[index]);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void insertAtIndexInLeadIdCalledInApp(int index, String value) {
    leadIdCalledInApp.insert(index, value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  String _profileFullName = '[full_name]';
  String get profileFullName => _profileFullName;
  set profileFullName(String value) {
    _profileFullName = value;
  }

  String _profileBirthDate = '[birth_date]';
  String get profileBirthDate => _profileBirthDate;
  set profileBirthDate(String value) {
    _profileBirthDate = value;
  }

  String _profileUnitCodeName = '[unit_code_name]';
  String get profileUnitCodeName => _profileUnitCodeName;
  set profileUnitCodeName(String value) {
    _profileUnitCodeName = value;
  }

  String _profileParentUnit = '[parent_unit]';
  String get profileParentUnit => _profileParentUnit;
  set profileParentUnit(String value) {
    _profileParentUnit = value;
  }

  String _profileRegion = '[region]';
  String get profileRegion => _profileRegion;
  set profileRegion(String value) {
    _profileRegion = value;
  }

  String _profileHiredDate = '[hired_date]';
  String get profileHiredDate => _profileHiredDate;
  set profileHiredDate(String value) {
    _profileHiredDate = value;
  }

  String _profileServiceDuration = '[service_duration]';
  String get profileServiceDuration => _profileServiceDuration;
  set profileServiceDuration(String value) {
    _profileServiceDuration = value;
  }

  String _profilePositionAge = '[position_age]';
  String get profilePositionAge => _profilePositionAge;
  set profilePositionAge(String value) {
    _profilePositionAge = value;
  }

  String _profilePositionName = '[position_name]';
  String get profilePositionName => _profilePositionName;
  set profilePositionName(String value) {
    _profilePositionName = value;
  }

  List<String> _dailySplashPageText = [
    'จันทร์แล้ว จันทร์จ้า สดใสซาบซ่า รับแต่สิ่งดี ๆ เข้ามาตลอดวัน',
    'สวัสดีวันอังคาร สดชื่นแจ่มใส คิดอะไรก็สมดั่งใจ อย่ามีอันตรายใดมาแผ้วพาน',
    'วันพุธสุดสดชื่น ขอให้มีความรักที่ชื่นมื่น มีแต่ความสุขใจทุกคืนวัน',
    'สวัสดีวันพฤหัสบดี ทักทายยามเช้าที่สดใส ขอให้ทำอะไร อยู่ที่ไหน มีแต่ความสุขกายสบายใจ',
    'สวัสดีวันศุกร์ สุขกาย สุขใจ สุขภาพแข็งแรง ปลอดภัยตลอดวัน',
    'Hello Saturday ขอให้ชีวิตชื่นมื่น ความรักก็ไม่ขมขื่น มีแต่ความเริงรื่นในหัวใจ',
    'สุขสันต์วันอาทิตย์ ขอให้มีสติคิดการณ์ใหญ่ มองเห็นหนทางที่กว้างไกล สู้สร้างฝันต่อไปให้สำเร็จ'
  ];
  List<String> get dailySplashPageText => _dailySplashPageText;
  set dailySplashPageText(List<String> value) {
    _dailySplashPageText = value;
  }

  void addToDailySplashPageText(String value) {
    dailySplashPageText.add(value);
  }

  void removeFromDailySplashPageText(String value) {
    dailySplashPageText.remove(value);
  }

  void removeAtIndexFromDailySplashPageText(int index) {
    dailySplashPageText.removeAt(index);
  }

  void updateDailySplashPageTextAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dailySplashPageText[index] = updateFn(_dailySplashPageText[index]);
  }

  void insertAtIndexInDailySplashPageText(int index, String value) {
    dailySplashPageText.insert(index, value);
  }

  List<String> _leadBranchCode = [];
  List<String> get leadBranchCode => _leadBranchCode;
  set leadBranchCode(List<String> value) {
    _leadBranchCode = value;
  }

  void addToLeadBranchCode(String value) {
    leadBranchCode.add(value);
  }

  void removeFromLeadBranchCode(String value) {
    leadBranchCode.remove(value);
  }

  void removeAtIndexFromLeadBranchCode(int index) {
    leadBranchCode.removeAt(index);
  }

  void updateLeadBranchCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadBranchCode[index] = updateFn(_leadBranchCode[index]);
  }

  void insertAtIndexInLeadBranchCode(int index, String value) {
    leadBranchCode.insert(index, value);
  }

  String _leadUserLevel = 'lead_user_level';
  String get leadUserLevel => _leadUserLevel;
  set leadUserLevel(String value) {
    _leadUserLevel = value;
  }

  List<int> _leadChannelAmountList = [0, 0, 0, 0];
  List<int> get leadChannelAmountList => _leadChannelAmountList;
  set leadChannelAmountList(List<int> value) {
    _leadChannelAmountList = value;
  }

  void addToLeadChannelAmountList(int value) {
    leadChannelAmountList.add(value);
  }

  void removeFromLeadChannelAmountList(int value) {
    leadChannelAmountList.remove(value);
  }

  void removeAtIndexFromLeadChannelAmountList(int index) {
    leadChannelAmountList.removeAt(index);
  }

  void updateLeadChannelAmountListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    leadChannelAmountList[index] = updateFn(_leadChannelAmountList[index]);
  }

  void insertAtIndexInLeadChannelAmountList(int index, int value) {
    leadChannelAmountList.insert(index, value);
  }

  String _leadChannelSelected = 'All';
  String get leadChannelSelected => _leadChannelSelected;
  set leadChannelSelected(String value) {
    _leadChannelSelected = value;
  }

  String _dailyText = 'daily_text';
  String get dailyText => _dailyText;
  set dailyText(String value) {
    _dailyText = value;
  }

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool value) {
    _firstUseApp = value;
    secureStorage.setBool('ff_firstUseApp', value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  int _introPageIndex = 1;
  int get introPageIndex => _introPageIndex;
  set introPageIndex(int value) {
    _introPageIndex = value;
  }

  LatLng? _HOLocation = LatLng(13.888767, 100.575308);
  LatLng? get HOLocation => _HOLocation;
  set HOLocation(LatLng? value) {
    _HOLocation = value;
  }

  List<String> _adminEmployeeID = ['31622', '23328', '30427', '33511'];
  List<String> get adminEmployeeID => _adminEmployeeID;
  set adminEmployeeID(List<String> value) {
    _adminEmployeeID = value;
  }

  void addToAdminEmployeeID(String value) {
    adminEmployeeID.add(value);
  }

  void removeFromAdminEmployeeID(String value) {
    adminEmployeeID.remove(value);
  }

  void removeAtIndexFromAdminEmployeeID(int index) {
    adminEmployeeID.removeAt(index);
  }

  void updateAdminEmployeeIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminEmployeeID[index] = updateFn(_adminEmployeeID[index]);
  }

  void insertAtIndexInAdminEmployeeID(int index, String value) {
    adminEmployeeID.insert(index, value);
  }

  String _profilePositionAgeCheck = '[position_age_check]';
  String get profilePositionAgeCheck => _profilePositionAgeCheck;
  set profilePositionAgeCheck(String value) {
    _profilePositionAgeCheck = value;
  }

  DateTime? _dcvdf;
  DateTime? get dcvdf => _dcvdf;
  set dcvdf(DateTime? value) {
    _dcvdf = value;
  }

  String _firebaseUserUID = '';
  String get firebaseUserUID => _firebaseUserUID;
  set firebaseUserUID(String value) {
    _firebaseUserUID = value;
  }

  int _RatingNumber = 0;
  int get RatingNumber => _RatingNumber;
  set RatingNumber(int value) {
    _RatingNumber = value;
  }

  List<String> _branchList = [' '];
  List<String> get branchList => _branchList;
  set branchList(List<String> value) {
    _branchList = value;
  }

  void addToBranchList(String value) {
    branchList.add(value);
  }

  void removeFromBranchList(String value) {
    branchList.remove(value);
  }

  void removeAtIndexFromBranchList(int index) {
    branchList.removeAt(index);
  }

  void updateBranchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchList[index] = updateFn(_branchList[index]);
  }

  void insertAtIndexInBranchList(int index, String value) {
    branchList.insert(index, value);
  }

  String _branchGroup = 'ทั่วไป';
  String get branchGroup => _branchGroup;
  set branchGroup(String value) {
    _branchGroup = value;
  }

  List<String> _branchLat = ['Hello World'];
  List<String> get branchLat => _branchLat;
  set branchLat(List<String> value) {
    _branchLat = value;
  }

  void addToBranchLat(String value) {
    branchLat.add(value);
  }

  void removeFromBranchLat(String value) {
    branchLat.remove(value);
  }

  void removeAtIndexFromBranchLat(int index) {
    branchLat.removeAt(index);
  }

  void updateBranchLatAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchLat[index] = updateFn(_branchLat[index]);
  }

  void insertAtIndexInBranchLat(int index, String value) {
    branchLat.insert(index, value);
  }

  List<String> _branchLng = ['99'];
  List<String> get branchLng => _branchLng;
  set branchLng(List<String> value) {
    _branchLng = value;
  }

  void addToBranchLng(String value) {
    branchLng.add(value);
  }

  void removeFromBranchLng(String value) {
    branchLng.remove(value);
  }

  void removeAtIndexFromBranchLng(int index) {
    branchLng.removeAt(index);
  }

  void updateBranchLngAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchLng[index] = updateFn(_branchLng[index]);
  }

  void insertAtIndexInBranchLng(int index, String value) {
    branchLng.insert(index, value);
  }

  List<String> _branchRad = ['98'];
  List<String> get branchRad => _branchRad;
  set branchRad(List<String> value) {
    _branchRad = value;
  }

  void addToBranchRad(String value) {
    branchRad.add(value);
  }

  void removeFromBranchRad(String value) {
    branchRad.remove(value);
  }

  void removeAtIndexFromBranchRad(int index) {
    branchRad.removeAt(index);
  }

  void updateBranchRadAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchRad[index] = updateFn(_branchRad[index]);
  }

  void insertAtIndexInBranchRad(int index, String value) {
    branchRad.insert(index, value);
  }

  LatLng? _branchLo;
  LatLng? get branchLo => _branchLo;
  set branchLo(LatLng? value) {
    _branchLo = value;
  }

  String _currentTime = '';
  String get currentTime => _currentTime;
  set currentTime(String value) {
    _currentTime = value;
  }

  String _currentDate = '';
  String get currentDate => _currentDate;
  set currentDate(String value) {
    _currentDate = value;
  }

  double _currentRadius = 0.0;
  double get currentRadius => _currentRadius;
  set currentRadius(double value) {
    _currentRadius = value;
  }

  String _flag = '';
  String get flag => _flag;
  set flag(String value) {
    _flag = value;
  }

  String _branchLoString = '';
  String get branchLoString => _branchLoString;
  set branchLoString(String value) {
    _branchLoString = value;
  }

  List<String> _checkinStatusBranch = [];
  List<String> get checkinStatusBranch => _checkinStatusBranch;
  set checkinStatusBranch(List<String> value) {
    _checkinStatusBranch = value;
  }

  void addToCheckinStatusBranch(String value) {
    checkinStatusBranch.add(value);
  }

  void removeFromCheckinStatusBranch(String value) {
    checkinStatusBranch.remove(value);
  }

  void removeAtIndexFromCheckinStatusBranch(int index) {
    checkinStatusBranch.removeAt(index);
  }

  void updateCheckinStatusBranchAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusBranch[index] = updateFn(_checkinStatusBranch[index]);
  }

  void insertAtIndexInCheckinStatusBranch(int index, String value) {
    checkinStatusBranch.insert(index, value);
  }

  List<String> _checkinStatusDate = [];
  List<String> get checkinStatusDate => _checkinStatusDate;
  set checkinStatusDate(List<String> value) {
    _checkinStatusDate = value;
  }

  void addToCheckinStatusDate(String value) {
    checkinStatusDate.add(value);
  }

  void removeFromCheckinStatusDate(String value) {
    checkinStatusDate.remove(value);
  }

  void removeAtIndexFromCheckinStatusDate(int index) {
    checkinStatusDate.removeAt(index);
  }

  void updateCheckinStatusDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusDate[index] = updateFn(_checkinStatusDate[index]);
  }

  void insertAtIndexInCheckinStatusDate(int index, String value) {
    checkinStatusDate.insert(index, value);
  }

  List<String> _checkinStatusTime = [];
  List<String> get checkinStatusTime => _checkinStatusTime;
  set checkinStatusTime(List<String> value) {
    _checkinStatusTime = value;
  }

  void addToCheckinStatusTime(String value) {
    checkinStatusTime.add(value);
  }

  void removeFromCheckinStatusTime(String value) {
    checkinStatusTime.remove(value);
  }

  void removeAtIndexFromCheckinStatusTime(int index) {
    checkinStatusTime.removeAt(index);
  }

  void updateCheckinStatusTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTime[index] = updateFn(_checkinStatusTime[index]);
  }

  void insertAtIndexInCheckinStatusTime(int index, String value) {
    checkinStatusTime.insert(index, value);
  }

  List<String> _checkinStatusAction = [];
  List<String> get checkinStatusAction => _checkinStatusAction;
  set checkinStatusAction(List<String> value) {
    _checkinStatusAction = value;
  }

  void addToCheckinStatusAction(String value) {
    checkinStatusAction.add(value);
  }

  void removeFromCheckinStatusAction(String value) {
    checkinStatusAction.remove(value);
  }

  void removeAtIndexFromCheckinStatusAction(int index) {
    checkinStatusAction.removeAt(index);
  }

  void updateCheckinStatusActionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusAction[index] = updateFn(_checkinStatusAction[index]);
  }

  void insertAtIndexInCheckinStatusAction(int index, String value) {
    checkinStatusAction.insert(index, value);
  }

  List<String> _checkinStatusTimeIn = [];
  List<String> get checkinStatusTimeIn => _checkinStatusTimeIn;
  set checkinStatusTimeIn(List<String> value) {
    _checkinStatusTimeIn = value;
  }

  void addToCheckinStatusTimeIn(String value) {
    checkinStatusTimeIn.add(value);
  }

  void removeFromCheckinStatusTimeIn(String value) {
    checkinStatusTimeIn.remove(value);
  }

  void removeAtIndexFromCheckinStatusTimeIn(int index) {
    checkinStatusTimeIn.removeAt(index);
  }

  void updateCheckinStatusTimeInAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTimeIn[index] = updateFn(_checkinStatusTimeIn[index]);
  }

  void insertAtIndexInCheckinStatusTimeIn(int index, String value) {
    checkinStatusTimeIn.insert(index, value);
  }

  List<String> _checkinStatusTimeOut = [];
  List<String> get checkinStatusTimeOut => _checkinStatusTimeOut;
  set checkinStatusTimeOut(List<String> value) {
    _checkinStatusTimeOut = value;
  }

  void addToCheckinStatusTimeOut(String value) {
    checkinStatusTimeOut.add(value);
  }

  void removeFromCheckinStatusTimeOut(String value) {
    checkinStatusTimeOut.remove(value);
  }

  void removeAtIndexFromCheckinStatusTimeOut(int index) {
    checkinStatusTimeOut.removeAt(index);
  }

  void updateCheckinStatusTimeOutAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTimeOut[index] = updateFn(_checkinStatusTimeOut[index]);
  }

  void insertAtIndexInCheckinStatusTimeOut(int index, String value) {
    checkinStatusTimeOut.insert(index, value);
  }

  List<String> _checkinStatusDateFlag = [];
  List<String> get checkinStatusDateFlag => _checkinStatusDateFlag;
  set checkinStatusDateFlag(List<String> value) {
    _checkinStatusDateFlag = value;
  }

  void addToCheckinStatusDateFlag(String value) {
    checkinStatusDateFlag.add(value);
  }

  void removeFromCheckinStatusDateFlag(String value) {
    checkinStatusDateFlag.remove(value);
  }

  void removeAtIndexFromCheckinStatusDateFlag(int index) {
    checkinStatusDateFlag.removeAt(index);
  }

  void updateCheckinStatusDateFlagAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusDateFlag[index] = updateFn(_checkinStatusDateFlag[index]);
  }

  void insertAtIndexInCheckinStatusDateFlag(int index, String value) {
    checkinStatusDateFlag.insert(index, value);
  }

  List<Color> _checkinStatusColor = [
    Color(4278234623),
    Color(4287996332),
    Color(4278190080),
    Color(4294930688),
    Color(4294901760),
    Color(4294964234),
    Color(4281270016)
  ];
  List<Color> get checkinStatusColor => _checkinStatusColor;
  set checkinStatusColor(List<Color> value) {
    _checkinStatusColor = value;
  }

  void addToCheckinStatusColor(Color value) {
    checkinStatusColor.add(value);
  }

  void removeFromCheckinStatusColor(Color value) {
    checkinStatusColor.remove(value);
  }

  void removeAtIndexFromCheckinStatusColor(int index) {
    checkinStatusColor.removeAt(index);
  }

  void updateCheckinStatusColorAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    checkinStatusColor[index] = updateFn(_checkinStatusColor[index]);
  }

  void insertAtIndexInCheckinStatusColor(int index, Color value) {
    checkinStatusColor.insert(index, value);
  }

  List<String> _teleBrandName = [];
  List<String> get teleBrandName => _teleBrandName;
  set teleBrandName(List<String> value) {
    _teleBrandName = value;
  }

  void addToTeleBrandName(String value) {
    teleBrandName.add(value);
  }

  void removeFromTeleBrandName(String value) {
    teleBrandName.remove(value);
  }

  void removeAtIndexFromTeleBrandName(int index) {
    teleBrandName.removeAt(index);
  }

  void updateTeleBrandNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandName[index] = updateFn(_teleBrandName[index]);
  }

  void insertAtIndexInTeleBrandName(int index, String value) {
    teleBrandName.insert(index, value);
  }

  List<String> _teleBrandType = [];
  List<String> get teleBrandType => _teleBrandType;
  set teleBrandType(List<String> value) {
    _teleBrandType = value;
  }

  void addToTeleBrandType(String value) {
    teleBrandType.add(value);
  }

  void removeFromTeleBrandType(String value) {
    teleBrandType.remove(value);
  }

  void removeAtIndexFromTeleBrandType(int index) {
    teleBrandType.removeAt(index);
  }

  void updateTeleBrandTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandType[index] = updateFn(_teleBrandType[index]);
  }

  void insertAtIndexInTeleBrandType(int index, String value) {
    teleBrandType.insert(index, value);
  }

  List<String> _modelName = [];
  List<String> get modelName => _modelName;
  set modelName(List<String> value) {
    _modelName = value;
  }

  void addToModelName(String value) {
    modelName.add(value);
  }

  void removeFromModelName(String value) {
    modelName.remove(value);
  }

  void removeAtIndexFromModelName(int index) {
    modelName.removeAt(index);
  }

  void updateModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    modelName[index] = updateFn(_modelName[index]);
  }

  void insertAtIndexInModelName(int index, String value) {
    modelName.insert(index, value);
  }

  List<String> _teleYearDropdownOption = [
    '2546',
    '2547',
    '2548',
    '2549',
    '2550',
    '2551',
    '2552',
    '2553',
    '2554',
    '2555',
    '2556',
    '2557',
    '2558',
    '2559',
    '2560',
    '2561',
    '2562',
    '2563',
    '2564',
    '2565',
    '2566'
  ];
  List<String> get teleYearDropdownOption => _teleYearDropdownOption;
  set teleYearDropdownOption(List<String> value) {
    _teleYearDropdownOption = value;
  }

  void addToTeleYearDropdownOption(String value) {
    teleYearDropdownOption.add(value);
  }

  void removeFromTeleYearDropdownOption(String value) {
    teleYearDropdownOption.remove(value);
  }

  void removeAtIndexFromTeleYearDropdownOption(int index) {
    teleYearDropdownOption.removeAt(index);
  }

  void updateTeleYearDropdownOptionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleYearDropdownOption[index] = updateFn(_teleYearDropdownOption[index]);
  }

  void insertAtIndexInTeleYearDropdownOption(int index, String value) {
    teleYearDropdownOption.insert(index, value);
  }

  List<String> _teleGetProvince = [];
  List<String> get teleGetProvince => _teleGetProvince;
  set teleGetProvince(List<String> value) {
    _teleGetProvince = value;
  }

  void addToTeleGetProvince(String value) {
    teleGetProvince.add(value);
  }

  void removeFromTeleGetProvince(String value) {
    teleGetProvince.remove(value);
  }

  void removeAtIndexFromTeleGetProvince(int index) {
    teleGetProvince.removeAt(index);
  }

  void updateTeleGetProvinceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleGetProvince[index] = updateFn(_teleGetProvince[index]);
  }

  void insertAtIndexInTeleGetProvince(int index, String value) {
    teleGetProvince.insert(index, value);
  }

  List<String> _teleModelName = [];
  List<String> get teleModelName => _teleModelName;
  set teleModelName(List<String> value) {
    _teleModelName = value;
  }

  void addToTeleModelName(String value) {
    teleModelName.add(value);
  }

  void removeFromTeleModelName(String value) {
    teleModelName.remove(value);
  }

  void removeAtIndexFromTeleModelName(int index) {
    teleModelName.removeAt(index);
  }

  void updateTeleModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelName[index] = updateFn(_teleModelName[index]);
  }

  void insertAtIndexInTeleModelName(int index, String value) {
    teleModelName.insert(index, value);
  }

  List<String> _coverTypeName = [];
  List<String> get coverTypeName => _coverTypeName;
  set coverTypeName(List<String> value) {
    _coverTypeName = value;
  }

  void addToCoverTypeName(String value) {
    coverTypeName.add(value);
  }

  void removeFromCoverTypeName(String value) {
    coverTypeName.remove(value);
  }

  void removeAtIndexFromCoverTypeName(int index) {
    coverTypeName.removeAt(index);
  }

  void updateCoverTypeNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeName[index] = updateFn(_coverTypeName[index]);
  }

  void insertAtIndexInCoverTypeName(int index, String value) {
    coverTypeName.insert(index, value);
  }

  List<String> _coverTypeCode = [];
  List<String> get coverTypeCode => _coverTypeCode;
  set coverTypeCode(List<String> value) {
    _coverTypeCode = value;
  }

  void addToCoverTypeCode(String value) {
    coverTypeCode.add(value);
  }

  void removeFromCoverTypeCode(String value) {
    coverTypeCode.remove(value);
  }

  void removeAtIndexFromCoverTypeCode(int index) {
    coverTypeCode.removeAt(index);
  }

  void updateCoverTypeCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeCode[index] = updateFn(_coverTypeCode[index]);
  }

  void insertAtIndexInCoverTypeCode(int index, String value) {
    coverTypeCode.insert(index, value);
  }

  List<String> _insurerFullNameList = [];
  List<String> get insurerFullNameList => _insurerFullNameList;
  set insurerFullNameList(List<String> value) {
    _insurerFullNameList = value;
  }

  void addToInsurerFullNameList(String value) {
    insurerFullNameList.add(value);
  }

  void removeFromInsurerFullNameList(String value) {
    insurerFullNameList.remove(value);
  }

  void removeAtIndexFromInsurerFullNameList(int index) {
    insurerFullNameList.removeAt(index);
  }

  void updateInsurerFullNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurerFullNameList[index] = updateFn(_insurerFullNameList[index]);
  }

  void insertAtIndexInInsurerFullNameList(int index, String value) {
    insurerFullNameList.insert(index, value);
  }

  String _garageTypeEng = '';
  String get garageTypeEng => _garageTypeEng;
  set garageTypeEng(String value) {
    _garageTypeEng = value;
  }

  List<String> _coverTypeNameChosen = [];
  List<String> get coverTypeNameChosen => _coverTypeNameChosen;
  set coverTypeNameChosen(List<String> value) {
    _coverTypeNameChosen = value;
  }

  void addToCoverTypeNameChosen(String value) {
    coverTypeNameChosen.add(value);
  }

  void removeFromCoverTypeNameChosen(String value) {
    coverTypeNameChosen.remove(value);
  }

  void removeAtIndexFromCoverTypeNameChosen(int index) {
    coverTypeNameChosen.removeAt(index);
  }

  void updateCoverTypeNameChosenAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeNameChosen[index] = updateFn(_coverTypeNameChosen[index]);
  }

  void insertAtIndexInCoverTypeNameChosen(int index, String value) {
    coverTypeNameChosen.insert(index, value);
  }

  List<String> _insurerNameChosen = [];
  List<String> get insurerNameChosen => _insurerNameChosen;
  set insurerNameChosen(List<String> value) {
    _insurerNameChosen = value;
  }

  void addToInsurerNameChosen(String value) {
    insurerNameChosen.add(value);
  }

  void removeFromInsurerNameChosen(String value) {
    insurerNameChosen.remove(value);
  }

  void removeAtIndexFromInsurerNameChosen(int index) {
    insurerNameChosen.removeAt(index);
  }

  void updateInsurerNameChosenAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurerNameChosen[index] = updateFn(_insurerNameChosen[index]);
  }

  void insertAtIndexInInsurerNameChosen(int index, String value) {
    insurerNameChosen.insert(index, value);
  }

  int _sumInsuredChosen = 0;
  int get sumInsuredChosen => _sumInsuredChosen;
  set sumInsuredChosen(int value) {
    _sumInsuredChosen = value;
  }

  List<String> _teleBrandID = [];
  List<String> get teleBrandID => _teleBrandID;
  set teleBrandID(List<String> value) {
    _teleBrandID = value;
  }

  void addToTeleBrandID(String value) {
    teleBrandID.add(value);
  }

  void removeFromTeleBrandID(String value) {
    teleBrandID.remove(value);
  }

  void removeAtIndexFromTeleBrandID(int index) {
    teleBrandID.removeAt(index);
  }

  void updateTeleBrandIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandID[index] = updateFn(_teleBrandID[index]);
  }

  void insertAtIndexInTeleBrandID(int index, String value) {
    teleBrandID.insert(index, value);
  }

  List<String> _teleModelCode = [];
  List<String> get teleModelCode => _teleModelCode;
  set teleModelCode(List<String> value) {
    _teleModelCode = value;
  }

  void addToTeleModelCode(String value) {
    teleModelCode.add(value);
  }

  void removeFromTeleModelCode(String value) {
    teleModelCode.remove(value);
  }

  void removeAtIndexFromTeleModelCode(int index) {
    teleModelCode.removeAt(index);
  }

  void updateTeleModelCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelCode[index] = updateFn(_teleModelCode[index]);
  }

  void insertAtIndexInTeleModelCode(int index, String value) {
    teleModelCode.insert(index, value);
  }

  List<String> _teleModelBrandID = [];
  List<String> get teleModelBrandID => _teleModelBrandID;
  set teleModelBrandID(List<String> value) {
    _teleModelBrandID = value;
  }

  void addToTeleModelBrandID(String value) {
    teleModelBrandID.add(value);
  }

  void removeFromTeleModelBrandID(String value) {
    teleModelBrandID.remove(value);
  }

  void removeAtIndexFromTeleModelBrandID(int index) {
    teleModelBrandID.removeAt(index);
  }

  void updateTeleModelBrandIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelBrandID[index] = updateFn(_teleModelBrandID[index]);
  }

  void insertAtIndexInTeleModelBrandID(int index, String value) {
    teleModelBrandID.insert(index, value);
  }

  List<String> _companyId = [];
  List<String> get companyId => _companyId;
  set companyId(List<String> value) {
    _companyId = value;
  }

  void addToCompanyId(String value) {
    companyId.add(value);
  }

  void removeFromCompanyId(String value) {
    companyId.remove(value);
  }

  void removeAtIndexFromCompanyId(int index) {
    companyId.removeAt(index);
  }

  void updateCompanyIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    companyId[index] = updateFn(_companyId[index]);
  }

  void insertAtIndexInCompanyId(int index, String value) {
    companyId.insert(index, value);
  }

  bool _teleSearchModelState = false;
  bool get teleSearchModelState => _teleSearchModelState;
  set teleSearchModelState(bool value) {
    _teleSearchModelState = value;
  }

  List<String> _searchFullName = [];
  List<String> get searchFullName => _searchFullName;
  set searchFullName(List<String> value) {
    _searchFullName = value;
  }

  void addToSearchFullName(String value) {
    searchFullName.add(value);
  }

  void removeFromSearchFullName(String value) {
    searchFullName.remove(value);
  }

  void removeAtIndexFromSearchFullName(int index) {
    searchFullName.removeAt(index);
  }

  void updateSearchFullNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchFullName[index] = updateFn(_searchFullName[index]);
  }

  void insertAtIndexInSearchFullName(int index, String value) {
    searchFullName.insert(index, value);
  }

  List<String> _searchCoverType = [];
  List<String> get searchCoverType => _searchCoverType;
  set searchCoverType(List<String> value) {
    _searchCoverType = value;
  }

  void addToSearchCoverType(String value) {
    searchCoverType.add(value);
  }

  void removeFromSearchCoverType(String value) {
    searchCoverType.remove(value);
  }

  void removeAtIndexFromSearchCoverType(int index) {
    searchCoverType.removeAt(index);
  }

  void updateSearchCoverTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchCoverType[index] = updateFn(_searchCoverType[index]);
  }

  void insertAtIndexInSearchCoverType(int index, String value) {
    searchCoverType.insert(index, value);
  }

  List<String> _searchGarageType = [];
  List<String> get searchGarageType => _searchGarageType;
  set searchGarageType(List<String> value) {
    _searchGarageType = value;
  }

  void addToSearchGarageType(String value) {
    searchGarageType.add(value);
  }

  void removeFromSearchGarageType(String value) {
    searchGarageType.remove(value);
  }

  void removeAtIndexFromSearchGarageType(int index) {
    searchGarageType.removeAt(index);
  }

  void updateSearchGarageTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchGarageType[index] = updateFn(_searchGarageType[index]);
  }

  void insertAtIndexInSearchGarageType(int index, String value) {
    searchGarageType.insert(index, value);
  }

  List<String> _searchGrossTotal = [];
  List<String> get searchGrossTotal => _searchGrossTotal;
  set searchGrossTotal(List<String> value) {
    _searchGrossTotal = value;
  }

  void addToSearchGrossTotal(String value) {
    searchGrossTotal.add(value);
  }

  void removeFromSearchGrossTotal(String value) {
    searchGrossTotal.remove(value);
  }

  void removeAtIndexFromSearchGrossTotal(int index) {
    searchGrossTotal.removeAt(index);
  }

  void updateSearchGrossTotalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchGrossTotal[index] = updateFn(_searchGrossTotal[index]);
  }

  void insertAtIndexInSearchGrossTotal(int index, String value) {
    searchGrossTotal.insert(index, value);
  }

  List<String> _searchSumInsured = [];
  List<String> get searchSumInsured => _searchSumInsured;
  set searchSumInsured(List<String> value) {
    _searchSumInsured = value;
  }

  void addToSearchSumInsured(String value) {
    searchSumInsured.add(value);
  }

  void removeFromSearchSumInsured(String value) {
    searchSumInsured.remove(value);
  }

  void removeAtIndexFromSearchSumInsured(int index) {
    searchSumInsured.removeAt(index);
  }

  void updateSearchSumInsuredAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchSumInsured[index] = updateFn(_searchSumInsured[index]);
  }

  void insertAtIndexInSearchSumInsured(int index, String value) {
    searchSumInsured.insert(index, value);
  }

  List<String> _searchTppd = [];
  List<String> get searchTppd => _searchTppd;
  set searchTppd(List<String> value) {
    _searchTppd = value;
  }

  void addToSearchTppd(String value) {
    searchTppd.add(value);
  }

  void removeFromSearchTppd(String value) {
    searchTppd.remove(value);
  }

  void removeAtIndexFromSearchTppd(int index) {
    searchTppd.removeAt(index);
  }

  void updateSearchTppdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchTppd[index] = updateFn(_searchTppd[index]);
  }

  void insertAtIndexInSearchTppd(int index, String value) {
    searchTppd.insert(index, value);
  }

  List<String> _searchPa = [];
  List<String> get searchPa => _searchPa;
  set searchPa(List<String> value) {
    _searchPa = value;
  }

  void addToSearchPa(String value) {
    searchPa.add(value);
  }

  void removeFromSearchPa(String value) {
    searchPa.remove(value);
  }

  void removeAtIndexFromSearchPa(int index) {
    searchPa.removeAt(index);
  }

  void updateSearchPaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchPa[index] = updateFn(_searchPa[index]);
  }

  void insertAtIndexInSearchPa(int index, String value) {
    searchPa.insert(index, value);
  }

  List<String> _searchExpDate = [];
  List<String> get searchExpDate => _searchExpDate;
  set searchExpDate(List<String> value) {
    _searchExpDate = value;
  }

  void addToSearchExpDate(String value) {
    searchExpDate.add(value);
  }

  void removeFromSearchExpDate(String value) {
    searchExpDate.remove(value);
  }

  void removeAtIndexFromSearchExpDate(int index) {
    searchExpDate.removeAt(index);
  }

  void updateSearchExpDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchExpDate[index] = updateFn(_searchExpDate[index]);
  }

  void insertAtIndexInSearchExpDate(int index, String value) {
    searchExpDate.insert(index, value);
  }

  String _garageChosen = '';
  String get garageChosen => _garageChosen;
  set garageChosen(String value) {
    _garageChosen = value;
  }

  List<String> _actAmount = [];
  List<String> get actAmount => _actAmount;
  set actAmount(List<String> value) {
    _actAmount = value;
  }

  void addToActAmount(String value) {
    actAmount.add(value);
  }

  void removeFromActAmount(String value) {
    actAmount.remove(value);
  }

  void removeAtIndexFromActAmount(int index) {
    actAmount.removeAt(index);
  }

  void updateActAmountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    actAmount[index] = updateFn(_actAmount[index]);
  }

  void insertAtIndexInActAmount(int index, String value) {
    actAmount.insert(index, value);
  }

  List<String> _searchActAmount = [];
  List<String> get searchActAmount => _searchActAmount;
  set searchActAmount(List<String> value) {
    _searchActAmount = value;
  }

  void addToSearchActAmount(String value) {
    searchActAmount.add(value);
  }

  void removeFromSearchActAmount(String value) {
    searchActAmount.remove(value);
  }

  void removeAtIndexFromSearchActAmount(int index) {
    searchActAmount.removeAt(index);
  }

  void updateSearchActAmountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchActAmount[index] = updateFn(_searchActAmount[index]);
  }

  void insertAtIndexInSearchActAmount(int index, String value) {
    searchActAmount.insert(index, value);
  }

  List<String> _teleADYearDropdown = [
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018 ',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ];
  List<String> get teleADYearDropdown => _teleADYearDropdown;
  set teleADYearDropdown(List<String> value) {
    _teleADYearDropdown = value;
  }

  void addToTeleADYearDropdown(String value) {
    teleADYearDropdown.add(value);
  }

  void removeFromTeleADYearDropdown(String value) {
    teleADYearDropdown.remove(value);
  }

  void removeAtIndexFromTeleADYearDropdown(int index) {
    teleADYearDropdown.removeAt(index);
  }

  void updateTeleADYearDropdownAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleADYearDropdown[index] = updateFn(_teleADYearDropdown[index]);
  }

  void insertAtIndexInTeleADYearDropdown(int index, String value) {
    teleADYearDropdown.insert(index, value);
  }

  List<String> _searchSerialName = [];
  List<String> get searchSerialName => _searchSerialName;
  set searchSerialName(List<String> value) {
    _searchSerialName = value;
  }

  void addToSearchSerialName(String value) {
    searchSerialName.add(value);
  }

  void removeFromSearchSerialName(String value) {
    searchSerialName.remove(value);
  }

  void removeAtIndexFromSearchSerialName(int index) {
    searchSerialName.removeAt(index);
  }

  void updateSearchSerialNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchSerialName[index] = updateFn(_searchSerialName[index]);
  }

  void insertAtIndexInSearchSerialName(int index, String value) {
    searchSerialName.insert(index, value);
  }

  double _sumInsuredChoosenDouble = 0.0;
  double get sumInsuredChoosenDouble => _sumInsuredChoosenDouble;
  set sumInsuredChoosenDouble(double value) {
    _sumInsuredChoosenDouble = value;
  }

  List<String> _kpiProductType = ['M', 'CTV', 'HL'];
  List<String> get kpiProductType => _kpiProductType;
  set kpiProductType(List<String> value) {
    _kpiProductType = value;
  }

  void addToKpiProductType(String value) {
    kpiProductType.add(value);
  }

  void removeFromKpiProductType(String value) {
    kpiProductType.remove(value);
  }

  void removeAtIndexFromKpiProductType(int index) {
    kpiProductType.removeAt(index);
  }

  void updateKpiProductTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiProductType[index] = updateFn(_kpiProductType[index]);
  }

  void insertAtIndexInKpiProductType(int index, String value) {
    kpiProductType.insert(index, value);
  }

  List<String> _kpiEmployeePosition = [
    '[position]',
    '[position]',
    '[position]'
  ];
  List<String> get kpiEmployeePosition => _kpiEmployeePosition;
  set kpiEmployeePosition(List<String> value) {
    _kpiEmployeePosition = value;
  }

  void addToKpiEmployeePosition(String value) {
    kpiEmployeePosition.add(value);
  }

  void removeFromKpiEmployeePosition(String value) {
    kpiEmployeePosition.remove(value);
  }

  void removeAtIndexFromKpiEmployeePosition(int index) {
    kpiEmployeePosition.removeAt(index);
  }

  void updateKpiEmployeePositionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiEmployeePosition[index] = updateFn(_kpiEmployeePosition[index]);
  }

  void insertAtIndexInKpiEmployeePosition(int index, String value) {
    kpiEmployeePosition.insert(index, value);
  }

  List<String> _kpiActual = ['0.0', '0.0', '0.0'];
  List<String> get kpiActual => _kpiActual;
  set kpiActual(List<String> value) {
    _kpiActual = value;
  }

  void addToKpiActual(String value) {
    kpiActual.add(value);
  }

  void removeFromKpiActual(String value) {
    kpiActual.remove(value);
  }

  void removeAtIndexFromKpiActual(int index) {
    kpiActual.removeAt(index);
  }

  void updateKpiActualAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiActual[index] = updateFn(_kpiActual[index]);
  }

  void insertAtIndexInKpiActual(int index, String value) {
    kpiActual.insert(index, value);
  }

  List<String> _kpiTargetQuantity = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantity => _kpiTargetQuantity;
  set kpiTargetQuantity(List<String> value) {
    _kpiTargetQuantity = value;
  }

  void addToKpiTargetQuantity(String value) {
    kpiTargetQuantity.add(value);
  }

  void removeFromKpiTargetQuantity(String value) {
    kpiTargetQuantity.remove(value);
  }

  void removeAtIndexFromKpiTargetQuantity(int index) {
    kpiTargetQuantity.removeAt(index);
  }

  void updateKpiTargetQuantityAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiTargetQuantity[index] = updateFn(_kpiTargetQuantity[index]);
  }

  void insertAtIndexInKpiTargetQuantity(int index, String value) {
    kpiTargetQuantity.insert(index, value);
  }

  List<String> _kpiYearMonth = ['2022-12', '2022-12', '2022-12'];
  List<String> get kpiYearMonth => _kpiYearMonth;
  set kpiYearMonth(List<String> value) {
    _kpiYearMonth = value;
  }

  void addToKpiYearMonth(String value) {
    kpiYearMonth.add(value);
  }

  void removeFromKpiYearMonth(String value) {
    kpiYearMonth.remove(value);
  }

  void removeAtIndexFromKpiYearMonth(int index) {
    kpiYearMonth.removeAt(index);
  }

  void updateKpiYearMonthAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiYearMonth[index] = updateFn(_kpiYearMonth[index]);
  }

  void insertAtIndexInKpiYearMonth(int index, String value) {
    kpiYearMonth.insert(index, value);
  }

  String _kpiTargetBudget = '100.00';
  String get kpiTargetBudget => _kpiTargetBudget;
  set kpiTargetBudget(String value) {
    _kpiTargetBudget = value;
  }

  String _kpiActualBudget = '0.00';
  String get kpiActualBudget => _kpiActualBudget;
  set kpiActualBudget(String value) {
    _kpiActualBudget = value;
  }

  DateTime? _DateHoliday;
  DateTime? get DateHoliday => _DateHoliday;
  set DateHoliday(DateTime? value) {
    _DateHoliday = value;
  }

  DateTime? _DateExpHoliday;
  DateTime? get DateExpHoliday => _DateExpHoliday;
  set DateExpHoliday(DateTime? value) {
    _DateExpHoliday = value;
  }

  DateTime? _DateHolidayNotShow;
  DateTime? get DateHolidayNotShow => _DateHolidayNotShow;
  set DateHolidayNotShow(DateTime? value) {
    _DateHolidayNotShow = value;
    value != null
        ? secureStorage.setInt(
            'ff_DateHolidayNotShow', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DateHolidayNotShow');
  }

  void deleteDateHolidayNotShow() {
    secureStorage.delete(key: 'ff_DateHolidayNotShow');
  }

  bool _isLoadedInsuranceData = false;
  bool get isLoadedInsuranceData => _isLoadedInsuranceData;
  set isLoadedInsuranceData(bool value) {
    _isLoadedInsuranceData = value;
  }

  List<String> _leaveWorkId = [];
  List<String> get leaveWorkId => _leaveWorkId;
  set leaveWorkId(List<String> value) {
    _leaveWorkId = value;
  }

  void addToLeaveWorkId(String value) {
    leaveWorkId.add(value);
  }

  void removeFromLeaveWorkId(String value) {
    leaveWorkId.remove(value);
  }

  void removeAtIndexFromLeaveWorkId(int index) {
    leaveWorkId.removeAt(index);
  }

  void updateLeaveWorkIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveWorkId[index] = updateFn(_leaveWorkId[index]);
  }

  void insertAtIndexInLeaveWorkId(int index, String value) {
    leaveWorkId.insert(index, value);
  }

  List<String> _leaveWorkDay = [];
  List<String> get leaveWorkDay => _leaveWorkDay;
  set leaveWorkDay(List<String> value) {
    _leaveWorkDay = value;
  }

  void addToLeaveWorkDay(String value) {
    leaveWorkDay.add(value);
  }

  void removeFromLeaveWorkDay(String value) {
    leaveWorkDay.remove(value);
  }

  void removeAtIndexFromLeaveWorkDay(int index) {
    leaveWorkDay.removeAt(index);
  }

  void updateLeaveWorkDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveWorkDay[index] = updateFn(_leaveWorkDay[index]);
  }

  void insertAtIndexInLeaveWorkDay(int index, String value) {
    leaveWorkDay.insert(index, value);
  }

  List<String> _checkinLastMonthDate = [];
  List<String> get checkinLastMonthDate => _checkinLastMonthDate;
  set checkinLastMonthDate(List<String> value) {
    _checkinLastMonthDate = value;
  }

  void addToCheckinLastMonthDate(String value) {
    checkinLastMonthDate.add(value);
  }

  void removeFromCheckinLastMonthDate(String value) {
    checkinLastMonthDate.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthDate(int index) {
    checkinLastMonthDate.removeAt(index);
  }

  void updateCheckinLastMonthDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthDate[index] = updateFn(_checkinLastMonthDate[index]);
  }

  void insertAtIndexInCheckinLastMonthDate(int index, String value) {
    checkinLastMonthDate.insert(index, value);
  }

  List<String> _checkinLastMonthTimeIn = [];
  List<String> get checkinLastMonthTimeIn => _checkinLastMonthTimeIn;
  set checkinLastMonthTimeIn(List<String> value) {
    _checkinLastMonthTimeIn = value;
  }

  void addToCheckinLastMonthTimeIn(String value) {
    checkinLastMonthTimeIn.add(value);
  }

  void removeFromCheckinLastMonthTimeIn(String value) {
    checkinLastMonthTimeIn.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthTimeIn(int index) {
    checkinLastMonthTimeIn.removeAt(index);
  }

  void updateCheckinLastMonthTimeInAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthTimeIn[index] = updateFn(_checkinLastMonthTimeIn[index]);
  }

  void insertAtIndexInCheckinLastMonthTimeIn(int index, String value) {
    checkinLastMonthTimeIn.insert(index, value);
  }

  List<String> _checkinLastMonthTimeOut = [];
  List<String> get checkinLastMonthTimeOut => _checkinLastMonthTimeOut;
  set checkinLastMonthTimeOut(List<String> value) {
    _checkinLastMonthTimeOut = value;
  }

  void addToCheckinLastMonthTimeOut(String value) {
    checkinLastMonthTimeOut.add(value);
  }

  void removeFromCheckinLastMonthTimeOut(String value) {
    checkinLastMonthTimeOut.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthTimeOut(int index) {
    checkinLastMonthTimeOut.removeAt(index);
  }

  void updateCheckinLastMonthTimeOutAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthTimeOut[index] = updateFn(_checkinLastMonthTimeOut[index]);
  }

  void insertAtIndexInCheckinLastMonthTimeOut(int index, String value) {
    checkinLastMonthTimeOut.insert(index, value);
  }

  String _endLeaveDayString = '';
  String get endLeaveDayString => _endLeaveDayString;
  set endLeaveDayString(String value) {
    _endLeaveDayString = value;
  }

  List<String> _leaveTypeName = [];
  List<String> get leaveTypeName => _leaveTypeName;
  set leaveTypeName(List<String> value) {
    _leaveTypeName = value;
  }

  void addToLeaveTypeName(String value) {
    leaveTypeName.add(value);
  }

  void removeFromLeaveTypeName(String value) {
    leaveTypeName.remove(value);
  }

  void removeAtIndexFromLeaveTypeName(int index) {
    leaveTypeName.removeAt(index);
  }

  void updateLeaveTypeNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveTypeName[index] = updateFn(_leaveTypeName[index]);
  }

  void insertAtIndexInLeaveTypeName(int index, String value) {
    leaveTypeName.insert(index, value);
  }

  String _areaResponsKPI = '[area_curent_month]';
  String get areaResponsKPI => _areaResponsKPI;
  set areaResponsKPI(String value) {
    _areaResponsKPI = value;
  }

  List<Color> _kpiGaugeColorListMain = [
    Color(4280103167),
    Color(4294960896),
    Color(4287299839)
  ];
  List<Color> get kpiGaugeColorListMain => _kpiGaugeColorListMain;
  set kpiGaugeColorListMain(List<Color> value) {
    _kpiGaugeColorListMain = value;
  }

  void addToKpiGaugeColorListMain(Color value) {
    kpiGaugeColorListMain.add(value);
  }

  void removeFromKpiGaugeColorListMain(Color value) {
    kpiGaugeColorListMain.remove(value);
  }

  void removeAtIndexFromKpiGaugeColorListMain(int index) {
    kpiGaugeColorListMain.removeAt(index);
  }

  void updateKpiGaugeColorListMainAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    kpiGaugeColorListMain[index] = updateFn(_kpiGaugeColorListMain[index]);
  }

  void insertAtIndexInKpiGaugeColorListMain(int index, Color value) {
    kpiGaugeColorListMain.insert(index, value);
  }

  List<Color> _kpiGaugeColorList2 = [
    Color(4278254079),
    Color(4294927616),
    Color(4294793471)
  ];
  List<Color> get kpiGaugeColorList2 => _kpiGaugeColorList2;
  set kpiGaugeColorList2(List<Color> value) {
    _kpiGaugeColorList2 = value;
  }

  void addToKpiGaugeColorList2(Color value) {
    kpiGaugeColorList2.add(value);
  }

  void removeFromKpiGaugeColorList2(Color value) {
    kpiGaugeColorList2.remove(value);
  }

  void removeAtIndexFromKpiGaugeColorList2(int index) {
    kpiGaugeColorList2.removeAt(index);
  }

  void updateKpiGaugeColorList2AtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    kpiGaugeColorList2[index] = updateFn(_kpiGaugeColorList2[index]);
  }

  void insertAtIndexInKpiGaugeColorList2(int index, Color value) {
    kpiGaugeColorList2.insert(index, value);
  }

  bool _checkAllowLeaveDay = false;
  bool get checkAllowLeaveDay => _checkAllowLeaveDay;
  set checkAllowLeaveDay(bool value) {
    _checkAllowLeaveDay = value;
  }

  List<String> _kpiProductTypeLM = ['M', 'CTV', 'HL'];
  List<String> get kpiProductTypeLM => _kpiProductTypeLM;
  set kpiProductTypeLM(List<String> value) {
    _kpiProductTypeLM = value;
  }

  void addToKpiProductTypeLM(String value) {
    kpiProductTypeLM.add(value);
  }

  void removeFromKpiProductTypeLM(String value) {
    kpiProductTypeLM.remove(value);
  }

  void removeAtIndexFromKpiProductTypeLM(int index) {
    kpiProductTypeLM.removeAt(index);
  }

  void updateKpiProductTypeLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiProductTypeLM[index] = updateFn(_kpiProductTypeLM[index]);
  }

  void insertAtIndexInKpiProductTypeLM(int index, String value) {
    kpiProductTypeLM.insert(index, value);
  }

  List<String> _kpiEmployeePositionLM = ['position', 'position', 'position'];
  List<String> get kpiEmployeePositionLM => _kpiEmployeePositionLM;
  set kpiEmployeePositionLM(List<String> value) {
    _kpiEmployeePositionLM = value;
  }

  void addToKpiEmployeePositionLM(String value) {
    kpiEmployeePositionLM.add(value);
  }

  void removeFromKpiEmployeePositionLM(String value) {
    kpiEmployeePositionLM.remove(value);
  }

  void removeAtIndexFromKpiEmployeePositionLM(int index) {
    kpiEmployeePositionLM.removeAt(index);
  }

  void updateKpiEmployeePositionLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiEmployeePositionLM[index] = updateFn(_kpiEmployeePositionLM[index]);
  }

  void insertAtIndexInKpiEmployeePositionLM(int index, String value) {
    kpiEmployeePositionLM.insert(index, value);
  }

  List<String> _kpiActualLM = ['0.0', '0.0', '0.0'];
  List<String> get kpiActualLM => _kpiActualLM;
  set kpiActualLM(List<String> value) {
    _kpiActualLM = value;
  }

  void addToKpiActualLM(String value) {
    kpiActualLM.add(value);
  }

  void removeFromKpiActualLM(String value) {
    kpiActualLM.remove(value);
  }

  void removeAtIndexFromKpiActualLM(int index) {
    kpiActualLM.removeAt(index);
  }

  void updateKpiActualLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiActualLM[index] = updateFn(_kpiActualLM[index]);
  }

  void insertAtIndexInKpiActualLM(int index, String value) {
    kpiActualLM.insert(index, value);
  }

  List<String> _kpiTargetQuantityLM = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantityLM => _kpiTargetQuantityLM;
  set kpiTargetQuantityLM(List<String> value) {
    _kpiTargetQuantityLM = value;
  }

  void addToKpiTargetQuantityLM(String value) {
    kpiTargetQuantityLM.add(value);
  }

  void removeFromKpiTargetQuantityLM(String value) {
    kpiTargetQuantityLM.remove(value);
  }

  void removeAtIndexFromKpiTargetQuantityLM(int index) {
    kpiTargetQuantityLM.removeAt(index);
  }

  void updateKpiTargetQuantityLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiTargetQuantityLM[index] = updateFn(_kpiTargetQuantityLM[index]);
  }

  void insertAtIndexInKpiTargetQuantityLM(int index, String value) {
    kpiTargetQuantityLM.insert(index, value);
  }

  List<String> _kpiYearMonthLM = ['2022-11', '2022-11', '2022-11'];
  List<String> get kpiYearMonthLM => _kpiYearMonthLM;
  set kpiYearMonthLM(List<String> value) {
    _kpiYearMonthLM = value;
  }

  void addToKpiYearMonthLM(String value) {
    kpiYearMonthLM.add(value);
  }

  void removeFromKpiYearMonthLM(String value) {
    kpiYearMonthLM.remove(value);
  }

  void removeAtIndexFromKpiYearMonthLM(int index) {
    kpiYearMonthLM.removeAt(index);
  }

  void updateKpiYearMonthLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiYearMonthLM[index] = updateFn(_kpiYearMonthLM[index]);
  }

  void insertAtIndexInKpiYearMonthLM(int index, String value) {
    kpiYearMonthLM.insert(index, value);
  }

  String _kpiTargetBudgetLM = '100.00';
  String get kpiTargetBudgetLM => _kpiTargetBudgetLM;
  set kpiTargetBudgetLM(String value) {
    _kpiTargetBudgetLM = value;
  }

  String _kpiActualBudgetLM = '0.00';
  String get kpiActualBudgetLM => _kpiActualBudgetLM;
  set kpiActualBudgetLM(String value) {
    _kpiActualBudgetLM = value;
  }

  List<String> _countLeave = [];
  List<String> get countLeave => _countLeave;
  set countLeave(List<String> value) {
    _countLeave = value;
  }

  void addToCountLeave(String value) {
    countLeave.add(value);
  }

  void removeFromCountLeave(String value) {
    countLeave.remove(value);
  }

  void removeAtIndexFromCountLeave(int index) {
    countLeave.removeAt(index);
  }

  void updateCountLeaveAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    countLeave[index] = updateFn(_countLeave[index]);
  }

  void insertAtIndexInCountLeave(int index, String value) {
    countLeave.insert(index, value);
  }

  List<String> _totalLeave = [];
  List<String> get totalLeave => _totalLeave;
  set totalLeave(List<String> value) {
    _totalLeave = value;
  }

  void addToTotalLeave(String value) {
    totalLeave.add(value);
  }

  void removeFromTotalLeave(String value) {
    totalLeave.remove(value);
  }

  void removeAtIndexFromTotalLeave(int index) {
    totalLeave.removeAt(index);
  }

  void updateTotalLeaveAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    totalLeave[index] = updateFn(_totalLeave[index]);
  }

  void insertAtIndexInTotalLeave(int index, String value) {
    totalLeave.insert(index, value);
  }

  List<String> _statusCheckCount = [];
  List<String> get statusCheckCount => _statusCheckCount;
  set statusCheckCount(List<String> value) {
    _statusCheckCount = value;
  }

  void addToStatusCheckCount(String value) {
    statusCheckCount.add(value);
  }

  void removeFromStatusCheckCount(String value) {
    statusCheckCount.remove(value);
  }

  void removeAtIndexFromStatusCheckCount(int index) {
    statusCheckCount.removeAt(index);
  }

  void updateStatusCheckCountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    statusCheckCount[index] = updateFn(_statusCheckCount[index]);
  }

  void insertAtIndexInStatusCheckCount(int index, String value) {
    statusCheckCount.insert(index, value);
  }

  String _kpiAreaResponsLM = '[area_last_month]';
  String get kpiAreaResponsLM => _kpiAreaResponsLM;
  set kpiAreaResponsLM(String value) {
    _kpiAreaResponsLM = value;
  }

  bool _allowFileUpload = false;
  bool get allowFileUpload => _allowFileUpload;
  set allowFileUpload(bool value) {
    _allowFileUpload = value;
  }

  String _leaveDaysLocal = '0.5';
  String get leaveDaysLocal => _leaveDaysLocal;
  set leaveDaysLocal(String value) {
    _leaveDaysLocal = value;
  }

  double _leaveDaysDouble = 0.5;
  double get leaveDaysDouble => _leaveDaysDouble;
  set leaveDaysDouble(double value) {
    _leaveDaysDouble = value;
  }

  String _leaveListID = 'leave_list_id';
  String get leaveListID => _leaveListID;
  set leaveListID(String value) {
    _leaveListID = value;
  }

  String _ProfilePhoneNumber = '';
  String get ProfilePhoneNumber => _ProfilePhoneNumber;
  set ProfilePhoneNumber(String value) {
    _ProfilePhoneNumber = value;
  }

  String _profileFirstBossEmpID = '';
  String get profileFirstBossEmpID => _profileFirstBossEmpID;
  set profileFirstBossEmpID(String value) {
    _profileFirstBossEmpID = value;
  }

  String _profileSecondBossEmpID = '';
  String get profileSecondBossEmpID => _profileSecondBossEmpID;
  set profileSecondBossEmpID(String value) {
    _profileSecondBossEmpID = value;
  }

  List<String> _leaveDocImgPathList = [];
  List<String> get leaveDocImgPathList => _leaveDocImgPathList;
  set leaveDocImgPathList(List<String> value) {
    _leaveDocImgPathList = value;
  }

  void addToLeaveDocImgPathList(String value) {
    leaveDocImgPathList.add(value);
  }

  void removeFromLeaveDocImgPathList(String value) {
    leaveDocImgPathList.remove(value);
  }

  void removeAtIndexFromLeaveDocImgPathList(int index) {
    leaveDocImgPathList.removeAt(index);
  }

  void updateLeaveDocImgPathListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveDocImgPathList[index] = updateFn(_leaveDocImgPathList[index]);
  }

  void insertAtIndexInLeaveDocImgPathList(int index, String value) {
    leaveDocImgPathList.insert(index, value);
  }

  String _positionApprove = '1';
  String get positionApprove => _positionApprove;
  set positionApprove(String value) {
    _positionApprove = value;
  }

  List<String> _disapproveName = [];
  List<String> get disapproveName => _disapproveName;
  set disapproveName(List<String> value) {
    _disapproveName = value;
  }

  void addToDisapproveName(String value) {
    disapproveName.add(value);
  }

  void removeFromDisapproveName(String value) {
    disapproveName.remove(value);
  }

  void removeAtIndexFromDisapproveName(int index) {
    disapproveName.removeAt(index);
  }

  void updateDisapproveNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveName[index] = updateFn(_disapproveName[index]);
  }

  void insertAtIndexInDisapproveName(int index, String value) {
    disapproveName.insert(index, value);
  }

  List<String> _disapproveLeaveName = [];
  List<String> get disapproveLeaveName => _disapproveLeaveName;
  set disapproveLeaveName(List<String> value) {
    _disapproveLeaveName = value;
  }

  void addToDisapproveLeaveName(String value) {
    disapproveLeaveName.add(value);
  }

  void removeFromDisapproveLeaveName(String value) {
    disapproveLeaveName.remove(value);
  }

  void removeAtIndexFromDisapproveLeaveName(int index) {
    disapproveLeaveName.removeAt(index);
  }

  void updateDisapproveLeaveNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveLeaveName[index] = updateFn(_disapproveLeaveName[index]);
  }

  void insertAtIndexInDisapproveLeaveName(int index, String value) {
    disapproveLeaveName.insert(index, value);
  }

  List<String> _disapproveCreatedDate = [];
  List<String> get disapproveCreatedDate => _disapproveCreatedDate;
  set disapproveCreatedDate(List<String> value) {
    _disapproveCreatedDate = value;
  }

  void addToDisapproveCreatedDate(String value) {
    disapproveCreatedDate.add(value);
  }

  void removeFromDisapproveCreatedDate(String value) {
    disapproveCreatedDate.remove(value);
  }

  void removeAtIndexFromDisapproveCreatedDate(int index) {
    disapproveCreatedDate.removeAt(index);
  }

  void updateDisapproveCreatedDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveCreatedDate[index] = updateFn(_disapproveCreatedDate[index]);
  }

  void insertAtIndexInDisapproveCreatedDate(int index, String value) {
    disapproveCreatedDate.insert(index, value);
  }

  List<String> _disapproveLeaveDate = [];
  List<String> get disapproveLeaveDate => _disapproveLeaveDate;
  set disapproveLeaveDate(List<String> value) {
    _disapproveLeaveDate = value;
  }

  void addToDisapproveLeaveDate(String value) {
    disapproveLeaveDate.add(value);
  }

  void removeFromDisapproveLeaveDate(String value) {
    disapproveLeaveDate.remove(value);
  }

  void removeAtIndexFromDisapproveLeaveDate(int index) {
    disapproveLeaveDate.removeAt(index);
  }

  void updateDisapproveLeaveDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveLeaveDate[index] = updateFn(_disapproveLeaveDate[index]);
  }

  void insertAtIndexInDisapproveLeaveDate(int index, String value) {
    disapproveLeaveDate.insert(index, value);
  }

  List<String> _disapproveCountDay = [];
  List<String> get disapproveCountDay => _disapproveCountDay;
  set disapproveCountDay(List<String> value) {
    _disapproveCountDay = value;
  }

  void addToDisapproveCountDay(String value) {
    disapproveCountDay.add(value);
  }

  void removeFromDisapproveCountDay(String value) {
    disapproveCountDay.remove(value);
  }

  void removeAtIndexFromDisapproveCountDay(int index) {
    disapproveCountDay.removeAt(index);
  }

  void updateDisapproveCountDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveCountDay[index] = updateFn(_disapproveCountDay[index]);
  }

  void insertAtIndexInDisapproveCountDay(int index, String value) {
    disapproveCountDay.insert(index, value);
  }

  List<String> _disapproveTimePeriod = [];
  List<String> get disapproveTimePeriod => _disapproveTimePeriod;
  set disapproveTimePeriod(List<String> value) {
    _disapproveTimePeriod = value;
  }

  void addToDisapproveTimePeriod(String value) {
    disapproveTimePeriod.add(value);
  }

  void removeFromDisapproveTimePeriod(String value) {
    disapproveTimePeriod.remove(value);
  }

  void removeAtIndexFromDisapproveTimePeriod(int index) {
    disapproveTimePeriod.removeAt(index);
  }

  void updateDisapproveTimePeriodAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveTimePeriod[index] = updateFn(_disapproveTimePeriod[index]);
  }

  void insertAtIndexInDisapproveTimePeriod(int index, String value) {
    disapproveTimePeriod.insert(index, value);
  }

  List<String> _disapproveReason = [];
  List<String> get disapproveReason => _disapproveReason;
  set disapproveReason(List<String> value) {
    _disapproveReason = value;
  }

  void addToDisapproveReason(String value) {
    disapproveReason.add(value);
  }

  void removeFromDisapproveReason(String value) {
    disapproveReason.remove(value);
  }

  void removeAtIndexFromDisapproveReason(int index) {
    disapproveReason.removeAt(index);
  }

  void updateDisapproveReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveReason[index] = updateFn(_disapproveReason[index]);
  }

  void insertAtIndexInDisapproveReason(int index, String value) {
    disapproveReason.insert(index, value);
  }

  List<String> _provName = ['ProvName'];
  List<String> get provName => _provName;
  set provName(List<String> value) {
    _provName = value;
  }

  void addToProvName(String value) {
    provName.add(value);
  }

  void removeFromProvName(String value) {
    provName.remove(value);
  }

  void removeAtIndexFromProvName(int index) {
    provName.removeAt(index);
  }

  void updateProvNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    provName[index] = updateFn(_provName[index]);
  }

  void insertAtIndexInProvName(int index, String value) {
    provName.insert(index, value);
  }

  List<String> _provCode = ['ProvCode'];
  List<String> get provCode => _provCode;
  set provCode(List<String> value) {
    _provCode = value;
  }

  void addToProvCode(String value) {
    provCode.add(value);
  }

  void removeFromProvCode(String value) {
    provCode.remove(value);
  }

  void removeAtIndexFromProvCode(int index) {
    provCode.removeAt(index);
  }

  void updateProvCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    provCode[index] = updateFn(_provCode[index]);
  }

  void insertAtIndexInProvCode(int index, String value) {
    provCode.insert(index, value);
  }

  List<String> _districtName = ['districtName'];
  List<String> get districtName => _districtName;
  set districtName(List<String> value) {
    _districtName = value;
  }

  void addToDistrictName(String value) {
    districtName.add(value);
  }

  void removeFromDistrictName(String value) {
    districtName.remove(value);
  }

  void removeAtIndexFromDistrictName(int index) {
    districtName.removeAt(index);
  }

  void updateDistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    districtName[index] = updateFn(_districtName[index]);
  }

  void insertAtIndexInDistrictName(int index, String value) {
    districtName.insert(index, value);
  }

  List<String> _districtCode = ['districtCode'];
  List<String> get districtCode => _districtCode;
  set districtCode(List<String> value) {
    _districtCode = value;
  }

  void addToDistrictCode(String value) {
    districtCode.add(value);
  }

  void removeFromDistrictCode(String value) {
    districtCode.remove(value);
  }

  void removeAtIndexFromDistrictCode(int index) {
    districtCode.removeAt(index);
  }

  void updateDistrictCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    districtCode[index] = updateFn(_districtCode[index]);
  }

  void insertAtIndexInDistrictCode(int index, String value) {
    districtCode.insert(index, value);
  }

  List<String> _postCode = ['PostCode'];
  List<String> get postCode => _postCode;
  set postCode(List<String> value) {
    _postCode = value;
  }

  void addToPostCode(String value) {
    postCode.add(value);
  }

  void removeFromPostCode(String value) {
    postCode.remove(value);
  }

  void removeAtIndexFromPostCode(int index) {
    postCode.removeAt(index);
  }

  void updatePostCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postCode[index] = updateFn(_postCode[index]);
  }

  void insertAtIndexInPostCode(int index, String value) {
    postCode.insert(index, value);
  }

  List<String> _subDistrictName = ['subDistrictName'];
  List<String> get subDistrictName => _subDistrictName;
  set subDistrictName(List<String> value) {
    _subDistrictName = value;
  }

  void addToSubDistrictName(String value) {
    subDistrictName.add(value);
  }

  void removeFromSubDistrictName(String value) {
    subDistrictName.remove(value);
  }

  void removeAtIndexFromSubDistrictName(int index) {
    subDistrictName.removeAt(index);
  }

  void updateSubDistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    subDistrictName[index] = updateFn(_subDistrictName[index]);
  }

  void insertAtIndexInSubDistrictName(int index, String value) {
    subDistrictName.insert(index, value);
  }

  int _leaveDayInt = 0;
  int get leaveDayInt => _leaveDayInt;
  set leaveDayInt(int value) {
    _leaveDayInt = value;
  }

  List<String> _leaveTypeEdit = [];
  List<String> get leaveTypeEdit => _leaveTypeEdit;
  set leaveTypeEdit(List<String> value) {
    _leaveTypeEdit = value;
  }

  void addToLeaveTypeEdit(String value) {
    leaveTypeEdit.add(value);
  }

  void removeFromLeaveTypeEdit(String value) {
    leaveTypeEdit.remove(value);
  }

  void removeAtIndexFromLeaveTypeEdit(int index) {
    leaveTypeEdit.removeAt(index);
  }

  void updateLeaveTypeEditAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveTypeEdit[index] = updateFn(_leaveTypeEdit[index]);
  }

  void insertAtIndexInLeaveTypeEdit(int index, String value) {
    leaveTypeEdit.insert(index, value);
  }

  List<String> _leaveHalfDay = [
    'ลาเต็มวัน',
    'ลาครึ่งวันเช้า',
    'ลาครึ่งวันบ่าย'
  ];
  List<String> get leaveHalfDay => _leaveHalfDay;
  set leaveHalfDay(List<String> value) {
    _leaveHalfDay = value;
  }

  void addToLeaveHalfDay(String value) {
    leaveHalfDay.add(value);
  }

  void removeFromLeaveHalfDay(String value) {
    leaveHalfDay.remove(value);
  }

  void removeAtIndexFromLeaveHalfDay(int index) {
    leaveHalfDay.removeAt(index);
  }

  void updateLeaveHalfDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveHalfDay[index] = updateFn(_leaveHalfDay[index]);
  }

  void insertAtIndexInLeaveHalfDay(int index, String value) {
    leaveHalfDay.insert(index, value);
  }

  List<String> _leaveFullDay = ['ลาเต็มวัน'];
  List<String> get leaveFullDay => _leaveFullDay;
  set leaveFullDay(List<String> value) {
    _leaveFullDay = value;
  }

  void addToLeaveFullDay(String value) {
    leaveFullDay.add(value);
  }

  void removeFromLeaveFullDay(String value) {
    leaveFullDay.remove(value);
  }

  void removeAtIndexFromLeaveFullDay(int index) {
    leaveFullDay.removeAt(index);
  }

  void updateLeaveFullDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveFullDay[index] = updateFn(_leaveFullDay[index]);
  }

  void insertAtIndexInLeaveFullDay(int index, String value) {
    leaveFullDay.insert(index, value);
  }

  bool _leaveReasonEtcVisible = false;
  bool get leaveReasonEtcVisible => _leaveReasonEtcVisible;
  set leaveReasonEtcVisible(bool value) {
    _leaveReasonEtcVisible = value;
  }

  bool _companyAssetReturnEtcVisible = false;
  bool get companyAssetReturnEtcVisible => _companyAssetReturnEtcVisible;
  set companyAssetReturnEtcVisible(bool value) {
    _companyAssetReturnEtcVisible = value;
  }

  List<String> _reasonToLeaveList = [];
  List<String> get reasonToLeaveList => _reasonToLeaveList;
  set reasonToLeaveList(List<String> value) {
    _reasonToLeaveList = value;
  }

  void addToReasonToLeaveList(String value) {
    reasonToLeaveList.add(value);
  }

  void removeFromReasonToLeaveList(String value) {
    reasonToLeaveList.remove(value);
  }

  void removeAtIndexFromReasonToLeaveList(int index) {
    reasonToLeaveList.removeAt(index);
  }

  void updateReasonToLeaveListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    reasonToLeaveList[index] = updateFn(_reasonToLeaveList[index]);
  }

  void insertAtIndexInReasonToLeaveList(int index, String value) {
    reasonToLeaveList.insert(index, value);
  }

  List<String> _assetReturnList = [];
  List<String> get assetReturnList => _assetReturnList;
  set assetReturnList(List<String> value) {
    _assetReturnList = value;
  }

  void addToAssetReturnList(String value) {
    assetReturnList.add(value);
  }

  void removeFromAssetReturnList(String value) {
    assetReturnList.remove(value);
  }

  void removeAtIndexFromAssetReturnList(int index) {
    assetReturnList.removeAt(index);
  }

  void updateAssetReturnListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    assetReturnList[index] = updateFn(_assetReturnList[index]);
  }

  void insertAtIndexInAssetReturnList(int index, String value) {
    assetReturnList.insert(index, value);
  }

  List<String> _insurancePlan1 = [];
  List<String> get insurancePlan1 => _insurancePlan1;
  set insurancePlan1(List<String> value) {
    _insurancePlan1 = value;
  }

  void addToInsurancePlan1(String value) {
    insurancePlan1.add(value);
  }

  void removeFromInsurancePlan1(String value) {
    insurancePlan1.remove(value);
  }

  void removeAtIndexFromInsurancePlan1(int index) {
    insurancePlan1.removeAt(index);
  }

  void updateInsurancePlan1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurancePlan1[index] = updateFn(_insurancePlan1[index]);
  }

  void insertAtIndexInInsurancePlan1(int index, String value) {
    insurancePlan1.insert(index, value);
  }

  String _insurancePlanNumber = '';
  String get insurancePlanNumber => _insurancePlanNumber;
  set insurancePlanNumber(String value) {
    _insurancePlanNumber = value;
  }

  String _profileLevel = '';
  String get profileLevel => _profileLevel;
  set profileLevel(String value) {
    _profileLevel = value;
  }

  String _profileBranch = '';
  String get profileBranch => _profileBranch;
  set profileBranch(String value) {
    _profileBranch = value;
  }

  List<Color> _welfareKpiStatusTextColorList = [
    Color(4293807906),
    Color(4293837090),
    Color(4286301986),
    Color(4280348415),
    Color(4279118847)
  ];
  List<Color> get welfareKpiStatusTextColorList =>
      _welfareKpiStatusTextColorList;
  set welfareKpiStatusTextColorList(List<Color> value) {
    _welfareKpiStatusTextColorList = value;
  }

  void addToWelfareKpiStatusTextColorList(Color value) {
    welfareKpiStatusTextColorList.add(value);
  }

  void removeFromWelfareKpiStatusTextColorList(Color value) {
    welfareKpiStatusTextColorList.remove(value);
  }

  void removeAtIndexFromWelfareKpiStatusTextColorList(int index) {
    welfareKpiStatusTextColorList.removeAt(index);
  }

  void updateWelfareKpiStatusTextColorListAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    welfareKpiStatusTextColorList[index] =
        updateFn(_welfareKpiStatusTextColorList[index]);
  }

  void insertAtIndexInWelfareKpiStatusTextColorList(int index, Color value) {
    welfareKpiStatusTextColorList.insert(index, value);
  }

  bool _isProduction = true;
  bool get isProduction => _isProduction;
  set isProduction(bool value) {
    _isProduction = value;
  }

  bool _isSelectedBranch = false;
  bool get isSelectedBranch => _isSelectedBranch;
  set isSelectedBranch(bool value) {
    _isSelectedBranch = value;
  }

  bool _isSearchedBranch = false;
  bool get isSearchedBranch => _isSearchedBranch;
  set isSearchedBranch(bool value) {
    _isSearchedBranch = value;
  }

  bool _isEmployeeSearched = false;
  bool get isEmployeeSearched => _isEmployeeSearched;
  set isEmployeeSearched(bool value) {
    _isEmployeeSearched = value;
  }

  bool _isEmployeeSelected = false;
  bool get isEmployeeSelected => _isEmployeeSelected;
  set isEmployeeSelected(bool value) {
    _isEmployeeSelected = value;
  }

  List<int> _welfareCEOStatusList = [5544, 5544];
  List<int> get welfareCEOStatusList => _welfareCEOStatusList;
  set welfareCEOStatusList(List<int> value) {
    _welfareCEOStatusList = value;
  }

  void addToWelfareCEOStatusList(int value) {
    welfareCEOStatusList.add(value);
  }

  void removeFromWelfareCEOStatusList(int value) {
    welfareCEOStatusList.remove(value);
  }

  void removeAtIndexFromWelfareCEOStatusList(int index) {
    welfareCEOStatusList.removeAt(index);
  }

  void updateWelfareCEOStatusListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    welfareCEOStatusList[index] = updateFn(_welfareCEOStatusList[index]);
  }

  void insertAtIndexInWelfareCEOStatusList(int index, int value) {
    welfareCEOStatusList.insert(index, value);
  }

  List<String> _leadCountCalled = [];
  List<String> get leadCountCalled => _leadCountCalled;
  set leadCountCalled(List<String> value) {
    _leadCountCalled = value;
  }

  void addToLeadCountCalled(String value) {
    leadCountCalled.add(value);
  }

  void removeFromLeadCountCalled(String value) {
    leadCountCalled.remove(value);
  }

  void removeAtIndexFromLeadCountCalled(int index) {
    leadCountCalled.removeAt(index);
  }

  void updateLeadCountCalledAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCountCalled[index] = updateFn(_leadCountCalled[index]);
  }

  void insertAtIndexInLeadCountCalled(int index, String value) {
    leadCountCalled.insert(index, value);
  }

  double _branchLatDouble = 0.0;
  double get branchLatDouble => _branchLatDouble;
  set branchLatDouble(double value) {
    _branchLatDouble = value;
  }

  double _branchLngDouble = 0.0;
  double get branchLngDouble => _branchLngDouble;
  set branchLngDouble(double value) {
    _branchLngDouble = value;
  }

  double _currentLatDouble = 0.0;
  double get currentLatDouble => _currentLatDouble;
  set currentLatDouble(double value) {
    _currentLatDouble = value;
  }

  double _currentLngDouble = 0.0;
  double get currentLngDouble => _currentLngDouble;
  set currentLngDouble(double value) {
    _currentLngDouble = value;
  }

  List<String> _leadName2 = [];
  List<String> get leadName2 => _leadName2;
  set leadName2(List<String> value) {
    _leadName2 = value;
  }

  void addToLeadName2(String value) {
    leadName2.add(value);
  }

  void removeFromLeadName2(String value) {
    leadName2.remove(value);
  }

  void removeAtIndexFromLeadName2(int index) {
    leadName2.removeAt(index);
  }

  void updateLeadName2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadName2[index] = updateFn(_leadName2[index]);
  }

  void insertAtIndexInLeadName2(int index, String value) {
    leadName2.insert(index, value);
  }

  List<String> _leadLastname2 = [];
  List<String> get leadLastname2 => _leadLastname2;
  set leadLastname2(List<String> value) {
    _leadLastname2 = value;
  }

  void addToLeadLastname2(String value) {
    leadLastname2.add(value);
  }

  void removeFromLeadLastname2(String value) {
    leadLastname2.remove(value);
  }

  void removeAtIndexFromLeadLastname2(int index) {
    leadLastname2.removeAt(index);
  }

  void updateLeadLastname2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadLastname2[index] = updateFn(_leadLastname2[index]);
  }

  void insertAtIndexInLeadLastname2(int index, String value) {
    leadLastname2.insert(index, value);
  }

  List<String> _leadPhone2 = [];
  List<String> get leadPhone2 => _leadPhone2;
  set leadPhone2(List<String> value) {
    _leadPhone2 = value;
  }

  void addToLeadPhone2(String value) {
    leadPhone2.add(value);
  }

  void removeFromLeadPhone2(String value) {
    leadPhone2.remove(value);
  }

  void removeAtIndexFromLeadPhone2(int index) {
    leadPhone2.removeAt(index);
  }

  void updateLeadPhone2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhone2[index] = updateFn(_leadPhone2[index]);
  }

  void insertAtIndexInLeadPhone2(int index, String value) {
    leadPhone2.insert(index, value);
  }

  List<int> _totalSumPoint = [];
  List<int> get totalSumPoint => _totalSumPoint;
  set totalSumPoint(List<int> value) {
    _totalSumPoint = value;
  }

  void addToTotalSumPoint(int value) {
    totalSumPoint.add(value);
  }

  void removeFromTotalSumPoint(int value) {
    totalSumPoint.remove(value);
  }

  void removeAtIndexFromTotalSumPoint(int index) {
    totalSumPoint.removeAt(index);
  }

  void updateTotalSumPointAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    totalSumPoint[index] = updateFn(_totalSumPoint[index]);
  }

  void insertAtIndexInTotalSumPoint(int index, int value) {
    totalSumPoint.insert(index, value);
  }

  List<String> _leadCarVehicleName = [];
  List<String> get leadCarVehicleName => _leadCarVehicleName;
  set leadCarVehicleName(List<String> value) {
    _leadCarVehicleName = value;
  }

  void addToLeadCarVehicleName(String value) {
    leadCarVehicleName.add(value);
  }

  void removeFromLeadCarVehicleName(String value) {
    leadCarVehicleName.remove(value);
  }

  void removeAtIndexFromLeadCarVehicleName(int index) {
    leadCarVehicleName.removeAt(index);
  }

  void updateLeadCarVehicleNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCarVehicleName[index] = updateFn(_leadCarVehicleName[index]);
  }

  void insertAtIndexInLeadCarVehicleName(int index, String value) {
    leadCarVehicleName.insert(index, value);
  }

  List<String> _leadAmountRequest = [];
  List<String> get leadAmountRequest => _leadAmountRequest;
  set leadAmountRequest(List<String> value) {
    _leadAmountRequest = value;
  }

  void addToLeadAmountRequest(String value) {
    leadAmountRequest.add(value);
  }

  void removeFromLeadAmountRequest(String value) {
    leadAmountRequest.remove(value);
  }

  void removeAtIndexFromLeadAmountRequest(int index) {
    leadAmountRequest.removeAt(index);
  }

  void updateLeadAmountRequestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadAmountRequest[index] = updateFn(_leadAmountRequest[index]);
  }

  void insertAtIndexInLeadAmountRequest(int index, String value) {
    leadAmountRequest.insert(index, value);
  }

  String _changeBranchCode = '';
  String get changeBranchCode => _changeBranchCode;
  set changeBranchCode(String value) {
    _changeBranchCode = value;
  }

  String _changeLat = '';
  String get changeLat => _changeLat;
  set changeLat(String value) {
    _changeLat = value;
  }

  String _changeLng = '';
  String get changeLng => _changeLng;
  set changeLng(String value) {
    _changeLng = value;
  }

  DateTime? _tpbDate;
  DateTime? get tpbDate => _tpbDate;
  set tpbDate(DateTime? value) {
    _tpbDate = value;
  }

  bool _firstLogin = false;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool value) {
    _firstLogin = value;
    secureStorage.setBool('ff_firstLogin', value);
  }

  void deleteFirstLogin() {
    secureStorage.delete(key: 'ff_firstLogin');
  }

  List<String> _brachListNew = [];
  List<String> get brachListNew => _brachListNew;
  set brachListNew(List<String> value) {
    _brachListNew = value;
    secureStorage.setStringList('ff_brachListNew', value);
  }

  void deleteBrachListNew() {
    secureStorage.delete(key: 'ff_brachListNew');
  }

  void addToBrachListNew(String value) {
    brachListNew.add(value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeFromBrachListNew(String value) {
    brachListNew.remove(value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeAtIndexFromBrachListNew(int index) {
    brachListNew.removeAt(index);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void updateBrachListNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachListNew[index] = updateFn(_brachListNew[index]);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void insertAtIndexInBrachListNew(int index, String value) {
    brachListNew.insert(index, value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  List<String> _brachLatNew = [];
  List<String> get brachLatNew => _brachLatNew;
  set brachLatNew(List<String> value) {
    _brachLatNew = value;
    secureStorage.setStringList('ff_brachLatNew', value);
  }

  void deleteBrachLatNew() {
    secureStorage.delete(key: 'ff_brachLatNew');
  }

  void addToBrachLatNew(String value) {
    brachLatNew.add(value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeFromBrachLatNew(String value) {
    brachLatNew.remove(value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeAtIndexFromBrachLatNew(int index) {
    brachLatNew.removeAt(index);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void updateBrachLatNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachLatNew[index] = updateFn(_brachLatNew[index]);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void insertAtIndexInBrachLatNew(int index, String value) {
    brachLatNew.insert(index, value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  List<String> _brachLngNew = [];
  List<String> get brachLngNew => _brachLngNew;
  set brachLngNew(List<String> value) {
    _brachLngNew = value;
    secureStorage.setStringList('ff_brachLngNew', value);
  }

  void deleteBrachLngNew() {
    secureStorage.delete(key: 'ff_brachLngNew');
  }

  void addToBrachLngNew(String value) {
    brachLngNew.add(value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeFromBrachLngNew(String value) {
    brachLngNew.remove(value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeAtIndexFromBrachLngNew(int index) {
    brachLngNew.removeAt(index);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void updateBrachLngNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachLngNew[index] = updateFn(_brachLngNew[index]);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void insertAtIndexInBrachLngNew(int index, String value) {
    brachLngNew.insert(index, value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  List<String> _BrachRadNew = [];
  List<String> get BrachRadNew => _BrachRadNew;
  set BrachRadNew(List<String> value) {
    _BrachRadNew = value;
    secureStorage.setStringList('ff_BrachRadNew', value);
  }

  void deleteBrachRadNew() {
    secureStorage.delete(key: 'ff_BrachRadNew');
  }

  void addToBrachRadNew(String value) {
    BrachRadNew.add(value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeFromBrachRadNew(String value) {
    BrachRadNew.remove(value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeAtIndexFromBrachRadNew(int index) {
    BrachRadNew.removeAt(index);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void updateBrachRadNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    BrachRadNew[index] = updateFn(_BrachRadNew[index]);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void insertAtIndexInBrachRadNew(int index, String value) {
    BrachRadNew.insert(index, value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  String _brachGroupNew = '';
  String get brachGroupNew => _brachGroupNew;
  set brachGroupNew(String value) {
    _brachGroupNew = value;
    secureStorage.setString('ff_brachGroupNew', value);
  }

  void deleteBrachGroupNew() {
    secureStorage.delete(key: 'ff_brachGroupNew');
  }

  List<String> _leadCalledStatusReason = [];
  List<String> get leadCalledStatusReason => _leadCalledStatusReason;
  set leadCalledStatusReason(List<String> value) {
    _leadCalledStatusReason = value;
  }

  void addToLeadCalledStatusReason(String value) {
    leadCalledStatusReason.add(value);
  }

  void removeFromLeadCalledStatusReason(String value) {
    leadCalledStatusReason.remove(value);
  }

  void removeAtIndexFromLeadCalledStatusReason(int index) {
    leadCalledStatusReason.removeAt(index);
  }

  void updateLeadCalledStatusReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCalledStatusReason[index] = updateFn(_leadCalledStatusReason[index]);
  }

  void insertAtIndexInLeadCalledStatusReason(int index, String value) {
    leadCalledStatusReason.insert(index, value);
  }

  List<String> _leadContractStatus = [];
  List<String> get leadContractStatus => _leadContractStatus;
  set leadContractStatus(List<String> value) {
    _leadContractStatus = value;
  }

  void addToLeadContractStatus(String value) {
    leadContractStatus.add(value);
  }

  void removeFromLeadContractStatus(String value) {
    leadContractStatus.remove(value);
  }

  void removeAtIndexFromLeadContractStatus(int index) {
    leadContractStatus.removeAt(index);
  }

  void updateLeadContractStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractStatus[index] = updateFn(_leadContractStatus[index]);
  }

  void insertAtIndexInLeadContractStatus(int index, String value) {
    leadContractStatus.insert(index, value);
  }

  List<String> _leadContractDate = [];
  List<String> get leadContractDate => _leadContractDate;
  set leadContractDate(List<String> value) {
    _leadContractDate = value;
  }

  void addToLeadContractDate(String value) {
    leadContractDate.add(value);
  }

  void removeFromLeadContractDate(String value) {
    leadContractDate.remove(value);
  }

  void removeAtIndexFromLeadContractDate(int index) {
    leadContractDate.removeAt(index);
  }

  void updateLeadContractDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractDate[index] = updateFn(_leadContractDate[index]);
  }

  void insertAtIndexInLeadContractDate(int index, String value) {
    leadContractDate.insert(index, value);
  }

  List<String> _defaultList1 = [
    'Hello World1',
    'Hello World3',
    'Hello World5',
    'Hello World7',
    'Hello World9'
  ];
  List<String> get defaultList1 => _defaultList1;
  set defaultList1(List<String> value) {
    _defaultList1 = value;
  }

  void addToDefaultList1(String value) {
    defaultList1.add(value);
  }

  void removeFromDefaultList1(String value) {
    defaultList1.remove(value);
  }

  void removeAtIndexFromDefaultList1(int index) {
    defaultList1.removeAt(index);
  }

  void updateDefaultList1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList1[index] = updateFn(_defaultList1[index]);
  }

  void insertAtIndexInDefaultList1(int index, String value) {
    defaultList1.insert(index, value);
  }

  List<String> _defaultList2 = ['Hello World'];
  List<String> get defaultList2 => _defaultList2;
  set defaultList2(List<String> value) {
    _defaultList2 = value;
  }

  void addToDefaultList2(String value) {
    defaultList2.add(value);
  }

  void removeFromDefaultList2(String value) {
    defaultList2.remove(value);
  }

  void removeAtIndexFromDefaultList2(int index) {
    defaultList2.removeAt(index);
  }

  void updateDefaultList2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList2[index] = updateFn(_defaultList2[index]);
  }

  void insertAtIndexInDefaultList2(int index, String value) {
    defaultList2.insert(index, value);
  }

  List<String> _defaultList3 = ['Hello World'];
  List<String> get defaultList3 => _defaultList3;
  set defaultList3(List<String> value) {
    _defaultList3 = value;
  }

  void addToDefaultList3(String value) {
    defaultList3.add(value);
  }

  void removeFromDefaultList3(String value) {
    defaultList3.remove(value);
  }

  void removeAtIndexFromDefaultList3(int index) {
    defaultList3.removeAt(index);
  }

  void updateDefaultList3AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList3[index] = updateFn(_defaultList3[index]);
  }

  void insertAtIndexInDefaultList3(int index, String value) {
    defaultList3.insert(index, value);
  }

  List<String> _defaultList4 = ['Hello World'];
  List<String> get defaultList4 => _defaultList4;
  set defaultList4(List<String> value) {
    _defaultList4 = value;
  }

  void addToDefaultList4(String value) {
    defaultList4.add(value);
  }

  void removeFromDefaultList4(String value) {
    defaultList4.remove(value);
  }

  void removeAtIndexFromDefaultList4(int index) {
    defaultList4.removeAt(index);
  }

  void updateDefaultList4AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList4[index] = updateFn(_defaultList4[index]);
  }

  void insertAtIndexInDefaultList4(int index, String value) {
    defaultList4.insert(index, value);
  }

  List<String> _defaultList5 = ['อยู่ระหว่างชำระเงิน', 'เตรียมข้อมูล'];
  List<String> get defaultList5 => _defaultList5;
  set defaultList5(List<String> value) {
    _defaultList5 = value;
  }

  void addToDefaultList5(String value) {
    defaultList5.add(value);
  }

  void removeFromDefaultList5(String value) {
    defaultList5.remove(value);
  }

  void removeAtIndexFromDefaultList5(int index) {
    defaultList5.removeAt(index);
  }

  void updateDefaultList5AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList5[index] = updateFn(_defaultList5[index]);
  }

  void insertAtIndexInDefaultList5(int index, String value) {
    defaultList5.insert(index, value);
  }

  List<String> _defaultList6 = ['Hello World'];
  List<String> get defaultList6 => _defaultList6;
  set defaultList6(List<String> value) {
    _defaultList6 = value;
  }

  void addToDefaultList6(String value) {
    defaultList6.add(value);
  }

  void removeFromDefaultList6(String value) {
    defaultList6.remove(value);
  }

  void removeAtIndexFromDefaultList6(int index) {
    defaultList6.removeAt(index);
  }

  void updateDefaultList6AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList6[index] = updateFn(_defaultList6[index]);
  }

  void insertAtIndexInDefaultList6(int index, String value) {
    defaultList6.insert(index, value);
  }

  List<String> _defaultList7 = ['Hello World'];
  List<String> get defaultList7 => _defaultList7;
  set defaultList7(List<String> value) {
    _defaultList7 = value;
  }

  void addToDefaultList7(String value) {
    defaultList7.add(value);
  }

  void removeFromDefaultList7(String value) {
    defaultList7.remove(value);
  }

  void removeAtIndexFromDefaultList7(int index) {
    defaultList7.removeAt(index);
  }

  void updateDefaultList7AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList7[index] = updateFn(_defaultList7[index]);
  }

  void insertAtIndexInDefaultList7(int index, String value) {
    defaultList7.insert(index, value);
  }

  String _profileFirstName = '[first_name]';
  String get profileFirstName => _profileFirstName;
  set profileFirstName(String value) {
    _profileFirstName = value;
  }

  String _profileLastName = '[last_name]';
  String get profileLastName => _profileLastName;
  set profileLastName(String value) {
    _profileLastName = value;
  }

  dynamic _userInsuranceLicense;
  dynamic get userInsuranceLicense => _userInsuranceLicense;
  set userInsuranceLicense(dynamic value) {
    _userInsuranceLicense = value;
  }

  List<String> _insuranceLicenseData = [];
  List<String> get insuranceLicenseData => _insuranceLicenseData;
  set insuranceLicenseData(List<String> value) {
    _insuranceLicenseData = value;
  }

  void addToInsuranceLicenseData(String value) {
    insuranceLicenseData.add(value);
  }

  void removeFromInsuranceLicenseData(String value) {
    insuranceLicenseData.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseData(int index) {
    insuranceLicenseData.removeAt(index);
  }

  void updateInsuranceLicenseDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceLicenseData[index] = updateFn(_insuranceLicenseData[index]);
  }

  void insertAtIndexInInsuranceLicenseData(int index, String value) {
    insuranceLicenseData.insert(index, value);
  }

  int _statusCodeSuccess = 200;
  int get statusCodeSuccess => _statusCodeSuccess;
  set statusCodeSuccess(int value) {
    _statusCodeSuccess = value;
  }

  List<int> _insuranceLicenseStatusCode = [404, 404, 404, 404, 404, 404, 404];
  List<int> get insuranceLicenseStatusCode => _insuranceLicenseStatusCode;
  set insuranceLicenseStatusCode(List<int> value) {
    _insuranceLicenseStatusCode = value;
  }

  void addToInsuranceLicenseStatusCode(int value) {
    insuranceLicenseStatusCode.add(value);
  }

  void removeFromInsuranceLicenseStatusCode(int value) {
    insuranceLicenseStatusCode.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCode(int index) {
    insuranceLicenseStatusCode.removeAt(index);
  }

  void updateInsuranceLicenseStatusCodeAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    insuranceLicenseStatusCode[index] =
        updateFn(_insuranceLicenseStatusCode[index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCode(int index, int value) {
    insuranceLicenseStatusCode.insert(index, value);
  }

  List<DateTime> _profileInsuExpdateAD = [];
  List<DateTime> get profileInsuExpdateAD => _profileInsuExpdateAD;
  set profileInsuExpdateAD(List<DateTime> value) {
    _profileInsuExpdateAD = value;
  }

  void addToProfileInsuExpdateAD(DateTime value) {
    profileInsuExpdateAD.add(value);
  }

  void removeFromProfileInsuExpdateAD(DateTime value) {
    profileInsuExpdateAD.remove(value);
  }

  void removeAtIndexFromProfileInsuExpdateAD(int index) {
    profileInsuExpdateAD.removeAt(index);
  }

  void updateProfileInsuExpdateADAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    profileInsuExpdateAD[index] = updateFn(_profileInsuExpdateAD[index]);
  }

  void insertAtIndexInProfileInsuExpdateAD(int index, DateTime value) {
    profileInsuExpdateAD.insert(index, value);
  }

  List<bool> _expInsuLessthen30 = [];
  List<bool> get expInsuLessthen30 => _expInsuLessthen30;
  set expInsuLessthen30(List<bool> value) {
    _expInsuLessthen30 = value;
  }

  void addToExpInsuLessthen30(bool value) {
    expInsuLessthen30.add(value);
  }

  void removeFromExpInsuLessthen30(bool value) {
    expInsuLessthen30.remove(value);
  }

  void removeAtIndexFromExpInsuLessthen30(int index) {
    expInsuLessthen30.removeAt(index);
  }

  void updateExpInsuLessthen30AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    expInsuLessthen30[index] = updateFn(_expInsuLessthen30[index]);
  }

  void insertAtIndexInExpInsuLessthen30(int index, bool value) {
    expInsuLessthen30.insert(index, value);
  }

  int _superAppi = 0;
  int get superAppi => _superAppi;
  set superAppi(int value) {
    _superAppi = value;
  }

  List<bool> _defaultlistFalse = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get defaultlistFalse => _defaultlistFalse;
  set defaultlistFalse(List<bool> value) {
    _defaultlistFalse = value;
  }

  void addToDefaultlistFalse(bool value) {
    defaultlistFalse.add(value);
  }

  void removeFromDefaultlistFalse(bool value) {
    defaultlistFalse.remove(value);
  }

  void removeAtIndexFromDefaultlistFalse(int index) {
    defaultlistFalse.removeAt(index);
  }

  void updateDefaultlistFalseAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    defaultlistFalse[index] = updateFn(_defaultlistFalse[index]);
  }

  void insertAtIndexInDefaultlistFalse(int index, bool value) {
    defaultlistFalse.insert(index, value);
  }

  List<bool> _falselistPersistd = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get falselistPersistd => _falselistPersistd;
  set falselistPersistd(List<bool> value) {
    _falselistPersistd = value;
    secureStorage.setStringList(
        'ff_falselistPersistd', value.map((x) => x.toString()).toList());
  }

  void deleteFalselistPersistd() {
    secureStorage.delete(key: 'ff_falselistPersistd');
  }

  void addToFalselistPersistd(bool value) {
    falselistPersistd.add(value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeFromFalselistPersistd(bool value) {
    falselistPersistd.remove(value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFalselistPersistd(int index) {
    falselistPersistd.removeAt(index);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void updateFalselistPersistdAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    falselistPersistd[index] = updateFn(_falselistPersistd[index]);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFalselistPersistd(int index, bool value) {
    falselistPersistd.insert(index, value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  List<int> _InsuranceLicenseStatusCodeDefault = [
    404,
    404,
    404,
    404,
    404,
    404,
    404
  ];
  List<int> get InsuranceLicenseStatusCodeDefault =>
      _InsuranceLicenseStatusCodeDefault;
  set InsuranceLicenseStatusCodeDefault(List<int> value) {
    _InsuranceLicenseStatusCodeDefault = value;
  }

  void addToInsuranceLicenseStatusCodeDefault(int value) {
    InsuranceLicenseStatusCodeDefault.add(value);
  }

  void removeFromInsuranceLicenseStatusCodeDefault(int value) {
    InsuranceLicenseStatusCodeDefault.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCodeDefault(int index) {
    InsuranceLicenseStatusCodeDefault.removeAt(index);
  }

  void updateInsuranceLicenseStatusCodeDefaultAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    InsuranceLicenseStatusCodeDefault[index] =
        updateFn(_InsuranceLicenseStatusCodeDefault[index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCodeDefault(int index, int value) {
    InsuranceLicenseStatusCodeDefault.insert(index, value);
  }

  String _changeBranchName = '[branch_name]';
  String get changeBranchName => _changeBranchName;
  set changeBranchName(String value) {
    _changeBranchName = value;
  }

  bool _isGetDataViaFirebase = false;
  bool get isGetDataViaFirebase => _isGetDataViaFirebase;
  set isGetDataViaFirebase(bool value) {
    _isGetDataViaFirebase = value;
  }

  String _departmentProfile = '';
  String get departmentProfile => _departmentProfile;
  set departmentProfile(String value) {
    _departmentProfile = value;
  }

  List<String> _adminEMP = [];
  List<String> get adminEMP => _adminEMP;
  set adminEMP(List<String> value) {
    _adminEMP = value;
  }

  void addToAdminEMP(String value) {
    adminEMP.add(value);
  }

  void removeFromAdminEMP(String value) {
    adminEMP.remove(value);
  }

  void removeAtIndexFromAdminEMP(int index) {
    adminEMP.removeAt(index);
  }

  void updateAdminEMPAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminEMP[index] = updateFn(_adminEMP[index]);
  }

  void insertAtIndexInAdminEMP(int index, String value) {
    adminEMP.insert(index, value);
  }

  bool _checkBranchDropdown = false;
  bool get checkBranchDropdown => _checkBranchDropdown;
  set checkBranchDropdown(bool value) {
    _checkBranchDropdown = value;
  }

  bool _BioAuthCheck = false;
  bool get BioAuthCheck => _BioAuthCheck;
  set BioAuthCheck(bool value) {
    _BioAuthCheck = value;
    secureStorage.setBool('ff_BioAuthCheck', value);
  }

  void deleteBioAuthCheck() {
    secureStorage.delete(key: 'ff_BioAuthCheck');
  }

  String _bossCheckFlag = '';
  String get bossCheckFlag => _bossCheckFlag;
  set bossCheckFlag(String value) {
    _bossCheckFlag = value;
  }

  bool _ApproveAllCheck = false;
  bool get ApproveAllCheck => _ApproveAllCheck;
  set ApproveAllCheck(bool value) {
    _ApproveAllCheck = value;
  }

  List<String> _ApproveSelect = [];
  List<String> get ApproveSelect => _ApproveSelect;
  set ApproveSelect(List<String> value) {
    _ApproveSelect = value;
  }

  void addToApproveSelect(String value) {
    ApproveSelect.add(value);
  }

  void removeFromApproveSelect(String value) {
    ApproveSelect.remove(value);
  }

  void removeAtIndexFromApproveSelect(int index) {
    ApproveSelect.removeAt(index);
  }

  void updateApproveSelectAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ApproveSelect[index] = updateFn(_ApproveSelect[index]);
  }

  void insertAtIndexInApproveSelect(int index, String value) {
    ApproveSelect.insert(index, value);
  }

  List<String> _tiktokNameList = [
    'กฤตกนก',
    'สุกัญญา',
    'นันทพร',
    'ชลณัฐ',
    'นรินทร์',
    'ลูกศร',
    'จรัสพร',
    'ปริยา​ภัทร​'
  ];
  List<String> get tiktokNameList => _tiktokNameList;
  set tiktokNameList(List<String> value) {
    _tiktokNameList = value;
  }

  void addToTiktokNameList(String value) {
    tiktokNameList.add(value);
  }

  void removeFromTiktokNameList(String value) {
    tiktokNameList.remove(value);
  }

  void removeAtIndexFromTiktokNameList(int index) {
    tiktokNameList.removeAt(index);
  }

  void updateTiktokNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokNameList[index] = updateFn(_tiktokNameList[index]);
  }

  void insertAtIndexInTiktokNameList(int index, String value) {
    tiktokNameList.insert(index, value);
  }

  List<String> _tiktokLastnameList = [
    'บุรารักษ์',
    'ธรรมนู',
    'วงศ์คำ',
    'ธนเปี่ยมสิริ',
    'เครือม่วง',
    'อังเปรม',
    'ทำกินดี',
    'คำทะลุ​ง'
  ];
  List<String> get tiktokLastnameList => _tiktokLastnameList;
  set tiktokLastnameList(List<String> value) {
    _tiktokLastnameList = value;
  }

  void addToTiktokLastnameList(String value) {
    tiktokLastnameList.add(value);
  }

  void removeFromTiktokLastnameList(String value) {
    tiktokLastnameList.remove(value);
  }

  void removeAtIndexFromTiktokLastnameList(int index) {
    tiktokLastnameList.removeAt(index);
  }

  void updateTiktokLastnameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokLastnameList[index] = updateFn(_tiktokLastnameList[index]);
  }

  void insertAtIndexInTiktokLastnameList(int index, String value) {
    tiktokLastnameList.insert(index, value);
  }

  List<String> _tiktokEmployeeIdList = [
    '32944',
    '30617',
    '27447',
    '24034',
    '13823',
    '20209',
    '7167',
    '14920'
  ];
  List<String> get tiktokEmployeeIdList => _tiktokEmployeeIdList;
  set tiktokEmployeeIdList(List<String> value) {
    _tiktokEmployeeIdList = value;
  }

  void addToTiktokEmployeeIdList(String value) {
    tiktokEmployeeIdList.add(value);
  }

  void removeFromTiktokEmployeeIdList(String value) {
    tiktokEmployeeIdList.remove(value);
  }

  void removeAtIndexFromTiktokEmployeeIdList(int index) {
    tiktokEmployeeIdList.removeAt(index);
  }

  void updateTiktokEmployeeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokEmployeeIdList[index] = updateFn(_tiktokEmployeeIdList[index]);
  }

  void insertAtIndexInTiktokEmployeeIdList(int index, String value) {
    tiktokEmployeeIdList.insert(index, value);
  }

  int _maxPage = 0;
  int get maxPage => _maxPage;
  set maxPage(int value) {
    _maxPage = value;
  }

  List<String> _pageSelectionList = ['1', '2', '3', '4', '5'];
  List<String> get pageSelectionList => _pageSelectionList;
  set pageSelectionList(List<String> value) {
    _pageSelectionList = value;
  }

  void addToPageSelectionList(String value) {
    pageSelectionList.add(value);
  }

  void removeFromPageSelectionList(String value) {
    pageSelectionList.remove(value);
  }

  void removeAtIndexFromPageSelectionList(int index) {
    pageSelectionList.removeAt(index);
  }

  void updatePageSelectionListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    pageSelectionList[index] = updateFn(_pageSelectionList[index]);
  }

  void insertAtIndexInPageSelectionList(int index, String value) {
    pageSelectionList.insert(index, value);
  }

  bool _visible = false;
  bool get visible => _visible;
  set visible(bool value) {
    _visible = value;
  }

  bool _previousButtonVisible = false;
  bool get previousButtonVisible => _previousButtonVisible;
  set previousButtonVisible(bool value) {
    _previousButtonVisible = value;
  }

  bool _nextButtonVisible = false;
  bool get nextButtonVisible => _nextButtonVisible;
  set nextButtonVisible(bool value) {
    _nextButtonVisible = value;
  }

  List<int> _reportItemIndexList = [];
  List<int> get reportItemIndexList => _reportItemIndexList;
  set reportItemIndexList(List<int> value) {
    _reportItemIndexList = value;
  }

  void addToReportItemIndexList(int value) {
    reportItemIndexList.add(value);
  }

  void removeFromReportItemIndexList(int value) {
    reportItemIndexList.remove(value);
  }

  void removeAtIndexFromReportItemIndexList(int index) {
    reportItemIndexList.removeAt(index);
  }

  void updateReportItemIndexListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    reportItemIndexList[index] = updateFn(_reportItemIndexList[index]);
  }

  void insertAtIndexInReportItemIndexList(int index, int value) {
    reportItemIndexList.insert(index, value);
  }

  List<String> _leadIdSurvey = [];
  List<String> get leadIdSurvey => _leadIdSurvey;
  set leadIdSurvey(List<String> value) {
    _leadIdSurvey = value;
  }

  void addToLeadIdSurvey(String value) {
    leadIdSurvey.add(value);
  }

  void removeFromLeadIdSurvey(String value) {
    leadIdSurvey.remove(value);
  }

  void removeAtIndexFromLeadIdSurvey(int index) {
    leadIdSurvey.removeAt(index);
  }

  void updateLeadIdSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadIdSurvey[index] = updateFn(_leadIdSurvey[index]);
  }

  void insertAtIndexInLeadIdSurvey(int index, String value) {
    leadIdSurvey.insert(index, value);
  }

  List<String> _leadCustomerNameSurvey = [];
  List<String> get leadCustomerNameSurvey => _leadCustomerNameSurvey;
  set leadCustomerNameSurvey(List<String> value) {
    _leadCustomerNameSurvey = value;
  }

  void addToLeadCustomerNameSurvey(String value) {
    leadCustomerNameSurvey.add(value);
  }

  void removeFromLeadCustomerNameSurvey(String value) {
    leadCustomerNameSurvey.remove(value);
  }

  void removeAtIndexFromLeadCustomerNameSurvey(int index) {
    leadCustomerNameSurvey.removeAt(index);
  }

  void updateLeadCustomerNameSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCustomerNameSurvey[index] = updateFn(_leadCustomerNameSurvey[index]);
  }

  void insertAtIndexInLeadCustomerNameSurvey(int index, String value) {
    leadCustomerNameSurvey.insert(index, value);
  }

  List<String> _leadCreatedTimeSurvey = [];
  List<String> get leadCreatedTimeSurvey => _leadCreatedTimeSurvey;
  set leadCreatedTimeSurvey(List<String> value) {
    _leadCreatedTimeSurvey = value;
  }

  void addToLeadCreatedTimeSurvey(String value) {
    leadCreatedTimeSurvey.add(value);
  }

  void removeFromLeadCreatedTimeSurvey(String value) {
    leadCreatedTimeSurvey.remove(value);
  }

  void removeAtIndexFromLeadCreatedTimeSurvey(int index) {
    leadCreatedTimeSurvey.removeAt(index);
  }

  void updateLeadCreatedTimeSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCreatedTimeSurvey[index] = updateFn(_leadCreatedTimeSurvey[index]);
  }

  void insertAtIndexInLeadCreatedTimeSurvey(int index, String value) {
    leadCreatedTimeSurvey.insert(index, value);
  }

  List<String> _leadCallStatusSurvey = [];
  List<String> get leadCallStatusSurvey => _leadCallStatusSurvey;
  set leadCallStatusSurvey(List<String> value) {
    _leadCallStatusSurvey = value;
  }

  void addToLeadCallStatusSurvey(String value) {
    leadCallStatusSurvey.add(value);
  }

  void removeFromLeadCallStatusSurvey(String value) {
    leadCallStatusSurvey.remove(value);
  }

  void removeAtIndexFromLeadCallStatusSurvey(int index) {
    leadCallStatusSurvey.removeAt(index);
  }

  void updateLeadCallStatusSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCallStatusSurvey[index] = updateFn(_leadCallStatusSurvey[index]);
  }

  void insertAtIndexInLeadCallStatusSurvey(int index, String value) {
    leadCallStatusSurvey.insert(index, value);
  }

  List<String> _leadPhoneNumberSurvey = [];
  List<String> get leadPhoneNumberSurvey => _leadPhoneNumberSurvey;
  set leadPhoneNumberSurvey(List<String> value) {
    _leadPhoneNumberSurvey = value;
  }

  void addToLeadPhoneNumberSurvey(String value) {
    leadPhoneNumberSurvey.add(value);
  }

  void removeFromLeadPhoneNumberSurvey(String value) {
    leadPhoneNumberSurvey.remove(value);
  }

  void removeAtIndexFromLeadPhoneNumberSurvey(int index) {
    leadPhoneNumberSurvey.removeAt(index);
  }

  void updateLeadPhoneNumberSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhoneNumberSurvey[index] = updateFn(_leadPhoneNumberSurvey[index]);
  }

  void insertAtIndexInLeadPhoneNumberSurvey(int index, String value) {
    leadPhoneNumberSurvey.insert(index, value);
  }

  List<String> _leadEmployeeIdSurvey = [];
  List<String> get leadEmployeeIdSurvey => _leadEmployeeIdSurvey;
  set leadEmployeeIdSurvey(List<String> value) {
    _leadEmployeeIdSurvey = value;
  }

  void addToLeadEmployeeIdSurvey(String value) {
    leadEmployeeIdSurvey.add(value);
  }

  void removeFromLeadEmployeeIdSurvey(String value) {
    leadEmployeeIdSurvey.remove(value);
  }

  void removeAtIndexFromLeadEmployeeIdSurvey(int index) {
    leadEmployeeIdSurvey.removeAt(index);
  }

  void updateLeadEmployeeIdSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadEmployeeIdSurvey[index] = updateFn(_leadEmployeeIdSurvey[index]);
  }

  void insertAtIndexInLeadEmployeeIdSurvey(int index, String value) {
    leadEmployeeIdSurvey.insert(index, value);
  }

  List<String> _leadChannelSurvey = [];
  List<String> get leadChannelSurvey => _leadChannelSurvey;
  set leadChannelSurvey(List<String> value) {
    _leadChannelSurvey = value;
  }

  void addToLeadChannelSurvey(String value) {
    leadChannelSurvey.add(value);
  }

  void removeFromLeadChannelSurvey(String value) {
    leadChannelSurvey.remove(value);
  }

  void removeAtIndexFromLeadChannelSurvey(int index) {
    leadChannelSurvey.removeAt(index);
  }

  void updateLeadChannelSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelSurvey[index] = updateFn(_leadChannelSurvey[index]);
  }

  void insertAtIndexInLeadChannelSurvey(int index, String value) {
    leadChannelSurvey.insert(index, value);
  }

  List<String> _leadBranchCodeSurvey = [];
  List<String> get leadBranchCodeSurvey => _leadBranchCodeSurvey;
  set leadBranchCodeSurvey(List<String> value) {
    _leadBranchCodeSurvey = value;
  }

  void addToLeadBranchCodeSurvey(String value) {
    leadBranchCodeSurvey.add(value);
  }

  void removeFromLeadBranchCodeSurvey(String value) {
    leadBranchCodeSurvey.remove(value);
  }

  void removeAtIndexFromLeadBranchCodeSurvey(int index) {
    leadBranchCodeSurvey.removeAt(index);
  }

  void updateLeadBranchCodeSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadBranchCodeSurvey[index] = updateFn(_leadBranchCodeSurvey[index]);
  }

  void insertAtIndexInLeadBranchCodeSurvey(int index, String value) {
    leadBranchCodeSurvey.insert(index, value);
  }

  List<String> _leadUserLevelSurvey = [];
  List<String> get leadUserLevelSurvey => _leadUserLevelSurvey;
  set leadUserLevelSurvey(List<String> value) {
    _leadUserLevelSurvey = value;
  }

  void addToLeadUserLevelSurvey(String value) {
    leadUserLevelSurvey.add(value);
  }

  void removeFromLeadUserLevelSurvey(String value) {
    leadUserLevelSurvey.remove(value);
  }

  void removeAtIndexFromLeadUserLevelSurvey(int index) {
    leadUserLevelSurvey.removeAt(index);
  }

  void updateLeadUserLevelSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadUserLevelSurvey[index] = updateFn(_leadUserLevelSurvey[index]);
  }

  void insertAtIndexInLeadUserLevelSurvey(int index, String value) {
    leadUserLevelSurvey.insert(index, value);
  }

  List<String> _leadCountCalledSurvey = [];
  List<String> get leadCountCalledSurvey => _leadCountCalledSurvey;
  set leadCountCalledSurvey(List<String> value) {
    _leadCountCalledSurvey = value;
  }

  void addToLeadCountCalledSurvey(String value) {
    leadCountCalledSurvey.add(value);
  }

  void removeFromLeadCountCalledSurvey(String value) {
    leadCountCalledSurvey.remove(value);
  }

  void removeAtIndexFromLeadCountCalledSurvey(int index) {
    leadCountCalledSurvey.removeAt(index);
  }

  void updateLeadCountCalledSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCountCalledSurvey[index] = updateFn(_leadCountCalledSurvey[index]);
  }

  void insertAtIndexInLeadCountCalledSurvey(int index, String value) {
    leadCountCalledSurvey.insert(index, value);
  }

  List<String> _leadCarVahicleNameSurvey = [];
  List<String> get leadCarVahicleNameSurvey => _leadCarVahicleNameSurvey;
  set leadCarVahicleNameSurvey(List<String> value) {
    _leadCarVahicleNameSurvey = value;
  }

  void addToLeadCarVahicleNameSurvey(String value) {
    leadCarVahicleNameSurvey.add(value);
  }

  void removeFromLeadCarVahicleNameSurvey(String value) {
    leadCarVahicleNameSurvey.remove(value);
  }

  void removeAtIndexFromLeadCarVahicleNameSurvey(int index) {
    leadCarVahicleNameSurvey.removeAt(index);
  }

  void updateLeadCarVahicleNameSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCarVahicleNameSurvey[index] =
        updateFn(_leadCarVahicleNameSurvey[index]);
  }

  void insertAtIndexInLeadCarVahicleNameSurvey(int index, String value) {
    leadCarVahicleNameSurvey.insert(index, value);
  }

  List<String> _leadAmountRequestSurvey = [];
  List<String> get leadAmountRequestSurvey => _leadAmountRequestSurvey;
  set leadAmountRequestSurvey(List<String> value) {
    _leadAmountRequestSurvey = value;
  }

  void addToLeadAmountRequestSurvey(String value) {
    leadAmountRequestSurvey.add(value);
  }

  void removeFromLeadAmountRequestSurvey(String value) {
    leadAmountRequestSurvey.remove(value);
  }

  void removeAtIndexFromLeadAmountRequestSurvey(int index) {
    leadAmountRequestSurvey.removeAt(index);
  }

  void updateLeadAmountRequestSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadAmountRequestSurvey[index] = updateFn(_leadAmountRequestSurvey[index]);
  }

  void insertAtIndexInLeadAmountRequestSurvey(int index, String value) {
    leadAmountRequestSurvey.insert(index, value);
  }

  List<String> _leadCalledStatusReasonSurvey = [];
  List<String> get leadCalledStatusReasonSurvey =>
      _leadCalledStatusReasonSurvey;
  set leadCalledStatusReasonSurvey(List<String> value) {
    _leadCalledStatusReasonSurvey = value;
  }

  void addToLeadCalledStatusReasonSurvey(String value) {
    leadCalledStatusReasonSurvey.add(value);
  }

  void removeFromLeadCalledStatusReasonSurvey(String value) {
    leadCalledStatusReasonSurvey.remove(value);
  }

  void removeAtIndexFromLeadCalledStatusReasonSurvey(int index) {
    leadCalledStatusReasonSurvey.removeAt(index);
  }

  void updateLeadCalledStatusReasonSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCalledStatusReasonSurvey[index] =
        updateFn(_leadCalledStatusReasonSurvey[index]);
  }

  void insertAtIndexInLeadCalledStatusReasonSurvey(int index, String value) {
    leadCalledStatusReasonSurvey.insert(index, value);
  }

  List<String> _leadContractStatusSurvey = [];
  List<String> get leadContractStatusSurvey => _leadContractStatusSurvey;
  set leadContractStatusSurvey(List<String> value) {
    _leadContractStatusSurvey = value;
  }

  void addToLeadContractStatusSurvey(String value) {
    leadContractStatusSurvey.add(value);
  }

  void removeFromLeadContractStatusSurvey(String value) {
    leadContractStatusSurvey.remove(value);
  }

  void removeAtIndexFromLeadContractStatusSurvey(int index) {
    leadContractStatusSurvey.removeAt(index);
  }

  void updateLeadContractStatusSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractStatusSurvey[index] =
        updateFn(_leadContractStatusSurvey[index]);
  }

  void insertAtIndexInLeadContractStatusSurvey(int index, String value) {
    leadContractStatusSurvey.insert(index, value);
  }

  List<String> _leadContractDateSurvey = [];
  List<String> get leadContractDateSurvey => _leadContractDateSurvey;
  set leadContractDateSurvey(List<String> value) {
    _leadContractDateSurvey = value;
  }

  void addToLeadContractDateSurvey(String value) {
    leadContractDateSurvey.add(value);
  }

  void removeFromLeadContractDateSurvey(String value) {
    leadContractDateSurvey.remove(value);
  }

  void removeAtIndexFromLeadContractDateSurvey(int index) {
    leadContractDateSurvey.removeAt(index);
  }

  void updateLeadContractDateSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractDateSurvey[index] = updateFn(_leadContractDateSurvey[index]);
  }

  void insertAtIndexInLeadContractDateSurvey(int index, String value) {
    leadContractDateSurvey.insert(index, value);
  }

  List<String> _leadListViewItem = [];
  List<String> get leadListViewItem => _leadListViewItem;
  set leadListViewItem(List<String> value) {
    _leadListViewItem = value;
  }

  void addToLeadListViewItem(String value) {
    leadListViewItem.add(value);
  }

  void removeFromLeadListViewItem(String value) {
    leadListViewItem.remove(value);
  }

  void removeAtIndexFromLeadListViewItem(int index) {
    leadListViewItem.removeAt(index);
  }

  void updateLeadListViewItemAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadListViewItem[index] = updateFn(_leadListViewItem[index]);
  }

  void insertAtIndexInLeadListViewItem(int index, String value) {
    leadListViewItem.insert(index, value);
  }

  String _profileImage =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
  String get profileImage => _profileImage;
  set profileImage(String value) {
    _profileImage = value;
    secureStorage.setString('ff_profileImage', value);
  }

  void deleteProfileImage() {
    secureStorage.delete(key: 'ff_profileImage');
  }

  List<bool> _timeChatIsVisibleList = [];
  List<bool> get timeChatIsVisibleList => _timeChatIsVisibleList;
  set timeChatIsVisibleList(List<bool> value) {
    _timeChatIsVisibleList = value;
  }

  void addToTimeChatIsVisibleList(bool value) {
    timeChatIsVisibleList.add(value);
  }

  void removeFromTimeChatIsVisibleList(bool value) {
    timeChatIsVisibleList.remove(value);
  }

  void removeAtIndexFromTimeChatIsVisibleList(int index) {
    timeChatIsVisibleList.removeAt(index);
  }

  void updateTimeChatIsVisibleListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    timeChatIsVisibleList[index] = updateFn(_timeChatIsVisibleList[index]);
  }

  void insertAtIndexInTimeChatIsVisibleList(int index, bool value) {
    timeChatIsVisibleList.insert(index, value);
  }

  bool _isSendMessageSuccess = false;
  bool get isSendMessageSuccess => _isSendMessageSuccess;
  set isSendMessageSuccess(bool value) {
    _isSendMessageSuccess = value;
  }

  String _chatMessagesTemp = '';
  String get chatMessagesTemp => _chatMessagesTemp;
  set chatMessagesTemp(String value) {
    _chatMessagesTemp = value;
  }

  int _idNumberTemp = 1;
  int get idNumberTemp => _idNumberTemp;
  set idNumberTemp(int value) {
    _idNumberTemp = value;
  }

  bool _insuranceRequestState = false;
  bool get insuranceRequestState => _insuranceRequestState;
  set insuranceRequestState(bool value) {
    _insuranceRequestState = value;
  }

  String _operationChoiceChips = 'งานใหม่';
  String get operationChoiceChips => _operationChoiceChips;
  set operationChoiceChips(String value) {
    _operationChoiceChips = value;
  }

  String _customerTypeChoiceChips = 'บุคคลธรรมดา';
  String get customerTypeChoiceChips => _customerTypeChoiceChips;
  set customerTypeChoiceChips(String value) {
    _customerTypeChoiceChips = value;
  }

  String _vehicleTypeDropdown = 'กรุณาเลือก';
  String get vehicleTypeDropdown => _vehicleTypeDropdown;
  set vehicleTypeDropdown(String value) {
    _vehicleTypeDropdown = value;
  }

  String _boxTypeChoiceChips = 'ตู้แห้ง';
  String get boxTypeChoiceChips => _boxTypeChoiceChips;
  set boxTypeChoiceChips(String value) {
    _boxTypeChoiceChips = value;
  }

  bool _isEquipedMetalBox = false;
  bool get isEquipedMetalBox => _isEquipedMetalBox;
  set isEquipedMetalBox(bool value) {
    _isEquipedMetalBox = value;
  }

  String _insuranceBasicCusName = '';
  String get insuranceBasicCusName => _insuranceBasicCusName;
  set insuranceBasicCusName(String value) {
    _insuranceBasicCusName = value;
  }

  String _insuranceBasicCusLastname = '';
  String get insuranceBasicCusLastname => _insuranceBasicCusLastname;
  set insuranceBasicCusLastname(String value) {
    _insuranceBasicCusLastname = value;
  }

  String _insuranceBasicPlateNo = '';
  String get insuranceBasicPlateNo => _insuranceBasicPlateNo;
  set insuranceBasicPlateNo(String value) {
    _insuranceBasicPlateNo = value;
  }

  String _insuranceBasicPlateAdditional = '';
  String get insuranceBasicPlateAdditional => _insuranceBasicPlateAdditional;
  set insuranceBasicPlateAdditional(String value) {
    _insuranceBasicPlateAdditional = value;
  }

  String _insuranceBasicBrandId = '';
  String get insuranceBasicBrandId => _insuranceBasicBrandId;
  set insuranceBasicBrandId(String value) {
    _insuranceBasicBrandId = value;
  }

  String _insuranceBasicBrandCode = '';
  String get insuranceBasicBrandCode => _insuranceBasicBrandCode;
  set insuranceBasicBrandCode(String value) {
    _insuranceBasicBrandCode = value;
  }

  String _insuranceBasicBrandName = 'เลือกยี่ห้อรถ';
  String get insuranceBasicBrandName => _insuranceBasicBrandName;
  set insuranceBasicBrandName(String value) {
    _insuranceBasicBrandName = value;
  }

  String _insuranceBasicModelId = '';
  String get insuranceBasicModelId => _insuranceBasicModelId;
  set insuranceBasicModelId(String value) {
    _insuranceBasicModelId = value;
  }

  String _insuranceBasicModelCode = '';
  String get insuranceBasicModelCode => _insuranceBasicModelCode;
  set insuranceBasicModelCode(String value) {
    _insuranceBasicModelCode = value;
  }

  String _insuranceBasicModelName = 'เลือกรุ่นรถ';
  String get insuranceBasicModelName => _insuranceBasicModelName;
  set insuranceBasicModelName(String value) {
    _insuranceBasicModelName = value;
  }

  String _insuranceBasicYear = 'เลือกปีจดทะเบียน พ.ศ.';
  String get insuranceBasicYear => _insuranceBasicYear;
  set insuranceBasicYear(String value) {
    _insuranceBasicYear = value;
  }

  String _insuranceBasicProvinceId = '';
  String get insuranceBasicProvinceId => _insuranceBasicProvinceId;
  set insuranceBasicProvinceId(String value) {
    _insuranceBasicProvinceId = value;
  }

  String _insuranceBasicProvinceName = '';
  String get insuranceBasicProvinceName => _insuranceBasicProvinceName;
  set insuranceBasicProvinceName(String value) {
    _insuranceBasicProvinceName = value;
  }

  String _insuranceBasicUsedType = '';
  String get insuranceBasicUsedType => _insuranceBasicUsedType;
  set insuranceBasicUsedType(String value) {
    _insuranceBasicUsedType = value;
  }

  bool _insuranceBasicCarModify = false;
  bool get insuranceBasicCarModify => _insuranceBasicCarModify;
  set insuranceBasicCarModify(bool value) {
    _insuranceBasicCarModify = value;
  }

  String _insuranceBasicAccessoryProtected = '';
  String get insuranceBasicAccessoryProtected =>
      _insuranceBasicAccessoryProtected;
  set insuranceBasicAccessoryProtected(String value) {
    _insuranceBasicAccessoryProtected = value;
  }

  String _insuranceBasicCusPhone = '';
  String get insuranceBasicCusPhone => _insuranceBasicCusPhone;
  set insuranceBasicCusPhone(String value) {
    _insuranceBasicCusPhone = value;
  }

  String _insuranceBasicDriverType = '';
  String get insuranceBasicDriverType => _insuranceBasicDriverType;
  set insuranceBasicDriverType(String value) {
    _insuranceBasicDriverType = value;
  }

  String _insuranceBasicIdCardNo = '';
  String get insuranceBasicIdCardNo => _insuranceBasicIdCardNo;
  set insuranceBasicIdCardNo(String value) {
    _insuranceBasicIdCardNo = value;
  }

  String _insuranceBasicOldLicenseNo = '';
  String get insuranceBasicOldLicenseNo => _insuranceBasicOldLicenseNo;
  set insuranceBasicOldLicenseNo(String value) {
    _insuranceBasicOldLicenseNo = value;
  }

  bool _insuranceBasicMetalBox = false;
  bool get insuranceBasicMetalBox => _insuranceBasicMetalBox;
  set insuranceBasicMetalBox(bool value) {
    _insuranceBasicMetalBox = value;
  }

  bool _insuranceBasicCoop = false;
  bool get insuranceBasicCoop => _insuranceBasicCoop;
  set insuranceBasicCoop(bool value) {
    _insuranceBasicCoop = value;
  }

  String _insuranceBasicPickupBoxType = '';
  String get insuranceBasicPickupBoxType => _insuranceBasicPickupBoxType;
  set insuranceBasicPickupBoxType(String value) {
    _insuranceBasicPickupBoxType = value;
  }

  String _insuranceBasicPickupBoxPrice = '';
  String get insuranceBasicPickupBoxPrice => _insuranceBasicPickupBoxPrice;
  set insuranceBasicPickupBoxPrice(String value) {
    _insuranceBasicPickupBoxPrice = value;
  }

  String _insuranceBasicTruckCurrentPrice = '';
  String get insuranceBasicTruckCurrentPrice =>
      _insuranceBasicTruckCurrentPrice;
  set insuranceBasicTruckCurrentPrice(String value) {
    _insuranceBasicTruckCurrentPrice = value;
  }

  String _insuranceBasicCarryPurpose = '';
  String get insuranceBasicCarryPurpose => _insuranceBasicCarryPurpose;
  set insuranceBasicCarryPurpose(String value) {
    _insuranceBasicCarryPurpose = value;
  }

  bool _insurancePackageInsurer = false;
  bool get insurancePackageInsurer => _insurancePackageInsurer;
  set insurancePackageInsurer(bool value) {
    _insurancePackageInsurer = value;
  }

  String _insuranceBasicMemberType = '';
  String get insuranceBasicMemberType => _insuranceBasicMemberType;
  set insuranceBasicMemberType(String value) {
    _insuranceBasicMemberType = value;
  }

  String _insuranceBasicRemark = '';
  String get insuranceBasicRemark => _insuranceBasicRemark;
  set insuranceBasicRemark(String value) {
    _insuranceBasicRemark = value;
  }

  List<String> _teleProvinceId = [];
  List<String> get teleProvinceId => _teleProvinceId;
  set teleProvinceId(List<String> value) {
    _teleProvinceId = value;
  }

  void addToTeleProvinceId(String value) {
    teleProvinceId.add(value);
  }

  void removeFromTeleProvinceId(String value) {
    teleProvinceId.remove(value);
  }

  void removeAtIndexFromTeleProvinceId(int index) {
    teleProvinceId.removeAt(index);
  }

  void updateTeleProvinceIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleProvinceId[index] = updateFn(_teleProvinceId[index]);
  }

  void insertAtIndexInTeleProvinceId(int index, String value) {
    teleProvinceId.insert(index, value);
  }

  bool _insuranceModelIsGenerating = false;
  bool get insuranceModelIsGenerating => _insuranceModelIsGenerating;
  set insuranceModelIsGenerating(bool value) {
    _insuranceModelIsGenerating = value;
  }

  List<String> _insuranceBasicOriginalModelName = [];
  List<String> get insuranceBasicOriginalModelName =>
      _insuranceBasicOriginalModelName;
  set insuranceBasicOriginalModelName(List<String> value) {
    _insuranceBasicOriginalModelName = value;
  }

  void addToInsuranceBasicOriginalModelName(String value) {
    insuranceBasicOriginalModelName.add(value);
  }

  void removeFromInsuranceBasicOriginalModelName(String value) {
    insuranceBasicOriginalModelName.remove(value);
  }

  void removeAtIndexFromInsuranceBasicOriginalModelName(int index) {
    insuranceBasicOriginalModelName.removeAt(index);
  }

  void updateInsuranceBasicOriginalModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicOriginalModelName[index] =
        updateFn(_insuranceBasicOriginalModelName[index]);
  }

  void insertAtIndexInInsuranceBasicOriginalModelName(int index, String value) {
    insuranceBasicOriginalModelName.insert(index, value);
  }

  List<String> _insuranceBasicBrandIdList = [];
  List<String> get insuranceBasicBrandIdList => _insuranceBasicBrandIdList;
  set insuranceBasicBrandIdList(List<String> value) {
    _insuranceBasicBrandIdList = value;
  }

  void addToInsuranceBasicBrandIdList(String value) {
    insuranceBasicBrandIdList.add(value);
  }

  void removeFromInsuranceBasicBrandIdList(String value) {
    insuranceBasicBrandIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandIdList(int index) {
    insuranceBasicBrandIdList.removeAt(index);
  }

  void updateInsuranceBasicBrandIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandIdList[index] =
        updateFn(_insuranceBasicBrandIdList[index]);
  }

  void insertAtIndexInInsuranceBasicBrandIdList(int index, String value) {
    insuranceBasicBrandIdList.insert(index, value);
  }

  List<String> _insuranceBasicBrandNameList = [];
  List<String> get insuranceBasicBrandNameList => _insuranceBasicBrandNameList;
  set insuranceBasicBrandNameList(List<String> value) {
    _insuranceBasicBrandNameList = value;
  }

  void addToInsuranceBasicBrandNameList(String value) {
    insuranceBasicBrandNameList.add(value);
  }

  void removeFromInsuranceBasicBrandNameList(String value) {
    insuranceBasicBrandNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandNameList(int index) {
    insuranceBasicBrandNameList.removeAt(index);
  }

  void updateInsuranceBasicBrandNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandNameList[index] =
        updateFn(_insuranceBasicBrandNameList[index]);
  }

  void insertAtIndexInInsuranceBasicBrandNameList(int index, String value) {
    insuranceBasicBrandNameList.insert(index, value);
  }

  List<String> _insuranceBasicModelIdListOriginal = [];
  List<String> get insuranceBasicModelIdListOriginal =>
      _insuranceBasicModelIdListOriginal;
  set insuranceBasicModelIdListOriginal(List<String> value) {
    _insuranceBasicModelIdListOriginal = value;
  }

  void addToInsuranceBasicModelIdListOriginal(String value) {
    insuranceBasicModelIdListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelIdListOriginal(String value) {
    insuranceBasicModelIdListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelIdListOriginal(int index) {
    insuranceBasicModelIdListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelIdListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelIdListOriginal[index] =
        updateFn(_insuranceBasicModelIdListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelIdListOriginal(
      int index, String value) {
    insuranceBasicModelIdListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicModelIdList = [];
  List<String> get insuranceBasicModelIdList => _insuranceBasicModelIdList;
  set insuranceBasicModelIdList(List<String> value) {
    _insuranceBasicModelIdList = value;
  }

  void addToInsuranceBasicModelIdList(String value) {
    insuranceBasicModelIdList.add(value);
  }

  void removeFromInsuranceBasicModelIdList(String value) {
    insuranceBasicModelIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelIdList(int index) {
    insuranceBasicModelIdList.removeAt(index);
  }

  void updateInsuranceBasicModelIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelIdList[index] =
        updateFn(_insuranceBasicModelIdList[index]);
  }

  void insertAtIndexInInsuranceBasicModelIdList(int index, String value) {
    insuranceBasicModelIdList.insert(index, value);
  }

  List<String> _insuranceBasicModelNameListOriginal = [];
  List<String> get insuranceBasicModelNameListOriginal =>
      _insuranceBasicModelNameListOriginal;
  set insuranceBasicModelNameListOriginal(List<String> value) {
    _insuranceBasicModelNameListOriginal = value;
  }

  void addToInsuranceBasicModelNameListOriginal(String value) {
    insuranceBasicModelNameListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelNameListOriginal(String value) {
    insuranceBasicModelNameListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelNameListOriginal(int index) {
    insuranceBasicModelNameListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelNameListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelNameListOriginal[index] =
        updateFn(_insuranceBasicModelNameListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelNameListOriginal(
      int index, String value) {
    insuranceBasicModelNameListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicModelNameList = [];
  List<String> get insuranceBasicModelNameList => _insuranceBasicModelNameList;
  set insuranceBasicModelNameList(List<String> value) {
    _insuranceBasicModelNameList = value;
  }

  void addToInsuranceBasicModelNameList(String value) {
    insuranceBasicModelNameList.add(value);
  }

  void removeFromInsuranceBasicModelNameList(String value) {
    insuranceBasicModelNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelNameList(int index) {
    insuranceBasicModelNameList.removeAt(index);
  }

  void updateInsuranceBasicModelNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelNameList[index] =
        updateFn(_insuranceBasicModelNameList[index]);
  }

  void insertAtIndexInInsuranceBasicModelNameList(int index, String value) {
    insuranceBasicModelNameList.insert(index, value);
  }

  List<String> _insuranceBasicProvinceIdList = [];
  List<String> get insuranceBasicProvinceIdList =>
      _insuranceBasicProvinceIdList;
  set insuranceBasicProvinceIdList(List<String> value) {
    _insuranceBasicProvinceIdList = value;
  }

  void addToInsuranceBasicProvinceIdList(String value) {
    insuranceBasicProvinceIdList.add(value);
  }

  void removeFromInsuranceBasicProvinceIdList(String value) {
    insuranceBasicProvinceIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicProvinceIdList(int index) {
    insuranceBasicProvinceIdList.removeAt(index);
  }

  void updateInsuranceBasicProvinceIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicProvinceIdList[index] =
        updateFn(_insuranceBasicProvinceIdList[index]);
  }

  void insertAtIndexInInsuranceBasicProvinceIdList(int index, String value) {
    insuranceBasicProvinceIdList.insert(index, value);
  }

  List<String> _insuranceBasicProvinceNameList = [];
  List<String> get insuranceBasicProvinceNameList =>
      _insuranceBasicProvinceNameList;
  set insuranceBasicProvinceNameList(List<String> value) {
    _insuranceBasicProvinceNameList = value;
  }

  void addToInsuranceBasicProvinceNameList(String value) {
    insuranceBasicProvinceNameList.add(value);
  }

  void removeFromInsuranceBasicProvinceNameList(String value) {
    insuranceBasicProvinceNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicProvinceNameList(int index) {
    insuranceBasicProvinceNameList.removeAt(index);
  }

  void updateInsuranceBasicProvinceNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicProvinceNameList[index] =
        updateFn(_insuranceBasicProvinceNameList[index]);
  }

  void insertAtIndexInInsuranceBasicProvinceNameList(int index, String value) {
    insuranceBasicProvinceNameList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeIdList = [];
  List<String> get insuranceBasicVehicleUsedTypeIdList =>
      _insuranceBasicVehicleUsedTypeIdList;
  set insuranceBasicVehicleUsedTypeIdList(List<String> value) {
    _insuranceBasicVehicleUsedTypeIdList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeIdList(String value) {
    insuranceBasicVehicleUsedTypeIdList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeIdList(String value) {
    insuranceBasicVehicleUsedTypeIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeIdList(int index) {
    insuranceBasicVehicleUsedTypeIdList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeIdList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeIdList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeIdList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeIdList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeNameList = [];
  List<String> get insuranceBasicVehicleUsedTypeNameList =>
      _insuranceBasicVehicleUsedTypeNameList;
  set insuranceBasicVehicleUsedTypeNameList(List<String> value) {
    _insuranceBasicVehicleUsedTypeNameList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeNameList(String value) {
    insuranceBasicVehicleUsedTypeNameList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeNameList(String value) {
    insuranceBasicVehicleUsedTypeNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeNameList(int index) {
    insuranceBasicVehicleUsedTypeNameList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeNameList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeNameList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeNameList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeNameList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeTypeList = [];
  List<String> get insuranceBasicVehicleUsedTypeTypeList =>
      _insuranceBasicVehicleUsedTypeTypeList;
  set insuranceBasicVehicleUsedTypeTypeList(List<String> value) {
    _insuranceBasicVehicleUsedTypeTypeList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeTypeList(String value) {
    insuranceBasicVehicleUsedTypeTypeList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeTypeList(String value) {
    insuranceBasicVehicleUsedTypeTypeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeTypeList(int index) {
    insuranceBasicVehicleUsedTypeTypeList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeTypeList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeTypeList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeTypeList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeTypeList.insert(index, value);
  }

  List<String> _insuranceBasicModelBrandIdListOriginal = [];
  List<String> get insuranceBasicModelBrandIdListOriginal =>
      _insuranceBasicModelBrandIdListOriginal;
  set insuranceBasicModelBrandIdListOriginal(List<String> value) {
    _insuranceBasicModelBrandIdListOriginal = value;
  }

  void addToInsuranceBasicModelBrandIdListOriginal(String value) {
    insuranceBasicModelBrandIdListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelBrandIdListOriginal(String value) {
    insuranceBasicModelBrandIdListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelBrandIdListOriginal(int index) {
    insuranceBasicModelBrandIdListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelBrandIdListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelBrandIdListOriginal[index] =
        updateFn(_insuranceBasicModelBrandIdListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelBrandIdListOriginal(
      int index, String value) {
    insuranceBasicModelBrandIdListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeCodeList = [];
  List<String> get insuranceBasicVehicleUsedTypeCodeList =>
      _insuranceBasicVehicleUsedTypeCodeList;
  set insuranceBasicVehicleUsedTypeCodeList(List<String> value) {
    _insuranceBasicVehicleUsedTypeCodeList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeCodeList(String value) {
    insuranceBasicVehicleUsedTypeCodeList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeCodeList(String value) {
    insuranceBasicVehicleUsedTypeCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeCodeList(int index) {
    insuranceBasicVehicleUsedTypeCodeList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeCodeList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeCodeList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeCodeList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerIdList = [];
  List<String> get insuranceBasicInsurerIdList => _insuranceBasicInsurerIdList;
  set insuranceBasicInsurerIdList(List<String> value) {
    _insuranceBasicInsurerIdList = value;
  }

  void addToInsuranceBasicInsurerIdList(String value) {
    insuranceBasicInsurerIdList.add(value);
  }

  void removeFromInsuranceBasicInsurerIdList(String value) {
    insuranceBasicInsurerIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdList(int index) {
    insuranceBasicInsurerIdList.removeAt(index);
  }

  void updateInsuranceBasicInsurerIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerIdList[index] =
        updateFn(_insuranceBasicInsurerIdList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdList(int index, String value) {
    insuranceBasicInsurerIdList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerCodeList = [];
  List<String> get insuranceBasicInsurerCodeList =>
      _insuranceBasicInsurerCodeList;
  set insuranceBasicInsurerCodeList(List<String> value) {
    _insuranceBasicInsurerCodeList = value;
  }

  void addToInsuranceBasicInsurerCodeList(String value) {
    insuranceBasicInsurerCodeList.add(value);
  }

  void removeFromInsuranceBasicInsurerCodeList(String value) {
    insuranceBasicInsurerCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeList(int index) {
    insuranceBasicInsurerCodeList.removeAt(index);
  }

  void updateInsuranceBasicInsurerCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerCodeList[index] =
        updateFn(_insuranceBasicInsurerCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeList(int index, String value) {
    insuranceBasicInsurerCodeList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerShortNameList = [];
  List<String> get insuranceBasicInsurerShortNameList =>
      _insuranceBasicInsurerShortNameList;
  set insuranceBasicInsurerShortNameList(List<String> value) {
    _insuranceBasicInsurerShortNameList = value;
  }

  void addToInsuranceBasicInsurerShortNameList(String value) {
    insuranceBasicInsurerShortNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerShortNameList(String value) {
    insuranceBasicInsurerShortNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameList(int index) {
    insuranceBasicInsurerShortNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerShortNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerShortNameList[index] =
        updateFn(_insuranceBasicInsurerShortNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameList(
      int index, String value) {
    insuranceBasicInsurerShortNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerFullNameList = [];
  List<String> get insuranceBasicInsurerFullNameList =>
      _insuranceBasicInsurerFullNameList;
  set insuranceBasicInsurerFullNameList(List<String> value) {
    _insuranceBasicInsurerFullNameList = value;
  }

  void addToInsuranceBasicInsurerFullNameList(String value) {
    insuranceBasicInsurerFullNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerFullNameList(String value) {
    insuranceBasicInsurerFullNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameList(int index) {
    insuranceBasicInsurerFullNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerFullNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerFullNameList[index] =
        updateFn(_insuranceBasicInsurerFullNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameList(
      int index, String value) {
    insuranceBasicInsurerFullNameList.insert(index, value);
  }

  String _insuranceBasicTruckPart = '';
  String get insuranceBasicTruckPart => _insuranceBasicTruckPart;
  set insuranceBasicTruckPart(String value) {
    _insuranceBasicTruckPart = value;
  }

  List<bool> _upLoadedPic2 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedPic2 => _upLoadedPic2;
  set upLoadedPic2(List<bool> value) {
    _upLoadedPic2 = value;
  }

  void addToUpLoadedPic2(bool value) {
    upLoadedPic2.add(value);
  }

  void removeFromUpLoadedPic2(bool value) {
    upLoadedPic2.remove(value);
  }

  void removeAtIndexFromUpLoadedPic2(int index) {
    upLoadedPic2.removeAt(index);
  }

  void updateUpLoadedPic2AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedPic2[index] = updateFn(_upLoadedPic2[index]);
  }

  void insertAtIndexInUpLoadedPic2(int index, bool value) {
    upLoadedPic2.insert(index, value);
  }

  List<bool> _upLoadedPic3 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedPic3 => _upLoadedPic3;
  set upLoadedPic3(List<bool> value) {
    _upLoadedPic3 = value;
  }

  void addToUpLoadedPic3(bool value) {
    upLoadedPic3.add(value);
  }

  void removeFromUpLoadedPic3(bool value) {
    upLoadedPic3.remove(value);
  }

  void removeAtIndexFromUpLoadedPic3(int index) {
    upLoadedPic3.removeAt(index);
  }

  void updateUpLoadedPic3AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedPic3[index] = updateFn(_upLoadedPic3[index]);
  }

  void insertAtIndexInUpLoadedPic3(int index, bool value) {
    upLoadedPic3.insert(index, value);
  }

  String _insuranceBasicGarageId = '';
  String get insuranceBasicGarageId => _insuranceBasicGarageId;
  set insuranceBasicGarageId(String value) {
    _insuranceBasicGarageId = value;
  }

  String _insuranceBasicGarageName = 'เลือกประเภทการซ่อม';
  String get insuranceBasicGarageName => _insuranceBasicGarageName;
  set insuranceBasicGarageName(String value) {
    _insuranceBasicGarageName = value;
  }

  String _insuranceBasicCoverTypeId = '';
  String get insuranceBasicCoverTypeId => _insuranceBasicCoverTypeId;
  set insuranceBasicCoverTypeId(String value) {
    _insuranceBasicCoverTypeId = value;
  }

  String _insuranceBasicCoverTypeCode = '';
  String get insuranceBasicCoverTypeCode => _insuranceBasicCoverTypeCode;
  set insuranceBasicCoverTypeCode(String value) {
    _insuranceBasicCoverTypeCode = value;
  }

  String _insuranceBasicCoverTypeName = 'เลือกชั้นประกัน';
  String get insuranceBasicCoverTypeName => _insuranceBasicCoverTypeName;
  set insuranceBasicCoverTypeName(String value) {
    _insuranceBasicCoverTypeName = value;
  }

  List<String> _insuranceBasicCoverTypeIdList = [];
  List<String> get insuranceBasicCoverTypeIdList =>
      _insuranceBasicCoverTypeIdList;
  set insuranceBasicCoverTypeIdList(List<String> value) {
    _insuranceBasicCoverTypeIdList = value;
  }

  void addToInsuranceBasicCoverTypeIdList(String value) {
    insuranceBasicCoverTypeIdList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeIdList(String value) {
    insuranceBasicCoverTypeIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeIdList(int index) {
    insuranceBasicCoverTypeIdList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeIdList[index] =
        updateFn(_insuranceBasicCoverTypeIdList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeIdList(int index, String value) {
    insuranceBasicCoverTypeIdList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeCodeList = [];
  List<String> get insuranceBasicCoverTypeCodeList =>
      _insuranceBasicCoverTypeCodeList;
  set insuranceBasicCoverTypeCodeList(List<String> value) {
    _insuranceBasicCoverTypeCodeList = value;
  }

  void addToInsuranceBasicCoverTypeCodeList(String value) {
    insuranceBasicCoverTypeCodeList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeCodeList(String value) {
    insuranceBasicCoverTypeCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeCodeList(int index) {
    insuranceBasicCoverTypeCodeList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeCodeList[index] =
        updateFn(_insuranceBasicCoverTypeCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeCodeList(int index, String value) {
    insuranceBasicCoverTypeCodeList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeNameList = [];
  List<String> get insuranceBasicCoverTypeNameList =>
      _insuranceBasicCoverTypeNameList;
  set insuranceBasicCoverTypeNameList(List<String> value) {
    _insuranceBasicCoverTypeNameList = value;
  }

  void addToInsuranceBasicCoverTypeNameList(String value) {
    insuranceBasicCoverTypeNameList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeNameList(String value) {
    insuranceBasicCoverTypeNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeNameList(int index) {
    insuranceBasicCoverTypeNameList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeNameList[index] =
        updateFn(_insuranceBasicCoverTypeNameList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeNameList(int index, String value) {
    insuranceBasicCoverTypeNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerIdOutput = [];
  List<String> get insuranceBasicInsurerIdOutput =>
      _insuranceBasicInsurerIdOutput;
  set insuranceBasicInsurerIdOutput(List<String> value) {
    _insuranceBasicInsurerIdOutput = value;
  }

  void addToInsuranceBasicInsurerIdOutput(String value) {
    insuranceBasicInsurerIdOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerIdOutput(String value) {
    insuranceBasicInsurerIdOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdOutput(int index) {
    insuranceBasicInsurerIdOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerIdOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerIdOutput[index] =
        updateFn(_insuranceBasicInsurerIdOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdOutput(int index, String value) {
    insuranceBasicInsurerIdOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerCodeOutput = [];
  List<String> get insuranceBasicInsurerCodeOutput =>
      _insuranceBasicInsurerCodeOutput;
  set insuranceBasicInsurerCodeOutput(List<String> value) {
    _insuranceBasicInsurerCodeOutput = value;
  }

  void addToInsuranceBasicInsurerCodeOutput(String value) {
    insuranceBasicInsurerCodeOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerCodeOutput(String value) {
    insuranceBasicInsurerCodeOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeOutput(int index) {
    insuranceBasicInsurerCodeOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerCodeOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerCodeOutput[index] =
        updateFn(_insuranceBasicInsurerCodeOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeOutput(int index, String value) {
    insuranceBasicInsurerCodeOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerShortNameOutput = [];
  List<String> get insuranceBasicInsurerShortNameOutput =>
      _insuranceBasicInsurerShortNameOutput;
  set insuranceBasicInsurerShortNameOutput(List<String> value) {
    _insuranceBasicInsurerShortNameOutput = value;
  }

  void addToInsuranceBasicInsurerShortNameOutput(String value) {
    insuranceBasicInsurerShortNameOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerShortNameOutput(String value) {
    insuranceBasicInsurerShortNameOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameOutput(int index) {
    insuranceBasicInsurerShortNameOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerShortNameOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerShortNameOutput[index] =
        updateFn(_insuranceBasicInsurerShortNameOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameOutput(
      int index, String value) {
    insuranceBasicInsurerShortNameOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerFullNameOutput = [];
  List<String> get insuranceBasicInsurerFullNameOutput =>
      _insuranceBasicInsurerFullNameOutput;
  set insuranceBasicInsurerFullNameOutput(List<String> value) {
    _insuranceBasicInsurerFullNameOutput = value;
  }

  void addToInsuranceBasicInsurerFullNameOutput(String value) {
    insuranceBasicInsurerFullNameOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerFullNameOutput(String value) {
    insuranceBasicInsurerFullNameOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameOutput(int index) {
    insuranceBasicInsurerFullNameOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerFullNameOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerFullNameOutput[index] =
        updateFn(_insuranceBasicInsurerFullNameOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameOutput(
      int index, String value) {
    insuranceBasicInsurerFullNameOutput.insert(index, value);
  }

  String _insuranceBasicActFlag = '';
  String get insuranceBasicActFlag => _insuranceBasicActFlag;
  set insuranceBasicActFlag(String value) {
    _insuranceBasicActFlag = value;
  }

  String _insuranceBasicVehicleUsedTypeId = '';
  String get insuranceBasicVehicleUsedTypeId =>
      _insuranceBasicVehicleUsedTypeId;
  set insuranceBasicVehicleUsedTypeId(String value) {
    _insuranceBasicVehicleUsedTypeId = value;
  }

  String _insuranceBasicVehicleUsedTypeCode = '';
  String get insuranceBasicVehicleUsedTypeCode =>
      _insuranceBasicVehicleUsedTypeCode;
  set insuranceBasicVehicleUsedTypeCode(String value) {
    _insuranceBasicVehicleUsedTypeCode = value;
  }

  String _insuranceBasicVehicleUsedTypeName = 'เลือกการใช้งาน';
  String get insuranceBasicVehicleUsedTypeName =>
      _insuranceBasicVehicleUsedTypeName;
  set insuranceBasicVehicleUsedTypeName(String value) {
    _insuranceBasicVehicleUsedTypeName = value;
  }

  String _insuranceBasicSumInsured = '';
  String get insuranceBasicSumInsured => _insuranceBasicSumInsured;
  set insuranceBasicSumInsured(String value) {
    _insuranceBasicSumInsured = value;
  }

  bool _insuranceRequestIsLoadedData = false;
  bool get insuranceRequestIsLoadedData => _insuranceRequestIsLoadedData;
  set insuranceRequestIsLoadedData(bool value) {
    _insuranceRequestIsLoadedData = value;
  }

  int _successStatusCode = 201;
  int get successStatusCode => _successStatusCode;
  set successStatusCode(int value) {
    _successStatusCode = value;
  }

  String _insuranceBasicTrailerSumInsured = '';
  String get insuranceBasicTrailerSumInsured =>
      _insuranceBasicTrailerSumInsured;
  set insuranceBasicTrailerSumInsured(String value) {
    _insuranceBasicTrailerSumInsured = value;
  }

  String _insuranceBasicListFlagRenew = '1';
  String get insuranceBasicListFlagRenew => _insuranceBasicListFlagRenew;
  set insuranceBasicListFlagRenew(String value) {
    _insuranceBasicListFlagRenew = value;
  }

  List<String> _insuranceBasicInsurerListNameList = [];
  List<String> get insuranceBasicInsurerListNameList =>
      _insuranceBasicInsurerListNameList;
  set insuranceBasicInsurerListNameList(List<String> value) {
    _insuranceBasicInsurerListNameList = value;
  }

  void addToInsuranceBasicInsurerListNameList(String value) {
    insuranceBasicInsurerListNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerListNameList(String value) {
    insuranceBasicInsurerListNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameList(int index) {
    insuranceBasicInsurerListNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerListNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerListNameList[index] =
        updateFn(_insuranceBasicInsurerListNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameList(
      int index, String value) {
    insuranceBasicInsurerListNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerListNameRandomList = [];
  List<String> get insuranceBasicInsurerListNameRandomList =>
      _insuranceBasicInsurerListNameRandomList;
  set insuranceBasicInsurerListNameRandomList(List<String> value) {
    _insuranceBasicInsurerListNameRandomList = value;
  }

  void addToInsuranceBasicInsurerListNameRandomList(String value) {
    insuranceBasicInsurerListNameRandomList.add(value);
  }

  void removeFromInsuranceBasicInsurerListNameRandomList(String value) {
    insuranceBasicInsurerListNameRandomList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameRandomList(int index) {
    insuranceBasicInsurerListNameRandomList.removeAt(index);
  }

  void updateInsuranceBasicInsurerListNameRandomListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerListNameRandomList[index] =
        updateFn(_insuranceBasicInsurerListNameRandomList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameRandomList(
      int index, String value) {
    insuranceBasicInsurerListNameRandomList.insert(index, value);
  }

  String _fromPage = 'Dashboard';
  String get fromPage => _fromPage;
  set fromPage(String value) {
    _fromPage = value;
  }

  String _insuranceOperationChoiceChips = 'งานใหม่          ';
  String get insuranceOperationChoiceChips => _insuranceOperationChoiceChips;
  set insuranceOperationChoiceChips(String value) {
    _insuranceOperationChoiceChips = value;
  }

  String _insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
  String get insuranceCustomerTypeChoiceChips =>
      _insuranceCustomerTypeChoiceChips;
  set insuranceCustomerTypeChoiceChips(String value) {
    _insuranceCustomerTypeChoiceChips = value;
  }

  bool _insuranceBoxCheckbokValue = false;
  bool get insuranceBoxCheckbokValue => _insuranceBoxCheckbokValue;
  set insuranceBoxCheckbokValue(bool value) {
    _insuranceBoxCheckbokValue = value;
  }

  String _insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
  String get insuranceBoxTypeChoiceChip => _insuranceBoxTypeChoiceChip;
  set insuranceBoxTypeChoiceChip(String value) {
    _insuranceBoxTypeChoiceChip = value;
  }

  String _insuranceVehicleTypeDropDown = 'เลือกประเภทรถ';
  String get insuranceVehicleTypeDropDown => _insuranceVehicleTypeDropDown;
  set insuranceVehicleTypeDropDown(String value) {
    _insuranceVehicleTypeDropDown = value;
  }

  String _imageOtherName = '';
  String get imageOtherName => _imageOtherName;
  set imageOtherName(String value) {
    _imageOtherName = value;
  }

  bool _checkBoxNotSatisfied = false;
  bool get checkBoxNotSatisfied => _checkBoxNotSatisfied;
  set checkBoxNotSatisfied(bool value) {
    _checkBoxNotSatisfied = value;
  }

  bool _checkBoxNotInRate = false;
  bool get checkBoxNotInRate => _checkBoxNotInRate;
  set checkBoxNotInRate(bool value) {
    _checkBoxNotInRate = value;
  }

  bool _checkBoxCustomCar = false;
  bool get checkBoxCustomCar => _checkBoxCustomCar;
  set checkBoxCustomCar(bool value) {
    _checkBoxCustomCar = value;
  }

  bool _buttonOrdinary = false;
  bool get buttonOrdinary => _buttonOrdinary;
  set buttonOrdinary(bool value) {
    _buttonOrdinary = value;
  }

  bool _buttonCorporation = false;
  bool get buttonCorporation => _buttonCorporation;
  set buttonCorporation(bool value) {
    _buttonCorporation = value;
  }

  List<String> _insuranceBasicBrandTypeList = [];
  List<String> get insuranceBasicBrandTypeList => _insuranceBasicBrandTypeList;
  set insuranceBasicBrandTypeList(List<String> value) {
    _insuranceBasicBrandTypeList = value;
  }

  void addToInsuranceBasicBrandTypeList(String value) {
    insuranceBasicBrandTypeList.add(value);
  }

  void removeFromInsuranceBasicBrandTypeList(String value) {
    insuranceBasicBrandTypeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandTypeList(int index) {
    insuranceBasicBrandTypeList.removeAt(index);
  }

  void updateInsuranceBasicBrandTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandTypeList[index] =
        updateFn(_insuranceBasicBrandTypeList[index]);
  }

  void insertAtIndexInInsuranceBasicBrandTypeList(int index, String value) {
    insuranceBasicBrandTypeList.insert(index, value);
  }

  List<String> _insuranceBasicModelList = [];
  List<String> get insuranceBasicModelList => _insuranceBasicModelList;
  set insuranceBasicModelList(List<String> value) {
    _insuranceBasicModelList = value;
  }

  void addToInsuranceBasicModelList(String value) {
    insuranceBasicModelList.add(value);
  }

  void removeFromInsuranceBasicModelList(String value) {
    insuranceBasicModelList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelList(int index) {
    insuranceBasicModelList.removeAt(index);
  }

  void updateInsuranceBasicModelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelList[index] = updateFn(_insuranceBasicModelList[index]);
  }

  void insertAtIndexInInsuranceBasicModelList(int index, String value) {
    insuranceBasicModelList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeNameOutputList = [];
  List<String> get insuranceBasicCoverTypeNameOutputList =>
      _insuranceBasicCoverTypeNameOutputList;
  set insuranceBasicCoverTypeNameOutputList(List<String> value) {
    _insuranceBasicCoverTypeNameOutputList = value;
  }

  void addToInsuranceBasicCoverTypeNameOutputList(String value) {
    insuranceBasicCoverTypeNameOutputList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeNameOutputList(String value) {
    insuranceBasicCoverTypeNameOutputList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeNameOutputList(int index) {
    insuranceBasicCoverTypeNameOutputList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeNameOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeNameOutputList[index] =
        updateFn(_insuranceBasicCoverTypeNameOutputList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeNameOutputList(
      int index, String value) {
    insuranceBasicCoverTypeNameOutputList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeIdOutputList = [];
  List<String> get insuranceBasicCoverTypeIdOutputList =>
      _insuranceBasicCoverTypeIdOutputList;
  set insuranceBasicCoverTypeIdOutputList(List<String> value) {
    _insuranceBasicCoverTypeIdOutputList = value;
  }

  void addToInsuranceBasicCoverTypeIdOutputList(String value) {
    insuranceBasicCoverTypeIdOutputList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeIdOutputList(String value) {
    insuranceBasicCoverTypeIdOutputList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeIdOutputList(int index) {
    insuranceBasicCoverTypeIdOutputList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeIdOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeIdOutputList[index] =
        updateFn(_insuranceBasicCoverTypeIdOutputList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeIdOutputList(
      int index, String value) {
    insuranceBasicCoverTypeIdOutputList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeCodeOutputList = [];
  List<String> get insuranceBasicCoverTypeCodeOutputList =>
      _insuranceBasicCoverTypeCodeOutputList;
  set insuranceBasicCoverTypeCodeOutputList(List<String> value) {
    _insuranceBasicCoverTypeCodeOutputList = value;
  }

  void addToInsuranceBasicCoverTypeCodeOutputList(String value) {
    insuranceBasicCoverTypeCodeOutputList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeCodeOutputList(String value) {
    insuranceBasicCoverTypeCodeOutputList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeCodeOutputList(int index) {
    insuranceBasicCoverTypeCodeOutputList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeCodeOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeCodeOutputList[index] =
        updateFn(_insuranceBasicCoverTypeCodeOutputList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeCodeOutputList(
      int index, String value) {
    insuranceBasicCoverTypeCodeOutputList.insert(index, value);
  }

  List<String> _insuranceBasicGarageTypeInPackage = [];
  List<String> get insuranceBasicGarageTypeInPackage =>
      _insuranceBasicGarageTypeInPackage;
  set insuranceBasicGarageTypeInPackage(List<String> value) {
    _insuranceBasicGarageTypeInPackage = value;
  }

  void addToInsuranceBasicGarageTypeInPackage(String value) {
    insuranceBasicGarageTypeInPackage.add(value);
  }

  void removeFromInsuranceBasicGarageTypeInPackage(String value) {
    insuranceBasicGarageTypeInPackage.remove(value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeInPackage(int index) {
    insuranceBasicGarageTypeInPackage.removeAt(index);
  }

  void updateInsuranceBasicGarageTypeInPackageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicGarageTypeInPackage[index] =
        updateFn(_insuranceBasicGarageTypeInPackage[index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeInPackage(
      int index, String value) {
    insuranceBasicGarageTypeInPackage.insert(index, value);
  }

  List<String> _searchableListComponentData = [];
  List<String> get searchableListComponentData => _searchableListComponentData;
  set searchableListComponentData(List<String> value) {
    _searchableListComponentData = value;
  }

  void addToSearchableListComponentData(String value) {
    searchableListComponentData.add(value);
  }

  void removeFromSearchableListComponentData(String value) {
    searchableListComponentData.remove(value);
  }

  void removeAtIndexFromSearchableListComponentData(int index) {
    searchableListComponentData.removeAt(index);
  }

  void updateSearchableListComponentDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchableListComponentData[index] =
        updateFn(_searchableListComponentData[index]);
  }

  void insertAtIndexInSearchableListComponentData(int index, String value) {
    searchableListComponentData.insert(index, value);
  }

  List<bool> _searchableListComponentSelectedList = [];
  List<bool> get searchableListComponentSelectedList =>
      _searchableListComponentSelectedList;
  set searchableListComponentSelectedList(List<bool> value) {
    _searchableListComponentSelectedList = value;
  }

  void addToSearchableListComponentSelectedList(bool value) {
    searchableListComponentSelectedList.add(value);
  }

  void removeFromSearchableListComponentSelectedList(bool value) {
    searchableListComponentSelectedList.remove(value);
  }

  void removeAtIndexFromSearchableListComponentSelectedList(int index) {
    searchableListComponentSelectedList.removeAt(index);
  }

  void updateSearchableListComponentSelectedListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    searchableListComponentSelectedList[index] =
        updateFn(_searchableListComponentSelectedList[index]);
  }

  void insertAtIndexInSearchableListComponentSelectedList(
      int index, bool value) {
    searchableListComponentSelectedList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleTypeDropdownList = [
    'รถเก๋ง',
    'รถตู้',
    'รถกระบะ',
    'รถบรรทุก หัวลาก หางพ่วง',
    'รถแต่ง ต่อคอก'
  ];
  List<String> get insuranceBasicVehicleTypeDropdownList =>
      _insuranceBasicVehicleTypeDropdownList;
  set insuranceBasicVehicleTypeDropdownList(List<String> value) {
    _insuranceBasicVehicleTypeDropdownList = value;
  }

  void addToInsuranceBasicVehicleTypeDropdownList(String value) {
    insuranceBasicVehicleTypeDropdownList.add(value);
  }

  void removeFromInsuranceBasicVehicleTypeDropdownList(String value) {
    insuranceBasicVehicleTypeDropdownList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleTypeDropdownList(int index) {
    insuranceBasicVehicleTypeDropdownList.removeAt(index);
  }

  void updateInsuranceBasicVehicleTypeDropdownListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleTypeDropdownList[index] =
        updateFn(_insuranceBasicVehicleTypeDropdownList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleTypeDropdownList(
      int index, String value) {
    insuranceBasicVehicleTypeDropdownList.insert(index, value);
  }

  List<String> _insuranceBasicGarageTypeIdList = ['2', '1'];
  List<String> get insuranceBasicGarageTypeIdList =>
      _insuranceBasicGarageTypeIdList;
  set insuranceBasicGarageTypeIdList(List<String> value) {
    _insuranceBasicGarageTypeIdList = value;
  }

  void addToInsuranceBasicGarageTypeIdList(String value) {
    insuranceBasicGarageTypeIdList.add(value);
  }

  void removeFromInsuranceBasicGarageTypeIdList(String value) {
    insuranceBasicGarageTypeIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeIdList(int index) {
    insuranceBasicGarageTypeIdList.removeAt(index);
  }

  void updateInsuranceBasicGarageTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicGarageTypeIdList[index] =
        updateFn(_insuranceBasicGarageTypeIdList[index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeIdList(int index, String value) {
    insuranceBasicGarageTypeIdList.insert(index, value);
  }

  List<String> _insuranceBasicGarageTypeNameList = ['ซ่อมอู่', 'ซ่อมห้าง'];
  List<String> get insuranceBasicGarageTypeNameList =>
      _insuranceBasicGarageTypeNameList;
  set insuranceBasicGarageTypeNameList(List<String> value) {
    _insuranceBasicGarageTypeNameList = value;
  }

  void addToInsuranceBasicGarageTypeNameList(String value) {
    insuranceBasicGarageTypeNameList.add(value);
  }

  void removeFromInsuranceBasicGarageTypeNameList(String value) {
    insuranceBasicGarageTypeNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeNameList(int index) {
    insuranceBasicGarageTypeNameList.removeAt(index);
  }

  void updateInsuranceBasicGarageTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicGarageTypeNameList[index] =
        updateFn(_insuranceBasicGarageTypeNameList[index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeNameList(
      int index, String value) {
    insuranceBasicGarageTypeNameList.insert(index, value);
  }

  List<String> _insuranceBasicGarageTypeIdInPackage = [];
  List<String> get insuranceBasicGarageTypeIdInPackage =>
      _insuranceBasicGarageTypeIdInPackage;
  set insuranceBasicGarageTypeIdInPackage(List<String> value) {
    _insuranceBasicGarageTypeIdInPackage = value;
  }

  void addToInsuranceBasicGarageTypeIdInPackage(String value) {
    insuranceBasicGarageTypeIdInPackage.add(value);
  }

  void removeFromInsuranceBasicGarageTypeIdInPackage(String value) {
    insuranceBasicGarageTypeIdInPackage.remove(value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeIdInPackage(int index) {
    insuranceBasicGarageTypeIdInPackage.removeAt(index);
  }

  void updateInsuranceBasicGarageTypeIdInPackageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicGarageTypeIdInPackage[index] =
        updateFn(_insuranceBasicGarageTypeIdInPackage[index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeIdInPackage(
      int index, String value) {
    insuranceBasicGarageTypeIdInPackage.insert(index, value);
  }

  bool _isSelectBrandInPackage = false;
  bool get isSelectBrandInPackage => _isSelectBrandInPackage;
  set isSelectBrandInPackage(bool value) {
    _isSelectBrandInPackage = value;
  }

  List<String> _tpbiPerson = [];
  List<String> get tpbiPerson => _tpbiPerson;
  set tpbiPerson(List<String> value) {
    _tpbiPerson = value;
  }

  void addToTpbiPerson(String value) {
    tpbiPerson.add(value);
  }

  void removeFromTpbiPerson(String value) {
    tpbiPerson.remove(value);
  }

  void removeAtIndexFromTpbiPerson(int index) {
    tpbiPerson.removeAt(index);
  }

  void updateTpbiPersonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tpbiPerson[index] = updateFn(_tpbiPerson[index]);
  }

  void insertAtIndexInTpbiPerson(int index, String value) {
    tpbiPerson.insert(index, value);
  }

  List<String> _tpbiAccident = [];
  List<String> get tpbiAccident => _tpbiAccident;
  set tpbiAccident(List<String> value) {
    _tpbiAccident = value;
  }

  void addToTpbiAccident(String value) {
    tpbiAccident.add(value);
  }

  void removeFromTpbiAccident(String value) {
    tpbiAccident.remove(value);
  }

  void removeAtIndexFromTpbiAccident(int index) {
    tpbiAccident.removeAt(index);
  }

  void updateTpbiAccidentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tpbiAccident[index] = updateFn(_tpbiAccident[index]);
  }

  void insertAtIndexInTpbiAccident(int index, String value) {
    tpbiAccident.insert(index, value);
  }

  List<String> _effectiveDate = [];
  List<String> get effectiveDate => _effectiveDate;
  set effectiveDate(List<String> value) {
    _effectiveDate = value;
  }

  void addToEffectiveDate(String value) {
    effectiveDate.add(value);
  }

  void removeFromEffectiveDate(String value) {
    effectiveDate.remove(value);
  }

  void removeAtIndexFromEffectiveDate(int index) {
    effectiveDate.removeAt(index);
  }

  void updateEffectiveDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    effectiveDate[index] = updateFn(_effectiveDate[index]);
  }

  void insertAtIndexInEffectiveDate(int index, String value) {
    effectiveDate.insert(index, value);
  }

  List<String> _filterInsurerList = [];
  List<String> get filterInsurerList => _filterInsurerList;
  set filterInsurerList(List<String> value) {
    _filterInsurerList = value;
  }

  void addToFilterInsurerList(String value) {
    filterInsurerList.add(value);
  }

  void removeFromFilterInsurerList(String value) {
    filterInsurerList.remove(value);
  }

  void removeAtIndexFromFilterInsurerList(int index) {
    filterInsurerList.removeAt(index);
  }

  void updateFilterInsurerListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterInsurerList[index] = updateFn(_filterInsurerList[index]);
  }

  void insertAtIndexInFilterInsurerList(int index, String value) {
    filterInsurerList.insert(index, value);
  }

  List<String> _filterCoverTypeList = [];
  List<String> get filterCoverTypeList => _filterCoverTypeList;
  set filterCoverTypeList(List<String> value) {
    _filterCoverTypeList = value;
  }

  void addToFilterCoverTypeList(String value) {
    filterCoverTypeList.add(value);
  }

  void removeFromFilterCoverTypeList(String value) {
    filterCoverTypeList.remove(value);
  }

  void removeAtIndexFromFilterCoverTypeList(int index) {
    filterCoverTypeList.removeAt(index);
  }

  void updateFilterCoverTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterCoverTypeList[index] = updateFn(_filterCoverTypeList[index]);
  }

  void insertAtIndexInFilterCoverTypeList(int index, String value) {
    filterCoverTypeList.insert(index, value);
  }

  List<String> _filterGarageTypeList = [];
  List<String> get filterGarageTypeList => _filterGarageTypeList;
  set filterGarageTypeList(List<String> value) {
    _filterGarageTypeList = value;
  }

  void addToFilterGarageTypeList(String value) {
    filterGarageTypeList.add(value);
  }

  void removeFromFilterGarageTypeList(String value) {
    filterGarageTypeList.remove(value);
  }

  void removeAtIndexFromFilterGarageTypeList(int index) {
    filterGarageTypeList.removeAt(index);
  }

  void updateFilterGarageTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterGarageTypeList[index] = updateFn(_filterGarageTypeList[index]);
  }

  void insertAtIndexInFilterGarageTypeList(int index, String value) {
    filterGarageTypeList.insert(index, value);
  }

  List<String> _searchRegisYearList = [];
  List<String> get searchRegisYearList => _searchRegisYearList;
  set searchRegisYearList(List<String> value) {
    _searchRegisYearList = value;
  }

  void addToSearchRegisYearList(String value) {
    searchRegisYearList.add(value);
  }

  void removeFromSearchRegisYearList(String value) {
    searchRegisYearList.remove(value);
  }

  void removeAtIndexFromSearchRegisYearList(int index) {
    searchRegisYearList.removeAt(index);
  }

  void updateSearchRegisYearListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchRegisYearList[index] = updateFn(_searchRegisYearList[index]);
  }

  void insertAtIndexInSearchRegisYearList(int index, String value) {
    searchRegisYearList.insert(index, value);
  }

  List<String> _insuranceCardType = [];
  List<String> get insuranceCardType => _insuranceCardType;
  set insuranceCardType(List<String> value) {
    _insuranceCardType = value;
  }

  void addToInsuranceCardType(String value) {
    insuranceCardType.add(value);
  }

  void removeFromInsuranceCardType(String value) {
    insuranceCardType.remove(value);
  }

  void removeAtIndexFromInsuranceCardType(int index) {
    insuranceCardType.removeAt(index);
  }

  void updateInsuranceCardTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceCardType[index] = updateFn(_insuranceCardType[index]);
  }

  void insertAtIndexInInsuranceCardType(int index, String value) {
    insuranceCardType.insert(index, value);
  }

  List<String> _insuranceCusGender = [];
  List<String> get insuranceCusGender => _insuranceCusGender;
  set insuranceCusGender(List<String> value) {
    _insuranceCusGender = value;
  }

  void addToInsuranceCusGender(String value) {
    insuranceCusGender.add(value);
  }

  void removeFromInsuranceCusGender(String value) {
    insuranceCusGender.remove(value);
  }

  void removeAtIndexFromInsuranceCusGender(int index) {
    insuranceCusGender.removeAt(index);
  }

  void updateInsuranceCusGenderAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceCusGender[index] = updateFn(_insuranceCusGender[index]);
  }

  void insertAtIndexInInsuranceCusGender(int index, String value) {
    insuranceCusGender.insert(index, value);
  }

  List<String> _searchDriverList = [];
  List<String> get searchDriverList => _searchDriverList;
  set searchDriverList(List<String> value) {
    _searchDriverList = value;
  }

  void addToSearchDriverList(String value) {
    searchDriverList.add(value);
  }

  void removeFromSearchDriverList(String value) {
    searchDriverList.remove(value);
  }

  void removeAtIndexFromSearchDriverList(int index) {
    searchDriverList.removeAt(index);
  }

  void updateSearchDriverListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchDriverList[index] = updateFn(_searchDriverList[index]);
  }

  void insertAtIndexInSearchDriverList(int index, String value) {
    searchDriverList.insert(index, value);
  }

  List<String> _searchShortName = [];
  List<String> get searchShortName => _searchShortName;
  set searchShortName(List<String> value) {
    _searchShortName = value;
  }

  void addToSearchShortName(String value) {
    searchShortName.add(value);
  }

  void removeFromSearchShortName(String value) {
    searchShortName.remove(value);
  }

  void removeAtIndexFromSearchShortName(int index) {
    searchShortName.removeAt(index);
  }

  void updateSearchShortNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchShortName[index] = updateFn(_searchShortName[index]);
  }

  void insertAtIndexInSearchShortName(int index, String value) {
    searchShortName.insert(index, value);
  }

  List<bool> _selectInsurerList = [];
  List<bool> get selectInsurerList => _selectInsurerList;
  set selectInsurerList(List<bool> value) {
    _selectInsurerList = value;
  }

  void addToSelectInsurerList(bool value) {
    selectInsurerList.add(value);
  }

  void removeFromSelectInsurerList(bool value) {
    selectInsurerList.remove(value);
  }

  void removeAtIndexFromSelectInsurerList(int index) {
    selectInsurerList.removeAt(index);
  }

  void updateSelectInsurerListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectInsurerList[index] = updateFn(_selectInsurerList[index]);
  }

  void insertAtIndexInSelectInsurerList(int index, bool value) {
    selectInsurerList.insert(index, value);
  }

  List<String> _cardType = ['บัตรประชาชน', 'Passport'];
  List<String> get cardType => _cardType;
  set cardType(List<String> value) {
    _cardType = value;
  }

  void addToCardType(String value) {
    cardType.add(value);
  }

  void removeFromCardType(String value) {
    cardType.remove(value);
  }

  void removeAtIndexFromCardType(int index) {
    cardType.removeAt(index);
  }

  void updateCardTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cardType[index] = updateFn(_cardType[index]);
  }

  void insertAtIndexInCardType(int index, String value) {
    cardType.insert(index, value);
  }

  List<String> _gender = ['ชาย', 'หญิง'];
  List<String> get gender => _gender;
  set gender(List<String> value) {
    _gender = value;
  }

  void addToGender(String value) {
    gender.add(value);
  }

  void removeFromGender(String value) {
    gender.remove(value);
  }

  void removeAtIndexFromGender(int index) {
    gender.removeAt(index);
  }

  void updateGenderAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    gender[index] = updateFn(_gender[index]);
  }

  void insertAtIndexInGender(int index, String value) {
    gender.insert(index, value);
  }

  List<String> _searchLogo = [];
  List<String> get searchLogo => _searchLogo;
  set searchLogo(List<String> value) {
    _searchLogo = value;
  }

  void addToSearchLogo(String value) {
    searchLogo.add(value);
  }

  void removeFromSearchLogo(String value) {
    searchLogo.remove(value);
  }

  void removeAtIndexFromSearchLogo(int index) {
    searchLogo.removeAt(index);
  }

  void updateSearchLogoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchLogo[index] = updateFn(_searchLogo[index]);
  }

  void insertAtIndexInSearchLogo(int index, String value) {
    searchLogo.insert(index, value);
  }

  String _insuranceInfoCardType = 'เลือกประเภทบัตร';
  String get insuranceInfoCardType => _insuranceInfoCardType;
  set insuranceInfoCardType(String value) {
    _insuranceInfoCardType = value;
  }

  String _insuranceInfoGender = 'เลือกเพศ';
  String get insuranceInfoGender => _insuranceInfoGender;
  set insuranceInfoGender(String value) {
    _insuranceInfoGender = value;
  }

  String _insuranceInfoTitle = 'เลือกคำนำหน้าชื่อ';
  String get insuranceInfoTitle => _insuranceInfoTitle;
  set insuranceInfoTitle(String value) {
    _insuranceInfoTitle = value;
  }

  String _insuranceInfoOccupationGroup = 'เลือกกลุ่มอาชีพ';
  String get insuranceInfoOccupationGroup => _insuranceInfoOccupationGroup;
  set insuranceInfoOccupationGroup(String value) {
    _insuranceInfoOccupationGroup = value;
  }

  String _insuranceInfoIdCard = '';
  String get insuranceInfoIdCard => _insuranceInfoIdCard;
  set insuranceInfoIdCard(String value) {
    _insuranceInfoIdCard = value;
  }

  String _insuranceInfoFirstName = '';
  String get insuranceInfoFirstName => _insuranceInfoFirstName;
  set insuranceInfoFirstName(String value) {
    _insuranceInfoFirstName = value;
  }

  String _insuranceInfoLastName = '';
  String get insuranceInfoLastName => _insuranceInfoLastName;
  set insuranceInfoLastName(String value) {
    _insuranceInfoLastName = value;
  }

  String _insuranceInfoBirthDate = '';
  String get insuranceInfoBirthDate => _insuranceInfoBirthDate;
  set insuranceInfoBirthDate(String value) {
    _insuranceInfoBirthDate = value;
  }

  String _insuranceInfoOccupation = '';
  String get insuranceInfoOccupation => _insuranceInfoOccupation;
  set insuranceInfoOccupation(String value) {
    _insuranceInfoOccupation = value;
  }

  String _insuranceInfoPhonenumber = '';
  String get insuranceInfoPhonenumber => _insuranceInfoPhonenumber;
  set insuranceInfoPhonenumber(String value) {
    _insuranceInfoPhonenumber = value;
  }

  String _insuranceInfoOtherPhone = '';
  String get insuranceInfoOtherPhone => _insuranceInfoOtherPhone;
  set insuranceInfoOtherPhone(String value) {
    _insuranceInfoOtherPhone = value;
  }

  String _insuranceInfoEmail = '';
  String get insuranceInfoEmail => _insuranceInfoEmail;
  set insuranceInfoEmail(String value) {
    _insuranceInfoEmail = value;
  }

  String _insuranceInfoAge = '';
  String get insuranceInfoAge => _insuranceInfoAge;
  set insuranceInfoAge(String value) {
    _insuranceInfoAge = value;
  }

  String _insuranceInfoGarageType = '';
  String get insuranceInfoGarageType => _insuranceInfoGarageType;
  set insuranceInfoGarageType(String value) {
    _insuranceInfoGarageType = value;
  }

  String _insuranceInfocoverType = '';
  String get insuranceInfocoverType => _insuranceInfocoverType;
  set insuranceInfocoverType(String value) {
    _insuranceInfocoverType = value;
  }

  String _insuranceInfoGrossTotal = '';
  String get insuranceInfoGrossTotal => _insuranceInfoGrossTotal;
  set insuranceInfoGrossTotal(String value) {
    _insuranceInfoGrossTotal = value;
  }

  String _insuranceInfoImgUrl = '';
  String get insuranceInfoImgUrl => _insuranceInfoImgUrl;
  set insuranceInfoImgUrl(String value) {
    _insuranceInfoImgUrl = value;
  }

  bool _nonePackageFlagCarrier = false;
  bool get nonePackageFlagCarrier => _nonePackageFlagCarrier;
  set nonePackageFlagCarrier(bool value) {
    _nonePackageFlagCarrier = value;
  }

  String _nonePackageVehicleType = 'กรุณาเลือกประเภทรถ';
  String get nonePackageVehicleType => _nonePackageVehicleType;
  set nonePackageVehicleType(String value) {
    _nonePackageVehicleType = value;
  }

  String _nonePackageBrandName = 'กรุณาเลือกยี่ห้อรถ';
  String get nonePackageBrandName => _nonePackageBrandName;
  set nonePackageBrandName(String value) {
    _nonePackageBrandName = value;
  }

  String _nonePackageBrandId = '';
  String get nonePackageBrandId => _nonePackageBrandId;
  set nonePackageBrandId(String value) {
    _nonePackageBrandId = value;
  }

  String _nonePackageModelName = 'กรุณากรอกรุ่นรถ';
  String get nonePackageModelName => _nonePackageModelName;
  set nonePackageModelName(String value) {
    _nonePackageModelName = value;
  }

  String _nonePackageModelCode = '';
  String get nonePackageModelCode => _nonePackageModelCode;
  set nonePackageModelCode(String value) {
    _nonePackageModelCode = value;
  }

  String _nonePackageYear = 'กรุณาเลือกปีจดทะเบียน';
  String get nonePackageYear => _nonePackageYear;
  set nonePackageYear(String value) {
    _nonePackageYear = value;
  }

  String _nonePackageUsedTypeId = '';
  String get nonePackageUsedTypeId => _nonePackageUsedTypeId;
  set nonePackageUsedTypeId(String value) {
    _nonePackageUsedTypeId = value;
  }

  List<String> _nonePackageSearchModelList = [];
  List<String> get nonePackageSearchModelList => _nonePackageSearchModelList;
  set nonePackageSearchModelList(List<String> value) {
    _nonePackageSearchModelList = value;
  }

  void addToNonePackageSearchModelList(String value) {
    nonePackageSearchModelList.add(value);
  }

  void removeFromNonePackageSearchModelList(String value) {
    nonePackageSearchModelList.remove(value);
  }

  void removeAtIndexFromNonePackageSearchModelList(int index) {
    nonePackageSearchModelList.removeAt(index);
  }

  void updateNonePackageSearchModelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageSearchModelList[index] =
        updateFn(_nonePackageSearchModelList[index]);
  }

  void insertAtIndexInNonePackageSearchModelList(int index, String value) {
    nonePackageSearchModelList.insert(index, value);
  }

  String _nonePackageUsedTypeCode = '';
  String get nonePackageUsedTypeCode => _nonePackageUsedTypeCode;
  set nonePackageUsedTypeCode(String value) {
    _nonePackageUsedTypeCode = value;
  }

  String _nonePackageUsedTypeName = 'กรุณาเลือกลักษณะการใช้รถ';
  String get nonePackageUsedTypeName => _nonePackageUsedTypeName;
  set nonePackageUsedTypeName(String value) {
    _nonePackageUsedTypeName = value;
  }

  String _nonePackageCusFullname = 'กรุณากรอกชื่อ';
  String get nonePackageCusFullname => _nonePackageCusFullname;
  set nonePackageCusFullname(String value) {
    _nonePackageCusFullname = value;
  }

  String _nonePackageCusPhone = 'กรุณากรอกเบอร์โทรศัพท์';
  String get nonePackageCusPhone => _nonePackageCusPhone;
  set nonePackageCusPhone(String value) {
    _nonePackageCusPhone = value;
  }

  String _nonePackagePlate = '';
  String get nonePackagePlate => _nonePackagePlate;
  set nonePackagePlate(String value) {
    _nonePackagePlate = value;
  }

  String _nonePackageProvince = 'กรุณาเลือกจังหวัดจดทะเบียน';
  String get nonePackageProvince => _nonePackageProvince;
  set nonePackageProvince(String value) {
    _nonePackageProvince = value;
  }

  String _nonePackageProvinceId = '';
  String get nonePackageProvinceId => _nonePackageProvinceId;
  set nonePackageProvinceId(String value) {
    _nonePackageProvinceId = value;
  }

  String _nonePackageSumInsured = 'กรุณากรอกทุนประกัน';
  String get nonePackageSumInsured => _nonePackageSumInsured;
  set nonePackageSumInsured(String value) {
    _nonePackageSumInsured = value;
  }

  bool _nonePackageFlagAct = true;
  bool get nonePackageFlagAct => _nonePackageFlagAct;
  set nonePackageFlagAct(bool value) {
    _nonePackageFlagAct = value;
  }

  String _insuranceInfoVehicleType = '';
  String get insuranceInfoVehicleType => _insuranceInfoVehicleType;
  set insuranceInfoVehicleType(String value) {
    _insuranceInfoVehicleType = value;
  }

  String _insuranceInfoBrandName = '';
  String get insuranceInfoBrandName => _insuranceInfoBrandName;
  set insuranceInfoBrandName(String value) {
    _insuranceInfoBrandName = value;
  }

  String _insuranceInfoModelName = '';
  String get insuranceInfoModelName => _insuranceInfoModelName;
  set insuranceInfoModelName(String value) {
    _insuranceInfoModelName = value;
  }

  String _insuranceInfoRegisYear = '';
  String get insuranceInfoRegisYear => _insuranceInfoRegisYear;
  set insuranceInfoRegisYear(String value) {
    _insuranceInfoRegisYear = value;
  }

  String _insuranceInfoProductYear = 'กรุณาเลือกปีผลิต';
  String get insuranceInfoProductYear => _insuranceInfoProductYear;
  set insuranceInfoProductYear(String value) {
    _insuranceInfoProductYear = value;
  }

  String _insuranceInfoVehicleUsage = '';
  String get insuranceInfoVehicleUsage => _insuranceInfoVehicleUsage;
  set insuranceInfoVehicleUsage(String value) {
    _insuranceInfoVehicleUsage = value;
  }

  String _insuranceInfoCarRegis = '';
  String get insuranceInfoCarRegis => _insuranceInfoCarRegis;
  set insuranceInfoCarRegis(String value) {
    _insuranceInfoCarRegis = value;
  }

  String _insuranceInfoBodyNumber = '';
  String get insuranceInfoBodyNumber => _insuranceInfoBodyNumber;
  set insuranceInfoBodyNumber(String value) {
    _insuranceInfoBodyNumber = value;
  }

  String _insuranceInfoEngineNumber = '';
  String get insuranceInfoEngineNumber => _insuranceInfoEngineNumber;
  set insuranceInfoEngineNumber(String value) {
    _insuranceInfoEngineNumber = value;
  }

  String _insuranceInfoCarSeat = '';
  String get insuranceInfoCarSeat => _insuranceInfoCarSeat;
  set insuranceInfoCarSeat(String value) {
    _insuranceInfoCarSeat = value;
  }

  String _insuranceInfoSizeCar = '';
  String get insuranceInfoSizeCar => _insuranceInfoSizeCar;
  set insuranceInfoSizeCar(String value) {
    _insuranceInfoSizeCar = value;
  }

  String _insuranceInfoWeightCar = '';
  String get insuranceInfoWeightCar => _insuranceInfoWeightCar;
  set insuranceInfoWeightCar(String value) {
    _insuranceInfoWeightCar = value;
  }

  bool _nonePackageIsBrandSelect = false;
  bool get nonePackageIsBrandSelect => _nonePackageIsBrandSelect;
  set nonePackageIsBrandSelect(bool value) {
    _nonePackageIsBrandSelect = value;
  }

  List<String> _nonePackageSearchModelIdList = [];
  List<String> get nonePackageSearchModelIdList =>
      _nonePackageSearchModelIdList;
  set nonePackageSearchModelIdList(List<String> value) {
    _nonePackageSearchModelIdList = value;
  }

  void addToNonePackageSearchModelIdList(String value) {
    nonePackageSearchModelIdList.add(value);
  }

  void removeFromNonePackageSearchModelIdList(String value) {
    nonePackageSearchModelIdList.remove(value);
  }

  void removeAtIndexFromNonePackageSearchModelIdList(int index) {
    nonePackageSearchModelIdList.removeAt(index);
  }

  void updateNonePackageSearchModelIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageSearchModelIdList[index] =
        updateFn(_nonePackageSearchModelIdList[index]);
  }

  void insertAtIndexInNonePackageSearchModelIdList(int index, String value) {
    nonePackageSearchModelIdList.insert(index, value);
  }

  List<String> _searchAccessoryList = [];
  List<String> get searchAccessoryList => _searchAccessoryList;
  set searchAccessoryList(List<String> value) {
    _searchAccessoryList = value;
  }

  void addToSearchAccessoryList(String value) {
    searchAccessoryList.add(value);
  }

  void removeFromSearchAccessoryList(String value) {
    searchAccessoryList.remove(value);
  }

  void removeAtIndexFromSearchAccessoryList(int index) {
    searchAccessoryList.removeAt(index);
  }

  void updateSearchAccessoryListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchAccessoryList[index] = updateFn(_searchAccessoryList[index]);
  }

  void insertAtIndexInSearchAccessoryList(int index, String value) {
    searchAccessoryList.insert(index, value);
  }

  String _insuranceInfoActAmount = '';
  String get insuranceInfoActAmount => _insuranceInfoActAmount;
  set insuranceInfoActAmount(String value) {
    _insuranceInfoActAmount = value;
  }

  String _insuranceInfoAccessory = '';
  String get insuranceInfoAccessory => _insuranceInfoAccessory;
  set insuranceInfoAccessory(String value) {
    _insuranceInfoAccessory = value;
  }

  String _insuranceInfoAccessoryProtect = '';
  String get insuranceInfoAccessoryProtect => _insuranceInfoAccessoryProtect;
  set insuranceInfoAccessoryProtect(String value) {
    _insuranceInfoAccessoryProtect = value;
  }

  List<String> _nonePackageCarrierTypeList = ['ตู้แห้ง', 'ตู้เย็น'];
  List<String> get nonePackageCarrierTypeList => _nonePackageCarrierTypeList;
  set nonePackageCarrierTypeList(List<String> value) {
    _nonePackageCarrierTypeList = value;
  }

  void addToNonePackageCarrierTypeList(String value) {
    nonePackageCarrierTypeList.add(value);
  }

  void removeFromNonePackageCarrierTypeList(String value) {
    nonePackageCarrierTypeList.remove(value);
  }

  void removeAtIndexFromNonePackageCarrierTypeList(int index) {
    nonePackageCarrierTypeList.removeAt(index);
  }

  void updateNonePackageCarrierTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageCarrierTypeList[index] =
        updateFn(_nonePackageCarrierTypeList[index]);
  }

  void insertAtIndexInNonePackageCarrierTypeList(int index, String value) {
    nonePackageCarrierTypeList.insert(index, value);
  }

  String _nonePackageCarrierType = 'กรุณาเลือกประเภทตู้เหล็ก';
  String get nonePackageCarrierType => _nonePackageCarrierType;
  set nonePackageCarrierType(String value) {
    _nonePackageCarrierType = value;
  }

  bool _nonePackageFlagCoop = false;
  bool get nonePackageFlagCoop => _nonePackageFlagCoop;
  set nonePackageFlagCoop(bool value) {
    _nonePackageFlagCoop = value;
  }

  List<String> _nonePackageTruckPartList = ['เฉพาะหัวลาก', 'หัวลาก + หางพ่วง'];
  List<String> get nonePackageTruckPartList => _nonePackageTruckPartList;
  set nonePackageTruckPartList(List<String> value) {
    _nonePackageTruckPartList = value;
  }

  void addToNonePackageTruckPartList(String value) {
    nonePackageTruckPartList.add(value);
  }

  void removeFromNonePackageTruckPartList(String value) {
    nonePackageTruckPartList.remove(value);
  }

  void removeAtIndexFromNonePackageTruckPartList(int index) {
    nonePackageTruckPartList.removeAt(index);
  }

  void updateNonePackageTruckPartListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTruckPartList[index] =
        updateFn(_nonePackageTruckPartList[index]);
  }

  void insertAtIndexInNonePackageTruckPartList(int index, String value) {
    nonePackageTruckPartList.insert(index, value);
  }

  String _nonePackageTruckPart = 'กรุณาเลือกส่วนของรถบรรทุก';
  String get nonePackageTruckPart => _nonePackageTruckPart;
  set nonePackageTruckPart(String value) {
    _nonePackageTruckPart = value;
  }

  List<String> _nonePackageCusMembershipList = ['ลูกค้าสินเชื่อ', 'ลูกค้านอก'];
  List<String> get nonePackageCusMembershipList =>
      _nonePackageCusMembershipList;
  set nonePackageCusMembershipList(List<String> value) {
    _nonePackageCusMembershipList = value;
  }

  void addToNonePackageCusMembershipList(String value) {
    nonePackageCusMembershipList.add(value);
  }

  void removeFromNonePackageCusMembershipList(String value) {
    nonePackageCusMembershipList.remove(value);
  }

  void removeAtIndexFromNonePackageCusMembershipList(int index) {
    nonePackageCusMembershipList.removeAt(index);
  }

  void updateNonePackageCusMembershipListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageCusMembershipList[index] =
        updateFn(_nonePackageCusMembershipList[index]);
  }

  void insertAtIndexInNonePackageCusMembershipList(int index, String value) {
    nonePackageCusMembershipList.insert(index, value);
  }

  String _nonePackageCusMembership = 'กรุณาเลือกประเภทลูกค้า';
  String get nonePackageCusMembership => _nonePackageCusMembership;
  set nonePackageCusMembership(String value) {
    _nonePackageCusMembership = value;
  }

  String _nonePackageTruckCurrentPrice = 'กรุณากรอกราคาซื้อขายปัจจุบัน';
  String get nonePackageTruckCurrentPrice => _nonePackageTruckCurrentPrice;
  set nonePackageTruckCurrentPrice(String value) {
    _nonePackageTruckCurrentPrice = value;
  }

  String _nonePackagePlateAdditional = 'กรุณากรอกเลขทะเบียนหางพ่วง';
  String get nonePackagePlateAdditional => _nonePackagePlateAdditional;
  set nonePackagePlateAdditional(String value) {
    _nonePackagePlateAdditional = value;
  }

  String _nonePackageTruckCarryPurpose = 'กรุณากรอกรถใช้บรรทุกอะไร';
  String get nonePackageTruckCarryPurpose => _nonePackageTruckCarryPurpose;
  set nonePackageTruckCarryPurpose(String value) {
    _nonePackageTruckCarryPurpose = value;
  }

  String _nonePackageTrailerSumInsured = 'กรุณากรอกทุนประกันหางพ่วง';
  String get nonePackageTrailerSumInsured => _nonePackageTrailerSumInsured;
  set nonePackageTrailerSumInsured(String value) {
    _nonePackageTrailerSumInsured = value;
  }

  String _nonePackageCarrierPrice = '';
  String get nonePackageCarrierPrice => _nonePackageCarrierPrice;
  set nonePackageCarrierPrice(String value) {
    _nonePackageCarrierPrice = value;
  }

  List<String> _nonePackageInsurerIdList = [];
  List<String> get nonePackageInsurerIdList => _nonePackageInsurerIdList;
  set nonePackageInsurerIdList(List<String> value) {
    _nonePackageInsurerIdList = value;
  }

  void addToNonePackageInsurerIdList(String value) {
    nonePackageInsurerIdList.add(value);
  }

  void removeFromNonePackageInsurerIdList(String value) {
    nonePackageInsurerIdList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerIdList(int index) {
    nonePackageInsurerIdList.removeAt(index);
  }

  void updateNonePackageInsurerIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerIdList[index] =
        updateFn(_nonePackageInsurerIdList[index]);
  }

  void insertAtIndexInNonePackageInsurerIdList(int index, String value) {
    nonePackageInsurerIdList.insert(index, value);
  }

  List<String> _nonePackageInsurerCodeList = [];
  List<String> get nonePackageInsurerCodeList => _nonePackageInsurerCodeList;
  set nonePackageInsurerCodeList(List<String> value) {
    _nonePackageInsurerCodeList = value;
  }

  void addToNonePackageInsurerCodeList(String value) {
    nonePackageInsurerCodeList.add(value);
  }

  void removeFromNonePackageInsurerCodeList(String value) {
    nonePackageInsurerCodeList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerCodeList(int index) {
    nonePackageInsurerCodeList.removeAt(index);
  }

  void updateNonePackageInsurerCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerCodeList[index] =
        updateFn(_nonePackageInsurerCodeList[index]);
  }

  void insertAtIndexInNonePackageInsurerCodeList(int index, String value) {
    nonePackageInsurerCodeList.insert(index, value);
  }

  List<String> _nonePackageInsurerShortNameList = [];
  List<String> get nonePackageInsurerShortNameList =>
      _nonePackageInsurerShortNameList;
  set nonePackageInsurerShortNameList(List<String> value) {
    _nonePackageInsurerShortNameList = value;
  }

  void addToNonePackageInsurerShortNameList(String value) {
    nonePackageInsurerShortNameList.add(value);
  }

  void removeFromNonePackageInsurerShortNameList(String value) {
    nonePackageInsurerShortNameList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameList(int index) {
    nonePackageInsurerShortNameList.removeAt(index);
  }

  void updateNonePackageInsurerShortNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerShortNameList[index] =
        updateFn(_nonePackageInsurerShortNameList[index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameList(int index, String value) {
    nonePackageInsurerShortNameList.insert(index, value);
  }

  List<String> _nonePackageInsurerNameList = [];
  List<String> get nonePackageInsurerNameList => _nonePackageInsurerNameList;
  set nonePackageInsurerNameList(List<String> value) {
    _nonePackageInsurerNameList = value;
  }

  void addToNonePackageInsurerNameList(String value) {
    nonePackageInsurerNameList.add(value);
  }

  void removeFromNonePackageInsurerNameList(String value) {
    nonePackageInsurerNameList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerNameList(int index) {
    nonePackageInsurerNameList.removeAt(index);
  }

  void updateNonePackageInsurerNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerNameList[index] =
        updateFn(_nonePackageInsurerNameList[index]);
  }

  void insertAtIndexInNonePackageInsurerNameList(int index, String value) {
    nonePackageInsurerNameList.insert(index, value);
  }

  List<String> _nonePackageInsurerDisplayName = [];
  List<String> get nonePackageInsurerDisplayName =>
      _nonePackageInsurerDisplayName;
  set nonePackageInsurerDisplayName(List<String> value) {
    _nonePackageInsurerDisplayName = value;
  }

  void addToNonePackageInsurerDisplayName(String value) {
    nonePackageInsurerDisplayName.add(value);
  }

  void removeFromNonePackageInsurerDisplayName(String value) {
    nonePackageInsurerDisplayName.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerDisplayName(int index) {
    nonePackageInsurerDisplayName.removeAt(index);
  }

  void updateNonePackageInsurerDisplayNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerDisplayName[index] =
        updateFn(_nonePackageInsurerDisplayName[index]);
  }

  void insertAtIndexInNonePackageInsurerDisplayName(int index, String value) {
    nonePackageInsurerDisplayName.insert(index, value);
  }

  String _addAddressAtIdCard = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard => _addAddressAtIdCard;
  set addAddressAtIdCard(String value) {
    _addAddressAtIdCard = value;
  }

  String _addAddressAtIdCard2 = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard2 => _addAddressAtIdCard2;
  set addAddressAtIdCard2(String value) {
    _addAddressAtIdCard2 = value;
  }

  String _addAddressAtIdCard3 = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard3 => _addAddressAtIdCard3;
  set addAddressAtIdCard3(String value) {
    _addAddressAtIdCard3 = value;
  }

  String _addAddressForDoc = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc => _addAddressForDoc;
  set addAddressForDoc(String value) {
    _addAddressForDoc = value;
  }

  String _addAddressForDoc2 = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc2 => _addAddressForDoc2;
  set addAddressForDoc2(String value) {
    _addAddressForDoc2 = value;
  }

  String _addAddressForDoc3 = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc3 => _addAddressForDoc3;
  set addAddressForDoc3(String value) {
    _addAddressForDoc3 = value;
  }

  bool _addAddressAtIdCardBool = false;
  bool get addAddressAtIdCardBool => _addAddressAtIdCardBool;
  set addAddressAtIdCardBool(bool value) {
    _addAddressAtIdCardBool = value;
  }

  bool _addAddressForDocBool = false;
  bool get addAddressForDocBool => _addAddressForDocBool;
  set addAddressForDocBool(bool value) {
    _addAddressForDocBool = value;
  }

  List<String> _nonePackageInsurerIdOutputList = [];
  List<String> get nonePackageInsurerIdOutputList =>
      _nonePackageInsurerIdOutputList;
  set nonePackageInsurerIdOutputList(List<String> value) {
    _nonePackageInsurerIdOutputList = value;
  }

  void addToNonePackageInsurerIdOutputList(String value) {
    nonePackageInsurerIdOutputList.add(value);
  }

  void removeFromNonePackageInsurerIdOutputList(String value) {
    nonePackageInsurerIdOutputList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerIdOutputList(int index) {
    nonePackageInsurerIdOutputList.removeAt(index);
  }

  void updateNonePackageInsurerIdOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerIdOutputList[index] =
        updateFn(_nonePackageInsurerIdOutputList[index]);
  }

  void insertAtIndexInNonePackageInsurerIdOutputList(int index, String value) {
    nonePackageInsurerIdOutputList.insert(index, value);
  }

  List<String> _nonePackageInsurerCodeOutputList = [];
  List<String> get nonePackageInsurerCodeOutputList =>
      _nonePackageInsurerCodeOutputList;
  set nonePackageInsurerCodeOutputList(List<String> value) {
    _nonePackageInsurerCodeOutputList = value;
  }

  void addToNonePackageInsurerCodeOutputList(String value) {
    nonePackageInsurerCodeOutputList.add(value);
  }

  void removeFromNonePackageInsurerCodeOutputList(String value) {
    nonePackageInsurerCodeOutputList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerCodeOutputList(int index) {
    nonePackageInsurerCodeOutputList.removeAt(index);
  }

  void updateNonePackageInsurerCodeOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerCodeOutputList[index] =
        updateFn(_nonePackageInsurerCodeOutputList[index]);
  }

  void insertAtIndexInNonePackageInsurerCodeOutputList(
      int index, String value) {
    nonePackageInsurerCodeOutputList.insert(index, value);
  }

  List<String> _nonePackageInsurerShortNameOutputList = [];
  List<String> get nonePackageInsurerShortNameOutputList =>
      _nonePackageInsurerShortNameOutputList;
  set nonePackageInsurerShortNameOutputList(List<String> value) {
    _nonePackageInsurerShortNameOutputList = value;
  }

  void addToNonePackageInsurerShortNameOutputList(String value) {
    nonePackageInsurerShortNameOutputList.add(value);
  }

  void removeFromNonePackageInsurerShortNameOutputList(String value) {
    nonePackageInsurerShortNameOutputList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameOutputList(int index) {
    nonePackageInsurerShortNameOutputList.removeAt(index);
  }

  void updateNonePackageInsurerShortNameOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerShortNameOutputList[index] =
        updateFn(_nonePackageInsurerShortNameOutputList[index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameOutputList(
      int index, String value) {
    nonePackageInsurerShortNameOutputList.insert(index, value);
  }

  List<String> _nonePackageInsurerNameOutputList = [];
  List<String> get nonePackageInsurerNameOutputList =>
      _nonePackageInsurerNameOutputList;
  set nonePackageInsurerNameOutputList(List<String> value) {
    _nonePackageInsurerNameOutputList = value;
  }

  void addToNonePackageInsurerNameOutputList(String value) {
    nonePackageInsurerNameOutputList.add(value);
  }

  void removeFromNonePackageInsurerNameOutputList(String value) {
    nonePackageInsurerNameOutputList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerNameOutputList(int index) {
    nonePackageInsurerNameOutputList.removeAt(index);
  }

  void updateNonePackageInsurerNameOutputListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerNameOutputList[index] =
        updateFn(_nonePackageInsurerNameOutputList[index]);
  }

  void insertAtIndexInNonePackageInsurerNameOutputList(
      int index, String value) {
    nonePackageInsurerNameOutputList.insert(index, value);
  }

  bool _addAddressCallAPI = false;
  bool get addAddressCallAPI => _addAddressCallAPI;
  set addAddressCallAPI(bool value) {
    _addAddressCallAPI = value;
  }

  List<String> _addAddressProvinceId = [];
  List<String> get addAddressProvinceId => _addAddressProvinceId;
  set addAddressProvinceId(List<String> value) {
    _addAddressProvinceId = value;
  }

  void addToAddAddressProvinceId(String value) {
    addAddressProvinceId.add(value);
  }

  void removeFromAddAddressProvinceId(String value) {
    addAddressProvinceId.remove(value);
  }

  void removeAtIndexFromAddAddressProvinceId(int index) {
    addAddressProvinceId.removeAt(index);
  }

  void updateAddAddressProvinceIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressProvinceId[index] = updateFn(_addAddressProvinceId[index]);
  }

  void insertAtIndexInAddAddressProvinceId(int index, String value) {
    addAddressProvinceId.insert(index, value);
  }

  List<String> _addAddressProvinceName = [];
  List<String> get addAddressProvinceName => _addAddressProvinceName;
  set addAddressProvinceName(List<String> value) {
    _addAddressProvinceName = value;
  }

  void addToAddAddressProvinceName(String value) {
    addAddressProvinceName.add(value);
  }

  void removeFromAddAddressProvinceName(String value) {
    addAddressProvinceName.remove(value);
  }

  void removeAtIndexFromAddAddressProvinceName(int index) {
    addAddressProvinceName.removeAt(index);
  }

  void updateAddAddressProvinceNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressProvinceName[index] = updateFn(_addAddressProvinceName[index]);
  }

  void insertAtIndexInAddAddressProvinceName(int index, String value) {
    addAddressProvinceName.insert(index, value);
  }

  List<String> _addAddressDistrictName = [];
  List<String> get addAddressDistrictName => _addAddressDistrictName;
  set addAddressDistrictName(List<String> value) {
    _addAddressDistrictName = value;
  }

  void addToAddAddressDistrictName(String value) {
    addAddressDistrictName.add(value);
  }

  void removeFromAddAddressDistrictName(String value) {
    addAddressDistrictName.remove(value);
  }

  void removeAtIndexFromAddAddressDistrictName(int index) {
    addAddressDistrictName.removeAt(index);
  }

  void updateAddAddressDistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressDistrictName[index] = updateFn(_addAddressDistrictName[index]);
  }

  void insertAtIndexInAddAddressDistrictName(int index, String value) {
    addAddressDistrictName.insert(index, value);
  }

  List<String> _addAddressSubdistrictName = [];
  List<String> get addAddressSubdistrictName => _addAddressSubdistrictName;
  set addAddressSubdistrictName(List<String> value) {
    _addAddressSubdistrictName = value;
  }

  void addToAddAddressSubdistrictName(String value) {
    addAddressSubdistrictName.add(value);
  }

  void removeFromAddAddressSubdistrictName(String value) {
    addAddressSubdistrictName.remove(value);
  }

  void removeAtIndexFromAddAddressSubdistrictName(int index) {
    addAddressSubdistrictName.removeAt(index);
  }

  void updateAddAddressSubdistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressSubdistrictName[index] =
        updateFn(_addAddressSubdistrictName[index]);
  }

  void insertAtIndexInAddAddressSubdistrictName(int index, String value) {
    addAddressSubdistrictName.insert(index, value);
  }

  List<String> _addAddressZipCode = [];
  List<String> get addAddressZipCode => _addAddressZipCode;
  set addAddressZipCode(List<String> value) {
    _addAddressZipCode = value;
  }

  void addToAddAddressZipCode(String value) {
    addAddressZipCode.add(value);
  }

  void removeFromAddAddressZipCode(String value) {
    addAddressZipCode.remove(value);
  }

  void removeAtIndexFromAddAddressZipCode(int index) {
    addAddressZipCode.removeAt(index);
  }

  void updateAddAddressZipCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressZipCode[index] = updateFn(_addAddressZipCode[index]);
  }

  void insertAtIndexInAddAddressZipCode(int index, String value) {
    addAddressZipCode.insert(index, value);
  }

  List<String> _addAddressKeyWord = [];
  List<String> get addAddressKeyWord => _addAddressKeyWord;
  set addAddressKeyWord(List<String> value) {
    _addAddressKeyWord = value;
  }

  void addToAddAddressKeyWord(String value) {
    addAddressKeyWord.add(value);
  }

  void removeFromAddAddressKeyWord(String value) {
    addAddressKeyWord.remove(value);
  }

  void removeAtIndexFromAddAddressKeyWord(int index) {
    addAddressKeyWord.removeAt(index);
  }

  void updateAddAddressKeyWordAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressKeyWord[index] = updateFn(_addAddressKeyWord[index]);
  }

  void insertAtIndexInAddAddressKeyWord(int index, String value) {
    addAddressKeyWord.insert(index, value);
  }

  List<int> _addAddressDistrictId = [];
  List<int> get addAddressDistrictId => _addAddressDistrictId;
  set addAddressDistrictId(List<int> value) {
    _addAddressDistrictId = value;
  }

  void addToAddAddressDistrictId(int value) {
    addAddressDistrictId.add(value);
  }

  void removeFromAddAddressDistrictId(int value) {
    addAddressDistrictId.remove(value);
  }

  void removeAtIndexFromAddAddressDistrictId(int index) {
    addAddressDistrictId.removeAt(index);
  }

  void updateAddAddressDistrictIdAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    addAddressDistrictId[index] = updateFn(_addAddressDistrictId[index]);
  }

  void insertAtIndexInAddAddressDistrictId(int index, int value) {
    addAddressDistrictId.insert(index, value);
  }

  List<int> _addAddressSubdistrictId = [];
  List<int> get addAddressSubdistrictId => _addAddressSubdistrictId;
  set addAddressSubdistrictId(List<int> value) {
    _addAddressSubdistrictId = value;
  }

  void addToAddAddressSubdistrictId(int value) {
    addAddressSubdistrictId.add(value);
  }

  void removeFromAddAddressSubdistrictId(int value) {
    addAddressSubdistrictId.remove(value);
  }

  void removeAtIndexFromAddAddressSubdistrictId(int index) {
    addAddressSubdistrictId.removeAt(index);
  }

  void updateAddAddressSubdistrictIdAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    addAddressSubdistrictId[index] = updateFn(_addAddressSubdistrictId[index]);
  }

  void insertAtIndexInAddAddressSubdistrictId(int index, int value) {
    addAddressSubdistrictId.insert(index, value);
  }

  List<bool> _nonePackageReason = [false, false, false];
  List<bool> get nonePackageReason => _nonePackageReason;
  set nonePackageReason(List<bool> value) {
    _nonePackageReason = value;
  }

  void addToNonePackageReason(bool value) {
    nonePackageReason.add(value);
  }

  void removeFromNonePackageReason(bool value) {
    nonePackageReason.remove(value);
  }

  void removeAtIndexFromNonePackageReason(int index) {
    nonePackageReason.removeAt(index);
  }

  void updateNonePackageReasonAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    nonePackageReason[index] = updateFn(_nonePackageReason[index]);
  }

  void insertAtIndexInNonePackageReason(int index, bool value) {
    nonePackageReason.insert(index, value);
  }

  String _addAddressSelectProvinceId = '';
  String get addAddressSelectProvinceId => _addAddressSelectProvinceId;
  set addAddressSelectProvinceId(String value) {
    _addAddressSelectProvinceId = value;
  }

  String _addAddressSelectProvinceName = '';
  String get addAddressSelectProvinceName => _addAddressSelectProvinceName;
  set addAddressSelectProvinceName(String value) {
    _addAddressSelectProvinceName = value;
  }

  String _addAddressSelectDistrictId = '';
  String get addAddressSelectDistrictId => _addAddressSelectDistrictId;
  set addAddressSelectDistrictId(String value) {
    _addAddressSelectDistrictId = value;
  }

  String _addAddressSelectDistrictName = '';
  String get addAddressSelectDistrictName => _addAddressSelectDistrictName;
  set addAddressSelectDistrictName(String value) {
    _addAddressSelectDistrictName = value;
  }

  String _addAddressSelectSubdistrictId = '';
  String get addAddressSelectSubdistrictId => _addAddressSelectSubdistrictId;
  set addAddressSelectSubdistrictId(String value) {
    _addAddressSelectSubdistrictId = value;
  }

  String _addAddressSelectSubdistrictName = '';
  String get addAddressSelectSubdistrictName =>
      _addAddressSelectSubdistrictName;
  set addAddressSelectSubdistrictName(String value) {
    _addAddressSelectSubdistrictName = value;
  }

  String _addAddressSelectZipCode = '';
  String get addAddressSelectZipCode => _addAddressSelectZipCode;
  set addAddressSelectZipCode(String value) {
    _addAddressSelectZipCode = value;
  }

  String _addAddressSelectKeyWord = '';
  String get addAddressSelectKeyWord => _addAddressSelectKeyWord;
  set addAddressSelectKeyWord(String value) {
    _addAddressSelectKeyWord = value;
  }

  List<bool> _nonePackageInsurerSelectedList = [];
  List<bool> get nonePackageInsurerSelectedList =>
      _nonePackageInsurerSelectedList;
  set nonePackageInsurerSelectedList(List<bool> value) {
    _nonePackageInsurerSelectedList = value;
  }

  void addToNonePackageInsurerSelectedList(bool value) {
    nonePackageInsurerSelectedList.add(value);
  }

  void removeFromNonePackageInsurerSelectedList(bool value) {
    nonePackageInsurerSelectedList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerSelectedList(int index) {
    nonePackageInsurerSelectedList.removeAt(index);
  }

  void updateNonePackageInsurerSelectedListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    nonePackageInsurerSelectedList[index] =
        updateFn(_nonePackageInsurerSelectedList[index]);
  }

  void insertAtIndexInNonePackageInsurerSelectedList(int index, bool value) {
    nonePackageInsurerSelectedList.insert(index, value);
  }

  List<String> _addAddressLicenseEmployeeId = [];
  List<String> get addAddressLicenseEmployeeId => _addAddressLicenseEmployeeId;
  set addAddressLicenseEmployeeId(List<String> value) {
    _addAddressLicenseEmployeeId = value;
  }

  void addToAddAddressLicenseEmployeeId(String value) {
    addAddressLicenseEmployeeId.add(value);
  }

  void removeFromAddAddressLicenseEmployeeId(String value) {
    addAddressLicenseEmployeeId.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseEmployeeId(int index) {
    addAddressLicenseEmployeeId.removeAt(index);
  }

  void updateAddAddressLicenseEmployeeIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseEmployeeId[index] =
        updateFn(_addAddressLicenseEmployeeId[index]);
  }

  void insertAtIndexInAddAddressLicenseEmployeeId(int index, String value) {
    addAddressLicenseEmployeeId.insert(index, value);
  }

  List<String> _addAddressLicenseTitle = [];
  List<String> get addAddressLicenseTitle => _addAddressLicenseTitle;
  set addAddressLicenseTitle(List<String> value) {
    _addAddressLicenseTitle = value;
  }

  void addToAddAddressLicenseTitle(String value) {
    addAddressLicenseTitle.add(value);
  }

  void removeFromAddAddressLicenseTitle(String value) {
    addAddressLicenseTitle.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseTitle(int index) {
    addAddressLicenseTitle.removeAt(index);
  }

  void updateAddAddressLicenseTitleAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseTitle[index] = updateFn(_addAddressLicenseTitle[index]);
  }

  void insertAtIndexInAddAddressLicenseTitle(int index, String value) {
    addAddressLicenseTitle.insert(index, value);
  }

  List<String> _addAddressLicenseFirstName = [];
  List<String> get addAddressLicenseFirstName => _addAddressLicenseFirstName;
  set addAddressLicenseFirstName(List<String> value) {
    _addAddressLicenseFirstName = value;
  }

  void addToAddAddressLicenseFirstName(String value) {
    addAddressLicenseFirstName.add(value);
  }

  void removeFromAddAddressLicenseFirstName(String value) {
    addAddressLicenseFirstName.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseFirstName(int index) {
    addAddressLicenseFirstName.removeAt(index);
  }

  void updateAddAddressLicenseFirstNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseFirstName[index] =
        updateFn(_addAddressLicenseFirstName[index]);
  }

  void insertAtIndexInAddAddressLicenseFirstName(int index, String value) {
    addAddressLicenseFirstName.insert(index, value);
  }

  List<String> _addAddressLicenseLastName = [];
  List<String> get addAddressLicenseLastName => _addAddressLicenseLastName;
  set addAddressLicenseLastName(List<String> value) {
    _addAddressLicenseLastName = value;
  }

  void addToAddAddressLicenseLastName(String value) {
    addAddressLicenseLastName.add(value);
  }

  void removeFromAddAddressLicenseLastName(String value) {
    addAddressLicenseLastName.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseLastName(int index) {
    addAddressLicenseLastName.removeAt(index);
  }

  void updateAddAddressLicenseLastNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseLastName[index] =
        updateFn(_addAddressLicenseLastName[index]);
  }

  void insertAtIndexInAddAddressLicenseLastName(int index, String value) {
    addAddressLicenseLastName.insert(index, value);
  }

  List<String> _addAddressLicenseLicenseId = [];
  List<String> get addAddressLicenseLicenseId => _addAddressLicenseLicenseId;
  set addAddressLicenseLicenseId(List<String> value) {
    _addAddressLicenseLicenseId = value;
  }

  void addToAddAddressLicenseLicenseId(String value) {
    addAddressLicenseLicenseId.add(value);
  }

  void removeFromAddAddressLicenseLicenseId(String value) {
    addAddressLicenseLicenseId.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseLicenseId(int index) {
    addAddressLicenseLicenseId.removeAt(index);
  }

  void updateAddAddressLicenseLicenseIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseLicenseId[index] =
        updateFn(_addAddressLicenseLicenseId[index]);
  }

  void insertAtIndexInAddAddressLicenseLicenseId(int index, String value) {
    addAddressLicenseLicenseId.insert(index, value);
  }

  List<String> _addAddressLicenseExpiredDate = [];
  List<String> get addAddressLicenseExpiredDate =>
      _addAddressLicenseExpiredDate;
  set addAddressLicenseExpiredDate(List<String> value) {
    _addAddressLicenseExpiredDate = value;
  }

  void addToAddAddressLicenseExpiredDate(String value) {
    addAddressLicenseExpiredDate.add(value);
  }

  void removeFromAddAddressLicenseExpiredDate(String value) {
    addAddressLicenseExpiredDate.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseExpiredDate(int index) {
    addAddressLicenseExpiredDate.removeAt(index);
  }

  void updateAddAddressLicenseExpiredDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseExpiredDate[index] =
        updateFn(_addAddressLicenseExpiredDate[index]);
  }

  void insertAtIndexInAddAddressLicenseExpiredDate(int index, String value) {
    addAddressLicenseExpiredDate.insert(index, value);
  }

  List<String> _addAddressLicenseMobilePhone = [];
  List<String> get addAddressLicenseMobilePhone =>
      _addAddressLicenseMobilePhone;
  set addAddressLicenseMobilePhone(List<String> value) {
    _addAddressLicenseMobilePhone = value;
  }

  void addToAddAddressLicenseMobilePhone(String value) {
    addAddressLicenseMobilePhone.add(value);
  }

  void removeFromAddAddressLicenseMobilePhone(String value) {
    addAddressLicenseMobilePhone.remove(value);
  }

  void removeAtIndexFromAddAddressLicenseMobilePhone(int index) {
    addAddressLicenseMobilePhone.removeAt(index);
  }

  void updateAddAddressLicenseMobilePhoneAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addAddressLicenseMobilePhone[index] =
        updateFn(_addAddressLicenseMobilePhone[index]);
  }

  void insertAtIndexInAddAddressLicenseMobilePhone(int index, String value) {
    addAddressLicenseMobilePhone.insert(index, value);
  }

  String _insuranceInfoLicenseEmployeeId = '';
  String get insuranceInfoLicenseEmployeeId => _insuranceInfoLicenseEmployeeId;
  set insuranceInfoLicenseEmployeeId(String value) {
    _insuranceInfoLicenseEmployeeId = value;
  }

  String _insuranceInfoLicenseTitle = '';
  String get insuranceInfoLicenseTitle => _insuranceInfoLicenseTitle;
  set insuranceInfoLicenseTitle(String value) {
    _insuranceInfoLicenseTitle = value;
  }

  String _insuranceInfoLicenseFirstName = '';
  String get insuranceInfoLicenseFirstName => _insuranceInfoLicenseFirstName;
  set insuranceInfoLicenseFirstName(String value) {
    _insuranceInfoLicenseFirstName = value;
  }

  String _insuranceInfoLicenseLastName = '';
  String get insuranceInfoLicenseLastName => _insuranceInfoLicenseLastName;
  set insuranceInfoLicenseLastName(String value) {
    _insuranceInfoLicenseLastName = value;
  }

  String _insuranceInfoLicenseLicenseId = '';
  String get insuranceInfoLicenseLicenseId => _insuranceInfoLicenseLicenseId;
  set insuranceInfoLicenseLicenseId(String value) {
    _insuranceInfoLicenseLicenseId = value;
  }

  String _insuranceInfoLicenseExpiredDate = '';
  String get insuranceInfoLicenseExpiredDate =>
      _insuranceInfoLicenseExpiredDate;
  set insuranceInfoLicenseExpiredDate(String value) {
    _insuranceInfoLicenseExpiredDate = value;
  }

  String _insuranceInfoLicenseMobilePhone = '';
  String get insuranceInfoLicenseMobilePhone =>
      _insuranceInfoLicenseMobilePhone;
  set insuranceInfoLicenseMobilePhone(String value) {
    _insuranceInfoLicenseMobilePhone = value;
  }

  String _insuranceInfoLicenseImg = '';
  String get insuranceInfoLicenseImg => _insuranceInfoLicenseImg;
  set insuranceInfoLicenseImg(String value) {
    _insuranceInfoLicenseImg = value;
  }

  String _nonePackageCoverTypeId = '';
  String get nonePackageCoverTypeId => _nonePackageCoverTypeId;
  set nonePackageCoverTypeId(String value) {
    _nonePackageCoverTypeId = value;
  }

  String _nonePackageCoverTypeCode = '';
  String get nonePackageCoverTypeCode => _nonePackageCoverTypeCode;
  set nonePackageCoverTypeCode(String value) {
    _nonePackageCoverTypeCode = value;
  }

  String _nonePackageCoverTypeName = 'กรุณาเลือกประเภทชั้นประกัน';
  String get nonePackageCoverTypeName => _nonePackageCoverTypeName;
  set nonePackageCoverTypeName(String value) {
    _nonePackageCoverTypeName = value;
  }

  String _nonePackageGarageTypeId = '';
  String get nonePackageGarageTypeId => _nonePackageGarageTypeId;
  set nonePackageGarageTypeId(String value) {
    _nonePackageGarageTypeId = value;
  }

  String _nonePackageGarageTypeName = 'กรุณาเลือกประเภทการซ่อม';
  String get nonePackageGarageTypeName => _nonePackageGarageTypeName;
  set nonePackageGarageTypeName(String value) {
    _nonePackageGarageTypeName = value;
  }

  String _insuranceInfoActOflLegislation = '';
  String get insuranceInfoActOflLegislation => _insuranceInfoActOflLegislation;
  set insuranceInfoActOflLegislation(String value) {
    _insuranceInfoActOflLegislation = value;
  }

  String _addAdressSelectDocProvinceId = '';
  String get addAdressSelectDocProvinceId => _addAdressSelectDocProvinceId;
  set addAdressSelectDocProvinceId(String value) {
    _addAdressSelectDocProvinceId = value;
  }

  String _addAdressSelectDocProvinceName = '';
  String get addAdressSelectDocProvinceName => _addAdressSelectDocProvinceName;
  set addAdressSelectDocProvinceName(String value) {
    _addAdressSelectDocProvinceName = value;
  }

  String _addAdressSelectDocDistrictName = '';
  String get addAdressSelectDocDistrictName => _addAdressSelectDocDistrictName;
  set addAdressSelectDocDistrictName(String value) {
    _addAdressSelectDocDistrictName = value;
  }

  String _addAddressSelectDocDistrictId = '';
  String get addAddressSelectDocDistrictId => _addAddressSelectDocDistrictId;
  set addAddressSelectDocDistrictId(String value) {
    _addAddressSelectDocDistrictId = value;
  }

  String _addAddressSelectDocSubdistrictId = '';
  String get addAddressSelectDocSubdistrictId =>
      _addAddressSelectDocSubdistrictId;
  set addAddressSelectDocSubdistrictId(String value) {
    _addAddressSelectDocSubdistrictId = value;
  }

  String _addAddressSelectDocSubdistrictName = '';
  String get addAddressSelectDocSubdistrictName =>
      _addAddressSelectDocSubdistrictName;
  set addAddressSelectDocSubdistrictName(String value) {
    _addAddressSelectDocSubdistrictName = value;
  }

  String _addAddressSelectDocZipCode = '';
  String get addAddressSelectDocZipCode => _addAddressSelectDocZipCode;
  set addAddressSelectDocZipCode(String value) {
    _addAddressSelectDocZipCode = value;
  }

  String _addAddressSelectDocKeyWord = '';
  String get addAddressSelectDocKeyWord => _addAddressSelectDocKeyWord;
  set addAddressSelectDocKeyWord(String value) {
    _addAddressSelectDocKeyWord = value;
  }

  String _nonePackageGarageTypeCode = '';
  String get nonePackageGarageTypeCode => _nonePackageGarageTypeCode;
  set nonePackageGarageTypeCode(String value) {
    _nonePackageGarageTypeCode = value;
  }

  List<String> _nonePackageGarageTypeCodeList = ['COMPANY', 'DEALER'];
  List<String> get nonePackageGarageTypeCodeList =>
      _nonePackageGarageTypeCodeList;
  set nonePackageGarageTypeCodeList(List<String> value) {
    _nonePackageGarageTypeCodeList = value;
  }

  void addToNonePackageGarageTypeCodeList(String value) {
    nonePackageGarageTypeCodeList.add(value);
  }

  void removeFromNonePackageGarageTypeCodeList(String value) {
    nonePackageGarageTypeCodeList.remove(value);
  }

  void removeAtIndexFromNonePackageGarageTypeCodeList(int index) {
    nonePackageGarageTypeCodeList.removeAt(index);
  }

  void updateNonePackageGarageTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageGarageTypeCodeList[index] =
        updateFn(_nonePackageGarageTypeCodeList[index]);
  }

  void insertAtIndexInNonePackageGarageTypeCodeList(int index, String value) {
    nonePackageGarageTypeCodeList.insert(index, value);
  }

  String _apiUrlInsuranceAppState = 'api_url_insurance';
  String get apiUrlInsuranceAppState => _apiUrlInsuranceAppState;
  set apiUrlInsuranceAppState(String value) {
    _apiUrlInsuranceAppState = value;
    secureStorage.setString('ff_apiUrlInsuranceAppState', value);
  }

  void deleteApiUrlInsuranceAppState() {
    secureStorage.delete(key: 'ff_apiUrlInsuranceAppState');
  }

  bool _nonePackageFlagRenew = false;
  bool get nonePackageFlagRenew => _nonePackageFlagRenew;
  set nonePackageFlagRenew(bool value) {
    _nonePackageFlagRenew = value;
  }

  String _nonePackageOldVmiExpDate = 'กรุณาเลือกวันที่หมดอายุประกันเดิม';
  String get nonePackageOldVmiExpDate => _nonePackageOldVmiExpDate;
  set nonePackageOldVmiExpDate(String value) {
    _nonePackageOldVmiExpDate = value;
  }

  String _nonePackageOldVmi = '';
  String get nonePackageOldVmi => _nonePackageOldVmi;
  set nonePackageOldVmi(String value) {
    _nonePackageOldVmi = value;
  }

  String _nonePackageOldVmiImageUrl = '';
  String get nonePackageOldVmiImageUrl => _nonePackageOldVmiImageUrl;
  set nonePackageOldVmiImageUrl(String value) {
    _nonePackageOldVmiImageUrl = value;
  }

  String _nonePackageIdCardImageUrl = '';
  String get nonePackageIdCardImageUrl => _nonePackageIdCardImageUrl;
  set nonePackageIdCardImageUrl(String value) {
    _nonePackageIdCardImageUrl = value;
  }

  List<String> _nonePackageRenewImageUrlList = [];
  List<String> get nonePackageRenewImageUrlList =>
      _nonePackageRenewImageUrlList;
  set nonePackageRenewImageUrlList(List<String> value) {
    _nonePackageRenewImageUrlList = value;
  }

  void addToNonePackageRenewImageUrlList(String value) {
    nonePackageRenewImageUrlList.add(value);
  }

  void removeFromNonePackageRenewImageUrlList(String value) {
    nonePackageRenewImageUrlList.remove(value);
  }

  void removeAtIndexFromNonePackageRenewImageUrlList(int index) {
    nonePackageRenewImageUrlList.removeAt(index);
  }

  void updateNonePackageRenewImageUrlListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageRenewImageUrlList[index] =
        updateFn(_nonePackageRenewImageUrlList[index]);
  }

  void insertAtIndexInNonePackageRenewImageUrlList(int index, String value) {
    nonePackageRenewImageUrlList.insert(index, value);
  }

  List<bool> _nonePackageRenewImageCheckList = [];
  List<bool> get nonePackageRenewImageCheckList =>
      _nonePackageRenewImageCheckList;
  set nonePackageRenewImageCheckList(List<bool> value) {
    _nonePackageRenewImageCheckList = value;
  }

  void addToNonePackageRenewImageCheckList(bool value) {
    nonePackageRenewImageCheckList.add(value);
  }

  void removeFromNonePackageRenewImageCheckList(bool value) {
    nonePackageRenewImageCheckList.remove(value);
  }

  void removeAtIndexFromNonePackageRenewImageCheckList(int index) {
    nonePackageRenewImageCheckList.removeAt(index);
  }

  void updateNonePackageRenewImageCheckListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    nonePackageRenewImageCheckList[index] =
        updateFn(_nonePackageRenewImageCheckList[index]);
  }

  void insertAtIndexInNonePackageRenewImageCheckList(int index, bool value) {
    nonePackageRenewImageCheckList.insert(index, value);
  }

  List<String> _insuranceInfoUploadImgOther = [];
  List<String> get insuranceInfoUploadImgOther => _insuranceInfoUploadImgOther;
  set insuranceInfoUploadImgOther(List<String> value) {
    _insuranceInfoUploadImgOther = value;
  }

  void addToInsuranceInfoUploadImgOther(String value) {
    insuranceInfoUploadImgOther.add(value);
  }

  void removeFromInsuranceInfoUploadImgOther(String value) {
    insuranceInfoUploadImgOther.remove(value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgOther(int index) {
    insuranceInfoUploadImgOther.removeAt(index);
  }

  void updateInsuranceInfoUploadImgOtherAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoUploadImgOther[index] =
        updateFn(_insuranceInfoUploadImgOther[index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgOther(int index, String value) {
    insuranceInfoUploadImgOther.insert(index, value);
  }

  bool _nonePackageOldVmiImageUploadedCheck = false;
  bool get nonePackageOldVmiImageUploadedCheck =>
      _nonePackageOldVmiImageUploadedCheck;
  set nonePackageOldVmiImageUploadedCheck(bool value) {
    _nonePackageOldVmiImageUploadedCheck = value;
  }

  bool _nonePackageIdCardWatermarkUploadedCheck = false;
  bool get nonePackageIdCardWatermarkUploadedCheck =>
      _nonePackageIdCardWatermarkUploadedCheck;
  set nonePackageIdCardWatermarkUploadedCheck(bool value) {
    _nonePackageIdCardWatermarkUploadedCheck = value;
  }

  List<bool> _insuranceInfoCheckUploadImgBoolList = [
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get insuranceInfoCheckUploadImgBoolList =>
      _insuranceInfoCheckUploadImgBoolList;
  set insuranceInfoCheckUploadImgBoolList(List<bool> value) {
    _insuranceInfoCheckUploadImgBoolList = value;
  }

  void addToInsuranceInfoCheckUploadImgBoolList(bool value) {
    insuranceInfoCheckUploadImgBoolList.add(value);
  }

  void removeFromInsuranceInfoCheckUploadImgBoolList(bool value) {
    insuranceInfoCheckUploadImgBoolList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoCheckUploadImgBoolList(int index) {
    insuranceInfoCheckUploadImgBoolList.removeAt(index);
  }

  void updateInsuranceInfoCheckUploadImgBoolListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    insuranceInfoCheckUploadImgBoolList[index] =
        updateFn(_insuranceInfoCheckUploadImgBoolList[index]);
  }

  void insertAtIndexInInsuranceInfoCheckUploadImgBoolList(
      int index, bool value) {
    insuranceInfoCheckUploadImgBoolList.insert(index, value);
  }

  List<String> _insuranceInfoUploadImgAccessory = [];
  List<String> get insuranceInfoUploadImgAccessory =>
      _insuranceInfoUploadImgAccessory;
  set insuranceInfoUploadImgAccessory(List<String> value) {
    _insuranceInfoUploadImgAccessory = value;
  }

  void addToInsuranceInfoUploadImgAccessory(String value) {
    insuranceInfoUploadImgAccessory.add(value);
  }

  void removeFromInsuranceInfoUploadImgAccessory(String value) {
    insuranceInfoUploadImgAccessory.remove(value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgAccessory(int index) {
    insuranceInfoUploadImgAccessory.removeAt(index);
  }

  void updateInsuranceInfoUploadImgAccessoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoUploadImgAccessory[index] =
        updateFn(_insuranceInfoUploadImgAccessory[index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgAccessory(int index, String value) {
    insuranceInfoUploadImgAccessory.insert(index, value);
  }

  List<String> _insuranceInfoUploadImgScar = [];
  List<String> get insuranceInfoUploadImgScar => _insuranceInfoUploadImgScar;
  set insuranceInfoUploadImgScar(List<String> value) {
    _insuranceInfoUploadImgScar = value;
  }

  void addToInsuranceInfoUploadImgScar(String value) {
    insuranceInfoUploadImgScar.add(value);
  }

  void removeFromInsuranceInfoUploadImgScar(String value) {
    insuranceInfoUploadImgScar.remove(value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgScar(int index) {
    insuranceInfoUploadImgScar.removeAt(index);
  }

  void updateInsuranceInfoUploadImgScarAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoUploadImgScar[index] =
        updateFn(_insuranceInfoUploadImgScar[index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgScar(int index, String value) {
    insuranceInfoUploadImgScar.insert(index, value);
  }

  List<bool> _searchPackageCheckFilled = [false, false, false, false, false];
  List<bool> get searchPackageCheckFilled => _searchPackageCheckFilled;
  set searchPackageCheckFilled(List<bool> value) {
    _searchPackageCheckFilled = value;
  }

  void addToSearchPackageCheckFilled(bool value) {
    searchPackageCheckFilled.add(value);
  }

  void removeFromSearchPackageCheckFilled(bool value) {
    searchPackageCheckFilled.remove(value);
  }

  void removeAtIndexFromSearchPackageCheckFilled(int index) {
    searchPackageCheckFilled.removeAt(index);
  }

  void updateSearchPackageCheckFilledAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    searchPackageCheckFilled[index] =
        updateFn(_searchPackageCheckFilled[index]);
  }

  void insertAtIndexInSearchPackageCheckFilled(int index, bool value) {
    searchPackageCheckFilled.insert(index, value);
  }

  List<String> _nonePackageUsedTypeIdList = [];
  List<String> get nonePackageUsedTypeIdList => _nonePackageUsedTypeIdList;
  set nonePackageUsedTypeIdList(List<String> value) {
    _nonePackageUsedTypeIdList = value;
  }

  void addToNonePackageUsedTypeIdList(String value) {
    nonePackageUsedTypeIdList.add(value);
  }

  void removeFromNonePackageUsedTypeIdList(String value) {
    nonePackageUsedTypeIdList.remove(value);
  }

  void removeAtIndexFromNonePackageUsedTypeIdList(int index) {
    nonePackageUsedTypeIdList.removeAt(index);
  }

  void updateNonePackageUsedTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageUsedTypeIdList[index] =
        updateFn(_nonePackageUsedTypeIdList[index]);
  }

  void insertAtIndexInNonePackageUsedTypeIdList(int index, String value) {
    nonePackageUsedTypeIdList.insert(index, value);
  }

  List<String> _nonePackageUsedTypeCodeList = [];
  List<String> get nonePackageUsedTypeCodeList => _nonePackageUsedTypeCodeList;
  set nonePackageUsedTypeCodeList(List<String> value) {
    _nonePackageUsedTypeCodeList = value;
  }

  void addToNonePackageUsedTypeCodeList(String value) {
    nonePackageUsedTypeCodeList.add(value);
  }

  void removeFromNonePackageUsedTypeCodeList(String value) {
    nonePackageUsedTypeCodeList.remove(value);
  }

  void removeAtIndexFromNonePackageUsedTypeCodeList(int index) {
    nonePackageUsedTypeCodeList.removeAt(index);
  }

  void updateNonePackageUsedTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageUsedTypeCodeList[index] =
        updateFn(_nonePackageUsedTypeCodeList[index]);
  }

  void insertAtIndexInNonePackageUsedTypeCodeList(int index, String value) {
    nonePackageUsedTypeCodeList.insert(index, value);
  }

  List<String> _nonePackageUsedTypeNameList = [];
  List<String> get nonePackageUsedTypeNameList => _nonePackageUsedTypeNameList;
  set nonePackageUsedTypeNameList(List<String> value) {
    _nonePackageUsedTypeNameList = value;
  }

  void addToNonePackageUsedTypeNameList(String value) {
    nonePackageUsedTypeNameList.add(value);
  }

  void removeFromNonePackageUsedTypeNameList(String value) {
    nonePackageUsedTypeNameList.remove(value);
  }

  void removeAtIndexFromNonePackageUsedTypeNameList(int index) {
    nonePackageUsedTypeNameList.removeAt(index);
  }

  void updateNonePackageUsedTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageUsedTypeNameList[index] =
        updateFn(_nonePackageUsedTypeNameList[index]);
  }

  void insertAtIndexInNonePackageUsedTypeNameList(int index, String value) {
    nonePackageUsedTypeNameList.insert(index, value);
  }

  List<String> _nonePackageUsedTypeTypeList = [];
  List<String> get nonePackageUsedTypeTypeList => _nonePackageUsedTypeTypeList;
  set nonePackageUsedTypeTypeList(List<String> value) {
    _nonePackageUsedTypeTypeList = value;
  }

  void addToNonePackageUsedTypeTypeList(String value) {
    nonePackageUsedTypeTypeList.add(value);
  }

  void removeFromNonePackageUsedTypeTypeList(String value) {
    nonePackageUsedTypeTypeList.remove(value);
  }

  void removeAtIndexFromNonePackageUsedTypeTypeList(int index) {
    nonePackageUsedTypeTypeList.removeAt(index);
  }

  void updateNonePackageUsedTypeTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageUsedTypeTypeList[index] =
        updateFn(_nonePackageUsedTypeTypeList[index]);
  }

  void insertAtIndexInNonePackageUsedTypeTypeList(int index, String value) {
    nonePackageUsedTypeTypeList.insert(index, value);
  }

  bool _nonePackageIsLoadedData = false;
  bool get nonePackageIsLoadedData => _nonePackageIsLoadedData;
  set nonePackageIsLoadedData(bool value) {
    _nonePackageIsLoadedData = value;
  }

  List<String> _searchPackageId = [];
  List<String> get searchPackageId => _searchPackageId;
  set searchPackageId(List<String> value) {
    _searchPackageId = value;
  }

  void addToSearchPackageId(String value) {
    searchPackageId.add(value);
  }

  void removeFromSearchPackageId(String value) {
    searchPackageId.remove(value);
  }

  void removeAtIndexFromSearchPackageId(int index) {
    searchPackageId.removeAt(index);
  }

  void updateSearchPackageIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchPackageId[index] = updateFn(_searchPackageId[index]);
  }

  void insertAtIndexInSearchPackageId(int index, String value) {
    searchPackageId.insert(index, value);
  }

  List<String> _serachPackageName = [];
  List<String> get serachPackageName => _serachPackageName;
  set serachPackageName(List<String> value) {
    _serachPackageName = value;
  }

  void addToSerachPackageName(String value) {
    serachPackageName.add(value);
  }

  void removeFromSerachPackageName(String value) {
    serachPackageName.remove(value);
  }

  void removeAtIndexFromSerachPackageName(int index) {
    serachPackageName.removeAt(index);
  }

  void updateSerachPackageNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    serachPackageName[index] = updateFn(_serachPackageName[index]);
  }

  void insertAtIndexInSerachPackageName(int index, String value) {
    serachPackageName.insert(index, value);
  }

  List<String> _searchStamp = [];
  List<String> get searchStamp => _searchStamp;
  set searchStamp(List<String> value) {
    _searchStamp = value;
  }

  void addToSearchStamp(String value) {
    searchStamp.add(value);
  }

  void removeFromSearchStamp(String value) {
    searchStamp.remove(value);
  }

  void removeAtIndexFromSearchStamp(int index) {
    searchStamp.removeAt(index);
  }

  void updateSearchStampAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchStamp[index] = updateFn(_searchStamp[index]);
  }

  void insertAtIndexInSearchStamp(int index, String value) {
    searchStamp.insert(index, value);
  }

  List<String> _searchVat = [];
  List<String> get searchVat => _searchVat;
  set searchVat(List<String> value) {
    _searchVat = value;
  }

  void addToSearchVat(String value) {
    searchVat.add(value);
  }

  void removeFromSearchVat(String value) {
    searchVat.remove(value);
  }

  void removeAtIndexFromSearchVat(int index) {
    searchVat.removeAt(index);
  }

  void updateSearchVatAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchVat[index] = updateFn(_searchVat[index]);
  }

  void insertAtIndexInSearchVat(int index, String value) {
    searchVat.insert(index, value);
  }

  List<String> _searchNetPremium = [];
  List<String> get searchNetPremium => _searchNetPremium;
  set searchNetPremium(List<String> value) {
    _searchNetPremium = value;
  }

  void addToSearchNetPremium(String value) {
    searchNetPremium.add(value);
  }

  void removeFromSearchNetPremium(String value) {
    searchNetPremium.remove(value);
  }

  void removeAtIndexFromSearchNetPremium(int index) {
    searchNetPremium.removeAt(index);
  }

  void updateSearchNetPremiumAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchNetPremium[index] = updateFn(_searchNetPremium[index]);
  }

  void insertAtIndexInSearchNetPremium(int index, String value) {
    searchNetPremium.insert(index, value);
  }

  List<String> _searchSeat = [];
  List<String> get searchSeat => _searchSeat;
  set searchSeat(List<String> value) {
    _searchSeat = value;
  }

  void addToSearchSeat(String value) {
    searchSeat.add(value);
  }

  void removeFromSearchSeat(String value) {
    searchSeat.remove(value);
  }

  void removeAtIndexFromSearchSeat(int index) {
    searchSeat.removeAt(index);
  }

  void updateSearchSeatAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchSeat[index] = updateFn(_searchSeat[index]);
  }

  void insertAtIndexInSearchSeat(int index, String value) {
    searchSeat.insert(index, value);
  }

  List<String> _searchRoadsideAssistance = [];
  List<String> get searchRoadsideAssistance => _searchRoadsideAssistance;
  set searchRoadsideAssistance(List<String> value) {
    _searchRoadsideAssistance = value;
  }

  void addToSearchRoadsideAssistance(String value) {
    searchRoadsideAssistance.add(value);
  }

  void removeFromSearchRoadsideAssistance(String value) {
    searchRoadsideAssistance.remove(value);
  }

  void removeAtIndexFromSearchRoadsideAssistance(int index) {
    searchRoadsideAssistance.removeAt(index);
  }

  void updateSearchRoadsideAssistanceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchRoadsideAssistance[index] =
        updateFn(_searchRoadsideAssistance[index]);
  }

  void insertAtIndexInSearchRoadsideAssistance(int index, String value) {
    searchRoadsideAssistance.insert(index, value);
  }

  List<String> _searchbb = [];
  List<String> get searchbb => _searchbb;
  set searchbb(List<String> value) {
    _searchbb = value;
  }

  void addToSearchbb(String value) {
    searchbb.add(value);
  }

  void removeFromSearchbb(String value) {
    searchbb.remove(value);
  }

  void removeAtIndexFromSearchbb(int index) {
    searchbb.removeAt(index);
  }

  void updateSearchbbAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchbb[index] = updateFn(_searchbb[index]);
  }

  void insertAtIndexInSearchbb(int index, String value) {
    searchbb.insert(index, value);
  }

  List<String> _searchme = [];
  List<String> get searchme => _searchme;
  set searchme(List<String> value) {
    _searchme = value;
  }

  void addToSearchme(String value) {
    searchme.add(value);
  }

  void removeFromSearchme(String value) {
    searchme.remove(value);
  }

  void removeAtIndexFromSearchme(int index) {
    searchme.removeAt(index);
  }

  void updateSearchmeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchme[index] = updateFn(_searchme[index]);
  }

  void insertAtIndexInSearchme(int index, String value) {
    searchme.insert(index, value);
  }

  List<String> _searchFlood = [];
  List<String> get searchFlood => _searchFlood;
  set searchFlood(List<String> value) {
    _searchFlood = value;
  }

  void addToSearchFlood(String value) {
    searchFlood.add(value);
  }

  void removeFromSearchFlood(String value) {
    searchFlood.remove(value);
  }

  void removeAtIndexFromSearchFlood(int index) {
    searchFlood.removeAt(index);
  }

  void updateSearchFloodAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchFlood[index] = updateFn(_searchFlood[index]);
  }

  void insertAtIndexInSearchFlood(int index, String value) {
    searchFlood.insert(index, value);
  }

  List<String> _searchDeductible = [];
  List<String> get searchDeductible => _searchDeductible;
  set searchDeductible(List<String> value) {
    _searchDeductible = value;
  }

  void addToSearchDeductible(String value) {
    searchDeductible.add(value);
  }

  void removeFromSearchDeductible(String value) {
    searchDeductible.remove(value);
  }

  void removeAtIndexFromSearchDeductible(int index) {
    searchDeductible.removeAt(index);
  }

  void updateSearchDeductibleAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchDeductible[index] = updateFn(_searchDeductible[index]);
  }

  void insertAtIndexInSearchDeductible(int index, String value) {
    searchDeductible.insert(index, value);
  }

  List<String> _searchContractProcessstate = [];
  List<String> get searchContractProcessstate => _searchContractProcessstate;
  set searchContractProcessstate(List<String> value) {
    _searchContractProcessstate = value;
  }

  void addToSearchContractProcessstate(String value) {
    searchContractProcessstate.add(value);
  }

  void removeFromSearchContractProcessstate(String value) {
    searchContractProcessstate.remove(value);
  }

  void removeAtIndexFromSearchContractProcessstate(int index) {
    searchContractProcessstate.removeAt(index);
  }

  void updateSearchContractProcessstateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchContractProcessstate[index] =
        updateFn(_searchContractProcessstate[index]);
  }

  void insertAtIndexInSearchContractProcessstate(int index, String value) {
    searchContractProcessstate.insert(index, value);
  }

  List<int> _searchId = [];
  List<int> get searchId => _searchId;
  set searchId(List<int> value) {
    _searchId = value;
  }

  void addToSearchId(int value) {
    searchId.add(value);
  }

  void removeFromSearchId(int value) {
    searchId.remove(value);
  }

  void removeAtIndexFromSearchId(int index) {
    searchId.removeAt(index);
  }

  void updateSearchIdAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    searchId[index] = updateFn(_searchId[index]);
  }

  void insertAtIndexInSearchId(int index, int value) {
    searchId.insert(index, value);
  }

  String _nonePackageCustomerType = '';
  String get nonePackageCustomerType => _nonePackageCustomerType;
  set nonePackageCustomerType(String value) {
    _nonePackageCustomerType = value;
  }

  List<String> _insuranceInfoFinance = [];
  List<String> get insuranceInfoFinance => _insuranceInfoFinance;
  set insuranceInfoFinance(List<String> value) {
    _insuranceInfoFinance = value;
  }

  void addToInsuranceInfoFinance(String value) {
    insuranceInfoFinance.add(value);
  }

  void removeFromInsuranceInfoFinance(String value) {
    insuranceInfoFinance.remove(value);
  }

  void removeAtIndexFromInsuranceInfoFinance(int index) {
    insuranceInfoFinance.removeAt(index);
  }

  void updateInsuranceInfoFinanceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoFinance[index] = updateFn(_insuranceInfoFinance[index]);
  }

  void insertAtIndexInInsuranceInfoFinance(int index, String value) {
    insuranceInfoFinance.insert(index, value);
  }

  String _insuranceInfoBeneficiaryName = '';
  String get insuranceInfoBeneficiaryName => _insuranceInfoBeneficiaryName;
  set insuranceInfoBeneficiaryName(String value) {
    _insuranceInfoBeneficiaryName = value;
  }

  String _nonePackageInsurerDisplayNameOutput = '';
  String get nonePackageInsurerDisplayNameOutput =>
      _nonePackageInsurerDisplayNameOutput;
  set nonePackageInsurerDisplayNameOutput(String value) {
    _nonePackageInsurerDisplayNameOutput = value;
  }

  List<dynamic> _nonePackageImageOther = [];
  List<dynamic> get nonePackageImageOther => _nonePackageImageOther;
  set nonePackageImageOther(List<dynamic> value) {
    _nonePackageImageOther = value;
  }

  void addToNonePackageImageOther(dynamic value) {
    nonePackageImageOther.add(value);
  }

  void removeFromNonePackageImageOther(dynamic value) {
    nonePackageImageOther.remove(value);
  }

  void removeAtIndexFromNonePackageImageOther(int index) {
    nonePackageImageOther.removeAt(index);
  }

  void updateNonePackageImageOtherAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    nonePackageImageOther[index] = updateFn(_nonePackageImageOther[index]);
  }

  void insertAtIndexInNonePackageImageOther(int index, dynamic value) {
    nonePackageImageOther.insert(index, value);
  }

  List<String> _nonePackageImageFront = [];
  List<String> get nonePackageImageFront => _nonePackageImageFront;
  set nonePackageImageFront(List<String> value) {
    _nonePackageImageFront = value;
  }

  void addToNonePackageImageFront(String value) {
    nonePackageImageFront.add(value);
  }

  void removeFromNonePackageImageFront(String value) {
    nonePackageImageFront.remove(value);
  }

  void removeAtIndexFromNonePackageImageFront(int index) {
    nonePackageImageFront.removeAt(index);
  }

  void updateNonePackageImageFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageFront[index] = updateFn(_nonePackageImageFront[index]);
  }

  void insertAtIndexInNonePackageImageFront(int index, String value) {
    nonePackageImageFront.insert(index, value);
  }

  List<String> _nonePackageImageRightFront = [];
  List<String> get nonePackageImageRightFront => _nonePackageImageRightFront;
  set nonePackageImageRightFront(List<String> value) {
    _nonePackageImageRightFront = value;
  }

  void addToNonePackageImageRightFront(String value) {
    nonePackageImageRightFront.add(value);
  }

  void removeFromNonePackageImageRightFront(String value) {
    nonePackageImageRightFront.remove(value);
  }

  void removeAtIndexFromNonePackageImageRightFront(int index) {
    nonePackageImageRightFront.removeAt(index);
  }

  void updateNonePackageImageRightFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageRightFront[index] =
        updateFn(_nonePackageImageRightFront[index]);
  }

  void insertAtIndexInNonePackageImageRightFront(int index, String value) {
    nonePackageImageRightFront.insert(index, value);
  }

  List<String> _nonePackageImageRight = [];
  List<String> get nonePackageImageRight => _nonePackageImageRight;
  set nonePackageImageRight(List<String> value) {
    _nonePackageImageRight = value;
  }

  void addToNonePackageImageRight(String value) {
    nonePackageImageRight.add(value);
  }

  void removeFromNonePackageImageRight(String value) {
    nonePackageImageRight.remove(value);
  }

  void removeAtIndexFromNonePackageImageRight(int index) {
    nonePackageImageRight.removeAt(index);
  }

  void updateNonePackageImageRightAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageRight[index] = updateFn(_nonePackageImageRight[index]);
  }

  void insertAtIndexInNonePackageImageRight(int index, String value) {
    nonePackageImageRight.insert(index, value);
  }

  List<String> _nonePackageImageRightRear = [];
  List<String> get nonePackageImageRightRear => _nonePackageImageRightRear;
  set nonePackageImageRightRear(List<String> value) {
    _nonePackageImageRightRear = value;
  }

  void addToNonePackageImageRightRear(String value) {
    nonePackageImageRightRear.add(value);
  }

  void removeFromNonePackageImageRightRear(String value) {
    nonePackageImageRightRear.remove(value);
  }

  void removeAtIndexFromNonePackageImageRightRear(int index) {
    nonePackageImageRightRear.removeAt(index);
  }

  void updateNonePackageImageRightRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageRightRear[index] =
        updateFn(_nonePackageImageRightRear[index]);
  }

  void insertAtIndexInNonePackageImageRightRear(int index, String value) {
    nonePackageImageRightRear.insert(index, value);
  }

  List<String> _nonePackageImageRear = [];
  List<String> get nonePackageImageRear => _nonePackageImageRear;
  set nonePackageImageRear(List<String> value) {
    _nonePackageImageRear = value;
  }

  void addToNonePackageImageRear(String value) {
    nonePackageImageRear.add(value);
  }

  void removeFromNonePackageImageRear(String value) {
    nonePackageImageRear.remove(value);
  }

  void removeAtIndexFromNonePackageImageRear(int index) {
    nonePackageImageRear.removeAt(index);
  }

  void updateNonePackageImageRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageRear[index] = updateFn(_nonePackageImageRear[index]);
  }

  void insertAtIndexInNonePackageImageRear(int index, String value) {
    nonePackageImageRear.insert(index, value);
  }

  List<String> _nonePackageImageLeftRear = [];
  List<String> get nonePackageImageLeftRear => _nonePackageImageLeftRear;
  set nonePackageImageLeftRear(List<String> value) {
    _nonePackageImageLeftRear = value;
  }

  void addToNonePackageImageLeftRear(String value) {
    nonePackageImageLeftRear.add(value);
  }

  void removeFromNonePackageImageLeftRear(String value) {
    nonePackageImageLeftRear.remove(value);
  }

  void removeAtIndexFromNonePackageImageLeftRear(int index) {
    nonePackageImageLeftRear.removeAt(index);
  }

  void updateNonePackageImageLeftRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageLeftRear[index] =
        updateFn(_nonePackageImageLeftRear[index]);
  }

  void insertAtIndexInNonePackageImageLeftRear(int index, String value) {
    nonePackageImageLeftRear.insert(index, value);
  }

  List<String> _nonePackageImageLeft = [];
  List<String> get nonePackageImageLeft => _nonePackageImageLeft;
  set nonePackageImageLeft(List<String> value) {
    _nonePackageImageLeft = value;
  }

  void addToNonePackageImageLeft(String value) {
    nonePackageImageLeft.add(value);
  }

  void removeFromNonePackageImageLeft(String value) {
    nonePackageImageLeft.remove(value);
  }

  void removeAtIndexFromNonePackageImageLeft(int index) {
    nonePackageImageLeft.removeAt(index);
  }

  void updateNonePackageImageLeftAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageLeft[index] = updateFn(_nonePackageImageLeft[index]);
  }

  void insertAtIndexInNonePackageImageLeft(int index, String value) {
    nonePackageImageLeft.insert(index, value);
  }

  List<String> _nonePackageImageLeftFront = [];
  List<String> get nonePackageImageLeftFront => _nonePackageImageLeftFront;
  set nonePackageImageLeftFront(List<String> value) {
    _nonePackageImageLeftFront = value;
  }

  void addToNonePackageImageLeftFront(String value) {
    nonePackageImageLeftFront.add(value);
  }

  void removeFromNonePackageImageLeftFront(String value) {
    nonePackageImageLeftFront.remove(value);
  }

  void removeAtIndexFromNonePackageImageLeftFront(int index) {
    nonePackageImageLeftFront.removeAt(index);
  }

  void updateNonePackageImageLeftFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageLeftFront[index] =
        updateFn(_nonePackageImageLeftFront[index]);
  }

  void insertAtIndexInNonePackageImageLeftFront(int index, String value) {
    nonePackageImageLeftFront.insert(index, value);
  }

  List<String> _nonePackageImageRoof = [];
  List<String> get nonePackageImageRoof => _nonePackageImageRoof;
  set nonePackageImageRoof(List<String> value) {
    _nonePackageImageRoof = value;
  }

  void addToNonePackageImageRoof(String value) {
    nonePackageImageRoof.add(value);
  }

  void removeFromNonePackageImageRoof(String value) {
    nonePackageImageRoof.remove(value);
  }

  void removeAtIndexFromNonePackageImageRoof(int index) {
    nonePackageImageRoof.removeAt(index);
  }

  void updateNonePackageImageRoofAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageRoof[index] = updateFn(_nonePackageImageRoof[index]);
  }

  void insertAtIndexInNonePackageImageRoof(int index, String value) {
    nonePackageImageRoof.insert(index, value);
  }

  List<String> _nonePackageTrailerImageFront = [];
  List<String> get nonePackageTrailerImageFront =>
      _nonePackageTrailerImageFront;
  set nonePackageTrailerImageFront(List<String> value) {
    _nonePackageTrailerImageFront = value;
  }

  void addToNonePackageTrailerImageFront(String value) {
    nonePackageTrailerImageFront.add(value);
  }

  void removeFromNonePackageTrailerImageFront(String value) {
    nonePackageTrailerImageFront.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageFront(int index) {
    nonePackageTrailerImageFront.removeAt(index);
  }

  void updateNonePackageTrailerImageFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageFront[index] =
        updateFn(_nonePackageTrailerImageFront[index]);
  }

  void insertAtIndexInNonePackageTrailerImageFront(int index, String value) {
    nonePackageTrailerImageFront.insert(index, value);
  }

  List<String> _nonePackageTrailerImageRightFront = [];
  List<String> get nonePackageTrailerImageRightFront =>
      _nonePackageTrailerImageRightFront;
  set nonePackageTrailerImageRightFront(List<String> value) {
    _nonePackageTrailerImageRightFront = value;
  }

  void addToNonePackageTrailerImageRightFront(String value) {
    nonePackageTrailerImageRightFront.add(value);
  }

  void removeFromNonePackageTrailerImageRightFront(String value) {
    nonePackageTrailerImageRightFront.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageRightFront(int index) {
    nonePackageTrailerImageRightFront.removeAt(index);
  }

  void updateNonePackageTrailerImageRightFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageRightFront[index] =
        updateFn(_nonePackageTrailerImageRightFront[index]);
  }

  void insertAtIndexInNonePackageTrailerImageRightFront(
      int index, String value) {
    nonePackageTrailerImageRightFront.insert(index, value);
  }

  List<String> _nonePackageTrailerImageRight = [];
  List<String> get nonePackageTrailerImageRight =>
      _nonePackageTrailerImageRight;
  set nonePackageTrailerImageRight(List<String> value) {
    _nonePackageTrailerImageRight = value;
  }

  void addToNonePackageTrailerImageRight(String value) {
    nonePackageTrailerImageRight.add(value);
  }

  void removeFromNonePackageTrailerImageRight(String value) {
    nonePackageTrailerImageRight.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageRight(int index) {
    nonePackageTrailerImageRight.removeAt(index);
  }

  void updateNonePackageTrailerImageRightAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageRight[index] =
        updateFn(_nonePackageTrailerImageRight[index]);
  }

  void insertAtIndexInNonePackageTrailerImageRight(int index, String value) {
    nonePackageTrailerImageRight.insert(index, value);
  }

  List<String> _nonePackageTrailerImageRightRear = [];
  List<String> get nonePackageTrailerImageRightRear =>
      _nonePackageTrailerImageRightRear;
  set nonePackageTrailerImageRightRear(List<String> value) {
    _nonePackageTrailerImageRightRear = value;
  }

  void addToNonePackageTrailerImageRightRear(String value) {
    nonePackageTrailerImageRightRear.add(value);
  }

  void removeFromNonePackageTrailerImageRightRear(String value) {
    nonePackageTrailerImageRightRear.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageRightRear(int index) {
    nonePackageTrailerImageRightRear.removeAt(index);
  }

  void updateNonePackageTrailerImageRightRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageRightRear[index] =
        updateFn(_nonePackageTrailerImageRightRear[index]);
  }

  void insertAtIndexInNonePackageTrailerImageRightRear(
      int index, String value) {
    nonePackageTrailerImageRightRear.insert(index, value);
  }

  List<String> _nonePackageTrailerImageRear = [];
  List<String> get nonePackageTrailerImageRear => _nonePackageTrailerImageRear;
  set nonePackageTrailerImageRear(List<String> value) {
    _nonePackageTrailerImageRear = value;
  }

  void addToNonePackageTrailerImageRear(String value) {
    nonePackageTrailerImageRear.add(value);
  }

  void removeFromNonePackageTrailerImageRear(String value) {
    nonePackageTrailerImageRear.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageRear(int index) {
    nonePackageTrailerImageRear.removeAt(index);
  }

  void updateNonePackageTrailerImageRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageRear[index] =
        updateFn(_nonePackageTrailerImageRear[index]);
  }

  void insertAtIndexInNonePackageTrailerImageRear(int index, String value) {
    nonePackageTrailerImageRear.insert(index, value);
  }

  List<String> _nonePackageTrailerImageLeftRear = [];
  List<String> get nonePackageTrailerImageLeftRear =>
      _nonePackageTrailerImageLeftRear;
  set nonePackageTrailerImageLeftRear(List<String> value) {
    _nonePackageTrailerImageLeftRear = value;
  }

  void addToNonePackageTrailerImageLeftRear(String value) {
    nonePackageTrailerImageLeftRear.add(value);
  }

  void removeFromNonePackageTrailerImageLeftRear(String value) {
    nonePackageTrailerImageLeftRear.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeftRear(int index) {
    nonePackageTrailerImageLeftRear.removeAt(index);
  }

  void updateNonePackageTrailerImageLeftRearAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageLeftRear[index] =
        updateFn(_nonePackageTrailerImageLeftRear[index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeftRear(int index, String value) {
    nonePackageTrailerImageLeftRear.insert(index, value);
  }

  List<String> _nonePackageTrailerImageLeft = [];
  List<String> get nonePackageTrailerImageLeft => _nonePackageTrailerImageLeft;
  set nonePackageTrailerImageLeft(List<String> value) {
    _nonePackageTrailerImageLeft = value;
  }

  void addToNonePackageTrailerImageLeft(String value) {
    nonePackageTrailerImageLeft.add(value);
  }

  void removeFromNonePackageTrailerImageLeft(String value) {
    nonePackageTrailerImageLeft.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeft(int index) {
    nonePackageTrailerImageLeft.removeAt(index);
  }

  void updateNonePackageTrailerImageLeftAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageLeft[index] =
        updateFn(_nonePackageTrailerImageLeft[index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeft(int index, String value) {
    nonePackageTrailerImageLeft.insert(index, value);
  }

  List<String> _nonePackageTrailerImageLeftFront = [];
  List<String> get nonePackageTrailerImageLeftFront =>
      _nonePackageTrailerImageLeftFront;
  set nonePackageTrailerImageLeftFront(List<String> value) {
    _nonePackageTrailerImageLeftFront = value;
  }

  void addToNonePackageTrailerImageLeftFront(String value) {
    nonePackageTrailerImageLeftFront.add(value);
  }

  void removeFromNonePackageTrailerImageLeftFront(String value) {
    nonePackageTrailerImageLeftFront.remove(value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeftFront(int index) {
    nonePackageTrailerImageLeftFront.removeAt(index);
  }

  void updateNonePackageTrailerImageLeftFrontAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageTrailerImageLeftFront[index] =
        updateFn(_nonePackageTrailerImageLeftFront[index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeftFront(
      int index, String value) {
    nonePackageTrailerImageLeftFront.insert(index, value);
  }

  List<String> _insuranceInfoAddressType = ['REGISTER', 'CURRENT'];
  List<String> get insuranceInfoAddressType => _insuranceInfoAddressType;
  set insuranceInfoAddressType(List<String> value) {
    _insuranceInfoAddressType = value;
  }

  void addToInsuranceInfoAddressType(String value) {
    insuranceInfoAddressType.add(value);
  }

  void removeFromInsuranceInfoAddressType(String value) {
    insuranceInfoAddressType.remove(value);
  }

  void removeAtIndexFromInsuranceInfoAddressType(int index) {
    insuranceInfoAddressType.removeAt(index);
  }

  void updateInsuranceInfoAddressTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoAddressType[index] =
        updateFn(_insuranceInfoAddressType[index]);
  }

  void insertAtIndexInInsuranceInfoAddressType(int index, String value) {
    insuranceInfoAddressType.insert(index, value);
  }

  int _nonePackageInsurerOutputIndex = 0;
  int get nonePackageInsurerOutputIndex => _nonePackageInsurerOutputIndex;
  set nonePackageInsurerOutputIndex(int value) {
    _nonePackageInsurerOutputIndex = value;
  }

  String _nonePackageLeadId = '';
  String get nonePackageLeadId => _nonePackageLeadId;
  set nonePackageLeadId(String value) {
    _nonePackageLeadId = value;
  }

  String _nonePackageLeadNo = '';
  String get nonePackageLeadNo => _nonePackageLeadNo;
  set nonePackageLeadNo(String value) {
    _nonePackageLeadNo = value;
  }

  bool _insuranceInfoHaveLicenseBool = false;
  bool get insuranceInfoHaveLicenseBool => _insuranceInfoHaveLicenseBool;
  set insuranceInfoHaveLicenseBool(bool value) {
    _insuranceInfoHaveLicenseBool = value;
  }

  List<String> _nonePackageCarImageUploadedList = [];
  List<String> get nonePackageCarImageUploadedList =>
      _nonePackageCarImageUploadedList;
  set nonePackageCarImageUploadedList(List<String> value) {
    _nonePackageCarImageUploadedList = value;
  }

  void addToNonePackageCarImageUploadedList(String value) {
    nonePackageCarImageUploadedList.add(value);
  }

  void removeFromNonePackageCarImageUploadedList(String value) {
    nonePackageCarImageUploadedList.remove(value);
  }

  void removeAtIndexFromNonePackageCarImageUploadedList(int index) {
    nonePackageCarImageUploadedList.removeAt(index);
  }

  void updateNonePackageCarImageUploadedListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageCarImageUploadedList[index] =
        updateFn(_nonePackageCarImageUploadedList[index]);
  }

  void insertAtIndexInNonePackageCarImageUploadedList(int index, String value) {
    nonePackageCarImageUploadedList.insert(index, value);
  }

  String _searchQuotationStatus = '';
  String get searchQuotationStatus => _searchQuotationStatus;
  set searchQuotationStatus(String value) {
    _searchQuotationStatus = value;
  }

  List<String> _nonePackageImageOldVmi = [];
  List<String> get nonePackageImageOldVmi => _nonePackageImageOldVmi;
  set nonePackageImageOldVmi(List<String> value) {
    _nonePackageImageOldVmi = value;
  }

  void addToNonePackageImageOldVmi(String value) {
    nonePackageImageOldVmi.add(value);
  }

  void removeFromNonePackageImageOldVmi(String value) {
    nonePackageImageOldVmi.remove(value);
  }

  void removeAtIndexFromNonePackageImageOldVmi(int index) {
    nonePackageImageOldVmi.removeAt(index);
  }

  void updateNonePackageImageOldVmiAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageOldVmi[index] = updateFn(_nonePackageImageOldVmi[index]);
  }

  void insertAtIndexInNonePackageImageOldVmi(int index, String value) {
    nonePackageImageOldVmi.insert(index, value);
  }

  List<String> _nonePackageImageCompanyBook = [];
  List<String> get nonePackageImageCompanyBook => _nonePackageImageCompanyBook;
  set nonePackageImageCompanyBook(List<String> value) {
    _nonePackageImageCompanyBook = value;
  }

  void addToNonePackageImageCompanyBook(String value) {
    nonePackageImageCompanyBook.add(value);
  }

  void removeFromNonePackageImageCompanyBook(String value) {
    nonePackageImageCompanyBook.remove(value);
  }

  void removeAtIndexFromNonePackageImageCompanyBook(int index) {
    nonePackageImageCompanyBook.removeAt(index);
  }

  void updateNonePackageImageCompanyBookAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageCompanyBook[index] =
        updateFn(_nonePackageImageCompanyBook[index]);
  }

  void insertAtIndexInNonePackageImageCompanyBook(int index, String value) {
    nonePackageImageCompanyBook.insert(index, value);
  }

  List<String> _nonePackageImageIdCard = [];
  List<String> get nonePackageImageIdCard => _nonePackageImageIdCard;
  set nonePackageImageIdCard(List<String> value) {
    _nonePackageImageIdCard = value;
  }

  void addToNonePackageImageIdCard(String value) {
    nonePackageImageIdCard.add(value);
  }

  void removeFromNonePackageImageIdCard(String value) {
    nonePackageImageIdCard.remove(value);
  }

  void removeAtIndexFromNonePackageImageIdCard(int index) {
    nonePackageImageIdCard.removeAt(index);
  }

  void updateNonePackageImageIdCardAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageIdCard[index] = updateFn(_nonePackageImageIdCard[index]);
  }

  void insertAtIndexInNonePackageImageIdCard(int index, String value) {
    nonePackageImageIdCard.insert(index, value);
  }

  List<String> _nonePackageImageBlueBook = [];
  List<String> get nonePackageImageBlueBook => _nonePackageImageBlueBook;
  set nonePackageImageBlueBook(List<String> value) {
    _nonePackageImageBlueBook = value;
  }

  void addToNonePackageImageBlueBook(String value) {
    nonePackageImageBlueBook.add(value);
  }

  void removeFromNonePackageImageBlueBook(String value) {
    nonePackageImageBlueBook.remove(value);
  }

  void removeAtIndexFromNonePackageImageBlueBook(int index) {
    nonePackageImageBlueBook.removeAt(index);
  }

  void updateNonePackageImageBlueBookAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageBlueBook[index] =
        updateFn(_nonePackageImageBlueBook[index]);
  }

  void insertAtIndexInNonePackageImageBlueBook(int index, String value) {
    nonePackageImageBlueBook.insert(index, value);
  }

  List<String> _insuranceInfoOccupationCode = [];
  List<String> get insuranceInfoOccupationCode => _insuranceInfoOccupationCode;
  set insuranceInfoOccupationCode(List<String> value) {
    _insuranceInfoOccupationCode = value;
  }

  void addToInsuranceInfoOccupationCode(String value) {
    insuranceInfoOccupationCode.add(value);
  }

  void removeFromInsuranceInfoOccupationCode(String value) {
    insuranceInfoOccupationCode.remove(value);
  }

  void removeAtIndexFromInsuranceInfoOccupationCode(int index) {
    insuranceInfoOccupationCode.removeAt(index);
  }

  void updateInsuranceInfoOccupationCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoOccupationCode[index] =
        updateFn(_insuranceInfoOccupationCode[index]);
  }

  void insertAtIndexInInsuranceInfoOccupationCode(int index, String value) {
    insuranceInfoOccupationCode.insert(index, value);
  }

  List<String> _insuranceInfoOccupationName = [];
  List<String> get insuranceInfoOccupationName => _insuranceInfoOccupationName;
  set insuranceInfoOccupationName(List<String> value) {
    _insuranceInfoOccupationName = value;
  }

  void addToInsuranceInfoOccupationName(String value) {
    insuranceInfoOccupationName.add(value);
  }

  void removeFromInsuranceInfoOccupationName(String value) {
    insuranceInfoOccupationName.remove(value);
  }

  void removeAtIndexFromInsuranceInfoOccupationName(int index) {
    insuranceInfoOccupationName.removeAt(index);
  }

  void updateInsuranceInfoOccupationNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoOccupationName[index] =
        updateFn(_insuranceInfoOccupationName[index]);
  }

  void insertAtIndexInInsuranceInfoOccupationName(int index, String value) {
    insuranceInfoOccupationName.insert(index, value);
  }

  List<String> _insuranceInfoOccupationSubCode = [];
  List<String> get insuranceInfoOccupationSubCode =>
      _insuranceInfoOccupationSubCode;
  set insuranceInfoOccupationSubCode(List<String> value) {
    _insuranceInfoOccupationSubCode = value;
  }

  void addToInsuranceInfoOccupationSubCode(String value) {
    insuranceInfoOccupationSubCode.add(value);
  }

  void removeFromInsuranceInfoOccupationSubCode(String value) {
    insuranceInfoOccupationSubCode.remove(value);
  }

  void removeAtIndexFromInsuranceInfoOccupationSubCode(int index) {
    insuranceInfoOccupationSubCode.removeAt(index);
  }

  void updateInsuranceInfoOccupationSubCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoOccupationSubCode[index] =
        updateFn(_insuranceInfoOccupationSubCode[index]);
  }

  void insertAtIndexInInsuranceInfoOccupationSubCode(int index, String value) {
    insuranceInfoOccupationSubCode.insert(index, value);
  }

  List<String> _insuranceInfoOccupationSubName = [];
  List<String> get insuranceInfoOccupationSubName =>
      _insuranceInfoOccupationSubName;
  set insuranceInfoOccupationSubName(List<String> value) {
    _insuranceInfoOccupationSubName = value;
  }

  void addToInsuranceInfoOccupationSubName(String value) {
    insuranceInfoOccupationSubName.add(value);
  }

  void removeFromInsuranceInfoOccupationSubName(String value) {
    insuranceInfoOccupationSubName.remove(value);
  }

  void removeAtIndexFromInsuranceInfoOccupationSubName(int index) {
    insuranceInfoOccupationSubName.removeAt(index);
  }

  void updateInsuranceInfoOccupationSubNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoOccupationSubName[index] =
        updateFn(_insuranceInfoOccupationSubName[index]);
  }

  void insertAtIndexInInsuranceInfoOccupationSubName(int index, String value) {
    insuranceInfoOccupationSubName.insert(index, value);
  }

  String _insuranceInfoSelectOccupationCode = '';
  String get insuranceInfoSelectOccupationCode =>
      _insuranceInfoSelectOccupationCode;
  set insuranceInfoSelectOccupationCode(String value) {
    _insuranceInfoSelectOccupationCode = value;
  }

  String _insuranceInfoSelectOccupationName = '';
  String get insuranceInfoSelectOccupationName =>
      _insuranceInfoSelectOccupationName;
  set insuranceInfoSelectOccupationName(String value) {
    _insuranceInfoSelectOccupationName = value;
  }

  List<String> _insuranceInfoSelectOccupationSubCode = [];
  List<String> get insuranceInfoSelectOccupationSubCode =>
      _insuranceInfoSelectOccupationSubCode;
  set insuranceInfoSelectOccupationSubCode(List<String> value) {
    _insuranceInfoSelectOccupationSubCode = value;
  }

  void addToInsuranceInfoSelectOccupationSubCode(String value) {
    insuranceInfoSelectOccupationSubCode.add(value);
  }

  void removeFromInsuranceInfoSelectOccupationSubCode(String value) {
    insuranceInfoSelectOccupationSubCode.remove(value);
  }

  void removeAtIndexFromInsuranceInfoSelectOccupationSubCode(int index) {
    insuranceInfoSelectOccupationSubCode.removeAt(index);
  }

  void updateInsuranceInfoSelectOccupationSubCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoSelectOccupationSubCode[index] =
        updateFn(_insuranceInfoSelectOccupationSubCode[index]);
  }

  void insertAtIndexInInsuranceInfoSelectOccupationSubCode(
      int index, String value) {
    insuranceInfoSelectOccupationSubCode.insert(index, value);
  }

  List<String> _insuranceInfoSelectOccupationSubName = [];
  List<String> get insuranceInfoSelectOccupationSubName =>
      _insuranceInfoSelectOccupationSubName;
  set insuranceInfoSelectOccupationSubName(List<String> value) {
    _insuranceInfoSelectOccupationSubName = value;
  }

  void addToInsuranceInfoSelectOccupationSubName(String value) {
    insuranceInfoSelectOccupationSubName.add(value);
  }

  void removeFromInsuranceInfoSelectOccupationSubName(String value) {
    insuranceInfoSelectOccupationSubName.remove(value);
  }

  void removeAtIndexFromInsuranceInfoSelectOccupationSubName(int index) {
    insuranceInfoSelectOccupationSubName.removeAt(index);
  }

  void updateInsuranceInfoSelectOccupationSubNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoSelectOccupationSubName[index] =
        updateFn(_insuranceInfoSelectOccupationSubName[index]);
  }

  void insertAtIndexInInsuranceInfoSelectOccupationSubName(
      int index, String value) {
    insuranceInfoSelectOccupationSubName.insert(index, value);
  }

  bool _nonePackageCompanyBookImageUploadedCheck = false;
  bool get nonePackageCompanyBookImageUploadedCheck =>
      _nonePackageCompanyBookImageUploadedCheck;
  set nonePackageCompanyBookImageUploadedCheck(bool value) {
    _nonePackageCompanyBookImageUploadedCheck = value;
  }

  String _nonePackageCompanyBookImageUrl = '';
  String get nonePackageCompanyBookImageUrl => _nonePackageCompanyBookImageUrl;
  set nonePackageCompanyBookImageUrl(String value) {
    _nonePackageCompanyBookImageUrl = value;
  }

  String _insuranceInfoImageApplication = '';
  String get insuranceInfoImageApplication => _insuranceInfoImageApplication;
  set insuranceInfoImageApplication(String value) {
    _insuranceInfoImageApplication = value;
  }

  String _insuranceInfoImageFileloanApplicationRegister = '';
  String get insuranceInfoImageFileloanApplicationRegister =>
      _insuranceInfoImageFileloanApplicationRegister;
  set insuranceInfoImageFileloanApplicationRegister(String value) {
    _insuranceInfoImageFileloanApplicationRegister = value;
  }

  String _nonePackageImageFrontUploaded = '';
  String get nonePackageImageFrontUploaded => _nonePackageImageFrontUploaded;
  set nonePackageImageFrontUploaded(String value) {
    _nonePackageImageFrontUploaded = value;
  }

  String _nonePackageImageRightFrontUploaded = '';
  String get nonePackageImageRightFrontUploaded =>
      _nonePackageImageRightFrontUploaded;
  set nonePackageImageRightFrontUploaded(String value) {
    _nonePackageImageRightFrontUploaded = value;
  }

  String _nonePackageImageRightUploaded = '';
  String get nonePackageImageRightUploaded => _nonePackageImageRightUploaded;
  set nonePackageImageRightUploaded(String value) {
    _nonePackageImageRightUploaded = value;
  }

  String _nonePackageImageRightRearUploaded = '';
  String get nonePackageImageRightRearUploaded =>
      _nonePackageImageRightRearUploaded;
  set nonePackageImageRightRearUploaded(String value) {
    _nonePackageImageRightRearUploaded = value;
  }

  String _nonePackageImageRearUploaded = '';
  String get nonePackageImageRearUploaded => _nonePackageImageRearUploaded;
  set nonePackageImageRearUploaded(String value) {
    _nonePackageImageRearUploaded = value;
  }

  String _nonePackageImageLeftRearUploaded = '';
  String get nonePackageImageLeftRearUploaded =>
      _nonePackageImageLeftRearUploaded;
  set nonePackageImageLeftRearUploaded(String value) {
    _nonePackageImageLeftRearUploaded = value;
  }

  String _nonePackageImageLeftUploaded = '';
  String get nonePackageImageLeftUploaded => _nonePackageImageLeftUploaded;
  set nonePackageImageLeftUploaded(String value) {
    _nonePackageImageLeftUploaded = value;
  }

  String _nonePackageImageLeftFrontUploaded = '';
  String get nonePackageImageLeftFrontUploaded =>
      _nonePackageImageLeftFrontUploaded;
  set nonePackageImageLeftFrontUploaded(String value) {
    _nonePackageImageLeftFrontUploaded = value;
  }

  String _nonePackageImageRoofUploaded = '';
  String get nonePackageImageRoofUploaded => _nonePackageImageRoofUploaded;
  set nonePackageImageRoofUploaded(String value) {
    _nonePackageImageRoofUploaded = value;
  }

  String _nonePackageTrailerImageFrontUploaded = '';
  String get nonePackageTrailerImageFrontUploaded =>
      _nonePackageTrailerImageFrontUploaded;
  set nonePackageTrailerImageFrontUploaded(String value) {
    _nonePackageTrailerImageFrontUploaded = value;
  }

  String _nonePackageTrailerImageRightFrontUploaded = '';
  String get nonePackageTrailerImageRightFrontUploaded =>
      _nonePackageTrailerImageRightFrontUploaded;
  set nonePackageTrailerImageRightFrontUploaded(String value) {
    _nonePackageTrailerImageRightFrontUploaded = value;
  }

  String _nonePackageTrailerImageRightUploaded = '';
  String get nonePackageTrailerImageRightUploaded =>
      _nonePackageTrailerImageRightUploaded;
  set nonePackageTrailerImageRightUploaded(String value) {
    _nonePackageTrailerImageRightUploaded = value;
  }

  String _nonePackageTrailerImageRightRearUploaded = '';
  String get nonePackageTrailerImageRightRearUploaded =>
      _nonePackageTrailerImageRightRearUploaded;
  set nonePackageTrailerImageRightRearUploaded(String value) {
    _nonePackageTrailerImageRightRearUploaded = value;
  }

  String _nonePackageTrailerImageRearUploaded = '';
  String get nonePackageTrailerImageRearUploaded =>
      _nonePackageTrailerImageRearUploaded;
  set nonePackageTrailerImageRearUploaded(String value) {
    _nonePackageTrailerImageRearUploaded = value;
  }

  String _nonePackageTrailerImageLeftRearUploaded = '';
  String get nonePackageTrailerImageLeftRearUploaded =>
      _nonePackageTrailerImageLeftRearUploaded;
  set nonePackageTrailerImageLeftRearUploaded(String value) {
    _nonePackageTrailerImageLeftRearUploaded = value;
  }

  String _nonePackageTrailerImageLeftUploaded = '';
  String get nonePackageTrailerImageLeftUploaded =>
      _nonePackageTrailerImageLeftUploaded;
  set nonePackageTrailerImageLeftUploaded(String value) {
    _nonePackageTrailerImageLeftUploaded = value;
  }

  String _nonePackageTrailerImageLeftFrontUploaded = '';
  String get nonePackageTrailerImageLeftFrontUploaded =>
      _nonePackageTrailerImageLeftFrontUploaded;
  set nonePackageTrailerImageLeftFrontUploaded(String value) {
    _nonePackageTrailerImageLeftFrontUploaded = value;
  }

  String _nonePackageImageBlueBookUploaded = '';
  String get nonePackageImageBlueBookUploaded =>
      _nonePackageImageBlueBookUploaded;
  set nonePackageImageBlueBookUploaded(String value) {
    _nonePackageImageBlueBookUploaded = value;
  }

  String _nonePackageImageOther1 = '';
  String get nonePackageImageOther1 => _nonePackageImageOther1;
  set nonePackageImageOther1(String value) {
    _nonePackageImageOther1 = value;
  }

  String _nonePackageImageOther2 = '';
  String get nonePackageImageOther2 => _nonePackageImageOther2;
  set nonePackageImageOther2(String value) {
    _nonePackageImageOther2 = value;
  }

  String _nonePackageImageOther3 = '';
  String get nonePackageImageOther3 => _nonePackageImageOther3;
  set nonePackageImageOther3(String value) {
    _nonePackageImageOther3 = value;
  }

  String _nonePackageImageOther4 = '';
  String get nonePackageImageOther4 => _nonePackageImageOther4;
  set nonePackageImageOther4(String value) {
    _nonePackageImageOther4 = value;
  }

  String _nonePackageImageOther5 = '';
  String get nonePackageImageOther5 => _nonePackageImageOther5;
  set nonePackageImageOther5(String value) {
    _nonePackageImageOther5 = value;
  }

  List<String> _nonePackageImageOtherNameList = [];
  List<String> get nonePackageImageOtherNameList =>
      _nonePackageImageOtherNameList;
  set nonePackageImageOtherNameList(List<String> value) {
    _nonePackageImageOtherNameList = value;
  }

  void addToNonePackageImageOtherNameList(String value) {
    nonePackageImageOtherNameList.add(value);
  }

  void removeFromNonePackageImageOtherNameList(String value) {
    nonePackageImageOtherNameList.remove(value);
  }

  void removeAtIndexFromNonePackageImageOtherNameList(int index) {
    nonePackageImageOtherNameList.removeAt(index);
  }

  void updateNonePackageImageOtherNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageImageOtherNameList[index] =
        updateFn(_nonePackageImageOtherNameList[index]);
  }

  void insertAtIndexInNonePackageImageOtherNameList(int index, String value) {
    nonePackageImageOtherNameList.insert(index, value);
  }

  String _paymentQrCodeGen = '';
  String get paymentQrCodeGen => _paymentQrCodeGen;
  set paymentQrCodeGen(String value) {
    _paymentQrCodeGen = value;
  }

  bool _insuranceInfoCardCheckBool = false;
  bool get insuranceInfoCardCheckBool => _insuranceInfoCardCheckBool;
  set insuranceInfoCardCheckBool(bool value) {
    _insuranceInfoCardCheckBool = value;
  }

  String _insuranceInfoPage4PaymentChannel = '';
  String get insuranceInfoPage4PaymentChannel =>
      _insuranceInfoPage4PaymentChannel;
  set insuranceInfoPage4PaymentChannel(String value) {
    _insuranceInfoPage4PaymentChannel = value;
  }

  String _insuranceInfoPage4PaymentType = '';
  String get insuranceInfoPage4PaymentType => _insuranceInfoPage4PaymentType;
  set insuranceInfoPage4PaymentType(String value) {
    _insuranceInfoPage4PaymentType = value;
  }

  String _insuranceInfo4pagePaymentStatus = '';
  String get insuranceInfo4pagePaymentStatus =>
      _insuranceInfo4pagePaymentStatus;
  set insuranceInfo4pagePaymentStatus(String value) {
    _insuranceInfo4pagePaymentStatus = value;
  }

  String _insuranceInfo4pageStatus = '';
  String get insuranceInfo4pageStatus => _insuranceInfo4pageStatus;
  set insuranceInfo4pageStatus(String value) {
    _insuranceInfo4pageStatus = value;
  }

  String _insuranceInfoPage4SelectTenor = '';
  String get insuranceInfoPage4SelectTenor => _insuranceInfoPage4SelectTenor;
  set insuranceInfoPage4SelectTenor(String value) {
    _insuranceInfoPage4SelectTenor = value;
  }

  String _insuranceInfoPage4SelectInstallMentFirstDue = '';
  String get insuranceInfoPage4SelectInstallMentFirstDue =>
      _insuranceInfoPage4SelectInstallMentFirstDue;
  set insuranceInfoPage4SelectInstallMentFirstDue(String value) {
    _insuranceInfoPage4SelectInstallMentFirstDue = value;
  }

  String _insuranceInfoPage4SelectInstallMentLastDue = '';
  String get insuranceInfoPage4SelectInstallMentLastDue =>
      _insuranceInfoPage4SelectInstallMentLastDue;
  set insuranceInfoPage4SelectInstallMentLastDue(String value) {
    _insuranceInfoPage4SelectInstallMentLastDue = value;
  }

  String _profileInsuranceLicenseFullName = '';
  String get profileInsuranceLicenseFullName =>
      _profileInsuranceLicenseFullName;
  set profileInsuranceLicenseFullName(String value) {
    _profileInsuranceLicenseFullName = value;
  }

  String _profileInsuranceLicenseIdCard = '';
  String get profileInsuranceLicenseIdCard => _profileInsuranceLicenseIdCard;
  set profileInsuranceLicenseIdCard(String value) {
    _profileInsuranceLicenseIdCard = value;
  }

  String _profileInsuranceLicenseLicenseNo = '';
  String get profileInsuranceLicenseLicenseNo =>
      _profileInsuranceLicenseLicenseNo;
  set profileInsuranceLicenseLicenseNo(String value) {
    _profileInsuranceLicenseLicenseNo = value;
  }

  String _profileInsuranceLicenseStartDate = '';
  String get profileInsuranceLicenseStartDate =>
      _profileInsuranceLicenseStartDate;
  set profileInsuranceLicenseStartDate(String value) {
    _profileInsuranceLicenseStartDate = value;
  }

  String _profileInsuranceLicenseExpireDate = '';
  String get profileInsuranceLicenseExpireDate =>
      _profileInsuranceLicenseExpireDate;
  set profileInsuranceLicenseExpireDate(String value) {
    _profileInsuranceLicenseExpireDate = value;
  }

  String _fcmToken = 'fcm_token';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
    secureStorage.setString('ff_fcmToken', value);
  }

  void deleteFcmToken() {
    secureStorage.delete(key: 'ff_fcmToken');
  }

  bool _profileIsHaveInsuranceCard = false;
  bool get profileIsHaveInsuranceCard => _profileIsHaveInsuranceCard;
  set profileIsHaveInsuranceCard(bool value) {
    _profileIsHaveInsuranceCard = value;
  }

  List<String> _insuranceInfoImgUrlInsurerList = [];
  List<String> get insuranceInfoImgUrlInsurerList =>
      _insuranceInfoImgUrlInsurerList;
  set insuranceInfoImgUrlInsurerList(List<String> value) {
    _insuranceInfoImgUrlInsurerList = value;
  }

  void addToInsuranceInfoImgUrlInsurerList(String value) {
    insuranceInfoImgUrlInsurerList.add(value);
  }

  void removeFromInsuranceInfoImgUrlInsurerList(String value) {
    insuranceInfoImgUrlInsurerList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoImgUrlInsurerList(int index) {
    insuranceInfoImgUrlInsurerList.removeAt(index);
  }

  void updateInsuranceInfoImgUrlInsurerListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoImgUrlInsurerList[index] =
        updateFn(_insuranceInfoImgUrlInsurerList[index]);
  }

  void insertAtIndexInInsuranceInfoImgUrlInsurerList(int index, String value) {
    insuranceInfoImgUrlInsurerList.insert(index, value);
  }

  List<String> _insuranceInfoCompanyIdList = [];
  List<String> get insuranceInfoCompanyIdList => _insuranceInfoCompanyIdList;
  set insuranceInfoCompanyIdList(List<String> value) {
    _insuranceInfoCompanyIdList = value;
  }

  void addToInsuranceInfoCompanyIdList(String value) {
    insuranceInfoCompanyIdList.add(value);
  }

  void removeFromInsuranceInfoCompanyIdList(String value) {
    insuranceInfoCompanyIdList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoCompanyIdList(int index) {
    insuranceInfoCompanyIdList.removeAt(index);
  }

  void updateInsuranceInfoCompanyIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoCompanyIdList[index] =
        updateFn(_insuranceInfoCompanyIdList[index]);
  }

  void insertAtIndexInInsuranceInfoCompanyIdList(int index, String value) {
    insuranceInfoCompanyIdList.insert(index, value);
  }

  String _insuranceInfoCompayId = '';
  String get insuranceInfoCompayId => _insuranceInfoCompayId;
  set insuranceInfoCompayId(String value) {
    _insuranceInfoCompayId = value;
  }

  String _nonePackageSelectedInsurerShortName = '';
  String get nonePackageSelectedInsurerShortName =>
      _nonePackageSelectedInsurerShortName;
  set nonePackageSelectedInsurerShortName(String value) {
    _nonePackageSelectedInsurerShortName = value;
  }

  String _nonePackageSelectedInsurerName = '';
  String get nonePackageSelectedInsurerName => _nonePackageSelectedInsurerName;
  set nonePackageSelectedInsurerName(String value) {
    _nonePackageSelectedInsurerName = value;
  }

  List<String> _nonePackageSelectedInsurerShortNameList = [];
  List<String> get nonePackageSelectedInsurerShortNameList =>
      _nonePackageSelectedInsurerShortNameList;
  set nonePackageSelectedInsurerShortNameList(List<String> value) {
    _nonePackageSelectedInsurerShortNameList = value;
  }

  void addToNonePackageSelectedInsurerShortNameList(String value) {
    nonePackageSelectedInsurerShortNameList.add(value);
  }

  void removeFromNonePackageSelectedInsurerShortNameList(String value) {
    nonePackageSelectedInsurerShortNameList.remove(value);
  }

  void removeAtIndexFromNonePackageSelectedInsurerShortNameList(int index) {
    nonePackageSelectedInsurerShortNameList.removeAt(index);
  }

  void updateNonePackageSelectedInsurerShortNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageSelectedInsurerShortNameList[index] =
        updateFn(_nonePackageSelectedInsurerShortNameList[index]);
  }

  void insertAtIndexInNonePackageSelectedInsurerShortNameList(
      int index, String value) {
    nonePackageSelectedInsurerShortNameList.insert(index, value);
  }

  List<String> _nonePackageSelectedInsurerNameList = [];
  List<String> get nonePackageSelectedInsurerNameList =>
      _nonePackageSelectedInsurerNameList;
  set nonePackageSelectedInsurerNameList(List<String> value) {
    _nonePackageSelectedInsurerNameList = value;
  }

  void addToNonePackageSelectedInsurerNameList(String value) {
    nonePackageSelectedInsurerNameList.add(value);
  }

  void removeFromNonePackageSelectedInsurerNameList(String value) {
    nonePackageSelectedInsurerNameList.remove(value);
  }

  void removeAtIndexFromNonePackageSelectedInsurerNameList(int index) {
    nonePackageSelectedInsurerNameList.removeAt(index);
  }

  void updateNonePackageSelectedInsurerNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageSelectedInsurerNameList[index] =
        updateFn(_nonePackageSelectedInsurerNameList[index]);
  }

  void insertAtIndexInNonePackageSelectedInsurerNameList(
      int index, String value) {
    nonePackageSelectedInsurerNameList.insert(index, value);
  }

  String _insuranceInfoLeadDetailId = '';
  String get insuranceInfoLeadDetailId => _insuranceInfoLeadDetailId;
  set insuranceInfoLeadDetailId(String value) {
    _insuranceInfoLeadDetailId = value;
  }

  String _insuranceInfoSelectOccupationSubNameChoose = '';
  String get insuranceInfoSelectOccupationSubNameChoose =>
      _insuranceInfoSelectOccupationSubNameChoose;
  set insuranceInfoSelectOccupationSubNameChoose(String value) {
    _insuranceInfoSelectOccupationSubNameChoose = value;
  }

  List<String> _addaddresslicensenBranch = [];
  List<String> get addaddresslicensenBranch => _addaddresslicensenBranch;
  set addaddresslicensenBranch(List<String> value) {
    _addaddresslicensenBranch = value;
  }

  void addToAddaddresslicensenBranch(String value) {
    addaddresslicensenBranch.add(value);
  }

  void removeFromAddaddresslicensenBranch(String value) {
    addaddresslicensenBranch.remove(value);
  }

  void removeAtIndexFromAddaddresslicensenBranch(int index) {
    addaddresslicensenBranch.removeAt(index);
  }

  void updateAddaddresslicensenBranchAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addaddresslicensenBranch[index] =
        updateFn(_addaddresslicensenBranch[index]);
  }

  void insertAtIndexInAddaddresslicensenBranch(int index, String value) {
    addaddresslicensenBranch.insert(index, value);
  }

  String _insuranceInfoLicenseBranch = '';
  String get insuranceInfoLicenseBranch => _insuranceInfoLicenseBranch;
  set insuranceInfoLicenseBranch(String value) {
    _insuranceInfoLicenseBranch = value;
  }

  String _insuranceInfoQuotationId = '';
  String get insuranceInfoQuotationId => _insuranceInfoQuotationId;
  set insuranceInfoQuotationId(String value) {
    _insuranceInfoQuotationId = value;
  }

  String _insuranceInfoQrcodeTaxId = '';
  String get insuranceInfoQrcodeTaxId => _insuranceInfoQrcodeTaxId;
  set insuranceInfoQrcodeTaxId(String value) {
    _insuranceInfoQrcodeTaxId = value;
  }

  String _insuranceInfoQrcodeSuffix = '';
  String get insuranceInfoQrcodeSuffix => _insuranceInfoQrcodeSuffix;
  set insuranceInfoQrcodeSuffix(String value) {
    _insuranceInfoQrcodeSuffix = value;
  }

  String _insuranceInfoQrcodeRef1 = '';
  String get insuranceInfoQrcodeRef1 => _insuranceInfoQrcodeRef1;
  set insuranceInfoQrcodeRef1(String value) {
    _insuranceInfoQrcodeRef1 = value;
  }

  String _insuranceInfoQrcodeRef2 = '';
  String get insuranceInfoQrcodeRef2 => _insuranceInfoQrcodeRef2;
  set insuranceInfoQrcodeRef2(String value) {
    _insuranceInfoQrcodeRef2 = value;
  }

  String _insuranceInfoQrcodeAmount = '';
  String get insuranceInfoQrcodeAmount => _insuranceInfoQrcodeAmount;
  set insuranceInfoQrcodeAmount(String value) {
    _insuranceInfoQrcodeAmount = value;
  }

  bool _insuranceInfoPage1SaveDataCheckBool = false;
  bool get insuranceInfoPage1SaveDataCheckBool =>
      _insuranceInfoPage1SaveDataCheckBool;
  set insuranceInfoPage1SaveDataCheckBool(bool value) {
    _insuranceInfoPage1SaveDataCheckBool = value;
  }

  bool _insuranceInfoPage2SaveDataCheckBool = false;
  bool get insuranceInfoPage2SaveDataCheckBool =>
      _insuranceInfoPage2SaveDataCheckBool;
  set insuranceInfoPage2SaveDataCheckBool(bool value) {
    _insuranceInfoPage2SaveDataCheckBool = value;
  }

  bool _insuranceInfoPage3SaveDataCheckBool = false;
  bool get insuranceInfoPage3SaveDataCheckBool =>
      _insuranceInfoPage3SaveDataCheckBool;
  set insuranceInfoPage3SaveDataCheckBool(bool value) {
    _insuranceInfoPage3SaveDataCheckBool = value;
  }

  String _insuranceInfoVehicleCode = '';
  String get insuranceInfoVehicleCode => _insuranceInfoVehicleCode;
  set insuranceInfoVehicleCode(String value) {
    _insuranceInfoVehicleCode = value;
  }

  List<String> _followUpListSelected = ['manual', 'auto'];
  List<String> get followUpListSelected => _followUpListSelected;
  set followUpListSelected(List<String> value) {
    _followUpListSelected = value;
  }

  void addToFollowUpListSelected(String value) {
    followUpListSelected.add(value);
  }

  void removeFromFollowUpListSelected(String value) {
    followUpListSelected.remove(value);
  }

  void removeAtIndexFromFollowUpListSelected(int index) {
    followUpListSelected.removeAt(index);
  }

  void updateFollowUpListSelectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    followUpListSelected[index] = updateFn(_followUpListSelected[index]);
  }

  void insertAtIndexInFollowUpListSelected(int index, String value) {
    followUpListSelected.insert(index, value);
  }

  List<String> _listForSearchFollowUp = ['เตรียมข้อมูล'];
  List<String> get listForSearchFollowUp => _listForSearchFollowUp;
  set listForSearchFollowUp(List<String> value) {
    _listForSearchFollowUp = value;
  }

  void addToListForSearchFollowUp(String value) {
    listForSearchFollowUp.add(value);
  }

  void removeFromListForSearchFollowUp(String value) {
    listForSearchFollowUp.remove(value);
  }

  void removeAtIndexFromListForSearchFollowUp(int index) {
    listForSearchFollowUp.removeAt(index);
  }

  void updateListForSearchFollowUpAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listForSearchFollowUp[index] = updateFn(_listForSearchFollowUp[index]);
  }

  void insertAtIndexInListForSearchFollowUp(int index, String value) {
    listForSearchFollowUp.insert(index, value);
  }

  dynamic _successStatusJson = jsonDecode('201');
  dynamic get successStatusJson => _successStatusJson;
  set successStatusJson(dynamic value) {
    _successStatusJson = value;
  }

  List<String> _inputPinValue = [];
  List<String> get inputPinValue => _inputPinValue;
  set inputPinValue(List<String> value) {
    _inputPinValue = value;
  }

  void addToInputPinValue(String value) {
    inputPinValue.add(value);
  }

  void removeFromInputPinValue(String value) {
    inputPinValue.remove(value);
  }

  void removeAtIndexFromInputPinValue(int index) {
    inputPinValue.removeAt(index);
  }

  void updateInputPinValueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    inputPinValue[index] = updateFn(_inputPinValue[index]);
  }

  void insertAtIndexInInputPinValue(int index, String value) {
    inputPinValue.insert(index, value);
  }

  bool _printQuotation = false;
  bool get printQuotation => _printQuotation;
  set printQuotation(bool value) {
    _printQuotation = value;
  }

  bool _printCompare = false;
  bool get printCompare => _printCompare;
  set printCompare(bool value) {
    _printCompare = value;
  }

  List<String> _insuranceInfoRegistrationCodeList = [];
  List<String> get insuranceInfoRegistrationCodeList =>
      _insuranceInfoRegistrationCodeList;
  set insuranceInfoRegistrationCodeList(List<String> value) {
    _insuranceInfoRegistrationCodeList = value;
  }

  void addToInsuranceInfoRegistrationCodeList(String value) {
    insuranceInfoRegistrationCodeList.add(value);
  }

  void removeFromInsuranceInfoRegistrationCodeList(String value) {
    insuranceInfoRegistrationCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoRegistrationCodeList(int index) {
    insuranceInfoRegistrationCodeList.removeAt(index);
  }

  void updateInsuranceInfoRegistrationCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoRegistrationCodeList[index] =
        updateFn(_insuranceInfoRegistrationCodeList[index]);
  }

  void insertAtIndexInInsuranceInfoRegistrationCodeList(
      int index, String value) {
    insuranceInfoRegistrationCodeList.insert(index, value);
  }

  List<String> _insuranceInfoRegistrationprovinceList = [];
  List<String> get insuranceInfoRegistrationprovinceList =>
      _insuranceInfoRegistrationprovinceList;
  set insuranceInfoRegistrationprovinceList(List<String> value) {
    _insuranceInfoRegistrationprovinceList = value;
  }

  void addToInsuranceInfoRegistrationprovinceList(String value) {
    insuranceInfoRegistrationprovinceList.add(value);
  }

  void removeFromInsuranceInfoRegistrationprovinceList(String value) {
    insuranceInfoRegistrationprovinceList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoRegistrationprovinceList(int index) {
    insuranceInfoRegistrationprovinceList.removeAt(index);
  }

  void updateInsuranceInfoRegistrationprovinceListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoRegistrationprovinceList[index] =
        updateFn(_insuranceInfoRegistrationprovinceList[index]);
  }

  void insertAtIndexInInsuranceInfoRegistrationprovinceList(
      int index, String value) {
    insuranceInfoRegistrationprovinceList.insert(index, value);
  }

  String _insuranceInfoRegistrationCodeSelect = '';
  String get insuranceInfoRegistrationCodeSelect =>
      _insuranceInfoRegistrationCodeSelect;
  set insuranceInfoRegistrationCodeSelect(String value) {
    _insuranceInfoRegistrationCodeSelect = value;
  }

  String _insuranceInfoRegistrationProvinceSelect = '';
  String get insuranceInfoRegistrationProvinceSelect =>
      _insuranceInfoRegistrationProvinceSelect;
  set insuranceInfoRegistrationProvinceSelect(String value) {
    _insuranceInfoRegistrationProvinceSelect = value;
  }

  dynamic _quotationTypeJson =
      jsonDecode('{\"auto\":\"auto\",\"manual\":\"manual\"}');
  dynamic get quotationTypeJson => _quotationTypeJson;
  set quotationTypeJson(dynamic value) {
    _quotationTypeJson = value;
  }

  bool _maxCurrentSelected = false;
  bool get maxCurrentSelected => _maxCurrentSelected;
  set maxCurrentSelected(bool value) {
    _maxCurrentSelected = value;
  }

  bool _installmentSelected = false;
  bool get installmentSelected => _installmentSelected;
  set installmentSelected(bool value) {
    _installmentSelected = value;
  }

  String _AddCustomerPageFirstname = '';
  String get AddCustomerPageFirstname => _AddCustomerPageFirstname;
  set AddCustomerPageFirstname(String value) {
    _AddCustomerPageFirstname = value;
  }

  String _AddCustomerPageLastname = '';
  String get AddCustomerPageLastname => _AddCustomerPageLastname;
  set AddCustomerPageLastname(String value) {
    _AddCustomerPageLastname = value;
  }

  String _AddCustomerPagePhone = '';
  String get AddCustomerPagePhone => _AddCustomerPagePhone;
  set AddCustomerPagePhone(String value) {
    _AddCustomerPagePhone = value;
  }

  String _AddCustomerPageCarRegistration = '';
  String get AddCustomerPageCarRegistration => _AddCustomerPageCarRegistration;
  set AddCustomerPageCarRegistration(String value) {
    _AddCustomerPageCarRegistration = value;
  }

  bool _addCustomerQuotationSaveSuccess = false;
  bool get addCustomerQuotationSaveSuccess => _addCustomerQuotationSaveSuccess;
  set addCustomerQuotationSaveSuccess(bool value) {
    _addCustomerQuotationSaveSuccess = value;
  }

  List<String> _insurarerQuotationPdf = [];
  List<String> get insurarerQuotationPdf => _insurarerQuotationPdf;
  set insurarerQuotationPdf(List<String> value) {
    _insurarerQuotationPdf = value;
  }

  void addToInsurarerQuotationPdf(String value) {
    insurarerQuotationPdf.add(value);
  }

  void removeFromInsurarerQuotationPdf(String value) {
    insurarerQuotationPdf.remove(value);
  }

  void removeAtIndexFromInsurarerQuotationPdf(int index) {
    insurarerQuotationPdf.removeAt(index);
  }

  void updateInsurarerQuotationPdfAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurarerQuotationPdf[index] = updateFn(_insurarerQuotationPdf[index]);
  }

  void insertAtIndexInInsurarerQuotationPdf(int index, String value) {
    insurarerQuotationPdf.insert(index, value);
  }

  String _page5QuotationStatus = '';
  String get page5QuotationStatus => _page5QuotationStatus;
  set page5QuotationStatus(String value) {
    _page5QuotationStatus = value;
  }

  String _page5CreatedDate = '';
  String get page5CreatedDate => _page5CreatedDate;
  set page5CreatedDate(String value) {
    _page5CreatedDate = value;
  }

  String _page5CompletedDate = '';
  String get page5CompletedDate => _page5CompletedDate;
  set page5CompletedDate(String value) {
    _page5CompletedDate = value;
  }

  String _page5ContractId = '';
  String get page5ContractId => _page5ContractId;
  set page5ContractId(String value) {
    _page5ContractId = value;
  }

  String _page5VmiPolicyNo = '';
  String get page5VmiPolicyNo => _page5VmiPolicyNo;
  set page5VmiPolicyNo(String value) {
    _page5VmiPolicyNo = value;
  }

  String _page5Reason = '';
  String get page5Reason => _page5Reason;
  set page5Reason(String value) {
    _page5Reason = value;
  }

  String _page5PaymentStatus = '';
  String get page5PaymentStatus => _page5PaymentStatus;
  set page5PaymentStatus(String value) {
    _page5PaymentStatus = value;
  }

  String _page5PaymentType = '';
  String get page5PaymentType => _page5PaymentType;
  set page5PaymentType(String value) {
    _page5PaymentType = value;
  }

  String _page5PaymentChannel = '';
  String get page5PaymentChannel => _page5PaymentChannel;
  set page5PaymentChannel(String value) {
    _page5PaymentChannel = value;
  }

  String _page5NetPremium = '';
  String get page5NetPremium => _page5NetPremium;
  set page5NetPremium(String value) {
    _page5NetPremium = value;
  }

  String _page5ActPrice = '';
  String get page5ActPrice => _page5ActPrice;
  set page5ActPrice(String value) {
    _page5ActPrice = value;
  }

  String _page5GrossTotalNet = '';
  String get page5GrossTotalNet => _page5GrossTotalNet;
  set page5GrossTotalNet(String value) {
    _page5GrossTotalNet = value;
  }

  String _page5FirstDue = '';
  String get page5FirstDue => _page5FirstDue;
  set page5FirstDue(String value) {
    _page5FirstDue = value;
  }

  String _page5LastDue = '';
  String get page5LastDue => _page5LastDue;
  set page5LastDue(String value) {
    _page5LastDue = value;
  }

  String _page5VloneContNo = '';
  String get page5VloneContNo => _page5VloneContNo;
  set page5VloneContNo(String value) {
    _page5VloneContNo = value;
  }

  String _page5CusIdCardNo = '';
  String get page5CusIdCardNo => _page5CusIdCardNo;
  set page5CusIdCardNo(String value) {
    _page5CusIdCardNo = value;
  }

  String _insuranceinfoPage3PdfFileapplication = '';
  String get insuranceinfoPage3PdfFileapplication =>
      _insuranceinfoPage3PdfFileapplication;
  set insuranceinfoPage3PdfFileapplication(String value) {
    _insuranceinfoPage3PdfFileapplication = value;
  }

  String _insuranceInfoApplicationType = '';
  String get insuranceInfoApplicationType => _insuranceInfoApplicationType;
  set insuranceInfoApplicationType(String value) {
    _insuranceInfoApplicationType = value;
  }

  List<String> _InsuranceInfoPage4PaymentFirst = [];
  List<String> get InsuranceInfoPage4PaymentFirst =>
      _InsuranceInfoPage4PaymentFirst;
  set InsuranceInfoPage4PaymentFirst(List<String> value) {
    _InsuranceInfoPage4PaymentFirst = value;
  }

  void addToInsuranceInfoPage4PaymentFirst(String value) {
    InsuranceInfoPage4PaymentFirst.add(value);
  }

  void removeFromInsuranceInfoPage4PaymentFirst(String value) {
    InsuranceInfoPage4PaymentFirst.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage4PaymentFirst(int index) {
    InsuranceInfoPage4PaymentFirst.removeAt(index);
  }

  void updateInsuranceInfoPage4PaymentFirstAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    InsuranceInfoPage4PaymentFirst[index] =
        updateFn(_InsuranceInfoPage4PaymentFirst[index]);
  }

  void insertAtIndexInInsuranceInfoPage4PaymentFirst(int index, String value) {
    InsuranceInfoPage4PaymentFirst.insert(index, value);
  }

  List<String> _InsuranceInfoPage4InstallmentFirstDue = [];
  List<String> get InsuranceInfoPage4InstallmentFirstDue =>
      _InsuranceInfoPage4InstallmentFirstDue;
  set InsuranceInfoPage4InstallmentFirstDue(List<String> value) {
    _InsuranceInfoPage4InstallmentFirstDue = value;
  }

  void addToInsuranceInfoPage4InstallmentFirstDue(String value) {
    InsuranceInfoPage4InstallmentFirstDue.add(value);
  }

  void removeFromInsuranceInfoPage4InstallmentFirstDue(String value) {
    InsuranceInfoPage4InstallmentFirstDue.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage4InstallmentFirstDue(int index) {
    InsuranceInfoPage4InstallmentFirstDue.removeAt(index);
  }

  void updateInsuranceInfoPage4InstallmentFirstDueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    InsuranceInfoPage4InstallmentFirstDue[index] =
        updateFn(_InsuranceInfoPage4InstallmentFirstDue[index]);
  }

  void insertAtIndexInInsuranceInfoPage4InstallmentFirstDue(
      int index, String value) {
    InsuranceInfoPage4InstallmentFirstDue.insert(index, value);
  }

  List<String> _InsuranceInfoPage4InstallmentLastDue = [];
  List<String> get InsuranceInfoPage4InstallmentLastDue =>
      _InsuranceInfoPage4InstallmentLastDue;
  set InsuranceInfoPage4InstallmentLastDue(List<String> value) {
    _InsuranceInfoPage4InstallmentLastDue = value;
  }

  void addToInsuranceInfoPage4InstallmentLastDue(String value) {
    InsuranceInfoPage4InstallmentLastDue.add(value);
  }

  void removeFromInsuranceInfoPage4InstallmentLastDue(String value) {
    InsuranceInfoPage4InstallmentLastDue.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage4InstallmentLastDue(int index) {
    InsuranceInfoPage4InstallmentLastDue.removeAt(index);
  }

  void updateInsuranceInfoPage4InstallmentLastDueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    InsuranceInfoPage4InstallmentLastDue[index] =
        updateFn(_InsuranceInfoPage4InstallmentLastDue[index]);
  }

  void insertAtIndexInInsuranceInfoPage4InstallmentLastDue(
      int index, String value) {
    InsuranceInfoPage4InstallmentLastDue.insert(index, value);
  }

  List<String> _InsuranceInfoPage4Tenor = [];
  List<String> get InsuranceInfoPage4Tenor => _InsuranceInfoPage4Tenor;
  set InsuranceInfoPage4Tenor(List<String> value) {
    _InsuranceInfoPage4Tenor = value;
  }

  void addToInsuranceInfoPage4Tenor(String value) {
    InsuranceInfoPage4Tenor.add(value);
  }

  void removeFromInsuranceInfoPage4Tenor(String value) {
    InsuranceInfoPage4Tenor.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage4Tenor(int index) {
    InsuranceInfoPage4Tenor.removeAt(index);
  }

  void updateInsuranceInfoPage4TenorAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    InsuranceInfoPage4Tenor[index] = updateFn(_InsuranceInfoPage4Tenor[index]);
  }

  void insertAtIndexInInsuranceInfoPage4Tenor(int index, String value) {
    InsuranceInfoPage4Tenor.insert(index, value);
  }

  String _insuranceInfoPage4NetPremiumTotal = '';
  String get insuranceInfoPage4NetPremiumTotal =>
      _insuranceInfoPage4NetPremiumTotal;
  set insuranceInfoPage4NetPremiumTotal(String value) {
    _insuranceInfoPage4NetPremiumTotal = value;
  }

  String _insuranceInfoPage4GrossTotalNet = '';
  String get insuranceInfoPage4GrossTotalNet =>
      _insuranceInfoPage4GrossTotalNet;
  set insuranceInfoPage4GrossTotalNet(String value) {
    _insuranceInfoPage4GrossTotalNet = value;
  }

  String _insuranceInfoPage4ActTotal = '';
  String get insuranceInfoPage4ActTotal => _insuranceInfoPage4ActTotal;
  set insuranceInfoPage4ActTotal(String value) {
    _insuranceInfoPage4ActTotal = value;
  }

  String _insuranceInfoPage4FileLoanApplicationRegister = '';
  String get insuranceInfoPage4FileLoanApplicationRegister =>
      _insuranceInfoPage4FileLoanApplicationRegister;
  set insuranceInfoPage4FileLoanApplicationRegister(String value) {
    _insuranceInfoPage4FileLoanApplicationRegister = value;
  }

  String _insuranceInfoPage4ImageApplication = '';
  String get insuranceInfoPage4ImageApplication =>
      _insuranceInfoPage4ImageApplication;
  set insuranceInfoPage4ImageApplication(String value) {
    _insuranceInfoPage4ImageApplication = value;
  }

  String _insuranceInfoPage3ImageIdCard = '';
  String get insuranceInfoPage3ImageIdCard => _insuranceInfoPage3ImageIdCard;
  set insuranceInfoPage3ImageIdCard(String value) {
    _insuranceInfoPage3ImageIdCard = value;
  }

  String _insuranceInfoPage3ImageBluebook = '';
  String get insuranceInfoPage3ImageBluebook =>
      _insuranceInfoPage3ImageBluebook;
  set insuranceInfoPage3ImageBluebook(String value) {
    _insuranceInfoPage3ImageBluebook = value;
  }

  String _insuranceInfoPage3ImageExamination = '';
  String get insuranceInfoPage3ImageExamination =>
      _insuranceInfoPage3ImageExamination;
  set insuranceInfoPage3ImageExamination(String value) {
    _insuranceInfoPage3ImageExamination = value;
  }

  String _insuranceInfoPage3ImageFront = '';
  String get insuranceInfoPage3ImageFront => _insuranceInfoPage3ImageFront;
  set insuranceInfoPage3ImageFront(String value) {
    _insuranceInfoPage3ImageFront = value;
  }

  String _insuranceInfoPageImageRear = '';
  String get insuranceInfoPageImageRear => _insuranceInfoPageImageRear;
  set insuranceInfoPageImageRear(String value) {
    _insuranceInfoPageImageRear = value;
  }

  String _insuranceInfoPage3ImageLeft = '';
  String get insuranceInfoPage3ImageLeft => _insuranceInfoPage3ImageLeft;
  set insuranceInfoPage3ImageLeft(String value) {
    _insuranceInfoPage3ImageLeft = value;
  }

  String _insuranceInfoPage3ImageRight = '';
  String get insuranceInfoPage3ImageRight => _insuranceInfoPage3ImageRight;
  set insuranceInfoPage3ImageRight(String value) {
    _insuranceInfoPage3ImageRight = value;
  }

  String _insuranceInfoPage3ImageRightFront = '';
  String get insuranceInfoPage3ImageRightFront =>
      _insuranceInfoPage3ImageRightFront;
  set insuranceInfoPage3ImageRightFront(String value) {
    _insuranceInfoPage3ImageRightFront = value;
  }

  String _insuranceInfoPage3ImageRightRear = '';
  String get insuranceInfoPage3ImageRightRear =>
      _insuranceInfoPage3ImageRightRear;
  set insuranceInfoPage3ImageRightRear(String value) {
    _insuranceInfoPage3ImageRightRear = value;
  }

  String _insuranceInfoPage3ImageLeftFront = '';
  String get insuranceInfoPage3ImageLeftFront =>
      _insuranceInfoPage3ImageLeftFront;
  set insuranceInfoPage3ImageLeftFront(String value) {
    _insuranceInfoPage3ImageLeftFront = value;
  }

  String _insuranceInfoPage3ImageLeftRear = '';
  String get insuranceInfoPage3ImageLeftRear =>
      _insuranceInfoPage3ImageLeftRear;
  set insuranceInfoPage3ImageLeftRear(String value) {
    _insuranceInfoPage3ImageLeftRear = value;
  }

  String _insuranceInfoPage3ImageRoof = '';
  String get insuranceInfoPage3ImageRoof => _insuranceInfoPage3ImageRoof;
  set insuranceInfoPage3ImageRoof(String value) {
    _insuranceInfoPage3ImageRoof = value;
  }

  List<String> _insuranceInfoPage3ImageWound = [];
  List<String> get insuranceInfoPage3ImageWound =>
      _insuranceInfoPage3ImageWound;
  set insuranceInfoPage3ImageWound(List<String> value) {
    _insuranceInfoPage3ImageWound = value;
  }

  void addToInsuranceInfoPage3ImageWound(String value) {
    insuranceInfoPage3ImageWound.add(value);
  }

  void removeFromInsuranceInfoPage3ImageWound(String value) {
    insuranceInfoPage3ImageWound.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage3ImageWound(int index) {
    insuranceInfoPage3ImageWound.removeAt(index);
  }

  void updateInsuranceInfoPage3ImageWoundAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoPage3ImageWound[index] =
        updateFn(_insuranceInfoPage3ImageWound[index]);
  }

  void insertAtIndexInInsuranceInfoPage3ImageWound(int index, String value) {
    insuranceInfoPage3ImageWound.insert(index, value);
  }

  List<String> _insuranceInfoPage3ImageAccessories = [];
  List<String> get insuranceInfoPage3ImageAccessories =>
      _insuranceInfoPage3ImageAccessories;
  set insuranceInfoPage3ImageAccessories(List<String> value) {
    _insuranceInfoPage3ImageAccessories = value;
  }

  void addToInsuranceInfoPage3ImageAccessories(String value) {
    insuranceInfoPage3ImageAccessories.add(value);
  }

  void removeFromInsuranceInfoPage3ImageAccessories(String value) {
    insuranceInfoPage3ImageAccessories.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage3ImageAccessories(int index) {
    insuranceInfoPage3ImageAccessories.removeAt(index);
  }

  void updateInsuranceInfoPage3ImageAccessoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoPage3ImageAccessories[index] =
        updateFn(_insuranceInfoPage3ImageAccessories[index]);
  }

  void insertAtIndexInInsuranceInfoPage3ImageAccessories(
      int index, String value) {
    insuranceInfoPage3ImageAccessories.insert(index, value);
  }

  String _insuranceInfoPage3ImageOther = '';
  String get insuranceInfoPage3ImageOther => _insuranceInfoPage3ImageOther;
  set insuranceInfoPage3ImageOther(String value) {
    _insuranceInfoPage3ImageOther = value;
  }

  String _typeList = 'list';
  String get typeList => _typeList;
  set typeList(String value) {
    _typeList = value;
  }

  String _insuranceInfoPage4FirstPay = '';
  String get insuranceInfoPage4FirstPay => _insuranceInfoPage4FirstPay;
  set insuranceInfoPage4FirstPay(String value) {
    _insuranceInfoPage4FirstPay = value;
  }

  String _page5Tenor = '';
  String get page5Tenor => _page5Tenor;
  set page5Tenor(String value) {
    _page5Tenor = value;
  }

  String _insuranceInfoBrandId = '';
  String get insuranceInfoBrandId => _insuranceInfoBrandId;
  set insuranceInfoBrandId(String value) {
    _insuranceInfoBrandId = value;
  }

  String _insuarnceInfoModelId = '';
  String get insuarnceInfoModelId => _insuarnceInfoModelId;
  set insuarnceInfoModelId(String value) {
    _insuarnceInfoModelId = value;
  }

  String _insuranceInfoVehicleId = '';
  String get insuranceInfoVehicleId => _insuranceInfoVehicleId;
  set insuranceInfoVehicleId(String value) {
    _insuranceInfoVehicleId = value;
  }

  String _insuranceInfoVehicleName = '';
  String get insuranceInfoVehicleName => _insuranceInfoVehicleName;
  set insuranceInfoVehicleName(String value) {
    _insuranceInfoVehicleName = value;
  }

  bool _insuranceinfoFirstInAppStep1 = false;
  bool get insuranceinfoFirstInAppStep1 => _insuranceinfoFirstInAppStep1;
  set insuranceinfoFirstInAppStep1(bool value) {
    _insuranceinfoFirstInAppStep1 = value;
  }

  String _insuranceInfoPage5Document = '';
  String get insuranceInfoPage5Document => _insuranceInfoPage5Document;
  set insuranceInfoPage5Document(String value) {
    _insuranceInfoPage5Document = value;
  }

  String _searchList1 = '';
  String get searchList1 => _searchList1;
  set searchList1(String value) {
    _searchList1 = value;
  }

  String _page5VloanCustomerNo = '';
  String get page5VloanCustomerNo => _page5VloanCustomerNo;
  set page5VloanCustomerNo(String value) {
    _page5VloanCustomerNo = value;
  }

  String _insuranceInfoGrosstotalNet = '';
  String get insuranceInfoGrosstotalNet => _insuranceInfoGrosstotalNet;
  set insuranceInfoGrosstotalNet(String value) {
    _insuranceInfoGrosstotalNet = value;
  }

  String _insuranceInfoActFlag = '';
  String get insuranceInfoActFlag => _insuranceInfoActFlag;
  set insuranceInfoActFlag(String value) {
    _insuranceInfoActFlag = value;
  }

  String _nonePackageFlagOldVmi = '';
  String get nonePackageFlagOldVmi => _nonePackageFlagOldVmi;
  set nonePackageFlagOldVmi(String value) {
    _nonePackageFlagOldVmi = value;
  }

  String _nonePackageWorkType = '';
  String get nonePackageWorkType => _nonePackageWorkType;
  set nonePackageWorkType(String value) {
    _nonePackageWorkType = value;
  }

  String _insuranceInfoEffectiveDateAct = '';
  String get insuranceInfoEffectiveDateAct => _insuranceInfoEffectiveDateAct;
  set insuranceInfoEffectiveDateAct(String value) {
    _insuranceInfoEffectiveDateAct = value;
  }

  String _insuranceInfoBranchCode = '';
  String get insuranceInfoBranchCode => _insuranceInfoBranchCode;
  set insuranceInfoBranchCode(String value) {
    _insuranceInfoBranchCode = value;
  }

  String _insuranceInfoBranchNameOutput = '';
  String get insuranceInfoBranchNameOutput => _insuranceInfoBranchNameOutput;
  set insuranceInfoBranchNameOutput(String value) {
    _insuranceInfoBranchNameOutput = value;
  }

  dynamic _coverTypeJson = jsonDecode('null');
  dynamic get coverTypeJson => _coverTypeJson;
  set coverTypeJson(dynamic value) {
    _coverTypeJson = value;
  }

  String _insuranceinfoApplicationNo = '';
  String get insuranceinfoApplicationNo => _insuranceinfoApplicationNo;
  set insuranceinfoApplicationNo(String value) {
    _insuranceinfoApplicationNo = value;
  }

  String _page5DateNow = '';
  String get page5DateNow => _page5DateNow;
  set page5DateNow(String value) {
    _page5DateNow = value;
  }

  String _insuranceInfoEffectiveDateInsure = '';
  String get insuranceInfoEffectiveDateInsure =>
      _insuranceInfoEffectiveDateInsure;
  set insuranceInfoEffectiveDateInsure(String value) {
    _insuranceInfoEffectiveDateInsure = value;
  }

  String _nonePackageRemark = '';
  String get nonePackageRemark => _nonePackageRemark;
  set nonePackageRemark(String value) {
    _nonePackageRemark = value;
  }

  int _statusCodeUnSuccess = 500;
  int get statusCodeUnSuccess => _statusCodeUnSuccess;
  set statusCodeUnSuccess(int value) {
    _statusCodeUnSuccess = value;
  }

  dynamic _unsuccessStatusJson = jsonDecode('500');
  dynamic get unsuccessStatusJson => _unsuccessStatusJson;
  set unsuccessStatusJson(dynamic value) {
    _unsuccessStatusJson = value;
  }

  String _nonePackageBranchCode = '';
  String get nonePackageBranchCode => _nonePackageBranchCode;
  set nonePackageBranchCode(String value) {
    _nonePackageBranchCode = value;
  }

  String _nonePackageBranchName = '';
  String get nonePackageBranchName => _nonePackageBranchName;
  set nonePackageBranchName(String value) {
    _nonePackageBranchName = value;
  }

  String _nonePackageImageQuotationPdfUploaded = '';
  String get nonePackageImageQuotationPdfUploaded =>
      _nonePackageImageQuotationPdfUploaded;
  set nonePackageImageQuotationPdfUploaded(String value) {
    _nonePackageImageQuotationPdfUploaded = value;
  }

  List<String> _nonePackageInsurerShortNameDupList = [];
  List<String> get nonePackageInsurerShortNameDupList =>
      _nonePackageInsurerShortNameDupList;
  set nonePackageInsurerShortNameDupList(List<String> value) {
    _nonePackageInsurerShortNameDupList = value;
  }

  void addToNonePackageInsurerShortNameDupList(String value) {
    nonePackageInsurerShortNameDupList.add(value);
  }

  void removeFromNonePackageInsurerShortNameDupList(String value) {
    nonePackageInsurerShortNameDupList.remove(value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameDupList(int index) {
    nonePackageInsurerShortNameDupList.removeAt(index);
  }

  void updateNonePackageInsurerShortNameDupListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nonePackageInsurerShortNameDupList[index] =
        updateFn(_nonePackageInsurerShortNameDupList[index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameDupList(
      int index, String value) {
    nonePackageInsurerShortNameDupList.insert(index, value);
  }

  String _insuranceInfoPage5CMIDocUrl = '';
  String get insuranceInfoPage5CMIDocUrl => _insuranceInfoPage5CMIDocUrl;
  set insuranceInfoPage5CMIDocUrl(String value) {
    _insuranceInfoPage5CMIDocUrl = value;
  }

  String _insuranceInfoInsuranceLogo = '';
  String get insuranceInfoInsuranceLogo => _insuranceInfoInsuranceLogo;
  set insuranceInfoInsuranceLogo(String value) {
    _insuranceInfoInsuranceLogo = value;
  }

  List<String> _listSelectionPdfQuotation = [];
  List<String> get listSelectionPdfQuotation => _listSelectionPdfQuotation;
  set listSelectionPdfQuotation(List<String> value) {
    _listSelectionPdfQuotation = value;
  }

  void addToListSelectionPdfQuotation(String value) {
    listSelectionPdfQuotation.add(value);
  }

  void removeFromListSelectionPdfQuotation(String value) {
    listSelectionPdfQuotation.remove(value);
  }

  void removeAtIndexFromListSelectionPdfQuotation(int index) {
    listSelectionPdfQuotation.removeAt(index);
  }

  void updateListSelectionPdfQuotationAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listSelectionPdfQuotation[index] =
        updateFn(_listSelectionPdfQuotation[index]);
  }

  void insertAtIndexInListSelectionPdfQuotation(int index, String value) {
    listSelectionPdfQuotation.insert(index, value);
  }

  List<int> _listValuePdfQuotation = [];
  List<int> get listValuePdfQuotation => _listValuePdfQuotation;
  set listValuePdfQuotation(List<int> value) {
    _listValuePdfQuotation = value;
  }

  void addToListValuePdfQuotation(int value) {
    listValuePdfQuotation.add(value);
  }

  void removeFromListValuePdfQuotation(int value) {
    listValuePdfQuotation.remove(value);
  }

  void removeAtIndexFromListValuePdfQuotation(int index) {
    listValuePdfQuotation.removeAt(index);
  }

  void updateListValuePdfQuotationAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listValuePdfQuotation[index] = updateFn(_listValuePdfQuotation[index]);
  }

  void insertAtIndexInListValuePdfQuotation(int index, int value) {
    listValuePdfQuotation.insert(index, value);
  }

  int _indexPdfQuotation = 0;
  int get indexPdfQuotation => _indexPdfQuotation;
  set indexPdfQuotation(int value) {
    _indexPdfQuotation = value;
  }

  int _lengthListPdfQuotation = 0;
  int get lengthListPdfQuotation => _lengthListPdfQuotation;
  set lengthListPdfQuotation(int value) {
    _lengthListPdfQuotation = value;
  }

  String _insuranceCarTypeDetailSelected = '';
  String get insuranceCarTypeDetailSelected => _insuranceCarTypeDetailSelected;
  set insuranceCarTypeDetailSelected(String value) {
    _insuranceCarTypeDetailSelected = value;
  }

  String _insuranceBasicOldVmiExpDate = '';
  String get insuranceBasicOldVmiExpDate => _insuranceBasicOldVmiExpDate;
  set insuranceBasicOldVmiExpDate(String value) {
    _insuranceBasicOldVmiExpDate = value;
  }

  String _nonepackagevehicletypeDetail = '';
  String get nonepackagevehicletypeDetail => _nonepackagevehicletypeDetail;
  set nonepackagevehicletypeDetail(String value) {
    _nonepackagevehicletypeDetail = value;
  }

  String _insuranceInfoCarTypeDetail = '';
  String get insuranceInfoCarTypeDetail => _insuranceInfoCarTypeDetail;
  set insuranceInfoCarTypeDetail(String value) {
    _insuranceInfoCarTypeDetail = value;
  }

  List<String> _insuranceBasicVehicleGroupList = [];
  List<String> get insuranceBasicVehicleGroupList =>
      _insuranceBasicVehicleGroupList;
  set insuranceBasicVehicleGroupList(List<String> value) {
    _insuranceBasicVehicleGroupList = value;
  }

  void addToInsuranceBasicVehicleGroupList(String value) {
    insuranceBasicVehicleGroupList.add(value);
  }

  void removeFromInsuranceBasicVehicleGroupList(String value) {
    insuranceBasicVehicleGroupList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleGroupList(int index) {
    insuranceBasicVehicleGroupList.removeAt(index);
  }

  void updateInsuranceBasicVehicleGroupListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleGroupList[index] =
        updateFn(_insuranceBasicVehicleGroupList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleGroupList(int index, String value) {
    insuranceBasicVehicleGroupList.insert(index, value);
  }

  String _insuranceBasicVehicleGroup = '';
  String get insuranceBasicVehicleGroup => _insuranceBasicVehicleGroup;
  set insuranceBasicVehicleGroup(String value) {
    _insuranceBasicVehicleGroup = value;
  }

  List<String> _searchInsurerCondition = [];
  List<String> get searchInsurerCondition => _searchInsurerCondition;
  set searchInsurerCondition(List<String> value) {
    _searchInsurerCondition = value;
  }

  void addToSearchInsurerCondition(String value) {
    searchInsurerCondition.add(value);
  }

  void removeFromSearchInsurerCondition(String value) {
    searchInsurerCondition.remove(value);
  }

  void removeAtIndexFromSearchInsurerCondition(int index) {
    searchInsurerCondition.removeAt(index);
  }

  void updateSearchInsurerConditionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerCondition[index] = updateFn(_searchInsurerCondition[index]);
  }

  void insertAtIndexInSearchInsurerCondition(int index, String value) {
    searchInsurerCondition.insert(index, value);
  }

  List<String> _insuranceBasicBrandNameListOriginal = [];
  List<String> get insuranceBasicBrandNameListOriginal =>
      _insuranceBasicBrandNameListOriginal;
  set insuranceBasicBrandNameListOriginal(List<String> value) {
    _insuranceBasicBrandNameListOriginal = value;
  }

  void addToInsuranceBasicBrandNameListOriginal(String value) {
    insuranceBasicBrandNameListOriginal.add(value);
  }

  void removeFromInsuranceBasicBrandNameListOriginal(String value) {
    insuranceBasicBrandNameListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandNameListOriginal(int index) {
    insuranceBasicBrandNameListOriginal.removeAt(index);
  }

  void updateInsuranceBasicBrandNameListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandNameListOriginal[index] =
        updateFn(_insuranceBasicBrandNameListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicBrandNameListOriginal(
      int index, String value) {
    insuranceBasicBrandNameListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicBrandIdListOriginal = [];
  List<String> get insuranceBasicBrandIdListOriginal =>
      _insuranceBasicBrandIdListOriginal;
  set insuranceBasicBrandIdListOriginal(List<String> value) {
    _insuranceBasicBrandIdListOriginal = value;
  }

  void addToInsuranceBasicBrandIdListOriginal(String value) {
    insuranceBasicBrandIdListOriginal.add(value);
  }

  void removeFromInsuranceBasicBrandIdListOriginal(String value) {
    insuranceBasicBrandIdListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandIdListOriginal(int index) {
    insuranceBasicBrandIdListOriginal.removeAt(index);
  }

  void updateInsuranceBasicBrandIdListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandIdListOriginal[index] =
        updateFn(_insuranceBasicBrandIdListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicBrandIdListOriginal(
      int index, String value) {
    insuranceBasicBrandIdListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicVehicleGroupBrandList = [];
  List<String> get insuranceBasicVehicleGroupBrandList =>
      _insuranceBasicVehicleGroupBrandList;
  set insuranceBasicVehicleGroupBrandList(List<String> value) {
    _insuranceBasicVehicleGroupBrandList = value;
  }

  void addToInsuranceBasicVehicleGroupBrandList(String value) {
    insuranceBasicVehicleGroupBrandList.add(value);
  }

  void removeFromInsuranceBasicVehicleGroupBrandList(String value) {
    insuranceBasicVehicleGroupBrandList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleGroupBrandList(int index) {
    insuranceBasicVehicleGroupBrandList.removeAt(index);
  }

  void updateInsuranceBasicVehicleGroupBrandListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleGroupBrandList[index] =
        updateFn(_insuranceBasicVehicleGroupBrandList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleGroupBrandList(
      int index, String value) {
    insuranceBasicVehicleGroupBrandList.insert(index, value);
  }

  String _insuranceInfoPage5QuotationType = '';
  String get insuranceInfoPage5QuotationType =>
      _insuranceInfoPage5QuotationType;
  set insuranceInfoPage5QuotationType(String value) {
    _insuranceInfoPage5QuotationType = value;
  }

  String _insuranceBasicCarTypeContain = '';
  String get insuranceBasicCarTypeContain => _insuranceBasicCarTypeContain;
  set insuranceBasicCarTypeContain(String value) {
    _insuranceBasicCarTypeContain = value;
  }

  List<String> _insuranceBasicCarGroupDetail = [];
  List<String> get insuranceBasicCarGroupDetail =>
      _insuranceBasicCarGroupDetail;
  set insuranceBasicCarGroupDetail(List<String> value) {
    _insuranceBasicCarGroupDetail = value;
  }

  void addToInsuranceBasicCarGroupDetail(String value) {
    insuranceBasicCarGroupDetail.add(value);
  }

  void removeFromInsuranceBasicCarGroupDetail(String value) {
    insuranceBasicCarGroupDetail.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCarGroupDetail(int index) {
    insuranceBasicCarGroupDetail.removeAt(index);
  }

  void updateInsuranceBasicCarGroupDetailAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCarGroupDetail[index] =
        updateFn(_insuranceBasicCarGroupDetail[index]);
  }

  void insertAtIndexInInsuranceBasicCarGroupDetail(int index, String value) {
    insuranceBasicCarGroupDetail.insert(index, value);
  }

  List<String> _insuranceBasicCarDoorList = [];
  List<String> get insuranceBasicCarDoorList => _insuranceBasicCarDoorList;
  set insuranceBasicCarDoorList(List<String> value) {
    _insuranceBasicCarDoorList = value;
  }

  void addToInsuranceBasicCarDoorList(String value) {
    insuranceBasicCarDoorList.add(value);
  }

  void removeFromInsuranceBasicCarDoorList(String value) {
    insuranceBasicCarDoorList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCarDoorList(int index) {
    insuranceBasicCarDoorList.removeAt(index);
  }

  void updateInsuranceBasicCarDoorListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCarDoorList[index] =
        updateFn(_insuranceBasicCarDoorList[index]);
  }

  void insertAtIndexInInsuranceBasicCarDoorList(int index, String value) {
    insuranceBasicCarDoorList.insert(index, value);
  }

  String _insuranceBasicCarTypeDoors = '';
  String get insuranceBasicCarTypeDoors => _insuranceBasicCarTypeDoors;
  set insuranceBasicCarTypeDoors(String value) {
    _insuranceBasicCarTypeDoors = value;
  }

  dynamic _jsonTemp;
  dynamic get jsonTemp => _jsonTemp;
  set jsonTemp(dynamic value) {
    _jsonTemp = value;
  }

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  set isProcessing(bool value) {
    _isProcessing = value;
  }

  bool _homeMenuIsExpanded = true;
  bool get homeMenuIsExpanded => _homeMenuIsExpanded;
  set homeMenuIsExpanded(bool value) {
    _homeMenuIsExpanded = value;
  }

  bool _viewVmiButtonIsOldVmi = false;
  bool get viewVmiButtonIsOldVmi => _viewVmiButtonIsOldVmi;
  set viewVmiButtonIsOldVmi(bool value) {
    _viewVmiButtonIsOldVmi = value;
  }

  bool _isTouchVmiButton = false;
  bool get isTouchVmiButton => _isTouchVmiButton;
  set isTouchVmiButton(bool value) {
    _isTouchVmiButton = value;
  }

  String _renewPaymentType = '';
  String get renewPaymentType => _renewPaymentType;
  set renewPaymentType(String value) {
    _renewPaymentType = value;
  }

  String _renewBranchCode = '';
  String get renewBranchCode => _renewBranchCode;
  set renewBranchCode(String value) {
    _renewBranchCode = value;
  }

  String _renewBranchName = '';
  String get renewBranchName => _renewBranchName;
  set renewBranchName(String value) {
    _renewBranchName = value;
  }

  dynamic _jsonDataRenew;
  dynamic get jsonDataRenew => _jsonDataRenew;
  set jsonDataRenew(dynamic value) {
    _jsonDataRenew = value;
  }

  String _flagRenew = '';
  String get flagRenew => _flagRenew;
  set flagRenew(String value) {
    _flagRenew = value;
  }

  bool _nonePackageOldVmiFlag = false;
  bool get nonePackageOldVmiFlag => _nonePackageOldVmiFlag;
  set nonePackageOldVmiFlag(bool value) {
    _nonePackageOldVmiFlag = value;
  }

  String _insuranceinfoActType = 'NONECMI';
  String get insuranceinfoActType => _insuranceinfoActType;
  set insuranceinfoActType(String value) {
    _insuranceinfoActType = value;
  }

  String _actCarType = '';
  String get actCarType => _actCarType;
  set actCarType(String value) {
    _actCarType = value;
  }

  String _actCoverType = '';
  String get actCoverType => _actCoverType;
  set actCoverType(String value) {
    _actCoverType = value;
  }

  String _actActAmount = '';
  String get actActAmount => _actActAmount;
  set actActAmount(String value) {
    _actActAmount = value;
  }

  String _actCoverTypeName = '';
  String get actCoverTypeName => _actCoverTypeName;
  set actCoverTypeName(String value) {
    _actCoverTypeName = value;
  }

  bool _actSelected = false;
  bool get actSelected => _actSelected;
  set actSelected(bool value) {
    _actSelected = value;
  }

  String _insuranceinfoActAmountNet = '';
  String get insuranceinfoActAmountNet => _insuranceinfoActAmountNet;
  set insuranceinfoActAmountNet(String value) {
    _insuranceinfoActAmountNet = value;
  }

  bool _insuranceRequestIsLoadDataMc = false;
  bool get insuranceRequestIsLoadDataMc => _insuranceRequestIsLoadDataMc;
  set insuranceRequestIsLoadDataMc(bool value) {
    _insuranceRequestIsLoadDataMc = value;
  }

  String _searchPackageSubProduct = '';
  String get searchPackageSubProduct => _searchPackageSubProduct;
  set searchPackageSubProduct(String value) {
    _searchPackageSubProduct = value;
  }

  String _apiUrlCmiAppState = 'api_url_cmi';
  String get apiUrlCmiAppState => _apiUrlCmiAppState;
  set apiUrlCmiAppState(String value) {
    _apiUrlCmiAppState = value;
  }

  DocumentReference? _generaliContentDocRef =
      FirebaseFirestore.instance.doc('/hideInAppContent/n7wRJ5Xq8tuMSZYbfdfs');
  DocumentReference? get generaliContentDocRef => _generaliContentDocRef;
  set generaliContentDocRef(DocumentReference? value) {
    _generaliContentDocRef = value;
  }

  DocumentReference? _cmiContentDocRef =
      FirebaseFirestore.instance.doc('/hideInAppContent/dqncRBs7SdkCP4UetgIZ');
  DocumentReference? get cmiContentDocRef => _cmiContentDocRef;
  set cmiContentDocRef(DocumentReference? value) {
    _cmiContentDocRef = value;
  }

  List<String> _searchcc = [];
  List<String> get searchcc => _searchcc;
  set searchcc(List<String> value) {
    _searchcc = value;
  }

  void addToSearchcc(String value) {
    searchcc.add(value);
  }

  void removeFromSearchcc(String value) {
    searchcc.remove(value);
  }

  void removeAtIndexFromSearchcc(int index) {
    searchcc.removeAt(index);
  }

  void updateSearchccAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchcc[index] = updateFn(_searchcc[index]);
  }

  void insertAtIndexInSearchcc(int index, String value) {
    searchcc.insert(index, value);
  }

  String _insuranceinfoQuotationTypeName = '';
  String get insuranceinfoQuotationTypeName => _insuranceinfoQuotationTypeName;
  set insuranceinfoQuotationTypeName(String value) {
    _insuranceinfoQuotationTypeName = value;
  }

  String _insuranceinfoQuotationTypeBakName = '';
  String get insuranceinfoQuotationTypeBakName =>
      _insuranceinfoQuotationTypeBakName;
  set insuranceinfoQuotationTypeBakName(String value) {
    _insuranceinfoQuotationTypeBakName = value;
  }

  String _insuranceinfoSubProductName = '';
  String get insuranceinfoSubProductName => _insuranceinfoSubProductName;
  set insuranceinfoSubProductName(String value) {
    _insuranceinfoSubProductName = value;
  }

  String _page5RefundRemark = '';
  String get page5RefundRemark => _page5RefundRemark;
  set page5RefundRemark(String value) {
    _page5RefundRemark = value;
  }

  String _insuranceInfoQuotationType = '';
  String get insuranceInfoQuotationType => _insuranceInfoQuotationType;
  set insuranceInfoQuotationType(String value) {
    _insuranceInfoQuotationType = value;
  }

  DocumentReference? _insurerConfig2InactiveInsurer =
      FirebaseFirestore.instance.doc('/InsurerConfig2/hvT7Gz16JBaY3J2HE4SW');
  DocumentReference? get insurerConfig2InactiveInsurer =>
      _insurerConfig2InactiveInsurer;
  set insurerConfig2InactiveInsurer(DocumentReference? value) {
    _insurerConfig2InactiveInsurer = value;
  }

  String _InsuranceInfoVedioCallUrl = '';
  String get InsuranceInfoVedioCallUrl => _InsuranceInfoVedioCallUrl;
  set InsuranceInfoVedioCallUrl(String value) {
    _InsuranceInfoVedioCallUrl = value;
  }

  String _InsuranceInfoVedioCallFile = '';
  String get InsuranceInfoVedioCallFile => _InsuranceInfoVedioCallFile;
  set InsuranceInfoVedioCallFile(String value) {
    _InsuranceInfoVedioCallFile = value;
  }

  String _licenseSelectBeforeStep1 = '';
  String get licenseSelectBeforeStep1 => _licenseSelectBeforeStep1;
  set licenseSelectBeforeStep1(String value) {
    _licenseSelectBeforeStep1 = value;
  }

  bool _isShowVideoCall = false;
  bool get isShowVideoCall => _isShowVideoCall;
  set isShowVideoCall(bool value) {
    _isShowVideoCall = value;
  }

  bool _isOpenAndroidTableauBrowser = true;
  bool get isOpenAndroidTableauBrowser => _isOpenAndroidTableauBrowser;
  set isOpenAndroidTableauBrowser(bool value) {
    _isOpenAndroidTableauBrowser = value;
  }

  DocumentReference? _hideContentTableauDocRef =
      FirebaseFirestore.instance.doc('/hideInAppContent/nCJPSG8ZMj2bNB5CehIX');
  DocumentReference? get hideContentTableauDocRef => _hideContentTableauDocRef;
  set hideContentTableauDocRef(DocumentReference? value) {
    _hideContentTableauDocRef = value;
  }

  List<DriverDataStruct> _DriverList = [];
  List<DriverDataStruct> get DriverList => _DriverList;
  set DriverList(List<DriverDataStruct> value) {
    _DriverList = value;
  }

  void addToDriverList(DriverDataStruct value) {
    DriverList.add(value);
  }

  void removeFromDriverList(DriverDataStruct value) {
    DriverList.remove(value);
  }

  void removeAtIndexFromDriverList(int index) {
    DriverList.removeAt(index);
  }

  void updateDriverListAtIndex(
    int index,
    DriverDataStruct Function(DriverDataStruct) updateFn,
  ) {
    DriverList[index] = updateFn(_DriverList[index]);
  }

  void insertAtIndexInDriverList(int index, DriverDataStruct value) {
    DriverList.insert(index, value);
  }

  bool _insuranceRequestisLoadDataEV = false;
  bool get insuranceRequestisLoadDataEV => _insuranceRequestisLoadDataEV;
  set insuranceRequestisLoadDataEV(bool value) {
    _insuranceRequestisLoadDataEV = value;
  }

  String _insuranceInfoApplicationId = '';
  String get insuranceInfoApplicationId => _insuranceInfoApplicationId;
  set insuranceInfoApplicationId(String value) {
    _insuranceInfoApplicationId = value;
  }

  String _insuranceInfoEvFlag = '';
  String get insuranceInfoEvFlag => _insuranceInfoEvFlag;
  set insuranceInfoEvFlag(String value) {
    _insuranceInfoEvFlag = value;
  }

  int _loopCountTemp = 0;
  int get loopCountTemp => _loopCountTemp;
  set loopCountTemp(int value) {
    _loopCountTemp = value;
  }

  List<String> _titleDriverList = [];
  List<String> get titleDriverList => _titleDriverList;
  set titleDriverList(List<String> value) {
    _titleDriverList = value;
  }

  void addToTitleDriverList(String value) {
    titleDriverList.add(value);
  }

  void removeFromTitleDriverList(String value) {
    titleDriverList.remove(value);
  }

  void removeAtIndexFromTitleDriverList(int index) {
    titleDriverList.removeAt(index);
  }

  void updateTitleDriverListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    titleDriverList[index] = updateFn(_titleDriverList[index]);
  }

  void insertAtIndexInTitleDriverList(int index, String value) {
    titleDriverList.insert(index, value);
  }

  String _searchPackageEvFlag = '';
  String get searchPackageEvFlag => _searchPackageEvFlag;
  set searchPackageEvFlag(String value) {
    _searchPackageEvFlag = value;
  }

  String _insuranceInfoBatteryNumber1 = '';
  String get insuranceInfoBatteryNumber1 => _insuranceInfoBatteryNumber1;
  set insuranceInfoBatteryNumber1(String value) {
    _insuranceInfoBatteryNumber1 = value;
  }

  String _insuranceInfoBatteryNumber2 = '';
  String get insuranceInfoBatteryNumber2 => _insuranceInfoBatteryNumber2;
  set insuranceInfoBatteryNumber2(String value) {
    _insuranceInfoBatteryNumber2 = value;
  }

  String _insuranceInfoWallChargerNumber = '';
  String get insuranceInfoWallChargerNumber => _insuranceInfoWallChargerNumber;
  set insuranceInfoWallChargerNumber(String value) {
    _insuranceInfoWallChargerNumber = value;
  }

  String _insuranceInfoHorsePower = '';
  String get insuranceInfoHorsePower => _insuranceInfoHorsePower;
  set insuranceInfoHorsePower(String value) {
    _insuranceInfoHorsePower = value;
  }

  String _nonePackageYearChrist = '';
  String get nonePackageYearChrist => _nonePackageYearChrist;
  set nonePackageYearChrist(String value) {
    _nonePackageYearChrist = value;
  }

  bool _isCorporate = false;
  bool get isCorporate => _isCorporate;
  set isCorporate(bool value) {
    _isCorporate = value;
  }

  String _tempVariable = '';
  String get tempVariable => _tempVariable;
  set tempVariable(String value) {
    _tempVariable = value;
  }

  List<String> _searchInsurerInsurershortname = [];
  List<String> get searchInsurerInsurershortname =>
      _searchInsurerInsurershortname;
  set searchInsurerInsurershortname(List<String> value) {
    _searchInsurerInsurershortname = value;
  }

  void addToSearchInsurerInsurershortname(String value) {
    searchInsurerInsurershortname.add(value);
  }

  void removeFromSearchInsurerInsurershortname(String value) {
    searchInsurerInsurershortname.remove(value);
  }

  void removeAtIndexFromSearchInsurerInsurershortname(int index) {
    searchInsurerInsurershortname.removeAt(index);
  }

  void updateSearchInsurerInsurershortnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerInsurershortname[index] =
        updateFn(_searchInsurerInsurershortname[index]);
  }

  void insertAtIndexInSearchInsurerInsurershortname(int index, String value) {
    searchInsurerInsurershortname.insert(index, value);
  }

  List<String> _searchInsurerInsurername = [];
  List<String> get searchInsurerInsurername => _searchInsurerInsurername;
  set searchInsurerInsurername(List<String> value) {
    _searchInsurerInsurername = value;
  }

  void addToSearchInsurerInsurername(String value) {
    searchInsurerInsurername.add(value);
  }

  void removeFromSearchInsurerInsurername(String value) {
    searchInsurerInsurername.remove(value);
  }

  void removeAtIndexFromSearchInsurerInsurername(int index) {
    searchInsurerInsurername.removeAt(index);
  }

  void updateSearchInsurerInsurernameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerInsurername[index] =
        updateFn(_searchInsurerInsurername[index]);
  }

  void insertAtIndexInSearchInsurerInsurername(int index, String value) {
    searchInsurerInsurername.insert(index, value);
  }

  List<String> _searchInsurerInsurercode = [];
  List<String> get searchInsurerInsurercode => _searchInsurerInsurercode;
  set searchInsurerInsurercode(List<String> value) {
    _searchInsurerInsurercode = value;
  }

  void addToSearchInsurerInsurercode(String value) {
    searchInsurerInsurercode.add(value);
  }

  void removeFromSearchInsurerInsurercode(String value) {
    searchInsurerInsurercode.remove(value);
  }

  void removeAtIndexFromSearchInsurerInsurercode(int index) {
    searchInsurerInsurercode.removeAt(index);
  }

  void updateSearchInsurerInsurercodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerInsurercode[index] =
        updateFn(_searchInsurerInsurercode[index]);
  }

  void insertAtIndexInSearchInsurerInsurercode(int index, String value) {
    searchInsurerInsurercode.insert(index, value);
  }

  List<String> _searchInsurerCompanyid = [];
  List<String> get searchInsurerCompanyid => _searchInsurerCompanyid;
  set searchInsurerCompanyid(List<String> value) {
    _searchInsurerCompanyid = value;
  }

  void addToSearchInsurerCompanyid(String value) {
    searchInsurerCompanyid.add(value);
  }

  void removeFromSearchInsurerCompanyid(String value) {
    searchInsurerCompanyid.remove(value);
  }

  void removeAtIndexFromSearchInsurerCompanyid(int index) {
    searchInsurerCompanyid.removeAt(index);
  }

  void updateSearchInsurerCompanyidAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerCompanyid[index] = updateFn(_searchInsurerCompanyid[index]);
  }

  void insertAtIndexInSearchInsurerCompanyid(int index, String value) {
    searchInsurerCompanyid.insert(index, value);
  }

  List<String> _searchInsurerLogo = [];
  List<String> get searchInsurerLogo => _searchInsurerLogo;
  set searchInsurerLogo(List<String> value) {
    _searchInsurerLogo = value;
  }

  void addToSearchInsurerLogo(String value) {
    searchInsurerLogo.add(value);
  }

  void removeFromSearchInsurerLogo(String value) {
    searchInsurerLogo.remove(value);
  }

  void removeAtIndexFromSearchInsurerLogo(int index) {
    searchInsurerLogo.removeAt(index);
  }

  void updateSearchInsurerLogoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerLogo[index] = updateFn(_searchInsurerLogo[index]);
  }

  void insertAtIndexInSearchInsurerLogo(int index, String value) {
    searchInsurerLogo.insert(index, value);
  }

  List<String> _searchInsurerCovertypelist = [];
  List<String> get searchInsurerCovertypelist => _searchInsurerCovertypelist;
  set searchInsurerCovertypelist(List<String> value) {
    _searchInsurerCovertypelist = value;
  }

  void addToSearchInsurerCovertypelist(String value) {
    searchInsurerCovertypelist.add(value);
  }

  void removeFromSearchInsurerCovertypelist(String value) {
    searchInsurerCovertypelist.remove(value);
  }

  void removeAtIndexFromSearchInsurerCovertypelist(int index) {
    searchInsurerCovertypelist.removeAt(index);
  }

  void updateSearchInsurerCovertypelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerCovertypelist[index] =
        updateFn(_searchInsurerCovertypelist[index]);
  }

  void insertAtIndexInSearchInsurerCovertypelist(int index, String value) {
    searchInsurerCovertypelist.insert(index, value);
  }

  List<String> _searchInsurerGaragetypelist = [];
  List<String> get searchInsurerGaragetypelist => _searchInsurerGaragetypelist;
  set searchInsurerGaragetypelist(List<String> value) {
    _searchInsurerGaragetypelist = value;
  }

  void addToSearchInsurerGaragetypelist(String value) {
    searchInsurerGaragetypelist.add(value);
  }

  void removeFromSearchInsurerGaragetypelist(String value) {
    searchInsurerGaragetypelist.remove(value);
  }

  void removeAtIndexFromSearchInsurerGaragetypelist(int index) {
    searchInsurerGaragetypelist.removeAt(index);
  }

  void updateSearchInsurerGaragetypelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerGaragetypelist[index] =
        updateFn(_searchInsurerGaragetypelist[index]);
  }

  void insertAtIndexInSearchInsurerGaragetypelist(int index, String value) {
    searchInsurerGaragetypelist.insert(index, value);
  }

  List<String> _searchInsurerMaxnetpremium = [];
  List<String> get searchInsurerMaxnetpremium => _searchInsurerMaxnetpremium;
  set searchInsurerMaxnetpremium(List<String> value) {
    _searchInsurerMaxnetpremium = value;
  }

  void addToSearchInsurerMaxnetpremium(String value) {
    searchInsurerMaxnetpremium.add(value);
  }

  void removeFromSearchInsurerMaxnetpremium(String value) {
    searchInsurerMaxnetpremium.remove(value);
  }

  void removeAtIndexFromSearchInsurerMaxnetpremium(int index) {
    searchInsurerMaxnetpremium.removeAt(index);
  }

  void updateSearchInsurerMaxnetpremiumAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerMaxnetpremium[index] =
        updateFn(_searchInsurerMaxnetpremium[index]);
  }

  void insertAtIndexInSearchInsurerMaxnetpremium(int index, String value) {
    searchInsurerMaxnetpremium.insert(index, value);
  }

  List<String> _searchInsurerMinnetpremium = [];
  List<String> get searchInsurerMinnetpremium => _searchInsurerMinnetpremium;
  set searchInsurerMinnetpremium(List<String> value) {
    _searchInsurerMinnetpremium = value;
  }

  void addToSearchInsurerMinnetpremium(String value) {
    searchInsurerMinnetpremium.add(value);
  }

  void removeFromSearchInsurerMinnetpremium(String value) {
    searchInsurerMinnetpremium.remove(value);
  }

  void removeAtIndexFromSearchInsurerMinnetpremium(int index) {
    searchInsurerMinnetpremium.removeAt(index);
  }

  void updateSearchInsurerMinnetpremiumAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerMinnetpremium[index] =
        updateFn(_searchInsurerMinnetpremium[index]);
  }

  void insertAtIndexInSearchInsurerMinnetpremium(int index, String value) {
    searchInsurerMinnetpremium.insert(index, value);
  }

  List<String> _searchInsurerMaxsuminsured = [];
  List<String> get searchInsurerMaxsuminsured => _searchInsurerMaxsuminsured;
  set searchInsurerMaxsuminsured(List<String> value) {
    _searchInsurerMaxsuminsured = value;
  }

  void addToSearchInsurerMaxsuminsured(String value) {
    searchInsurerMaxsuminsured.add(value);
  }

  void removeFromSearchInsurerMaxsuminsured(String value) {
    searchInsurerMaxsuminsured.remove(value);
  }

  void removeAtIndexFromSearchInsurerMaxsuminsured(int index) {
    searchInsurerMaxsuminsured.removeAt(index);
  }

  void updateSearchInsurerMaxsuminsuredAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerMaxsuminsured[index] =
        updateFn(_searchInsurerMaxsuminsured[index]);
  }

  void insertAtIndexInSearchInsurerMaxsuminsured(int index, String value) {
    searchInsurerMaxsuminsured.insert(index, value);
  }

  List<String> _searchInsurerMinsuminsured = [];
  List<String> get searchInsurerMinsuminsured => _searchInsurerMinsuminsured;
  set searchInsurerMinsuminsured(List<String> value) {
    _searchInsurerMinsuminsured = value;
  }

  void addToSearchInsurerMinsuminsured(String value) {
    searchInsurerMinsuminsured.add(value);
  }

  void removeFromSearchInsurerMinsuminsured(String value) {
    searchInsurerMinsuminsured.remove(value);
  }

  void removeAtIndexFromSearchInsurerMinsuminsured(int index) {
    searchInsurerMinsuminsured.removeAt(index);
  }

  void updateSearchInsurerMinsuminsuredAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInsurerMinsuminsured[index] =
        updateFn(_searchInsurerMinsuminsured[index]);
  }

  void insertAtIndexInSearchInsurerMinsuminsured(int index, String value) {
    searchInsurerMinsuminsured.insert(index, value);
  }

  List<String> _searchCarlost = [];
  List<String> get searchCarlost => _searchCarlost;
  set searchCarlost(List<String> value) {
    _searchCarlost = value;
  }

  void addToSearchCarlost(String value) {
    searchCarlost.add(value);
  }

  void removeFromSearchCarlost(String value) {
    searchCarlost.remove(value);
  }

  void removeAtIndexFromSearchCarlost(int index) {
    searchCarlost.removeAt(index);
  }

  void updateSearchCarlostAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchCarlost[index] = updateFn(_searchCarlost[index]);
  }

  void insertAtIndexInSearchCarlost(int index, String value) {
    searchCarlost.insert(index, value);
  }

  List<String> _searchMotoraddon = [];
  List<String> get searchMotoraddon => _searchMotoraddon;
  set searchMotoraddon(List<String> value) {
    _searchMotoraddon = value;
  }

  void addToSearchMotoraddon(String value) {
    searchMotoraddon.add(value);
  }

  void removeFromSearchMotoraddon(String value) {
    searchMotoraddon.remove(value);
  }

  void removeAtIndexFromSearchMotoraddon(int index) {
    searchMotoraddon.removeAt(index);
  }

  void updateSearchMotoraddonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchMotoraddon[index] = updateFn(_searchMotoraddon[index]);
  }

  void insertAtIndexInSearchMotoraddon(int index, String value) {
    searchMotoraddon.insert(index, value);
  }

  List<String> _searchDriverbehavior = [];
  List<String> get searchDriverbehavior => _searchDriverbehavior;
  set searchDriverbehavior(List<String> value) {
    _searchDriverbehavior = value;
  }

  void addToSearchDriverbehavior(String value) {
    searchDriverbehavior.add(value);
  }

  void removeFromSearchDriverbehavior(String value) {
    searchDriverbehavior.remove(value);
  }

  void removeAtIndexFromSearchDriverbehavior(int index) {
    searchDriverbehavior.removeAt(index);
  }

  void updateSearchDriverbehaviorAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchDriverbehavior[index] = updateFn(_searchDriverbehavior[index]);
  }

  void insertAtIndexInSearchDriverbehavior(int index, String value) {
    searchDriverbehavior.insert(index, value);
  }

  String _sliderMinGrossTotal = '1000';
  String get sliderMinGrossTotal => _sliderMinGrossTotal;
  set sliderMinGrossTotal(String value) {
    _sliderMinGrossTotal = value;
  }

  String _sliderMaxGrossTotal = '50000';
  String get sliderMaxGrossTotal => _sliderMaxGrossTotal;
  set sliderMaxGrossTotal(String value) {
    _sliderMaxGrossTotal = value;
  }

  String _sliderMinSumInsured = '0';
  String get sliderMinSumInsured => _sliderMinSumInsured;
  set sliderMinSumInsured(String value) {
    _sliderMinSumInsured = value;
  }

  String _sliderMaxSumInsured = '1000000';
  String get sliderMaxSumInsured => _sliderMaxSumInsured;
  set sliderMaxSumInsured(String value) {
    _sliderMaxSumInsured = value;
  }

  bool _inShowPackageCard = false;
  bool get inShowPackageCard => _inShowPackageCard;
  set inShowPackageCard(bool value) {
    _inShowPackageCard = value;
  }

  List<String> _listNonType1 = [];
  List<String> get listNonType1 => _listNonType1;
  set listNonType1(List<String> value) {
    _listNonType1 = value;
  }

  void addToListNonType1(String value) {
    listNonType1.add(value);
  }

  void removeFromListNonType1(String value) {
    listNonType1.remove(value);
  }

  void removeAtIndexFromListNonType1(int index) {
    listNonType1.removeAt(index);
  }

  void updateListNonType1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listNonType1[index] = updateFn(_listNonType1[index]);
  }

  void insertAtIndexInListNonType1(int index, String value) {
    listNonType1.insert(index, value);
  }

  List<String> _listType1 = ['VMI1'];
  List<String> get listType1 => _listType1;
  set listType1(List<String> value) {
    _listType1 = value;
  }

  void addToListType1(String value) {
    listType1.add(value);
  }

  void removeFromListType1(String value) {
    listType1.remove(value);
  }

  void removeAtIndexFromListType1(int index) {
    listType1.removeAt(index);
  }

  void updateListType1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listType1[index] = updateFn(_listType1[index]);
  }

  void insertAtIndexInListType1(int index, String value) {
    listType1.insert(index, value);
  }

  List<bool> _isShowPackageCardList1 = [];
  List<bool> get isShowPackageCardList1 => _isShowPackageCardList1;
  set isShowPackageCardList1(List<bool> value) {
    _isShowPackageCardList1 = value;
  }

  void addToIsShowPackageCardList1(bool value) {
    isShowPackageCardList1.add(value);
  }

  void removeFromIsShowPackageCardList1(bool value) {
    isShowPackageCardList1.remove(value);
  }

  void removeAtIndexFromIsShowPackageCardList1(int index) {
    isShowPackageCardList1.removeAt(index);
  }

  void updateIsShowPackageCardList1AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    isShowPackageCardList1[index] = updateFn(_isShowPackageCardList1[index]);
  }

  void insertAtIndexInIsShowPackageCardList1(int index, bool value) {
    isShowPackageCardList1.insert(index, value);
  }

  String _sliderCurrentMinValueGross = '1000';
  String get sliderCurrentMinValueGross => _sliderCurrentMinValueGross;
  set sliderCurrentMinValueGross(String value) {
    _sliderCurrentMinValueGross = value;
  }

  String _sliderCurrentMaxValueGross = '50000';
  String get sliderCurrentMaxValueGross => _sliderCurrentMaxValueGross;
  set sliderCurrentMaxValueGross(String value) {
    _sliderCurrentMaxValueGross = value;
  }

  String _sliderCurrentMinSumInsured = '0';
  String get sliderCurrentMinSumInsured => _sliderCurrentMinSumInsured;
  set sliderCurrentMinSumInsured(String value) {
    _sliderCurrentMinSumInsured = value;
  }

  String _sliderCurrentMaxSumInsured = '1000000';
  String get sliderCurrentMaxSumInsured => _sliderCurrentMaxSumInsured;
  set sliderCurrentMaxSumInsured(String value) {
    _sliderCurrentMaxSumInsured = value;
  }

  String _sliderMinGrossPage2 = '1000';
  String get sliderMinGrossPage2 => _sliderMinGrossPage2;
  set sliderMinGrossPage2(String value) {
    _sliderMinGrossPage2 = value;
  }

  String _sliderMaxGrossPage2 = '10000';
  String get sliderMaxGrossPage2 => _sliderMaxGrossPage2;
  set sliderMaxGrossPage2(String value) {
    _sliderMaxGrossPage2 = value;
  }

  String _sliderMinSumInsuredPage2 = '0';
  String get sliderMinSumInsuredPage2 => _sliderMinSumInsuredPage2;
  set sliderMinSumInsuredPage2(String value) {
    _sliderMinSumInsuredPage2 = value;
  }

  String _sliderMaxSumInsuredPage2 = '1000000';
  String get sliderMaxSumInsuredPage2 => _sliderMaxSumInsuredPage2;
  set sliderMaxSumInsuredPage2(String value) {
    _sliderMaxSumInsuredPage2 = value;
  }

  String _sliderCurrentMinGrossPage2 = '1000';
  String get sliderCurrentMinGrossPage2 => _sliderCurrentMinGrossPage2;
  set sliderCurrentMinGrossPage2(String value) {
    _sliderCurrentMinGrossPage2 = value;
  }

  String _sliderCurrentMaxGrossPage2 = '10000';
  String get sliderCurrentMaxGrossPage2 => _sliderCurrentMaxGrossPage2;
  set sliderCurrentMaxGrossPage2(String value) {
    _sliderCurrentMaxGrossPage2 = value;
  }

  String _sliderCurrentMinSumInsuredPage2 = '0';
  String get sliderCurrentMinSumInsuredPage2 =>
      _sliderCurrentMinSumInsuredPage2;
  set sliderCurrentMinSumInsuredPage2(String value) {
    _sliderCurrentMinSumInsuredPage2 = value;
  }

  String _sliderCurrentMaxSumInsuredPage2 = '1000000';
  String get sliderCurrentMaxSumInsuredPage2 =>
      _sliderCurrentMaxSumInsuredPage2;
  set sliderCurrentMaxSumInsuredPage2(String value) {
    _sliderCurrentMaxSumInsuredPage2 = value;
  }

  String _sliderMinGrossPage3 = '1000';
  String get sliderMinGrossPage3 => _sliderMinGrossPage3;
  set sliderMinGrossPage3(String value) {
    _sliderMinGrossPage3 = value;
  }

  String _sliderMaxGrossPage3 = '10000';
  String get sliderMaxGrossPage3 => _sliderMaxGrossPage3;
  set sliderMaxGrossPage3(String value) {
    _sliderMaxGrossPage3 = value;
  }

  String _sliderMinSumInsuredPage3 = '0';
  String get sliderMinSumInsuredPage3 => _sliderMinSumInsuredPage3;
  set sliderMinSumInsuredPage3(String value) {
    _sliderMinSumInsuredPage3 = value;
  }

  String _sliderMaxSumInsuredPage3 = '1000000';
  String get sliderMaxSumInsuredPage3 => _sliderMaxSumInsuredPage3;
  set sliderMaxSumInsuredPage3(String value) {
    _sliderMaxSumInsuredPage3 = value;
  }

  String _sliderCurrentMinGrossPage3 = '1000';
  String get sliderCurrentMinGrossPage3 => _sliderCurrentMinGrossPage3;
  set sliderCurrentMinGrossPage3(String value) {
    _sliderCurrentMinGrossPage3 = value;
  }

  String _sliderCurrentMaxGrossPage3 = '10000';
  String get sliderCurrentMaxGrossPage3 => _sliderCurrentMaxGrossPage3;
  set sliderCurrentMaxGrossPage3(String value) {
    _sliderCurrentMaxGrossPage3 = value;
  }

  String _sliderCurrentMinSumInsuredPage3 = '0';
  String get sliderCurrentMinSumInsuredPage3 =>
      _sliderCurrentMinSumInsuredPage3;
  set sliderCurrentMinSumInsuredPage3(String value) {
    _sliderCurrentMinSumInsuredPage3 = value;
  }

  String _sliderCurrentMaxSumInsuredPage3 = '1000000';
  String get sliderCurrentMaxSumInsuredPage3 =>
      _sliderCurrentMaxSumInsuredPage3;
  set sliderCurrentMaxSumInsuredPage3(String value) {
    _sliderCurrentMaxSumInsuredPage3 = value;
  }

  String _insuranceInfoPage4FileCancelLoan = '';
  String get insuranceInfoPage4FileCancelLoan =>
      _insuranceInfoPage4FileCancelLoan;
  set insuranceInfoPage4FileCancelLoan(String value) {
    _insuranceInfoPage4FileCancelLoan = value;
  }

  String _InsuranceInfoPage4PowerOfAttoney = '';
  String get InsuranceInfoPage4PowerOfAttoney =>
      _InsuranceInfoPage4PowerOfAttoney;
  set InsuranceInfoPage4PowerOfAttoney(String value) {
    _InsuranceInfoPage4PowerOfAttoney = value;
  }

  String _insuranceInfoPage4IdCardPowerattorney = '';
  String get insuranceInfoPage4IdCardPowerattorney =>
      _insuranceInfoPage4IdCardPowerattorney;
  set insuranceInfoPage4IdCardPowerattorney(String value) {
    _insuranceInfoPage4IdCardPowerattorney = value;
  }

  bool _haveSeatinPackage = false;
  bool get haveSeatinPackage => _haveSeatinPackage;
  set haveSeatinPackage(bool value) {
    _haveSeatinPackage = value;
  }

  UserProfileModelStruct _userProfileData = UserProfileModelStruct();
  UserProfileModelStruct get userProfileData => _userProfileData;
  set userProfileData(UserProfileModelStruct value) {
    _userProfileData = value;
  }

  void updateUserProfileDataStruct(Function(UserProfileModelStruct) updateFn) {
    updateFn(_userProfileData);
  }

  FireInsuranceSearchPackageDataStruct _fireInsuranceSearchPackageData =
      FireInsuranceSearchPackageDataStruct();
  FireInsuranceSearchPackageDataStruct get fireInsuranceSearchPackageData =>
      _fireInsuranceSearchPackageData;
  set fireInsuranceSearchPackageData(
      FireInsuranceSearchPackageDataStruct value) {
    _fireInsuranceSearchPackageData = value;
  }

  void updateFireInsuranceSearchPackageDataStruct(
      Function(FireInsuranceSearchPackageDataStruct) updateFn) {
    updateFn(_fireInsuranceSearchPackageData);
  }

  HouseCalEstimatedModelStruct _calEstimatedData =
      HouseCalEstimatedModelStruct();
  HouseCalEstimatedModelStruct get calEstimatedData => _calEstimatedData;
  set calEstimatedData(HouseCalEstimatedModelStruct value) {
    _calEstimatedData = value;
  }

  void updateCalEstimatedDataStruct(
      Function(HouseCalEstimatedModelStruct) updateFn) {
    updateFn(_calEstimatedData);
  }

  DocumentReference? _KeyStorageProdDocRef =
      FirebaseFirestore.instance.doc('/Key_Storage/ZRFrQlF71fd8Hq36FOuR');
  DocumentReference? get KeyStorageProdDocRef => _KeyStorageProdDocRef;
  set KeyStorageProdDocRef(DocumentReference? value) {
    _KeyStorageProdDocRef = value;
  }

  DocumentReference? _KeyStorageUatDocRef =
      FirebaseFirestore.instance.doc('/Key_Storage3/5zyDv5qIAJuNGeMvfsJr');
  DocumentReference? get KeyStorageUatDocRef => _KeyStorageUatDocRef;
  set KeyStorageUatDocRef(DocumentReference? value) {
    _KeyStorageUatDocRef = value;
  }

  List<LeadsHouseStruct> _leadsHouse = [];
  List<LeadsHouseStruct> get leadsHouse => _leadsHouse;
  set leadsHouse(List<LeadsHouseStruct> value) {
    _leadsHouse = value;
  }

  void addToLeadsHouse(LeadsHouseStruct value) {
    leadsHouse.add(value);
  }

  void removeFromLeadsHouse(LeadsHouseStruct value) {
    leadsHouse.remove(value);
  }

  void removeAtIndexFromLeadsHouse(int index) {
    leadsHouse.removeAt(index);
  }

  void updateLeadsHouseAtIndex(
    int index,
    LeadsHouseStruct Function(LeadsHouseStruct) updateFn,
  ) {
    leadsHouse[index] = updateFn(_leadsHouse[index]);
  }

  void insertAtIndexInLeadsHouse(int index, LeadsHouseStruct value) {
    leadsHouse.insert(index, value);
  }

  List<BenefitorModelStruct> _benefitorData = [];
  List<BenefitorModelStruct> get benefitorData => _benefitorData;
  set benefitorData(List<BenefitorModelStruct> value) {
    _benefitorData = value;
  }

  void addToBenefitorData(BenefitorModelStruct value) {
    benefitorData.add(value);
  }

  void removeFromBenefitorData(BenefitorModelStruct value) {
    benefitorData.remove(value);
  }

  void removeAtIndexFromBenefitorData(int index) {
    benefitorData.removeAt(index);
  }

  void updateBenefitorDataAtIndex(
    int index,
    BenefitorModelStruct Function(BenefitorModelStruct) updateFn,
  ) {
    benefitorData[index] = updateFn(_benefitorData[index]);
  }

  void insertAtIndexInBenefitorData(int index, BenefitorModelStruct value) {
    benefitorData.insert(index, value);
  }

  List<LeadsDetailHouseStruct> _leadsDetailHouse = [];
  List<LeadsDetailHouseStruct> get leadsDetailHouse => _leadsDetailHouse;
  set leadsDetailHouse(List<LeadsDetailHouseStruct> value) {
    _leadsDetailHouse = value;
  }

  void addToLeadsDetailHouse(LeadsDetailHouseStruct value) {
    leadsDetailHouse.add(value);
  }

  void removeFromLeadsDetailHouse(LeadsDetailHouseStruct value) {
    leadsDetailHouse.remove(value);
  }

  void removeAtIndexFromLeadsDetailHouse(int index) {
    leadsDetailHouse.removeAt(index);
  }

  void updateLeadsDetailHouseAtIndex(
    int index,
    LeadsDetailHouseStruct Function(LeadsDetailHouseStruct) updateFn,
  ) {
    leadsDetailHouse[index] = updateFn(_leadsDetailHouse[index]);
  }

  void insertAtIndexInLeadsDetailHouse(
      int index, LeadsDetailHouseStruct value) {
    leadsDetailHouse.insert(index, value);
  }

  bool _isTouchFollowUpButton = false;
  bool get isTouchFollowUpButton => _isTouchFollowUpButton;
  set isTouchFollowUpButton(bool value) {
    _isTouchFollowUpButton = value;
  }

  bool _isViewCarFollowUp = false;
  bool get isViewCarFollowUp => _isViewCarFollowUp;
  set isViewCarFollowUp(bool value) {
    _isViewCarFollowUp = value;
  }

  String _insuranceInfoPage4ImageApp2 = '';
  String get insuranceInfoPage4ImageApp2 => _insuranceInfoPage4ImageApp2;
  set insuranceInfoPage4ImageApp2(String value) {
    _insuranceInfoPage4ImageApp2 = value;
  }

  String _insuranceinfoPage1MaximumInsuredPerson = '';
  String get insuranceinfoPage1MaximumInsuredPerson =>
      _insuranceinfoPage1MaximumInsuredPerson;
  set insuranceinfoPage1MaximumInsuredPerson(String value) {
    _insuranceinfoPage1MaximumInsuredPerson = value;
  }

  String _insuranceInfoInspectionExcept = '';
  String get insuranceInfoInspectionExcept => _insuranceInfoInspectionExcept;
  set insuranceInfoInspectionExcept(String value) {
    _insuranceInfoInspectionExcept = value;
  }

  List<String> _searchInspectionExcept = [];
  List<String> get searchInspectionExcept => _searchInspectionExcept;
  set searchInspectionExcept(List<String> value) {
    _searchInspectionExcept = value;
  }

  void addToSearchInspectionExcept(String value) {
    searchInspectionExcept.add(value);
  }

  void removeFromSearchInspectionExcept(String value) {
    searchInspectionExcept.remove(value);
  }

  void removeAtIndexFromSearchInspectionExcept(int index) {
    searchInspectionExcept.removeAt(index);
  }

  void updateSearchInspectionExceptAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchInspectionExcept[index] = updateFn(_searchInspectionExcept[index]);
  }

  void insertAtIndexInSearchInspectionExcept(int index, String value) {
    searchInspectionExcept.insert(index, value);
  }

  String _insuranceinfoOldVMIimage = '';
  String get insuranceinfoOldVMIimage => _insuranceinfoOldVMIimage;
  set insuranceinfoOldVMIimage(String value) {
    _insuranceinfoOldVMIimage = value;
  }

  String _insuranceInfoPage5DocumentURL = '';
  String get insuranceInfoPage5DocumentURL => _insuranceInfoPage5DocumentURL;
  set insuranceInfoPage5DocumentURL(String value) {
    _insuranceInfoPage5DocumentURL = value;
  }

  List<String> _insuranceInfoPage4TenorOverList = [];
  List<String> get insuranceInfoPage4TenorOverList =>
      _insuranceInfoPage4TenorOverList;
  set insuranceInfoPage4TenorOverList(List<String> value) {
    _insuranceInfoPage4TenorOverList = value;
  }

  void addToInsuranceInfoPage4TenorOverList(String value) {
    insuranceInfoPage4TenorOverList.add(value);
  }

  void removeFromInsuranceInfoPage4TenorOverList(String value) {
    insuranceInfoPage4TenorOverList.remove(value);
  }

  void removeAtIndexFromInsuranceInfoPage4TenorOverList(int index) {
    insuranceInfoPage4TenorOverList.removeAt(index);
  }

  void updateInsuranceInfoPage4TenorOverListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceInfoPage4TenorOverList[index] =
        updateFn(_insuranceInfoPage4TenorOverList[index]);
  }

  void insertAtIndexInInsuranceInfoPage4TenorOverList(int index, String value) {
    insuranceInfoPage4TenorOverList.insert(index, value);
  }

  String _insuranceInfoPage4TenorOverSelect = '';
  String get insuranceInfoPage4TenorOverSelect =>
      _insuranceInfoPage4TenorOverSelect;
  set insuranceInfoPage4TenorOverSelect(String value) {
    _insuranceInfoPage4TenorOverSelect = value;
  }

  String _insuranceInfoCoverTypeCode = '';
  String get insuranceInfoCoverTypeCode => _insuranceInfoCoverTypeCode;
  set insuranceInfoCoverTypeCode(String value) {
    _insuranceInfoCoverTypeCode = value;
  }

  List<InstallmentDataTypeStruct> _installmentDataTypeAppState = [];
  List<InstallmentDataTypeStruct> get installmentDataTypeAppState =>
      _installmentDataTypeAppState;
  set installmentDataTypeAppState(List<InstallmentDataTypeStruct> value) {
    _installmentDataTypeAppState = value;
  }

  void addToInstallmentDataTypeAppState(InstallmentDataTypeStruct value) {
    installmentDataTypeAppState.add(value);
  }

  void removeFromInstallmentDataTypeAppState(InstallmentDataTypeStruct value) {
    installmentDataTypeAppState.remove(value);
  }

  void removeAtIndexFromInstallmentDataTypeAppState(int index) {
    installmentDataTypeAppState.removeAt(index);
  }

  void updateInstallmentDataTypeAppStateAtIndex(
    int index,
    InstallmentDataTypeStruct Function(InstallmentDataTypeStruct) updateFn,
  ) {
    installmentDataTypeAppState[index] =
        updateFn(_installmentDataTypeAppState[index]);
  }

  void insertAtIndexInInstallmentDataTypeAppState(
      int index, InstallmentDataTypeStruct value) {
    installmentDataTypeAppState.insert(index, value);
  }

  String _page5amount = '';
  String get page5amount => _page5amount;
  set page5amount(String value) {
    _page5amount = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
