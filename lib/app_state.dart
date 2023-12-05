import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  set accessToken(String _value) {
    _accessToken = _value;
    secureStorage.setString('ff_accessToken', _value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _imei = '123456789012345';
  String get imei => _imei;
  set imei(String _value) {
    _imei = _value;
  }

  String _employeeID = 'employee_id';
  String get employeeID => _employeeID;
  set employeeID(String _value) {
    _employeeID = _value;
    secureStorage.setString('ff_employeeID', _value);
  }

  void deleteEmployeeID() {
    secureStorage.delete(key: 'ff_employeeID');
  }

  String _apiURLLocalState = 'api_url';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String _value) {
    _apiURLLocalState = _value;
    secureStorage.setString('ff_apiURLLocalState', _value);
  }

  void deleteApiURLLocalState() {
    secureStorage.delete(key: 'ff_apiURLLocalState');
  }

  String _branchCode = 'branch_code';
  String get branchCode => _branchCode;
  set branchCode(String _value) {
    _branchCode = _value;
    secureStorage.setString('ff_branchCode', _value);
  }

  void deleteBranchCode() {
    secureStorage.delete(key: 'ff_branchCode');
  }

  List<String> _vloanServerListTemp = [];
  List<String> get vloanServerListTemp => _vloanServerListTemp;
  set vloanServerListTemp(List<String> _value) {
    _vloanServerListTemp = _value;
  }

  void addToVloanServerListTemp(String _value) {
    _vloanServerListTemp.add(_value);
  }

  void removeFromVloanServerListTemp(String _value) {
    _vloanServerListTemp.remove(_value);
  }

  void removeAtIndexFromVloanServerListTemp(int _index) {
    _vloanServerListTemp.removeAt(_index);
  }

  void updateVloanServerListTempAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _vloanServerListTemp[_index] = updateFn(_vloanServerListTemp[_index]);
  }

  void insertAtIndexInVloanServerListTemp(int _index, String _value) {
    _vloanServerListTemp.insert(_index, _value);
  }

  List<String> _leadID = [];
  List<String> get leadID => _leadID;
  set leadID(List<String> _value) {
    _leadID = _value;
  }

  void addToLeadID(String _value) {
    _leadID.add(_value);
  }

  void removeFromLeadID(String _value) {
    _leadID.remove(_value);
  }

  void removeAtIndexFromLeadID(int _index) {
    _leadID.removeAt(_index);
  }

  void updateLeadIDAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadID[_index] = updateFn(_leadID[_index]);
  }

  void insertAtIndexInLeadID(int _index, String _value) {
    _leadID.insert(_index, _value);
  }

  List<DateTime> _leadTimeRemainList = [];
  List<DateTime> get leadTimeRemainList => _leadTimeRemainList;
  set leadTimeRemainList(List<DateTime> _value) {
    _leadTimeRemainList = _value;
  }

  void addToLeadTimeRemainList(DateTime _value) {
    _leadTimeRemainList.add(_value);
  }

  void removeFromLeadTimeRemainList(DateTime _value) {
    _leadTimeRemainList.remove(_value);
  }

  void removeAtIndexFromLeadTimeRemainList(int _index) {
    _leadTimeRemainList.removeAt(_index);
  }

  void updateLeadTimeRemainListAtIndex(
    int _index,
    DateTime Function(DateTime) updateFn,
  ) {
    _leadTimeRemainList[_index] = updateFn(_leadTimeRemainList[_index]);
  }

  void insertAtIndexInLeadTimeRemainList(int _index, DateTime _value) {
    _leadTimeRemainList.insert(_index, _value);
  }

  List<String> _leadCustomerNameList = [];
  List<String> get leadCustomerNameList => _leadCustomerNameList;
  set leadCustomerNameList(List<String> _value) {
    _leadCustomerNameList = _value;
  }

  void addToLeadCustomerNameList(String _value) {
    _leadCustomerNameList.add(_value);
  }

  void removeFromLeadCustomerNameList(String _value) {
    _leadCustomerNameList.remove(_value);
  }

  void removeAtIndexFromLeadCustomerNameList(int _index) {
    _leadCustomerNameList.removeAt(_index);
  }

  void updateLeadCustomerNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCustomerNameList[_index] = updateFn(_leadCustomerNameList[_index]);
  }

  void insertAtIndexInLeadCustomerNameList(int _index, String _value) {
    _leadCustomerNameList.insert(_index, _value);
  }

  String _coachURL = 'https://hris.srisawadpower.com/COACH';
  String get coachURL => _coachURL;
  set coachURL(String _value) {
    _coachURL = _value;
  }

  bool _isInApp = false;
  bool get isInApp => _isInApp;
  set isInApp(bool _value) {
    _isInApp = _value;
  }

  bool _inAppViaNotification = true;
  bool get inAppViaNotification => _inAppViaNotification;
  set inAppViaNotification(bool _value) {
    _inAppViaNotification = _value;
  }

  bool _doNotShowAgain = false;
  bool get doNotShowAgain => _doNotShowAgain;
  set doNotShowAgain(bool _value) {
    _doNotShowAgain = _value;
    secureStorage.setBool('ff_doNotShowAgain', _value);
  }

  void deleteDoNotShowAgain() {
    secureStorage.delete(key: 'ff_doNotShowAgain');
  }

  DateTime? _dateDoNotShowAgain;
  DateTime? get dateDoNotShowAgain => _dateDoNotShowAgain;
  set dateDoNotShowAgain(DateTime? _value) {
    _dateDoNotShowAgain = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_dateDoNotShowAgain', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateDoNotShowAgain');
  }

  void deleteDateDoNotShowAgain() {
    secureStorage.delete(key: 'ff_dateDoNotShowAgain');
  }

  bool _check = false;
  bool get check => _check;
  set check(bool _value) {
    _check = _value;
  }

  bool _opsMenuVisible = false;
  bool get opsMenuVisible => _opsMenuVisible;
  set opsMenuVisible(bool _value) {
    _opsMenuVisible = _value;
  }

  List<String> _bannerSuperAppImgList = [];
  List<String> get bannerSuperAppImgList => _bannerSuperAppImgList;
  set bannerSuperAppImgList(List<String> _value) {
    _bannerSuperAppImgList = _value;
  }

  void addToBannerSuperAppImgList(String _value) {
    _bannerSuperAppImgList.add(_value);
  }

  void removeFromBannerSuperAppImgList(String _value) {
    _bannerSuperAppImgList.remove(_value);
  }

  void removeAtIndexFromBannerSuperAppImgList(int _index) {
    _bannerSuperAppImgList.removeAt(_index);
  }

  void updateBannerSuperAppImgListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _bannerSuperAppImgList[_index] = updateFn(_bannerSuperAppImgList[_index]);
  }

  void insertAtIndexInBannerSuperAppImgList(int _index, String _value) {
    _bannerSuperAppImgList.insert(_index, _value);
  }

  int _diffDate = -99;
  int get diffDate => _diffDate;
  set diffDate(int _value) {
    _diffDate = _value;
  }

  bool _isFromAuthenPage = false;
  bool get isFromAuthenPage => _isFromAuthenPage;
  set isFromAuthenPage(bool _value) {
    _isFromAuthenPage = _value;
  }

  String _pinCodeAuthen = '013972';
  String get pinCodeAuthen => _pinCodeAuthen;
  set pinCodeAuthen(String _value) {
    _pinCodeAuthen = _value;
    secureStorage.setString('ff_pinCodeAuthen', _value);
  }

  void deletePinCodeAuthen() {
    secureStorage.delete(key: 'ff_pinCodeAuthen');
  }

  bool _isFromLoginPage = false;
  bool get isFromLoginPage => _isFromLoginPage;
  set isFromLoginPage(bool _value) {
    _isFromLoginPage = _value;
  }

  bool _isGotNoti = false;
  bool get isGotNoti => _isGotNoti;
  set isGotNoti(bool _value) {
    _isGotNoti = _value;
  }

  String _isGottNoti = '';
  String get isGottNoti => _isGottNoti;
  set isGottNoti(String _value) {
    _isGottNoti = _value;
  }

  List<String> _leadChannelPairColorList = [];
  List<String> get leadChannelPairColorList => _leadChannelPairColorList;
  set leadChannelPairColorList(List<String> _value) {
    _leadChannelPairColorList = _value;
  }

  void addToLeadChannelPairColorList(String _value) {
    _leadChannelPairColorList.add(_value);
  }

  void removeFromLeadChannelPairColorList(String _value) {
    _leadChannelPairColorList.remove(_value);
  }

  void removeAtIndexFromLeadChannelPairColorList(int _index) {
    _leadChannelPairColorList.removeAt(_index);
  }

  void updateLeadChannelPairColorListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadChannelPairColorList[_index] =
        updateFn(_leadChannelPairColorList[_index]);
  }

  void insertAtIndexInLeadChannelPairColorList(int _index, String _value) {
    _leadChannelPairColorList.insert(_index, _value);
  }

  List<String> _leadChannelList = [];
  List<String> get leadChannelList => _leadChannelList;
  set leadChannelList(List<String> _value) {
    _leadChannelList = _value;
  }

  void addToLeadChannelList(String _value) {
    _leadChannelList.add(_value);
  }

  void removeFromLeadChannelList(String _value) {
    _leadChannelList.remove(_value);
  }

  void removeAtIndexFromLeadChannelList(int _index) {
    _leadChannelList.removeAt(_index);
  }

  void updateLeadChannelListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadChannelList[_index] = updateFn(_leadChannelList[_index]);
  }

  void insertAtIndexInLeadChannelList(int _index, String _value) {
    _leadChannelList.insert(_index, _value);
  }

  List<String> _leadChannelColor = [];
  List<String> get leadChannelColor => _leadChannelColor;
  set leadChannelColor(List<String> _value) {
    _leadChannelColor = _value;
  }

  void addToLeadChannelColor(String _value) {
    _leadChannelColor.add(_value);
  }

  void removeFromLeadChannelColor(String _value) {
    _leadChannelColor.remove(_value);
  }

  void removeAtIndexFromLeadChannelColor(int _index) {
    _leadChannelColor.removeAt(_index);
  }

  void updateLeadChannelColorAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadChannelColor[_index] = updateFn(_leadChannelColor[_index]);
  }

  void insertAtIndexInLeadChannelColor(int _index, String _value) {
    _leadChannelColor.insert(_index, _value);
  }

  bool _isFromSetPinPage = false;
  bool get isFromSetPinPage => _isFromSetPinPage;
  set isFromSetPinPage(bool _value) {
    _isFromSetPinPage = _value;
  }

  DocumentReference? _userLogRef =
      FirebaseFirestore.instance.doc('/user_log/[user_log]');
  DocumentReference? get userLogRef => _userLogRef;
  set userLogRef(DocumentReference? _value) {
    _userLogRef = _value;
    _value != null
        ? secureStorage.setString('ff_userLogRef', _value.path)
        : secureStorage.remove('ff_userLogRef');
  }

  void deleteUserLogRef() {
    secureStorage.delete(key: 'ff_userLogRef');
  }

  DocumentReference? _checkUserRef;
  DocumentReference? get checkUserRef => _checkUserRef;
  set checkUserRef(DocumentReference? _value) {
    _checkUserRef = _value;
  }

  String _temp1 = '';
  String get temp1 => _temp1;
  set temp1(String _value) {
    _temp1 = _value;
  }

  String _temp2 = '';
  String get temp2 => _temp2;
  set temp2(String _value) {
    _temp2 = _value;
  }

  DateTime? _temp3;
  DateTime? get temp3 => _temp3;
  set temp3(DateTime? _value) {
    _temp3 = _value;
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? _value) {
    _userRef = _value;
    _value != null
        ? secureStorage.setString('ff_userRef', _value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  String _loginStateFirebase = '[loginStateFirebase]';
  String get loginStateFirebase => _loginStateFirebase;
  set loginStateFirebase(String _value) {
    _loginStateFirebase = _value;
  }

  List<String> _leadCreatedTimeList = [];
  List<String> get leadCreatedTimeList => _leadCreatedTimeList;
  set leadCreatedTimeList(List<String> _value) {
    _leadCreatedTimeList = _value;
  }

  void addToLeadCreatedTimeList(String _value) {
    _leadCreatedTimeList.add(_value);
  }

  void removeFromLeadCreatedTimeList(String _value) {
    _leadCreatedTimeList.remove(_value);
  }

  void removeAtIndexFromLeadCreatedTimeList(int _index) {
    _leadCreatedTimeList.removeAt(_index);
  }

  void updateLeadCreatedTimeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCreatedTimeList[_index] = updateFn(_leadCreatedTimeList[_index]);
  }

  void insertAtIndexInLeadCreatedTimeList(int _index, String _value) {
    _leadCreatedTimeList.insert(_index, _value);
  }

  List<String> _leadCallStatus = [];
  List<String> get leadCallStatus => _leadCallStatus;
  set leadCallStatus(List<String> _value) {
    _leadCallStatus = _value;
  }

  void addToLeadCallStatus(String _value) {
    _leadCallStatus.add(_value);
  }

  void removeFromLeadCallStatus(String _value) {
    _leadCallStatus.remove(_value);
  }

  void removeAtIndexFromLeadCallStatus(int _index) {
    _leadCallStatus.removeAt(_index);
  }

  void updateLeadCallStatusAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCallStatus[_index] = updateFn(_leadCallStatus[_index]);
  }

  void insertAtIndexInLeadCallStatus(int _index, String _value) {
    _leadCallStatus.insert(_index, _value);
  }

  List<String> _leadPhoneNumberList = [];
  List<String> get leadPhoneNumberList => _leadPhoneNumberList;
  set leadPhoneNumberList(List<String> _value) {
    _leadPhoneNumberList = _value;
  }

  void addToLeadPhoneNumberList(String _value) {
    _leadPhoneNumberList.add(_value);
  }

  void removeFromLeadPhoneNumberList(String _value) {
    _leadPhoneNumberList.remove(_value);
  }

  void removeAtIndexFromLeadPhoneNumberList(int _index) {
    _leadPhoneNumberList.removeAt(_index);
  }

  void updateLeadPhoneNumberListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadPhoneNumberList[_index] = updateFn(_leadPhoneNumberList[_index]);
  }

  void insertAtIndexInLeadPhoneNumberList(int _index, String _value) {
    _leadPhoneNumberList.insert(_index, _value);
  }

  List<String> _leadEmployeeID = [];
  List<String> get leadEmployeeID => _leadEmployeeID;
  set leadEmployeeID(List<String> _value) {
    _leadEmployeeID = _value;
  }

  void addToLeadEmployeeID(String _value) {
    _leadEmployeeID.add(_value);
  }

  void removeFromLeadEmployeeID(String _value) {
    _leadEmployeeID.remove(_value);
  }

  void removeAtIndexFromLeadEmployeeID(int _index) {
    _leadEmployeeID.removeAt(_index);
  }

  void updateLeadEmployeeIDAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadEmployeeID[_index] = updateFn(_leadEmployeeID[_index]);
  }

  void insertAtIndexInLeadEmployeeID(int _index, String _value) {
    _leadEmployeeID.insert(_index, _value);
  }

  bool _isPassLoginSection = false;
  bool get isPassLoginSection => _isPassLoginSection;
  set isPassLoginSection(bool _value) {
    _isPassLoginSection = _value;
  }

  List<Color> _leadChannelLabelColor = [];
  List<Color> get leadChannelLabelColor => _leadChannelLabelColor;
  set leadChannelLabelColor(List<Color> _value) {
    _leadChannelLabelColor = _value;
  }

  void addToLeadChannelLabelColor(Color _value) {
    _leadChannelLabelColor.add(_value);
  }

  void removeFromLeadChannelLabelColor(Color _value) {
    _leadChannelLabelColor.remove(_value);
  }

  void removeAtIndexFromLeadChannelLabelColor(int _index) {
    _leadChannelLabelColor.removeAt(_index);
  }

  void updateLeadChannelLabelColorAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _leadChannelLabelColor[_index] = updateFn(_leadChannelLabelColor[_index]);
  }

  void insertAtIndexInLeadChannelLabelColor(int _index, Color _value) {
    _leadChannelLabelColor.insert(_index, _value);
  }

  String _userNickname = '[user_nickname]';
  String get userNickname => _userNickname;
  set userNickname(String _value) {
    _userNickname = _value;
    secureStorage.setString('ff_userNickname', _value);
  }

  void deleteUserNickname() {
    secureStorage.delete(key: 'ff_userNickname');
  }

  List<String> _leadIdCalledInApp = [];
  List<String> get leadIdCalledInApp => _leadIdCalledInApp;
  set leadIdCalledInApp(List<String> _value) {
    _leadIdCalledInApp = _value;
    secureStorage.setStringList('ff_leadIdCalledInApp', _value);
  }

  void deleteLeadIdCalledInApp() {
    secureStorage.delete(key: 'ff_leadIdCalledInApp');
  }

  void addToLeadIdCalledInApp(String _value) {
    _leadIdCalledInApp.add(_value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeFromLeadIdCalledInApp(String _value) {
    _leadIdCalledInApp.remove(_value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeAtIndexFromLeadIdCalledInApp(int _index) {
    _leadIdCalledInApp.removeAt(_index);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void updateLeadIdCalledInAppAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadIdCalledInApp[_index] = updateFn(_leadIdCalledInApp[_index]);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void insertAtIndexInLeadIdCalledInApp(int _index, String _value) {
    _leadIdCalledInApp.insert(_index, _value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  String _profileFullName = '[full_name]';
  String get profileFullName => _profileFullName;
  set profileFullName(String _value) {
    _profileFullName = _value;
  }

  String _profileBirthDate = '[birth_date]';
  String get profileBirthDate => _profileBirthDate;
  set profileBirthDate(String _value) {
    _profileBirthDate = _value;
  }

  String _profileUnitCodeName = '[unit_code_name]';
  String get profileUnitCodeName => _profileUnitCodeName;
  set profileUnitCodeName(String _value) {
    _profileUnitCodeName = _value;
  }

  String _profileParentUnit = '[parent_unit]';
  String get profileParentUnit => _profileParentUnit;
  set profileParentUnit(String _value) {
    _profileParentUnit = _value;
  }

  String _profileRegion = '[region]';
  String get profileRegion => _profileRegion;
  set profileRegion(String _value) {
    _profileRegion = _value;
  }

  String _profileHiredDate = '[hired_date]';
  String get profileHiredDate => _profileHiredDate;
  set profileHiredDate(String _value) {
    _profileHiredDate = _value;
  }

  String _profileServiceDuration = '[service_duration]';
  String get profileServiceDuration => _profileServiceDuration;
  set profileServiceDuration(String _value) {
    _profileServiceDuration = _value;
  }

  String _profilePositionAge = '[position_age]';
  String get profilePositionAge => _profilePositionAge;
  set profilePositionAge(String _value) {
    _profilePositionAge = _value;
  }

  String _profilePositionName = '[position_name]';
  String get profilePositionName => _profilePositionName;
  set profilePositionName(String _value) {
    _profilePositionName = _value;
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
  set dailySplashPageText(List<String> _value) {
    _dailySplashPageText = _value;
  }

  void addToDailySplashPageText(String _value) {
    _dailySplashPageText.add(_value);
  }

  void removeFromDailySplashPageText(String _value) {
    _dailySplashPageText.remove(_value);
  }

  void removeAtIndexFromDailySplashPageText(int _index) {
    _dailySplashPageText.removeAt(_index);
  }

  void updateDailySplashPageTextAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _dailySplashPageText[_index] = updateFn(_dailySplashPageText[_index]);
  }

  void insertAtIndexInDailySplashPageText(int _index, String _value) {
    _dailySplashPageText.insert(_index, _value);
  }

  List<String> _leadBranchCode = [];
  List<String> get leadBranchCode => _leadBranchCode;
  set leadBranchCode(List<String> _value) {
    _leadBranchCode = _value;
  }

  void addToLeadBranchCode(String _value) {
    _leadBranchCode.add(_value);
  }

  void removeFromLeadBranchCode(String _value) {
    _leadBranchCode.remove(_value);
  }

  void removeAtIndexFromLeadBranchCode(int _index) {
    _leadBranchCode.removeAt(_index);
  }

  void updateLeadBranchCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadBranchCode[_index] = updateFn(_leadBranchCode[_index]);
  }

  void insertAtIndexInLeadBranchCode(int _index, String _value) {
    _leadBranchCode.insert(_index, _value);
  }

  String _leadUserLevel = 'lead_user_level';
  String get leadUserLevel => _leadUserLevel;
  set leadUserLevel(String _value) {
    _leadUserLevel = _value;
  }

  List<int> _leadChannelAmountList = [0, 0, 0, 0];
  List<int> get leadChannelAmountList => _leadChannelAmountList;
  set leadChannelAmountList(List<int> _value) {
    _leadChannelAmountList = _value;
  }

  void addToLeadChannelAmountList(int _value) {
    _leadChannelAmountList.add(_value);
  }

  void removeFromLeadChannelAmountList(int _value) {
    _leadChannelAmountList.remove(_value);
  }

  void removeAtIndexFromLeadChannelAmountList(int _index) {
    _leadChannelAmountList.removeAt(_index);
  }

  void updateLeadChannelAmountListAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _leadChannelAmountList[_index] = updateFn(_leadChannelAmountList[_index]);
  }

  void insertAtIndexInLeadChannelAmountList(int _index, int _value) {
    _leadChannelAmountList.insert(_index, _value);
  }

  String _leadChannelSelected = 'All';
  String get leadChannelSelected => _leadChannelSelected;
  set leadChannelSelected(String _value) {
    _leadChannelSelected = _value;
  }

  String _dailyText = 'daily_text';
  String get dailyText => _dailyText;
  set dailyText(String _value) {
    _dailyText = _value;
  }

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool _value) {
    _firstUseApp = _value;
    secureStorage.setBool('ff_firstUseApp', _value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  int _introPageIndex = 1;
  int get introPageIndex => _introPageIndex;
  set introPageIndex(int _value) {
    _introPageIndex = _value;
  }

  LatLng? _HOLocation = LatLng(13.888767, 100.575308);
  LatLng? get HOLocation => _HOLocation;
  set HOLocation(LatLng? _value) {
    _HOLocation = _value;
  }

  List<String> _adminEmployeeID = ['31622', '23328', '30427', '33511'];
  List<String> get adminEmployeeID => _adminEmployeeID;
  set adminEmployeeID(List<String> _value) {
    _adminEmployeeID = _value;
  }

  void addToAdminEmployeeID(String _value) {
    _adminEmployeeID.add(_value);
  }

  void removeFromAdminEmployeeID(String _value) {
    _adminEmployeeID.remove(_value);
  }

  void removeAtIndexFromAdminEmployeeID(int _index) {
    _adminEmployeeID.removeAt(_index);
  }

  void updateAdminEmployeeIDAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _adminEmployeeID[_index] = updateFn(_adminEmployeeID[_index]);
  }

  void insertAtIndexInAdminEmployeeID(int _index, String _value) {
    _adminEmployeeID.insert(_index, _value);
  }

  String _profilePositionAgeCheck = '[position_age_check]';
  String get profilePositionAgeCheck => _profilePositionAgeCheck;
  set profilePositionAgeCheck(String _value) {
    _profilePositionAgeCheck = _value;
  }

  DateTime? _dcvdf;
  DateTime? get dcvdf => _dcvdf;
  set dcvdf(DateTime? _value) {
    _dcvdf = _value;
  }

  String _firebaseUserUID = '';
  String get firebaseUserUID => _firebaseUserUID;
  set firebaseUserUID(String _value) {
    _firebaseUserUID = _value;
  }

  int _RatingNumber = 0;
  int get RatingNumber => _RatingNumber;
  set RatingNumber(int _value) {
    _RatingNumber = _value;
  }

  List<String> _branchList = [' '];
  List<String> get branchList => _branchList;
  set branchList(List<String> _value) {
    _branchList = _value;
  }

  void addToBranchList(String _value) {
    _branchList.add(_value);
  }

  void removeFromBranchList(String _value) {
    _branchList.remove(_value);
  }

  void removeAtIndexFromBranchList(int _index) {
    _branchList.removeAt(_index);
  }

  void updateBranchListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _branchList[_index] = updateFn(_branchList[_index]);
  }

  void insertAtIndexInBranchList(int _index, String _value) {
    _branchList.insert(_index, _value);
  }

  String _branchGroup = 'ทั่วไป';
  String get branchGroup => _branchGroup;
  set branchGroup(String _value) {
    _branchGroup = _value;
  }

  List<String> _branchLat = ['Hello World'];
  List<String> get branchLat => _branchLat;
  set branchLat(List<String> _value) {
    _branchLat = _value;
  }

  void addToBranchLat(String _value) {
    _branchLat.add(_value);
  }

  void removeFromBranchLat(String _value) {
    _branchLat.remove(_value);
  }

  void removeAtIndexFromBranchLat(int _index) {
    _branchLat.removeAt(_index);
  }

  void updateBranchLatAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _branchLat[_index] = updateFn(_branchLat[_index]);
  }

  void insertAtIndexInBranchLat(int _index, String _value) {
    _branchLat.insert(_index, _value);
  }

  List<String> _branchLng = ['99'];
  List<String> get branchLng => _branchLng;
  set branchLng(List<String> _value) {
    _branchLng = _value;
  }

  void addToBranchLng(String _value) {
    _branchLng.add(_value);
  }

  void removeFromBranchLng(String _value) {
    _branchLng.remove(_value);
  }

  void removeAtIndexFromBranchLng(int _index) {
    _branchLng.removeAt(_index);
  }

  void updateBranchLngAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _branchLng[_index] = updateFn(_branchLng[_index]);
  }

  void insertAtIndexInBranchLng(int _index, String _value) {
    _branchLng.insert(_index, _value);
  }

  List<String> _branchRad = ['98'];
  List<String> get branchRad => _branchRad;
  set branchRad(List<String> _value) {
    _branchRad = _value;
  }

  void addToBranchRad(String _value) {
    _branchRad.add(_value);
  }

  void removeFromBranchRad(String _value) {
    _branchRad.remove(_value);
  }

  void removeAtIndexFromBranchRad(int _index) {
    _branchRad.removeAt(_index);
  }

  void updateBranchRadAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _branchRad[_index] = updateFn(_branchRad[_index]);
  }

  void insertAtIndexInBranchRad(int _index, String _value) {
    _branchRad.insert(_index, _value);
  }

  LatLng? _branchLo;
  LatLng? get branchLo => _branchLo;
  set branchLo(LatLng? _value) {
    _branchLo = _value;
  }

  String _currentTime = '';
  String get currentTime => _currentTime;
  set currentTime(String _value) {
    _currentTime = _value;
  }

  String _currentDate = '';
  String get currentDate => _currentDate;
  set currentDate(String _value) {
    _currentDate = _value;
  }

  double _currentRadius = 0;
  double get currentRadius => _currentRadius;
  set currentRadius(double _value) {
    _currentRadius = _value;
  }

  String _flag = '';
  String get flag => _flag;
  set flag(String _value) {
    _flag = _value;
  }

  String _branchLoString = '';
  String get branchLoString => _branchLoString;
  set branchLoString(String _value) {
    _branchLoString = _value;
  }

  List<String> _checkinStatusBranch = [];
  List<String> get checkinStatusBranch => _checkinStatusBranch;
  set checkinStatusBranch(List<String> _value) {
    _checkinStatusBranch = _value;
  }

  void addToCheckinStatusBranch(String _value) {
    _checkinStatusBranch.add(_value);
  }

  void removeFromCheckinStatusBranch(String _value) {
    _checkinStatusBranch.remove(_value);
  }

  void removeAtIndexFromCheckinStatusBranch(int _index) {
    _checkinStatusBranch.removeAt(_index);
  }

  void updateCheckinStatusBranchAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusBranch[_index] = updateFn(_checkinStatusBranch[_index]);
  }

  void insertAtIndexInCheckinStatusBranch(int _index, String _value) {
    _checkinStatusBranch.insert(_index, _value);
  }

  List<String> _checkinStatusDate = [];
  List<String> get checkinStatusDate => _checkinStatusDate;
  set checkinStatusDate(List<String> _value) {
    _checkinStatusDate = _value;
  }

  void addToCheckinStatusDate(String _value) {
    _checkinStatusDate.add(_value);
  }

  void removeFromCheckinStatusDate(String _value) {
    _checkinStatusDate.remove(_value);
  }

  void removeAtIndexFromCheckinStatusDate(int _index) {
    _checkinStatusDate.removeAt(_index);
  }

  void updateCheckinStatusDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusDate[_index] = updateFn(_checkinStatusDate[_index]);
  }

  void insertAtIndexInCheckinStatusDate(int _index, String _value) {
    _checkinStatusDate.insert(_index, _value);
  }

  List<String> _checkinStatusTime = [];
  List<String> get checkinStatusTime => _checkinStatusTime;
  set checkinStatusTime(List<String> _value) {
    _checkinStatusTime = _value;
  }

  void addToCheckinStatusTime(String _value) {
    _checkinStatusTime.add(_value);
  }

  void removeFromCheckinStatusTime(String _value) {
    _checkinStatusTime.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTime(int _index) {
    _checkinStatusTime.removeAt(_index);
  }

  void updateCheckinStatusTimeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusTime[_index] = updateFn(_checkinStatusTime[_index]);
  }

  void insertAtIndexInCheckinStatusTime(int _index, String _value) {
    _checkinStatusTime.insert(_index, _value);
  }

  List<String> _checkinStatusAction = [];
  List<String> get checkinStatusAction => _checkinStatusAction;
  set checkinStatusAction(List<String> _value) {
    _checkinStatusAction = _value;
  }

  void addToCheckinStatusAction(String _value) {
    _checkinStatusAction.add(_value);
  }

  void removeFromCheckinStatusAction(String _value) {
    _checkinStatusAction.remove(_value);
  }

  void removeAtIndexFromCheckinStatusAction(int _index) {
    _checkinStatusAction.removeAt(_index);
  }

  void updateCheckinStatusActionAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusAction[_index] = updateFn(_checkinStatusAction[_index]);
  }

  void insertAtIndexInCheckinStatusAction(int _index, String _value) {
    _checkinStatusAction.insert(_index, _value);
  }

  List<String> _checkinStatusTimeIn = [];
  List<String> get checkinStatusTimeIn => _checkinStatusTimeIn;
  set checkinStatusTimeIn(List<String> _value) {
    _checkinStatusTimeIn = _value;
  }

  void addToCheckinStatusTimeIn(String _value) {
    _checkinStatusTimeIn.add(_value);
  }

  void removeFromCheckinStatusTimeIn(String _value) {
    _checkinStatusTimeIn.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTimeIn(int _index) {
    _checkinStatusTimeIn.removeAt(_index);
  }

  void updateCheckinStatusTimeInAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusTimeIn[_index] = updateFn(_checkinStatusTimeIn[_index]);
  }

  void insertAtIndexInCheckinStatusTimeIn(int _index, String _value) {
    _checkinStatusTimeIn.insert(_index, _value);
  }

  List<String> _checkinStatusTimeOut = [];
  List<String> get checkinStatusTimeOut => _checkinStatusTimeOut;
  set checkinStatusTimeOut(List<String> _value) {
    _checkinStatusTimeOut = _value;
  }

  void addToCheckinStatusTimeOut(String _value) {
    _checkinStatusTimeOut.add(_value);
  }

  void removeFromCheckinStatusTimeOut(String _value) {
    _checkinStatusTimeOut.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTimeOut(int _index) {
    _checkinStatusTimeOut.removeAt(_index);
  }

  void updateCheckinStatusTimeOutAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusTimeOut[_index] = updateFn(_checkinStatusTimeOut[_index]);
  }

  void insertAtIndexInCheckinStatusTimeOut(int _index, String _value) {
    _checkinStatusTimeOut.insert(_index, _value);
  }

  List<String> _checkinStatusDateFlag = [];
  List<String> get checkinStatusDateFlag => _checkinStatusDateFlag;
  set checkinStatusDateFlag(List<String> _value) {
    _checkinStatusDateFlag = _value;
  }

  void addToCheckinStatusDateFlag(String _value) {
    _checkinStatusDateFlag.add(_value);
  }

  void removeFromCheckinStatusDateFlag(String _value) {
    _checkinStatusDateFlag.remove(_value);
  }

  void removeAtIndexFromCheckinStatusDateFlag(int _index) {
    _checkinStatusDateFlag.removeAt(_index);
  }

  void updateCheckinStatusDateFlagAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinStatusDateFlag[_index] = updateFn(_checkinStatusDateFlag[_index]);
  }

  void insertAtIndexInCheckinStatusDateFlag(int _index, String _value) {
    _checkinStatusDateFlag.insert(_index, _value);
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
  set checkinStatusColor(List<Color> _value) {
    _checkinStatusColor = _value;
  }

  void addToCheckinStatusColor(Color _value) {
    _checkinStatusColor.add(_value);
  }

  void removeFromCheckinStatusColor(Color _value) {
    _checkinStatusColor.remove(_value);
  }

  void removeAtIndexFromCheckinStatusColor(int _index) {
    _checkinStatusColor.removeAt(_index);
  }

  void updateCheckinStatusColorAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _checkinStatusColor[_index] = updateFn(_checkinStatusColor[_index]);
  }

  void insertAtIndexInCheckinStatusColor(int _index, Color _value) {
    _checkinStatusColor.insert(_index, _value);
  }

  List<String> _teleBrandName = [];
  List<String> get teleBrandName => _teleBrandName;
  set teleBrandName(List<String> _value) {
    _teleBrandName = _value;
  }

  void addToTeleBrandName(String _value) {
    _teleBrandName.add(_value);
  }

  void removeFromTeleBrandName(String _value) {
    _teleBrandName.remove(_value);
  }

  void removeAtIndexFromTeleBrandName(int _index) {
    _teleBrandName.removeAt(_index);
  }

  void updateTeleBrandNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleBrandName[_index] = updateFn(_teleBrandName[_index]);
  }

  void insertAtIndexInTeleBrandName(int _index, String _value) {
    _teleBrandName.insert(_index, _value);
  }

  List<String> _teleBrandType = [];
  List<String> get teleBrandType => _teleBrandType;
  set teleBrandType(List<String> _value) {
    _teleBrandType = _value;
  }

  void addToTeleBrandType(String _value) {
    _teleBrandType.add(_value);
  }

  void removeFromTeleBrandType(String _value) {
    _teleBrandType.remove(_value);
  }

  void removeAtIndexFromTeleBrandType(int _index) {
    _teleBrandType.removeAt(_index);
  }

  void updateTeleBrandTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleBrandType[_index] = updateFn(_teleBrandType[_index]);
  }

  void insertAtIndexInTeleBrandType(int _index, String _value) {
    _teleBrandType.insert(_index, _value);
  }

  List<String> _modelName = [];
  List<String> get modelName => _modelName;
  set modelName(List<String> _value) {
    _modelName = _value;
  }

  void addToModelName(String _value) {
    _modelName.add(_value);
  }

  void removeFromModelName(String _value) {
    _modelName.remove(_value);
  }

  void removeAtIndexFromModelName(int _index) {
    _modelName.removeAt(_index);
  }

  void updateModelNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _modelName[_index] = updateFn(_modelName[_index]);
  }

  void insertAtIndexInModelName(int _index, String _value) {
    _modelName.insert(_index, _value);
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
  set teleYearDropdownOption(List<String> _value) {
    _teleYearDropdownOption = _value;
  }

  void addToTeleYearDropdownOption(String _value) {
    _teleYearDropdownOption.add(_value);
  }

  void removeFromTeleYearDropdownOption(String _value) {
    _teleYearDropdownOption.remove(_value);
  }

  void removeAtIndexFromTeleYearDropdownOption(int _index) {
    _teleYearDropdownOption.removeAt(_index);
  }

  void updateTeleYearDropdownOptionAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleYearDropdownOption[_index] = updateFn(_teleYearDropdownOption[_index]);
  }

  void insertAtIndexInTeleYearDropdownOption(int _index, String _value) {
    _teleYearDropdownOption.insert(_index, _value);
  }

  List<String> _teleGetProvince = [];
  List<String> get teleGetProvince => _teleGetProvince;
  set teleGetProvince(List<String> _value) {
    _teleGetProvince = _value;
  }

  void addToTeleGetProvince(String _value) {
    _teleGetProvince.add(_value);
  }

  void removeFromTeleGetProvince(String _value) {
    _teleGetProvince.remove(_value);
  }

  void removeAtIndexFromTeleGetProvince(int _index) {
    _teleGetProvince.removeAt(_index);
  }

  void updateTeleGetProvinceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleGetProvince[_index] = updateFn(_teleGetProvince[_index]);
  }

  void insertAtIndexInTeleGetProvince(int _index, String _value) {
    _teleGetProvince.insert(_index, _value);
  }

  List<String> _teleModelName = [];
  List<String> get teleModelName => _teleModelName;
  set teleModelName(List<String> _value) {
    _teleModelName = _value;
  }

  void addToTeleModelName(String _value) {
    _teleModelName.add(_value);
  }

  void removeFromTeleModelName(String _value) {
    _teleModelName.remove(_value);
  }

  void removeAtIndexFromTeleModelName(int _index) {
    _teleModelName.removeAt(_index);
  }

  void updateTeleModelNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleModelName[_index] = updateFn(_teleModelName[_index]);
  }

  void insertAtIndexInTeleModelName(int _index, String _value) {
    _teleModelName.insert(_index, _value);
  }

  List<String> _coverTypeName = [];
  List<String> get coverTypeName => _coverTypeName;
  set coverTypeName(List<String> _value) {
    _coverTypeName = _value;
  }

  void addToCoverTypeName(String _value) {
    _coverTypeName.add(_value);
  }

  void removeFromCoverTypeName(String _value) {
    _coverTypeName.remove(_value);
  }

  void removeAtIndexFromCoverTypeName(int _index) {
    _coverTypeName.removeAt(_index);
  }

  void updateCoverTypeNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _coverTypeName[_index] = updateFn(_coverTypeName[_index]);
  }

  void insertAtIndexInCoverTypeName(int _index, String _value) {
    _coverTypeName.insert(_index, _value);
  }

  List<String> _coverTypeCode = [];
  List<String> get coverTypeCode => _coverTypeCode;
  set coverTypeCode(List<String> _value) {
    _coverTypeCode = _value;
  }

  void addToCoverTypeCode(String _value) {
    _coverTypeCode.add(_value);
  }

  void removeFromCoverTypeCode(String _value) {
    _coverTypeCode.remove(_value);
  }

  void removeAtIndexFromCoverTypeCode(int _index) {
    _coverTypeCode.removeAt(_index);
  }

  void updateCoverTypeCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _coverTypeCode[_index] = updateFn(_coverTypeCode[_index]);
  }

  void insertAtIndexInCoverTypeCode(int _index, String _value) {
    _coverTypeCode.insert(_index, _value);
  }

  List<String> _insurerFullNameList = [];
  List<String> get insurerFullNameList => _insurerFullNameList;
  set insurerFullNameList(List<String> _value) {
    _insurerFullNameList = _value;
  }

  void addToInsurerFullNameList(String _value) {
    _insurerFullNameList.add(_value);
  }

  void removeFromInsurerFullNameList(String _value) {
    _insurerFullNameList.remove(_value);
  }

  void removeAtIndexFromInsurerFullNameList(int _index) {
    _insurerFullNameList.removeAt(_index);
  }

  void updateInsurerFullNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insurerFullNameList[_index] = updateFn(_insurerFullNameList[_index]);
  }

  void insertAtIndexInInsurerFullNameList(int _index, String _value) {
    _insurerFullNameList.insert(_index, _value);
  }

  String _garageTypeEng = '';
  String get garageTypeEng => _garageTypeEng;
  set garageTypeEng(String _value) {
    _garageTypeEng = _value;
  }

  List<String> _coverTypeNameChosen = [];
  List<String> get coverTypeNameChosen => _coverTypeNameChosen;
  set coverTypeNameChosen(List<String> _value) {
    _coverTypeNameChosen = _value;
  }

  void addToCoverTypeNameChosen(String _value) {
    _coverTypeNameChosen.add(_value);
  }

  void removeFromCoverTypeNameChosen(String _value) {
    _coverTypeNameChosen.remove(_value);
  }

  void removeAtIndexFromCoverTypeNameChosen(int _index) {
    _coverTypeNameChosen.removeAt(_index);
  }

  void updateCoverTypeNameChosenAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _coverTypeNameChosen[_index] = updateFn(_coverTypeNameChosen[_index]);
  }

  void insertAtIndexInCoverTypeNameChosen(int _index, String _value) {
    _coverTypeNameChosen.insert(_index, _value);
  }

  List<String> _insurerNameChosen = [];
  List<String> get insurerNameChosen => _insurerNameChosen;
  set insurerNameChosen(List<String> _value) {
    _insurerNameChosen = _value;
  }

  void addToInsurerNameChosen(String _value) {
    _insurerNameChosen.add(_value);
  }

  void removeFromInsurerNameChosen(String _value) {
    _insurerNameChosen.remove(_value);
  }

  void removeAtIndexFromInsurerNameChosen(int _index) {
    _insurerNameChosen.removeAt(_index);
  }

  void updateInsurerNameChosenAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insurerNameChosen[_index] = updateFn(_insurerNameChosen[_index]);
  }

  void insertAtIndexInInsurerNameChosen(int _index, String _value) {
    _insurerNameChosen.insert(_index, _value);
  }

  int _sumInsuredChosen = 0;
  int get sumInsuredChosen => _sumInsuredChosen;
  set sumInsuredChosen(int _value) {
    _sumInsuredChosen = _value;
  }

  List<String> _teleBrandID = [];
  List<String> get teleBrandID => _teleBrandID;
  set teleBrandID(List<String> _value) {
    _teleBrandID = _value;
  }

  void addToTeleBrandID(String _value) {
    _teleBrandID.add(_value);
  }

  void removeFromTeleBrandID(String _value) {
    _teleBrandID.remove(_value);
  }

  void removeAtIndexFromTeleBrandID(int _index) {
    _teleBrandID.removeAt(_index);
  }

  void updateTeleBrandIDAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleBrandID[_index] = updateFn(_teleBrandID[_index]);
  }

  void insertAtIndexInTeleBrandID(int _index, String _value) {
    _teleBrandID.insert(_index, _value);
  }

  List<String> _teleModelCode = [];
  List<String> get teleModelCode => _teleModelCode;
  set teleModelCode(List<String> _value) {
    _teleModelCode = _value;
  }

  void addToTeleModelCode(String _value) {
    _teleModelCode.add(_value);
  }

  void removeFromTeleModelCode(String _value) {
    _teleModelCode.remove(_value);
  }

  void removeAtIndexFromTeleModelCode(int _index) {
    _teleModelCode.removeAt(_index);
  }

  void updateTeleModelCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleModelCode[_index] = updateFn(_teleModelCode[_index]);
  }

  void insertAtIndexInTeleModelCode(int _index, String _value) {
    _teleModelCode.insert(_index, _value);
  }

  List<String> _teleModelBrandID = [];
  List<String> get teleModelBrandID => _teleModelBrandID;
  set teleModelBrandID(List<String> _value) {
    _teleModelBrandID = _value;
  }

  void addToTeleModelBrandID(String _value) {
    _teleModelBrandID.add(_value);
  }

  void removeFromTeleModelBrandID(String _value) {
    _teleModelBrandID.remove(_value);
  }

  void removeAtIndexFromTeleModelBrandID(int _index) {
    _teleModelBrandID.removeAt(_index);
  }

  void updateTeleModelBrandIDAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleModelBrandID[_index] = updateFn(_teleModelBrandID[_index]);
  }

  void insertAtIndexInTeleModelBrandID(int _index, String _value) {
    _teleModelBrandID.insert(_index, _value);
  }

  List<String> _companyId = [];
  List<String> get companyId => _companyId;
  set companyId(List<String> _value) {
    _companyId = _value;
  }

  void addToCompanyId(String _value) {
    _companyId.add(_value);
  }

  void removeFromCompanyId(String _value) {
    _companyId.remove(_value);
  }

  void removeAtIndexFromCompanyId(int _index) {
    _companyId.removeAt(_index);
  }

  void updateCompanyIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _companyId[_index] = updateFn(_companyId[_index]);
  }

  void insertAtIndexInCompanyId(int _index, String _value) {
    _companyId.insert(_index, _value);
  }

  bool _teleSearchModelState = false;
  bool get teleSearchModelState => _teleSearchModelState;
  set teleSearchModelState(bool _value) {
    _teleSearchModelState = _value;
  }

  List<String> _searchFullName = [];
  List<String> get searchFullName => _searchFullName;
  set searchFullName(List<String> _value) {
    _searchFullName = _value;
  }

  void addToSearchFullName(String _value) {
    _searchFullName.add(_value);
  }

  void removeFromSearchFullName(String _value) {
    _searchFullName.remove(_value);
  }

  void removeAtIndexFromSearchFullName(int _index) {
    _searchFullName.removeAt(_index);
  }

  void updateSearchFullNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchFullName[_index] = updateFn(_searchFullName[_index]);
  }

  void insertAtIndexInSearchFullName(int _index, String _value) {
    _searchFullName.insert(_index, _value);
  }

  List<String> _searchCoverType = [];
  List<String> get searchCoverType => _searchCoverType;
  set searchCoverType(List<String> _value) {
    _searchCoverType = _value;
  }

  void addToSearchCoverType(String _value) {
    _searchCoverType.add(_value);
  }

  void removeFromSearchCoverType(String _value) {
    _searchCoverType.remove(_value);
  }

  void removeAtIndexFromSearchCoverType(int _index) {
    _searchCoverType.removeAt(_index);
  }

  void updateSearchCoverTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchCoverType[_index] = updateFn(_searchCoverType[_index]);
  }

  void insertAtIndexInSearchCoverType(int _index, String _value) {
    _searchCoverType.insert(_index, _value);
  }

  List<String> _searchGarageType = [];
  List<String> get searchGarageType => _searchGarageType;
  set searchGarageType(List<String> _value) {
    _searchGarageType = _value;
  }

  void addToSearchGarageType(String _value) {
    _searchGarageType.add(_value);
  }

  void removeFromSearchGarageType(String _value) {
    _searchGarageType.remove(_value);
  }

  void removeAtIndexFromSearchGarageType(int _index) {
    _searchGarageType.removeAt(_index);
  }

  void updateSearchGarageTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchGarageType[_index] = updateFn(_searchGarageType[_index]);
  }

  void insertAtIndexInSearchGarageType(int _index, String _value) {
    _searchGarageType.insert(_index, _value);
  }

  List<String> _searchGrossTotal = [];
  List<String> get searchGrossTotal => _searchGrossTotal;
  set searchGrossTotal(List<String> _value) {
    _searchGrossTotal = _value;
  }

  void addToSearchGrossTotal(String _value) {
    _searchGrossTotal.add(_value);
  }

  void removeFromSearchGrossTotal(String _value) {
    _searchGrossTotal.remove(_value);
  }

  void removeAtIndexFromSearchGrossTotal(int _index) {
    _searchGrossTotal.removeAt(_index);
  }

  void updateSearchGrossTotalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchGrossTotal[_index] = updateFn(_searchGrossTotal[_index]);
  }

  void insertAtIndexInSearchGrossTotal(int _index, String _value) {
    _searchGrossTotal.insert(_index, _value);
  }

  List<String> _searchSumInsured = [];
  List<String> get searchSumInsured => _searchSumInsured;
  set searchSumInsured(List<String> _value) {
    _searchSumInsured = _value;
  }

  void addToSearchSumInsured(String _value) {
    _searchSumInsured.add(_value);
  }

  void removeFromSearchSumInsured(String _value) {
    _searchSumInsured.remove(_value);
  }

  void removeAtIndexFromSearchSumInsured(int _index) {
    _searchSumInsured.removeAt(_index);
  }

  void updateSearchSumInsuredAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchSumInsured[_index] = updateFn(_searchSumInsured[_index]);
  }

  void insertAtIndexInSearchSumInsured(int _index, String _value) {
    _searchSumInsured.insert(_index, _value);
  }

  List<String> _searchTppd = [];
  List<String> get searchTppd => _searchTppd;
  set searchTppd(List<String> _value) {
    _searchTppd = _value;
  }

  void addToSearchTppd(String _value) {
    _searchTppd.add(_value);
  }

  void removeFromSearchTppd(String _value) {
    _searchTppd.remove(_value);
  }

  void removeAtIndexFromSearchTppd(int _index) {
    _searchTppd.removeAt(_index);
  }

  void updateSearchTppdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchTppd[_index] = updateFn(_searchTppd[_index]);
  }

  void insertAtIndexInSearchTppd(int _index, String _value) {
    _searchTppd.insert(_index, _value);
  }

  List<String> _searchPa = [];
  List<String> get searchPa => _searchPa;
  set searchPa(List<String> _value) {
    _searchPa = _value;
  }

  void addToSearchPa(String _value) {
    _searchPa.add(_value);
  }

  void removeFromSearchPa(String _value) {
    _searchPa.remove(_value);
  }

  void removeAtIndexFromSearchPa(int _index) {
    _searchPa.removeAt(_index);
  }

  void updateSearchPaAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchPa[_index] = updateFn(_searchPa[_index]);
  }

  void insertAtIndexInSearchPa(int _index, String _value) {
    _searchPa.insert(_index, _value);
  }

  List<String> _searchExpDate = [];
  List<String> get searchExpDate => _searchExpDate;
  set searchExpDate(List<String> _value) {
    _searchExpDate = _value;
  }

  void addToSearchExpDate(String _value) {
    _searchExpDate.add(_value);
  }

  void removeFromSearchExpDate(String _value) {
    _searchExpDate.remove(_value);
  }

  void removeAtIndexFromSearchExpDate(int _index) {
    _searchExpDate.removeAt(_index);
  }

  void updateSearchExpDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchExpDate[_index] = updateFn(_searchExpDate[_index]);
  }

  void insertAtIndexInSearchExpDate(int _index, String _value) {
    _searchExpDate.insert(_index, _value);
  }

  String _garageChosen = '';
  String get garageChosen => _garageChosen;
  set garageChosen(String _value) {
    _garageChosen = _value;
  }

  List<String> _actAmount = [];
  List<String> get actAmount => _actAmount;
  set actAmount(List<String> _value) {
    _actAmount = _value;
  }

  void addToActAmount(String _value) {
    _actAmount.add(_value);
  }

  void removeFromActAmount(String _value) {
    _actAmount.remove(_value);
  }

  void removeAtIndexFromActAmount(int _index) {
    _actAmount.removeAt(_index);
  }

  void updateActAmountAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _actAmount[_index] = updateFn(_actAmount[_index]);
  }

  void insertAtIndexInActAmount(int _index, String _value) {
    _actAmount.insert(_index, _value);
  }

  List<String> _searchActAmount = [];
  List<String> get searchActAmount => _searchActAmount;
  set searchActAmount(List<String> _value) {
    _searchActAmount = _value;
  }

  void addToSearchActAmount(String _value) {
    _searchActAmount.add(_value);
  }

  void removeFromSearchActAmount(String _value) {
    _searchActAmount.remove(_value);
  }

  void removeAtIndexFromSearchActAmount(int _index) {
    _searchActAmount.removeAt(_index);
  }

  void updateSearchActAmountAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchActAmount[_index] = updateFn(_searchActAmount[_index]);
  }

  void insertAtIndexInSearchActAmount(int _index, String _value) {
    _searchActAmount.insert(_index, _value);
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
  set teleADYearDropdown(List<String> _value) {
    _teleADYearDropdown = _value;
  }

  void addToTeleADYearDropdown(String _value) {
    _teleADYearDropdown.add(_value);
  }

  void removeFromTeleADYearDropdown(String _value) {
    _teleADYearDropdown.remove(_value);
  }

  void removeAtIndexFromTeleADYearDropdown(int _index) {
    _teleADYearDropdown.removeAt(_index);
  }

  void updateTeleADYearDropdownAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleADYearDropdown[_index] = updateFn(_teleADYearDropdown[_index]);
  }

  void insertAtIndexInTeleADYearDropdown(int _index, String _value) {
    _teleADYearDropdown.insert(_index, _value);
  }

  List<String> _searchSerialName = [];
  List<String> get searchSerialName => _searchSerialName;
  set searchSerialName(List<String> _value) {
    _searchSerialName = _value;
  }

  void addToSearchSerialName(String _value) {
    _searchSerialName.add(_value);
  }

  void removeFromSearchSerialName(String _value) {
    _searchSerialName.remove(_value);
  }

  void removeAtIndexFromSearchSerialName(int _index) {
    _searchSerialName.removeAt(_index);
  }

  void updateSearchSerialNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchSerialName[_index] = updateFn(_searchSerialName[_index]);
  }

  void insertAtIndexInSearchSerialName(int _index, String _value) {
    _searchSerialName.insert(_index, _value);
  }

  double _sumInsuredChoosenDouble = 0;
  double get sumInsuredChoosenDouble => _sumInsuredChoosenDouble;
  set sumInsuredChoosenDouble(double _value) {
    _sumInsuredChoosenDouble = _value;
  }

  List<String> _kpiProductType = ['M', 'CTV', 'HL'];
  List<String> get kpiProductType => _kpiProductType;
  set kpiProductType(List<String> _value) {
    _kpiProductType = _value;
  }

  void addToKpiProductType(String _value) {
    _kpiProductType.add(_value);
  }

  void removeFromKpiProductType(String _value) {
    _kpiProductType.remove(_value);
  }

  void removeAtIndexFromKpiProductType(int _index) {
    _kpiProductType.removeAt(_index);
  }

  void updateKpiProductTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiProductType[_index] = updateFn(_kpiProductType[_index]);
  }

  void insertAtIndexInKpiProductType(int _index, String _value) {
    _kpiProductType.insert(_index, _value);
  }

  List<String> _kpiEmployeePosition = [
    '[position]',
    '[position]',
    '[position]'
  ];
  List<String> get kpiEmployeePosition => _kpiEmployeePosition;
  set kpiEmployeePosition(List<String> _value) {
    _kpiEmployeePosition = _value;
  }

  void addToKpiEmployeePosition(String _value) {
    _kpiEmployeePosition.add(_value);
  }

  void removeFromKpiEmployeePosition(String _value) {
    _kpiEmployeePosition.remove(_value);
  }

  void removeAtIndexFromKpiEmployeePosition(int _index) {
    _kpiEmployeePosition.removeAt(_index);
  }

  void updateKpiEmployeePositionAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiEmployeePosition[_index] = updateFn(_kpiEmployeePosition[_index]);
  }

  void insertAtIndexInKpiEmployeePosition(int _index, String _value) {
    _kpiEmployeePosition.insert(_index, _value);
  }

  List<String> _kpiActual = ['0.0', '0.0', '0.0'];
  List<String> get kpiActual => _kpiActual;
  set kpiActual(List<String> _value) {
    _kpiActual = _value;
  }

  void addToKpiActual(String _value) {
    _kpiActual.add(_value);
  }

  void removeFromKpiActual(String _value) {
    _kpiActual.remove(_value);
  }

  void removeAtIndexFromKpiActual(int _index) {
    _kpiActual.removeAt(_index);
  }

  void updateKpiActualAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiActual[_index] = updateFn(_kpiActual[_index]);
  }

  void insertAtIndexInKpiActual(int _index, String _value) {
    _kpiActual.insert(_index, _value);
  }

  List<String> _kpiTargetQuantity = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantity => _kpiTargetQuantity;
  set kpiTargetQuantity(List<String> _value) {
    _kpiTargetQuantity = _value;
  }

  void addToKpiTargetQuantity(String _value) {
    _kpiTargetQuantity.add(_value);
  }

  void removeFromKpiTargetQuantity(String _value) {
    _kpiTargetQuantity.remove(_value);
  }

  void removeAtIndexFromKpiTargetQuantity(int _index) {
    _kpiTargetQuantity.removeAt(_index);
  }

  void updateKpiTargetQuantityAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiTargetQuantity[_index] = updateFn(_kpiTargetQuantity[_index]);
  }

  void insertAtIndexInKpiTargetQuantity(int _index, String _value) {
    _kpiTargetQuantity.insert(_index, _value);
  }

  List<String> _kpiYearMonth = ['2022-12', '2022-12', '2022-12'];
  List<String> get kpiYearMonth => _kpiYearMonth;
  set kpiYearMonth(List<String> _value) {
    _kpiYearMonth = _value;
  }

  void addToKpiYearMonth(String _value) {
    _kpiYearMonth.add(_value);
  }

  void removeFromKpiYearMonth(String _value) {
    _kpiYearMonth.remove(_value);
  }

  void removeAtIndexFromKpiYearMonth(int _index) {
    _kpiYearMonth.removeAt(_index);
  }

  void updateKpiYearMonthAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiYearMonth[_index] = updateFn(_kpiYearMonth[_index]);
  }

  void insertAtIndexInKpiYearMonth(int _index, String _value) {
    _kpiYearMonth.insert(_index, _value);
  }

  String _kpiTargetBudget = '100.00';
  String get kpiTargetBudget => _kpiTargetBudget;
  set kpiTargetBudget(String _value) {
    _kpiTargetBudget = _value;
  }

  String _kpiActualBudget = '0.00';
  String get kpiActualBudget => _kpiActualBudget;
  set kpiActualBudget(String _value) {
    _kpiActualBudget = _value;
  }

  DateTime? _DateHoliday;
  DateTime? get DateHoliday => _DateHoliday;
  set DateHoliday(DateTime? _value) {
    _DateHoliday = _value;
  }

  DateTime? _DateExpHoliday;
  DateTime? get DateExpHoliday => _DateExpHoliday;
  set DateExpHoliday(DateTime? _value) {
    _DateExpHoliday = _value;
  }

  DateTime? _DateHolidayNotShow;
  DateTime? get DateHolidayNotShow => _DateHolidayNotShow;
  set DateHolidayNotShow(DateTime? _value) {
    _DateHolidayNotShow = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_DateHolidayNotShow', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DateHolidayNotShow');
  }

  void deleteDateHolidayNotShow() {
    secureStorage.delete(key: 'ff_DateHolidayNotShow');
  }

  bool _isLoadedInsuranceData = false;
  bool get isLoadedInsuranceData => _isLoadedInsuranceData;
  set isLoadedInsuranceData(bool _value) {
    _isLoadedInsuranceData = _value;
  }

  List<String> _leaveWorkId = [];
  List<String> get leaveWorkId => _leaveWorkId;
  set leaveWorkId(List<String> _value) {
    _leaveWorkId = _value;
  }

  void addToLeaveWorkId(String _value) {
    _leaveWorkId.add(_value);
  }

  void removeFromLeaveWorkId(String _value) {
    _leaveWorkId.remove(_value);
  }

  void removeAtIndexFromLeaveWorkId(int _index) {
    _leaveWorkId.removeAt(_index);
  }

  void updateLeaveWorkIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveWorkId[_index] = updateFn(_leaveWorkId[_index]);
  }

  void insertAtIndexInLeaveWorkId(int _index, String _value) {
    _leaveWorkId.insert(_index, _value);
  }

  List<String> _leaveWorkDay = [];
  List<String> get leaveWorkDay => _leaveWorkDay;
  set leaveWorkDay(List<String> _value) {
    _leaveWorkDay = _value;
  }

  void addToLeaveWorkDay(String _value) {
    _leaveWorkDay.add(_value);
  }

  void removeFromLeaveWorkDay(String _value) {
    _leaveWorkDay.remove(_value);
  }

  void removeAtIndexFromLeaveWorkDay(int _index) {
    _leaveWorkDay.removeAt(_index);
  }

  void updateLeaveWorkDayAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveWorkDay[_index] = updateFn(_leaveWorkDay[_index]);
  }

  void insertAtIndexInLeaveWorkDay(int _index, String _value) {
    _leaveWorkDay.insert(_index, _value);
  }

  List<String> _checkinLastMonthDate = [];
  List<String> get checkinLastMonthDate => _checkinLastMonthDate;
  set checkinLastMonthDate(List<String> _value) {
    _checkinLastMonthDate = _value;
  }

  void addToCheckinLastMonthDate(String _value) {
    _checkinLastMonthDate.add(_value);
  }

  void removeFromCheckinLastMonthDate(String _value) {
    _checkinLastMonthDate.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthDate(int _index) {
    _checkinLastMonthDate.removeAt(_index);
  }

  void updateCheckinLastMonthDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinLastMonthDate[_index] = updateFn(_checkinLastMonthDate[_index]);
  }

  void insertAtIndexInCheckinLastMonthDate(int _index, String _value) {
    _checkinLastMonthDate.insert(_index, _value);
  }

  List<String> _checkinLastMonthTimeIn = [];
  List<String> get checkinLastMonthTimeIn => _checkinLastMonthTimeIn;
  set checkinLastMonthTimeIn(List<String> _value) {
    _checkinLastMonthTimeIn = _value;
  }

  void addToCheckinLastMonthTimeIn(String _value) {
    _checkinLastMonthTimeIn.add(_value);
  }

  void removeFromCheckinLastMonthTimeIn(String _value) {
    _checkinLastMonthTimeIn.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthTimeIn(int _index) {
    _checkinLastMonthTimeIn.removeAt(_index);
  }

  void updateCheckinLastMonthTimeInAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinLastMonthTimeIn[_index] = updateFn(_checkinLastMonthTimeIn[_index]);
  }

  void insertAtIndexInCheckinLastMonthTimeIn(int _index, String _value) {
    _checkinLastMonthTimeIn.insert(_index, _value);
  }

  List<String> _checkinLastMonthTimeOut = [];
  List<String> get checkinLastMonthTimeOut => _checkinLastMonthTimeOut;
  set checkinLastMonthTimeOut(List<String> _value) {
    _checkinLastMonthTimeOut = _value;
  }

  void addToCheckinLastMonthTimeOut(String _value) {
    _checkinLastMonthTimeOut.add(_value);
  }

  void removeFromCheckinLastMonthTimeOut(String _value) {
    _checkinLastMonthTimeOut.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthTimeOut(int _index) {
    _checkinLastMonthTimeOut.removeAt(_index);
  }

  void updateCheckinLastMonthTimeOutAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkinLastMonthTimeOut[_index] =
        updateFn(_checkinLastMonthTimeOut[_index]);
  }

  void insertAtIndexInCheckinLastMonthTimeOut(int _index, String _value) {
    _checkinLastMonthTimeOut.insert(_index, _value);
  }

  String _endLeaveDayString = '';
  String get endLeaveDayString => _endLeaveDayString;
  set endLeaveDayString(String _value) {
    _endLeaveDayString = _value;
  }

  List<String> _leaveTypeName = [];
  List<String> get leaveTypeName => _leaveTypeName;
  set leaveTypeName(List<String> _value) {
    _leaveTypeName = _value;
  }

  void addToLeaveTypeName(String _value) {
    _leaveTypeName.add(_value);
  }

  void removeFromLeaveTypeName(String _value) {
    _leaveTypeName.remove(_value);
  }

  void removeAtIndexFromLeaveTypeName(int _index) {
    _leaveTypeName.removeAt(_index);
  }

  void updateLeaveTypeNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveTypeName[_index] = updateFn(_leaveTypeName[_index]);
  }

  void insertAtIndexInLeaveTypeName(int _index, String _value) {
    _leaveTypeName.insert(_index, _value);
  }

  String _areaResponsKPI = '[area_curent_month]';
  String get areaResponsKPI => _areaResponsKPI;
  set areaResponsKPI(String _value) {
    _areaResponsKPI = _value;
  }

  List<Color> _kpiGaugeColorListMain = [
    Color(4280103167),
    Color(4294960896),
    Color(4287299839)
  ];
  List<Color> get kpiGaugeColorListMain => _kpiGaugeColorListMain;
  set kpiGaugeColorListMain(List<Color> _value) {
    _kpiGaugeColorListMain = _value;
  }

  void addToKpiGaugeColorListMain(Color _value) {
    _kpiGaugeColorListMain.add(_value);
  }

  void removeFromKpiGaugeColorListMain(Color _value) {
    _kpiGaugeColorListMain.remove(_value);
  }

  void removeAtIndexFromKpiGaugeColorListMain(int _index) {
    _kpiGaugeColorListMain.removeAt(_index);
  }

  void updateKpiGaugeColorListMainAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _kpiGaugeColorListMain[_index] = updateFn(_kpiGaugeColorListMain[_index]);
  }

  void insertAtIndexInKpiGaugeColorListMain(int _index, Color _value) {
    _kpiGaugeColorListMain.insert(_index, _value);
  }

  List<Color> _kpiGaugeColorList2 = [
    Color(4278254079),
    Color(4294927616),
    Color(4294793471)
  ];
  List<Color> get kpiGaugeColorList2 => _kpiGaugeColorList2;
  set kpiGaugeColorList2(List<Color> _value) {
    _kpiGaugeColorList2 = _value;
  }

  void addToKpiGaugeColorList2(Color _value) {
    _kpiGaugeColorList2.add(_value);
  }

  void removeFromKpiGaugeColorList2(Color _value) {
    _kpiGaugeColorList2.remove(_value);
  }

  void removeAtIndexFromKpiGaugeColorList2(int _index) {
    _kpiGaugeColorList2.removeAt(_index);
  }

  void updateKpiGaugeColorList2AtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _kpiGaugeColorList2[_index] = updateFn(_kpiGaugeColorList2[_index]);
  }

  void insertAtIndexInKpiGaugeColorList2(int _index, Color _value) {
    _kpiGaugeColorList2.insert(_index, _value);
  }

  bool _checkAllowLeaveDay = false;
  bool get checkAllowLeaveDay => _checkAllowLeaveDay;
  set checkAllowLeaveDay(bool _value) {
    _checkAllowLeaveDay = _value;
  }

  List<String> _kpiProductTypeLM = ['M', 'CTV', 'HL'];
  List<String> get kpiProductTypeLM => _kpiProductTypeLM;
  set kpiProductTypeLM(List<String> _value) {
    _kpiProductTypeLM = _value;
  }

  void addToKpiProductTypeLM(String _value) {
    _kpiProductTypeLM.add(_value);
  }

  void removeFromKpiProductTypeLM(String _value) {
    _kpiProductTypeLM.remove(_value);
  }

  void removeAtIndexFromKpiProductTypeLM(int _index) {
    _kpiProductTypeLM.removeAt(_index);
  }

  void updateKpiProductTypeLMAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiProductTypeLM[_index] = updateFn(_kpiProductTypeLM[_index]);
  }

  void insertAtIndexInKpiProductTypeLM(int _index, String _value) {
    _kpiProductTypeLM.insert(_index, _value);
  }

  List<String> _kpiEmployeePositionLM = ['position', 'position', 'position'];
  List<String> get kpiEmployeePositionLM => _kpiEmployeePositionLM;
  set kpiEmployeePositionLM(List<String> _value) {
    _kpiEmployeePositionLM = _value;
  }

  void addToKpiEmployeePositionLM(String _value) {
    _kpiEmployeePositionLM.add(_value);
  }

  void removeFromKpiEmployeePositionLM(String _value) {
    _kpiEmployeePositionLM.remove(_value);
  }

  void removeAtIndexFromKpiEmployeePositionLM(int _index) {
    _kpiEmployeePositionLM.removeAt(_index);
  }

  void updateKpiEmployeePositionLMAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiEmployeePositionLM[_index] = updateFn(_kpiEmployeePositionLM[_index]);
  }

  void insertAtIndexInKpiEmployeePositionLM(int _index, String _value) {
    _kpiEmployeePositionLM.insert(_index, _value);
  }

  List<String> _kpiActualLM = ['0.0', '0.0', '0.0'];
  List<String> get kpiActualLM => _kpiActualLM;
  set kpiActualLM(List<String> _value) {
    _kpiActualLM = _value;
  }

  void addToKpiActualLM(String _value) {
    _kpiActualLM.add(_value);
  }

  void removeFromKpiActualLM(String _value) {
    _kpiActualLM.remove(_value);
  }

  void removeAtIndexFromKpiActualLM(int _index) {
    _kpiActualLM.removeAt(_index);
  }

  void updateKpiActualLMAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiActualLM[_index] = updateFn(_kpiActualLM[_index]);
  }

  void insertAtIndexInKpiActualLM(int _index, String _value) {
    _kpiActualLM.insert(_index, _value);
  }

  List<String> _kpiTargetQuantityLM = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantityLM => _kpiTargetQuantityLM;
  set kpiTargetQuantityLM(List<String> _value) {
    _kpiTargetQuantityLM = _value;
  }

  void addToKpiTargetQuantityLM(String _value) {
    _kpiTargetQuantityLM.add(_value);
  }

  void removeFromKpiTargetQuantityLM(String _value) {
    _kpiTargetQuantityLM.remove(_value);
  }

  void removeAtIndexFromKpiTargetQuantityLM(int _index) {
    _kpiTargetQuantityLM.removeAt(_index);
  }

  void updateKpiTargetQuantityLMAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiTargetQuantityLM[_index] = updateFn(_kpiTargetQuantityLM[_index]);
  }

  void insertAtIndexInKpiTargetQuantityLM(int _index, String _value) {
    _kpiTargetQuantityLM.insert(_index, _value);
  }

  List<String> _kpiYearMonthLM = ['2022-11', '2022-11', '2022-11'];
  List<String> get kpiYearMonthLM => _kpiYearMonthLM;
  set kpiYearMonthLM(List<String> _value) {
    _kpiYearMonthLM = _value;
  }

  void addToKpiYearMonthLM(String _value) {
    _kpiYearMonthLM.add(_value);
  }

  void removeFromKpiYearMonthLM(String _value) {
    _kpiYearMonthLM.remove(_value);
  }

  void removeAtIndexFromKpiYearMonthLM(int _index) {
    _kpiYearMonthLM.removeAt(_index);
  }

  void updateKpiYearMonthLMAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _kpiYearMonthLM[_index] = updateFn(_kpiYearMonthLM[_index]);
  }

  void insertAtIndexInKpiYearMonthLM(int _index, String _value) {
    _kpiYearMonthLM.insert(_index, _value);
  }

  String _kpiTargetBudgetLM = '100.00';
  String get kpiTargetBudgetLM => _kpiTargetBudgetLM;
  set kpiTargetBudgetLM(String _value) {
    _kpiTargetBudgetLM = _value;
  }

  String _kpiActualBudgetLM = '0.00';
  String get kpiActualBudgetLM => _kpiActualBudgetLM;
  set kpiActualBudgetLM(String _value) {
    _kpiActualBudgetLM = _value;
  }

  List<String> _countLeave = [];
  List<String> get countLeave => _countLeave;
  set countLeave(List<String> _value) {
    _countLeave = _value;
  }

  void addToCountLeave(String _value) {
    _countLeave.add(_value);
  }

  void removeFromCountLeave(String _value) {
    _countLeave.remove(_value);
  }

  void removeAtIndexFromCountLeave(int _index) {
    _countLeave.removeAt(_index);
  }

  void updateCountLeaveAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _countLeave[_index] = updateFn(_countLeave[_index]);
  }

  void insertAtIndexInCountLeave(int _index, String _value) {
    _countLeave.insert(_index, _value);
  }

  List<String> _totalLeave = [];
  List<String> get totalLeave => _totalLeave;
  set totalLeave(List<String> _value) {
    _totalLeave = _value;
  }

  void addToTotalLeave(String _value) {
    _totalLeave.add(_value);
  }

  void removeFromTotalLeave(String _value) {
    _totalLeave.remove(_value);
  }

  void removeAtIndexFromTotalLeave(int _index) {
    _totalLeave.removeAt(_index);
  }

  void updateTotalLeaveAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _totalLeave[_index] = updateFn(_totalLeave[_index]);
  }

  void insertAtIndexInTotalLeave(int _index, String _value) {
    _totalLeave.insert(_index, _value);
  }

  List<String> _statusCheckCount = [];
  List<String> get statusCheckCount => _statusCheckCount;
  set statusCheckCount(List<String> _value) {
    _statusCheckCount = _value;
  }

  void addToStatusCheckCount(String _value) {
    _statusCheckCount.add(_value);
  }

  void removeFromStatusCheckCount(String _value) {
    _statusCheckCount.remove(_value);
  }

  void removeAtIndexFromStatusCheckCount(int _index) {
    _statusCheckCount.removeAt(_index);
  }

  void updateStatusCheckCountAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _statusCheckCount[_index] = updateFn(_statusCheckCount[_index]);
  }

  void insertAtIndexInStatusCheckCount(int _index, String _value) {
    _statusCheckCount.insert(_index, _value);
  }

  String _kpiAreaResponsLM = '[area_last_month]';
  String get kpiAreaResponsLM => _kpiAreaResponsLM;
  set kpiAreaResponsLM(String _value) {
    _kpiAreaResponsLM = _value;
  }

  bool _allowFileUpload = false;
  bool get allowFileUpload => _allowFileUpload;
  set allowFileUpload(bool _value) {
    _allowFileUpload = _value;
  }

  String _leaveDaysLocal = '0.5';
  String get leaveDaysLocal => _leaveDaysLocal;
  set leaveDaysLocal(String _value) {
    _leaveDaysLocal = _value;
  }

  double _leaveDaysDouble = 0.5;
  double get leaveDaysDouble => _leaveDaysDouble;
  set leaveDaysDouble(double _value) {
    _leaveDaysDouble = _value;
  }

  String _leaveListID = 'leave_list_id';
  String get leaveListID => _leaveListID;
  set leaveListID(String _value) {
    _leaveListID = _value;
  }

  String _ProfilePhoneNumber = '';
  String get ProfilePhoneNumber => _ProfilePhoneNumber;
  set ProfilePhoneNumber(String _value) {
    _ProfilePhoneNumber = _value;
  }

  String _profileFirstBossEmpID = '';
  String get profileFirstBossEmpID => _profileFirstBossEmpID;
  set profileFirstBossEmpID(String _value) {
    _profileFirstBossEmpID = _value;
  }

  String _profileSecondBossEmpID = '';
  String get profileSecondBossEmpID => _profileSecondBossEmpID;
  set profileSecondBossEmpID(String _value) {
    _profileSecondBossEmpID = _value;
  }

  List<String> _leaveDocImgPathList = [];
  List<String> get leaveDocImgPathList => _leaveDocImgPathList;
  set leaveDocImgPathList(List<String> _value) {
    _leaveDocImgPathList = _value;
  }

  void addToLeaveDocImgPathList(String _value) {
    _leaveDocImgPathList.add(_value);
  }

  void removeFromLeaveDocImgPathList(String _value) {
    _leaveDocImgPathList.remove(_value);
  }

  void removeAtIndexFromLeaveDocImgPathList(int _index) {
    _leaveDocImgPathList.removeAt(_index);
  }

  void updateLeaveDocImgPathListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveDocImgPathList[_index] = updateFn(_leaveDocImgPathList[_index]);
  }

  void insertAtIndexInLeaveDocImgPathList(int _index, String _value) {
    _leaveDocImgPathList.insert(_index, _value);
  }

  String _positionApprove = '1';
  String get positionApprove => _positionApprove;
  set positionApprove(String _value) {
    _positionApprove = _value;
  }

  List<String> _disapproveName = [];
  List<String> get disapproveName => _disapproveName;
  set disapproveName(List<String> _value) {
    _disapproveName = _value;
  }

  void addToDisapproveName(String _value) {
    _disapproveName.add(_value);
  }

  void removeFromDisapproveName(String _value) {
    _disapproveName.remove(_value);
  }

  void removeAtIndexFromDisapproveName(int _index) {
    _disapproveName.removeAt(_index);
  }

  void updateDisapproveNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveName[_index] = updateFn(_disapproveName[_index]);
  }

  void insertAtIndexInDisapproveName(int _index, String _value) {
    _disapproveName.insert(_index, _value);
  }

  List<String> _disapproveLeaveName = [];
  List<String> get disapproveLeaveName => _disapproveLeaveName;
  set disapproveLeaveName(List<String> _value) {
    _disapproveLeaveName = _value;
  }

  void addToDisapproveLeaveName(String _value) {
    _disapproveLeaveName.add(_value);
  }

  void removeFromDisapproveLeaveName(String _value) {
    _disapproveLeaveName.remove(_value);
  }

  void removeAtIndexFromDisapproveLeaveName(int _index) {
    _disapproveLeaveName.removeAt(_index);
  }

  void updateDisapproveLeaveNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveLeaveName[_index] = updateFn(_disapproveLeaveName[_index]);
  }

  void insertAtIndexInDisapproveLeaveName(int _index, String _value) {
    _disapproveLeaveName.insert(_index, _value);
  }

  List<String> _disapproveCreatedDate = [];
  List<String> get disapproveCreatedDate => _disapproveCreatedDate;
  set disapproveCreatedDate(List<String> _value) {
    _disapproveCreatedDate = _value;
  }

  void addToDisapproveCreatedDate(String _value) {
    _disapproveCreatedDate.add(_value);
  }

  void removeFromDisapproveCreatedDate(String _value) {
    _disapproveCreatedDate.remove(_value);
  }

  void removeAtIndexFromDisapproveCreatedDate(int _index) {
    _disapproveCreatedDate.removeAt(_index);
  }

  void updateDisapproveCreatedDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveCreatedDate[_index] = updateFn(_disapproveCreatedDate[_index]);
  }

  void insertAtIndexInDisapproveCreatedDate(int _index, String _value) {
    _disapproveCreatedDate.insert(_index, _value);
  }

  List<String> _disapproveLeaveDate = [];
  List<String> get disapproveLeaveDate => _disapproveLeaveDate;
  set disapproveLeaveDate(List<String> _value) {
    _disapproveLeaveDate = _value;
  }

  void addToDisapproveLeaveDate(String _value) {
    _disapproveLeaveDate.add(_value);
  }

  void removeFromDisapproveLeaveDate(String _value) {
    _disapproveLeaveDate.remove(_value);
  }

  void removeAtIndexFromDisapproveLeaveDate(int _index) {
    _disapproveLeaveDate.removeAt(_index);
  }

  void updateDisapproveLeaveDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveLeaveDate[_index] = updateFn(_disapproveLeaveDate[_index]);
  }

  void insertAtIndexInDisapproveLeaveDate(int _index, String _value) {
    _disapproveLeaveDate.insert(_index, _value);
  }

  List<String> _disapproveCountDay = [];
  List<String> get disapproveCountDay => _disapproveCountDay;
  set disapproveCountDay(List<String> _value) {
    _disapproveCountDay = _value;
  }

  void addToDisapproveCountDay(String _value) {
    _disapproveCountDay.add(_value);
  }

  void removeFromDisapproveCountDay(String _value) {
    _disapproveCountDay.remove(_value);
  }

  void removeAtIndexFromDisapproveCountDay(int _index) {
    _disapproveCountDay.removeAt(_index);
  }

  void updateDisapproveCountDayAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveCountDay[_index] = updateFn(_disapproveCountDay[_index]);
  }

  void insertAtIndexInDisapproveCountDay(int _index, String _value) {
    _disapproveCountDay.insert(_index, _value);
  }

  List<String> _disapproveTimePeriod = [];
  List<String> get disapproveTimePeriod => _disapproveTimePeriod;
  set disapproveTimePeriod(List<String> _value) {
    _disapproveTimePeriod = _value;
  }

  void addToDisapproveTimePeriod(String _value) {
    _disapproveTimePeriod.add(_value);
  }

  void removeFromDisapproveTimePeriod(String _value) {
    _disapproveTimePeriod.remove(_value);
  }

  void removeAtIndexFromDisapproveTimePeriod(int _index) {
    _disapproveTimePeriod.removeAt(_index);
  }

  void updateDisapproveTimePeriodAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveTimePeriod[_index] = updateFn(_disapproveTimePeriod[_index]);
  }

  void insertAtIndexInDisapproveTimePeriod(int _index, String _value) {
    _disapproveTimePeriod.insert(_index, _value);
  }

  List<String> _disapproveReason = [];
  List<String> get disapproveReason => _disapproveReason;
  set disapproveReason(List<String> _value) {
    _disapproveReason = _value;
  }

  void addToDisapproveReason(String _value) {
    _disapproveReason.add(_value);
  }

  void removeFromDisapproveReason(String _value) {
    _disapproveReason.remove(_value);
  }

  void removeAtIndexFromDisapproveReason(int _index) {
    _disapproveReason.removeAt(_index);
  }

  void updateDisapproveReasonAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _disapproveReason[_index] = updateFn(_disapproveReason[_index]);
  }

  void insertAtIndexInDisapproveReason(int _index, String _value) {
    _disapproveReason.insert(_index, _value);
  }

  List<String> _provName = ['ProvName'];
  List<String> get provName => _provName;
  set provName(List<String> _value) {
    _provName = _value;
  }

  void addToProvName(String _value) {
    _provName.add(_value);
  }

  void removeFromProvName(String _value) {
    _provName.remove(_value);
  }

  void removeAtIndexFromProvName(int _index) {
    _provName.removeAt(_index);
  }

  void updateProvNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _provName[_index] = updateFn(_provName[_index]);
  }

  void insertAtIndexInProvName(int _index, String _value) {
    _provName.insert(_index, _value);
  }

  List<String> _provCode = ['ProvCode'];
  List<String> get provCode => _provCode;
  set provCode(List<String> _value) {
    _provCode = _value;
  }

  void addToProvCode(String _value) {
    _provCode.add(_value);
  }

  void removeFromProvCode(String _value) {
    _provCode.remove(_value);
  }

  void removeAtIndexFromProvCode(int _index) {
    _provCode.removeAt(_index);
  }

  void updateProvCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _provCode[_index] = updateFn(_provCode[_index]);
  }

  void insertAtIndexInProvCode(int _index, String _value) {
    _provCode.insert(_index, _value);
  }

  List<String> _districtName = ['districtName'];
  List<String> get districtName => _districtName;
  set districtName(List<String> _value) {
    _districtName = _value;
  }

  void addToDistrictName(String _value) {
    _districtName.add(_value);
  }

  void removeFromDistrictName(String _value) {
    _districtName.remove(_value);
  }

  void removeAtIndexFromDistrictName(int _index) {
    _districtName.removeAt(_index);
  }

  void updateDistrictNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _districtName[_index] = updateFn(_districtName[_index]);
  }

  void insertAtIndexInDistrictName(int _index, String _value) {
    _districtName.insert(_index, _value);
  }

  List<String> _districtCode = ['districtCode'];
  List<String> get districtCode => _districtCode;
  set districtCode(List<String> _value) {
    _districtCode = _value;
  }

  void addToDistrictCode(String _value) {
    _districtCode.add(_value);
  }

  void removeFromDistrictCode(String _value) {
    _districtCode.remove(_value);
  }

  void removeAtIndexFromDistrictCode(int _index) {
    _districtCode.removeAt(_index);
  }

  void updateDistrictCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _districtCode[_index] = updateFn(_districtCode[_index]);
  }

  void insertAtIndexInDistrictCode(int _index, String _value) {
    _districtCode.insert(_index, _value);
  }

  List<String> _postCode = ['PostCode'];
  List<String> get postCode => _postCode;
  set postCode(List<String> _value) {
    _postCode = _value;
  }

  void addToPostCode(String _value) {
    _postCode.add(_value);
  }

  void removeFromPostCode(String _value) {
    _postCode.remove(_value);
  }

  void removeAtIndexFromPostCode(int _index) {
    _postCode.removeAt(_index);
  }

  void updatePostCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _postCode[_index] = updateFn(_postCode[_index]);
  }

  void insertAtIndexInPostCode(int _index, String _value) {
    _postCode.insert(_index, _value);
  }

  List<String> _subDistrictName = ['subDistrictName'];
  List<String> get subDistrictName => _subDistrictName;
  set subDistrictName(List<String> _value) {
    _subDistrictName = _value;
  }

  void addToSubDistrictName(String _value) {
    _subDistrictName.add(_value);
  }

  void removeFromSubDistrictName(String _value) {
    _subDistrictName.remove(_value);
  }

  void removeAtIndexFromSubDistrictName(int _index) {
    _subDistrictName.removeAt(_index);
  }

  void updateSubDistrictNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _subDistrictName[_index] = updateFn(_subDistrictName[_index]);
  }

  void insertAtIndexInSubDistrictName(int _index, String _value) {
    _subDistrictName.insert(_index, _value);
  }

  int _leaveDayInt = 0;
  int get leaveDayInt => _leaveDayInt;
  set leaveDayInt(int _value) {
    _leaveDayInt = _value;
  }

  List<String> _leaveTypeEdit = [];
  List<String> get leaveTypeEdit => _leaveTypeEdit;
  set leaveTypeEdit(List<String> _value) {
    _leaveTypeEdit = _value;
  }

  void addToLeaveTypeEdit(String _value) {
    _leaveTypeEdit.add(_value);
  }

  void removeFromLeaveTypeEdit(String _value) {
    _leaveTypeEdit.remove(_value);
  }

  void removeAtIndexFromLeaveTypeEdit(int _index) {
    _leaveTypeEdit.removeAt(_index);
  }

  void updateLeaveTypeEditAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveTypeEdit[_index] = updateFn(_leaveTypeEdit[_index]);
  }

  void insertAtIndexInLeaveTypeEdit(int _index, String _value) {
    _leaveTypeEdit.insert(_index, _value);
  }

  List<String> _leaveHalfDay = [
    'ลาเต็มวัน',
    'ลาครึ่งวันเช้า',
    'ลาครึ่งวันบ่าย'
  ];
  List<String> get leaveHalfDay => _leaveHalfDay;
  set leaveHalfDay(List<String> _value) {
    _leaveHalfDay = _value;
  }

  void addToLeaveHalfDay(String _value) {
    _leaveHalfDay.add(_value);
  }

  void removeFromLeaveHalfDay(String _value) {
    _leaveHalfDay.remove(_value);
  }

  void removeAtIndexFromLeaveHalfDay(int _index) {
    _leaveHalfDay.removeAt(_index);
  }

  void updateLeaveHalfDayAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveHalfDay[_index] = updateFn(_leaveHalfDay[_index]);
  }

  void insertAtIndexInLeaveHalfDay(int _index, String _value) {
    _leaveHalfDay.insert(_index, _value);
  }

  List<String> _leaveFullDay = ['ลาเต็มวัน'];
  List<String> get leaveFullDay => _leaveFullDay;
  set leaveFullDay(List<String> _value) {
    _leaveFullDay = _value;
  }

  void addToLeaveFullDay(String _value) {
    _leaveFullDay.add(_value);
  }

  void removeFromLeaveFullDay(String _value) {
    _leaveFullDay.remove(_value);
  }

  void removeAtIndexFromLeaveFullDay(int _index) {
    _leaveFullDay.removeAt(_index);
  }

  void updateLeaveFullDayAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leaveFullDay[_index] = updateFn(_leaveFullDay[_index]);
  }

  void insertAtIndexInLeaveFullDay(int _index, String _value) {
    _leaveFullDay.insert(_index, _value);
  }

  bool _leaveReasonEtcVisible = false;
  bool get leaveReasonEtcVisible => _leaveReasonEtcVisible;
  set leaveReasonEtcVisible(bool _value) {
    _leaveReasonEtcVisible = _value;
  }

  bool _companyAssetReturnEtcVisible = false;
  bool get companyAssetReturnEtcVisible => _companyAssetReturnEtcVisible;
  set companyAssetReturnEtcVisible(bool _value) {
    _companyAssetReturnEtcVisible = _value;
  }

  List<String> _reasonToLeaveList = [];
  List<String> get reasonToLeaveList => _reasonToLeaveList;
  set reasonToLeaveList(List<String> _value) {
    _reasonToLeaveList = _value;
  }

  void addToReasonToLeaveList(String _value) {
    _reasonToLeaveList.add(_value);
  }

  void removeFromReasonToLeaveList(String _value) {
    _reasonToLeaveList.remove(_value);
  }

  void removeAtIndexFromReasonToLeaveList(int _index) {
    _reasonToLeaveList.removeAt(_index);
  }

  void updateReasonToLeaveListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _reasonToLeaveList[_index] = updateFn(_reasonToLeaveList[_index]);
  }

  void insertAtIndexInReasonToLeaveList(int _index, String _value) {
    _reasonToLeaveList.insert(_index, _value);
  }

  List<String> _assetReturnList = [];
  List<String> get assetReturnList => _assetReturnList;
  set assetReturnList(List<String> _value) {
    _assetReturnList = _value;
  }

  void addToAssetReturnList(String _value) {
    _assetReturnList.add(_value);
  }

  void removeFromAssetReturnList(String _value) {
    _assetReturnList.remove(_value);
  }

  void removeAtIndexFromAssetReturnList(int _index) {
    _assetReturnList.removeAt(_index);
  }

  void updateAssetReturnListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _assetReturnList[_index] = updateFn(_assetReturnList[_index]);
  }

  void insertAtIndexInAssetReturnList(int _index, String _value) {
    _assetReturnList.insert(_index, _value);
  }

  List<String> _insurancePlan1 = [];
  List<String> get insurancePlan1 => _insurancePlan1;
  set insurancePlan1(List<String> _value) {
    _insurancePlan1 = _value;
  }

  void addToInsurancePlan1(String _value) {
    _insurancePlan1.add(_value);
  }

  void removeFromInsurancePlan1(String _value) {
    _insurancePlan1.remove(_value);
  }

  void removeAtIndexFromInsurancePlan1(int _index) {
    _insurancePlan1.removeAt(_index);
  }

  void updateInsurancePlan1AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insurancePlan1[_index] = updateFn(_insurancePlan1[_index]);
  }

  void insertAtIndexInInsurancePlan1(int _index, String _value) {
    _insurancePlan1.insert(_index, _value);
  }

  String _insurancePlanNumber = '';
  String get insurancePlanNumber => _insurancePlanNumber;
  set insurancePlanNumber(String _value) {
    _insurancePlanNumber = _value;
  }

  String _profileLevel = '';
  String get profileLevel => _profileLevel;
  set profileLevel(String _value) {
    _profileLevel = _value;
  }

  String _profileBranch = '';
  String get profileBranch => _profileBranch;
  set profileBranch(String _value) {
    _profileBranch = _value;
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
  set welfareKpiStatusTextColorList(List<Color> _value) {
    _welfareKpiStatusTextColorList = _value;
  }

  void addToWelfareKpiStatusTextColorList(Color _value) {
    _welfareKpiStatusTextColorList.add(_value);
  }

  void removeFromWelfareKpiStatusTextColorList(Color _value) {
    _welfareKpiStatusTextColorList.remove(_value);
  }

  void removeAtIndexFromWelfareKpiStatusTextColorList(int _index) {
    _welfareKpiStatusTextColorList.removeAt(_index);
  }

  void updateWelfareKpiStatusTextColorListAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _welfareKpiStatusTextColorList[_index] =
        updateFn(_welfareKpiStatusTextColorList[_index]);
  }

  void insertAtIndexInWelfareKpiStatusTextColorList(int _index, Color _value) {
    _welfareKpiStatusTextColorList.insert(_index, _value);
  }

  bool _isProduction = true;
  bool get isProduction => _isProduction;
  set isProduction(bool _value) {
    _isProduction = _value;
  }

  bool _isSelectedBranch = false;
  bool get isSelectedBranch => _isSelectedBranch;
  set isSelectedBranch(bool _value) {
    _isSelectedBranch = _value;
  }

  bool _isSearchedBranch = false;
  bool get isSearchedBranch => _isSearchedBranch;
  set isSearchedBranch(bool _value) {
    _isSearchedBranch = _value;
  }

  bool _isEmployeeSearched = false;
  bool get isEmployeeSearched => _isEmployeeSearched;
  set isEmployeeSearched(bool _value) {
    _isEmployeeSearched = _value;
  }

  bool _isEmployeeSelected = false;
  bool get isEmployeeSelected => _isEmployeeSelected;
  set isEmployeeSelected(bool _value) {
    _isEmployeeSelected = _value;
  }

  List<int> _welfareCEOStatusList = [5544, 5544];
  List<int> get welfareCEOStatusList => _welfareCEOStatusList;
  set welfareCEOStatusList(List<int> _value) {
    _welfareCEOStatusList = _value;
  }

  void addToWelfareCEOStatusList(int _value) {
    _welfareCEOStatusList.add(_value);
  }

  void removeFromWelfareCEOStatusList(int _value) {
    _welfareCEOStatusList.remove(_value);
  }

  void removeAtIndexFromWelfareCEOStatusList(int _index) {
    _welfareCEOStatusList.removeAt(_index);
  }

  void updateWelfareCEOStatusListAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _welfareCEOStatusList[_index] = updateFn(_welfareCEOStatusList[_index]);
  }

  void insertAtIndexInWelfareCEOStatusList(int _index, int _value) {
    _welfareCEOStatusList.insert(_index, _value);
  }

  List<String> _leadCountCalled = [];
  List<String> get leadCountCalled => _leadCountCalled;
  set leadCountCalled(List<String> _value) {
    _leadCountCalled = _value;
  }

  void addToLeadCountCalled(String _value) {
    _leadCountCalled.add(_value);
  }

  void removeFromLeadCountCalled(String _value) {
    _leadCountCalled.remove(_value);
  }

  void removeAtIndexFromLeadCountCalled(int _index) {
    _leadCountCalled.removeAt(_index);
  }

  void updateLeadCountCalledAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCountCalled[_index] = updateFn(_leadCountCalled[_index]);
  }

  void insertAtIndexInLeadCountCalled(int _index, String _value) {
    _leadCountCalled.insert(_index, _value);
  }

  double _branchLatDouble = 0;
  double get branchLatDouble => _branchLatDouble;
  set branchLatDouble(double _value) {
    _branchLatDouble = _value;
  }

  double _branchLngDouble = 0;
  double get branchLngDouble => _branchLngDouble;
  set branchLngDouble(double _value) {
    _branchLngDouble = _value;
  }

  double _currentLatDouble = 0.0;
  double get currentLatDouble => _currentLatDouble;
  set currentLatDouble(double _value) {
    _currentLatDouble = _value;
  }

  double _currentLngDouble = 0.0;
  double get currentLngDouble => _currentLngDouble;
  set currentLngDouble(double _value) {
    _currentLngDouble = _value;
  }

  List<String> _leadName2 = [];
  List<String> get leadName2 => _leadName2;
  set leadName2(List<String> _value) {
    _leadName2 = _value;
  }

  void addToLeadName2(String _value) {
    _leadName2.add(_value);
  }

  void removeFromLeadName2(String _value) {
    _leadName2.remove(_value);
  }

  void removeAtIndexFromLeadName2(int _index) {
    _leadName2.removeAt(_index);
  }

  void updateLeadName2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadName2[_index] = updateFn(_leadName2[_index]);
  }

  void insertAtIndexInLeadName2(int _index, String _value) {
    _leadName2.insert(_index, _value);
  }

  List<String> _leadLastname2 = [];
  List<String> get leadLastname2 => _leadLastname2;
  set leadLastname2(List<String> _value) {
    _leadLastname2 = _value;
  }

  void addToLeadLastname2(String _value) {
    _leadLastname2.add(_value);
  }

  void removeFromLeadLastname2(String _value) {
    _leadLastname2.remove(_value);
  }

  void removeAtIndexFromLeadLastname2(int _index) {
    _leadLastname2.removeAt(_index);
  }

  void updateLeadLastname2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadLastname2[_index] = updateFn(_leadLastname2[_index]);
  }

  void insertAtIndexInLeadLastname2(int _index, String _value) {
    _leadLastname2.insert(_index, _value);
  }

  List<String> _leadPhone2 = [];
  List<String> get leadPhone2 => _leadPhone2;
  set leadPhone2(List<String> _value) {
    _leadPhone2 = _value;
  }

  void addToLeadPhone2(String _value) {
    _leadPhone2.add(_value);
  }

  void removeFromLeadPhone2(String _value) {
    _leadPhone2.remove(_value);
  }

  void removeAtIndexFromLeadPhone2(int _index) {
    _leadPhone2.removeAt(_index);
  }

  void updateLeadPhone2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadPhone2[_index] = updateFn(_leadPhone2[_index]);
  }

  void insertAtIndexInLeadPhone2(int _index, String _value) {
    _leadPhone2.insert(_index, _value);
  }

  List<int> _totalSumPoint = [];
  List<int> get totalSumPoint => _totalSumPoint;
  set totalSumPoint(List<int> _value) {
    _totalSumPoint = _value;
  }

  void addToTotalSumPoint(int _value) {
    _totalSumPoint.add(_value);
  }

  void removeFromTotalSumPoint(int _value) {
    _totalSumPoint.remove(_value);
  }

  void removeAtIndexFromTotalSumPoint(int _index) {
    _totalSumPoint.removeAt(_index);
  }

  void updateTotalSumPointAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _totalSumPoint[_index] = updateFn(_totalSumPoint[_index]);
  }

  void insertAtIndexInTotalSumPoint(int _index, int _value) {
    _totalSumPoint.insert(_index, _value);
  }

  List<String> _leadCarVehicleName = [];
  List<String> get leadCarVehicleName => _leadCarVehicleName;
  set leadCarVehicleName(List<String> _value) {
    _leadCarVehicleName = _value;
  }

  void addToLeadCarVehicleName(String _value) {
    _leadCarVehicleName.add(_value);
  }

  void removeFromLeadCarVehicleName(String _value) {
    _leadCarVehicleName.remove(_value);
  }

  void removeAtIndexFromLeadCarVehicleName(int _index) {
    _leadCarVehicleName.removeAt(_index);
  }

  void updateLeadCarVehicleNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCarVehicleName[_index] = updateFn(_leadCarVehicleName[_index]);
  }

  void insertAtIndexInLeadCarVehicleName(int _index, String _value) {
    _leadCarVehicleName.insert(_index, _value);
  }

  List<String> _leadAmountRequest = [];
  List<String> get leadAmountRequest => _leadAmountRequest;
  set leadAmountRequest(List<String> _value) {
    _leadAmountRequest = _value;
  }

  void addToLeadAmountRequest(String _value) {
    _leadAmountRequest.add(_value);
  }

  void removeFromLeadAmountRequest(String _value) {
    _leadAmountRequest.remove(_value);
  }

  void removeAtIndexFromLeadAmountRequest(int _index) {
    _leadAmountRequest.removeAt(_index);
  }

  void updateLeadAmountRequestAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadAmountRequest[_index] = updateFn(_leadAmountRequest[_index]);
  }

  void insertAtIndexInLeadAmountRequest(int _index, String _value) {
    _leadAmountRequest.insert(_index, _value);
  }

  String _changeBranchCode = '';
  String get changeBranchCode => _changeBranchCode;
  set changeBranchCode(String _value) {
    _changeBranchCode = _value;
  }

  String _changeLat = '';
  String get changeLat => _changeLat;
  set changeLat(String _value) {
    _changeLat = _value;
  }

  String _changeLng = '';
  String get changeLng => _changeLng;
  set changeLng(String _value) {
    _changeLng = _value;
  }

  DateTime? _tpbDate;
  DateTime? get tpbDate => _tpbDate;
  set tpbDate(DateTime? _value) {
    _tpbDate = _value;
  }

  bool _firstLogin = false;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool _value) {
    _firstLogin = _value;
    secureStorage.setBool('ff_firstLogin', _value);
  }

  void deleteFirstLogin() {
    secureStorage.delete(key: 'ff_firstLogin');
  }

  List<String> _brachListNew = [];
  List<String> get brachListNew => _brachListNew;
  set brachListNew(List<String> _value) {
    _brachListNew = _value;
    secureStorage.setStringList('ff_brachListNew', _value);
  }

  void deleteBrachListNew() {
    secureStorage.delete(key: 'ff_brachListNew');
  }

  void addToBrachListNew(String _value) {
    _brachListNew.add(_value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeFromBrachListNew(String _value) {
    _brachListNew.remove(_value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeAtIndexFromBrachListNew(int _index) {
    _brachListNew.removeAt(_index);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void updateBrachListNewAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _brachListNew[_index] = updateFn(_brachListNew[_index]);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void insertAtIndexInBrachListNew(int _index, String _value) {
    _brachListNew.insert(_index, _value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  List<String> _brachLatNew = [];
  List<String> get brachLatNew => _brachLatNew;
  set brachLatNew(List<String> _value) {
    _brachLatNew = _value;
    secureStorage.setStringList('ff_brachLatNew', _value);
  }

  void deleteBrachLatNew() {
    secureStorage.delete(key: 'ff_brachLatNew');
  }

  void addToBrachLatNew(String _value) {
    _brachLatNew.add(_value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeFromBrachLatNew(String _value) {
    _brachLatNew.remove(_value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeAtIndexFromBrachLatNew(int _index) {
    _brachLatNew.removeAt(_index);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void updateBrachLatNewAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _brachLatNew[_index] = updateFn(_brachLatNew[_index]);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void insertAtIndexInBrachLatNew(int _index, String _value) {
    _brachLatNew.insert(_index, _value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  List<String> _brachLngNew = [];
  List<String> get brachLngNew => _brachLngNew;
  set brachLngNew(List<String> _value) {
    _brachLngNew = _value;
    secureStorage.setStringList('ff_brachLngNew', _value);
  }

  void deleteBrachLngNew() {
    secureStorage.delete(key: 'ff_brachLngNew');
  }

  void addToBrachLngNew(String _value) {
    _brachLngNew.add(_value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeFromBrachLngNew(String _value) {
    _brachLngNew.remove(_value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeAtIndexFromBrachLngNew(int _index) {
    _brachLngNew.removeAt(_index);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void updateBrachLngNewAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _brachLngNew[_index] = updateFn(_brachLngNew[_index]);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void insertAtIndexInBrachLngNew(int _index, String _value) {
    _brachLngNew.insert(_index, _value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  List<String> _BrachRadNew = [];
  List<String> get BrachRadNew => _BrachRadNew;
  set BrachRadNew(List<String> _value) {
    _BrachRadNew = _value;
    secureStorage.setStringList('ff_BrachRadNew', _value);
  }

  void deleteBrachRadNew() {
    secureStorage.delete(key: 'ff_BrachRadNew');
  }

  void addToBrachRadNew(String _value) {
    _BrachRadNew.add(_value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeFromBrachRadNew(String _value) {
    _BrachRadNew.remove(_value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeAtIndexFromBrachRadNew(int _index) {
    _BrachRadNew.removeAt(_index);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void updateBrachRadNewAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _BrachRadNew[_index] = updateFn(_BrachRadNew[_index]);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void insertAtIndexInBrachRadNew(int _index, String _value) {
    _BrachRadNew.insert(_index, _value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  String _brachGroupNew = '';
  String get brachGroupNew => _brachGroupNew;
  set brachGroupNew(String _value) {
    _brachGroupNew = _value;
    secureStorage.setString('ff_brachGroupNew', _value);
  }

  void deleteBrachGroupNew() {
    secureStorage.delete(key: 'ff_brachGroupNew');
  }

  List<String> _leadCalledStatusReason = [];
  List<String> get leadCalledStatusReason => _leadCalledStatusReason;
  set leadCalledStatusReason(List<String> _value) {
    _leadCalledStatusReason = _value;
  }

  void addToLeadCalledStatusReason(String _value) {
    _leadCalledStatusReason.add(_value);
  }

  void removeFromLeadCalledStatusReason(String _value) {
    _leadCalledStatusReason.remove(_value);
  }

  void removeAtIndexFromLeadCalledStatusReason(int _index) {
    _leadCalledStatusReason.removeAt(_index);
  }

  void updateLeadCalledStatusReasonAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCalledStatusReason[_index] = updateFn(_leadCalledStatusReason[_index]);
  }

  void insertAtIndexInLeadCalledStatusReason(int _index, String _value) {
    _leadCalledStatusReason.insert(_index, _value);
  }

  List<String> _leadContractStatus = [];
  List<String> get leadContractStatus => _leadContractStatus;
  set leadContractStatus(List<String> _value) {
    _leadContractStatus = _value;
  }

  void addToLeadContractStatus(String _value) {
    _leadContractStatus.add(_value);
  }

  void removeFromLeadContractStatus(String _value) {
    _leadContractStatus.remove(_value);
  }

  void removeAtIndexFromLeadContractStatus(int _index) {
    _leadContractStatus.removeAt(_index);
  }

  void updateLeadContractStatusAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadContractStatus[_index] = updateFn(_leadContractStatus[_index]);
  }

  void insertAtIndexInLeadContractStatus(int _index, String _value) {
    _leadContractStatus.insert(_index, _value);
  }

  List<String> _leadContractDate = [];
  List<String> get leadContractDate => _leadContractDate;
  set leadContractDate(List<String> _value) {
    _leadContractDate = _value;
  }

  void addToLeadContractDate(String _value) {
    _leadContractDate.add(_value);
  }

  void removeFromLeadContractDate(String _value) {
    _leadContractDate.remove(_value);
  }

  void removeAtIndexFromLeadContractDate(int _index) {
    _leadContractDate.removeAt(_index);
  }

  void updateLeadContractDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadContractDate[_index] = updateFn(_leadContractDate[_index]);
  }

  void insertAtIndexInLeadContractDate(int _index, String _value) {
    _leadContractDate.insert(_index, _value);
  }

  List<String> _defaultList1 = [
    'Hello World1',
    'Hello World3',
    'Hello World5',
    'Hello World7',
    'Hello World9'
  ];
  List<String> get defaultList1 => _defaultList1;
  set defaultList1(List<String> _value) {
    _defaultList1 = _value;
  }

  void addToDefaultList1(String _value) {
    _defaultList1.add(_value);
  }

  void removeFromDefaultList1(String _value) {
    _defaultList1.remove(_value);
  }

  void removeAtIndexFromDefaultList1(int _index) {
    _defaultList1.removeAt(_index);
  }

  void updateDefaultList1AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList1[_index] = updateFn(_defaultList1[_index]);
  }

  void insertAtIndexInDefaultList1(int _index, String _value) {
    _defaultList1.insert(_index, _value);
  }

  List<String> _defaultList2 = ['Hello World'];
  List<String> get defaultList2 => _defaultList2;
  set defaultList2(List<String> _value) {
    _defaultList2 = _value;
  }

  void addToDefaultList2(String _value) {
    _defaultList2.add(_value);
  }

  void removeFromDefaultList2(String _value) {
    _defaultList2.remove(_value);
  }

  void removeAtIndexFromDefaultList2(int _index) {
    _defaultList2.removeAt(_index);
  }

  void updateDefaultList2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList2[_index] = updateFn(_defaultList2[_index]);
  }

  void insertAtIndexInDefaultList2(int _index, String _value) {
    _defaultList2.insert(_index, _value);
  }

  List<String> _defaultList3 = ['Hello World'];
  List<String> get defaultList3 => _defaultList3;
  set defaultList3(List<String> _value) {
    _defaultList3 = _value;
  }

  void addToDefaultList3(String _value) {
    _defaultList3.add(_value);
  }

  void removeFromDefaultList3(String _value) {
    _defaultList3.remove(_value);
  }

  void removeAtIndexFromDefaultList3(int _index) {
    _defaultList3.removeAt(_index);
  }

  void updateDefaultList3AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList3[_index] = updateFn(_defaultList3[_index]);
  }

  void insertAtIndexInDefaultList3(int _index, String _value) {
    _defaultList3.insert(_index, _value);
  }

  List<String> _defaultList4 = ['Hello World'];
  List<String> get defaultList4 => _defaultList4;
  set defaultList4(List<String> _value) {
    _defaultList4 = _value;
  }

  void addToDefaultList4(String _value) {
    _defaultList4.add(_value);
  }

  void removeFromDefaultList4(String _value) {
    _defaultList4.remove(_value);
  }

  void removeAtIndexFromDefaultList4(int _index) {
    _defaultList4.removeAt(_index);
  }

  void updateDefaultList4AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList4[_index] = updateFn(_defaultList4[_index]);
  }

  void insertAtIndexInDefaultList4(int _index, String _value) {
    _defaultList4.insert(_index, _value);
  }

  List<String> _defaultList5 = ['อยู่ระหว่างชำระเงิน', 'เตรียมข้อมูล'];
  List<String> get defaultList5 => _defaultList5;
  set defaultList5(List<String> _value) {
    _defaultList5 = _value;
  }

  void addToDefaultList5(String _value) {
    _defaultList5.add(_value);
  }

  void removeFromDefaultList5(String _value) {
    _defaultList5.remove(_value);
  }

  void removeAtIndexFromDefaultList5(int _index) {
    _defaultList5.removeAt(_index);
  }

  void updateDefaultList5AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList5[_index] = updateFn(_defaultList5[_index]);
  }

  void insertAtIndexInDefaultList5(int _index, String _value) {
    _defaultList5.insert(_index, _value);
  }

  List<String> _defaultList6 = ['Hello World'];
  List<String> get defaultList6 => _defaultList6;
  set defaultList6(List<String> _value) {
    _defaultList6 = _value;
  }

  void addToDefaultList6(String _value) {
    _defaultList6.add(_value);
  }

  void removeFromDefaultList6(String _value) {
    _defaultList6.remove(_value);
  }

  void removeAtIndexFromDefaultList6(int _index) {
    _defaultList6.removeAt(_index);
  }

  void updateDefaultList6AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList6[_index] = updateFn(_defaultList6[_index]);
  }

  void insertAtIndexInDefaultList6(int _index, String _value) {
    _defaultList6.insert(_index, _value);
  }

  List<String> _defaultList7 = ['Hello World'];
  List<String> get defaultList7 => _defaultList7;
  set defaultList7(List<String> _value) {
    _defaultList7 = _value;
  }

  void addToDefaultList7(String _value) {
    _defaultList7.add(_value);
  }

  void removeFromDefaultList7(String _value) {
    _defaultList7.remove(_value);
  }

  void removeAtIndexFromDefaultList7(int _index) {
    _defaultList7.removeAt(_index);
  }

  void updateDefaultList7AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _defaultList7[_index] = updateFn(_defaultList7[_index]);
  }

  void insertAtIndexInDefaultList7(int _index, String _value) {
    _defaultList7.insert(_index, _value);
  }

  String _profileFirstName = '[first_name]';
  String get profileFirstName => _profileFirstName;
  set profileFirstName(String _value) {
    _profileFirstName = _value;
  }

  String _profileLastName = '[last_name]';
  String get profileLastName => _profileLastName;
  set profileLastName(String _value) {
    _profileLastName = _value;
  }

  dynamic _userInsuranceLicense;
  dynamic get userInsuranceLicense => _userInsuranceLicense;
  set userInsuranceLicense(dynamic _value) {
    _userInsuranceLicense = _value;
  }

  List<String> _insuranceLicenseData = [];
  List<String> get insuranceLicenseData => _insuranceLicenseData;
  set insuranceLicenseData(List<String> _value) {
    _insuranceLicenseData = _value;
  }

  void addToInsuranceLicenseData(String _value) {
    _insuranceLicenseData.add(_value);
  }

  void removeFromInsuranceLicenseData(String _value) {
    _insuranceLicenseData.remove(_value);
  }

  void removeAtIndexFromInsuranceLicenseData(int _index) {
    _insuranceLicenseData.removeAt(_index);
  }

  void updateInsuranceLicenseDataAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceLicenseData[_index] = updateFn(_insuranceLicenseData[_index]);
  }

  void insertAtIndexInInsuranceLicenseData(int _index, String _value) {
    _insuranceLicenseData.insert(_index, _value);
  }

  int _statusCodeSuccess = 200;
  int get statusCodeSuccess => _statusCodeSuccess;
  set statusCodeSuccess(int _value) {
    _statusCodeSuccess = _value;
  }

  List<int> _insuranceLicenseStatusCode = [404, 404, 404, 404, 404, 404, 404];
  List<int> get insuranceLicenseStatusCode => _insuranceLicenseStatusCode;
  set insuranceLicenseStatusCode(List<int> _value) {
    _insuranceLicenseStatusCode = _value;
  }

  void addToInsuranceLicenseStatusCode(int _value) {
    _insuranceLicenseStatusCode.add(_value);
  }

  void removeFromInsuranceLicenseStatusCode(int _value) {
    _insuranceLicenseStatusCode.remove(_value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCode(int _index) {
    _insuranceLicenseStatusCode.removeAt(_index);
  }

  void updateInsuranceLicenseStatusCodeAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _insuranceLicenseStatusCode[_index] =
        updateFn(_insuranceLicenseStatusCode[_index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCode(int _index, int _value) {
    _insuranceLicenseStatusCode.insert(_index, _value);
  }

  List<DateTime> _profileInsuExpdateAD = [];
  List<DateTime> get profileInsuExpdateAD => _profileInsuExpdateAD;
  set profileInsuExpdateAD(List<DateTime> _value) {
    _profileInsuExpdateAD = _value;
  }

  void addToProfileInsuExpdateAD(DateTime _value) {
    _profileInsuExpdateAD.add(_value);
  }

  void removeFromProfileInsuExpdateAD(DateTime _value) {
    _profileInsuExpdateAD.remove(_value);
  }

  void removeAtIndexFromProfileInsuExpdateAD(int _index) {
    _profileInsuExpdateAD.removeAt(_index);
  }

  void updateProfileInsuExpdateADAtIndex(
    int _index,
    DateTime Function(DateTime) updateFn,
  ) {
    _profileInsuExpdateAD[_index] = updateFn(_profileInsuExpdateAD[_index]);
  }

  void insertAtIndexInProfileInsuExpdateAD(int _index, DateTime _value) {
    _profileInsuExpdateAD.insert(_index, _value);
  }

  List<bool> _expInsuLessthen30 = [];
  List<bool> get expInsuLessthen30 => _expInsuLessthen30;
  set expInsuLessthen30(List<bool> _value) {
    _expInsuLessthen30 = _value;
  }

  void addToExpInsuLessthen30(bool _value) {
    _expInsuLessthen30.add(_value);
  }

  void removeFromExpInsuLessthen30(bool _value) {
    _expInsuLessthen30.remove(_value);
  }

  void removeAtIndexFromExpInsuLessthen30(int _index) {
    _expInsuLessthen30.removeAt(_index);
  }

  void updateExpInsuLessthen30AtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _expInsuLessthen30[_index] = updateFn(_expInsuLessthen30[_index]);
  }

  void insertAtIndexInExpInsuLessthen30(int _index, bool _value) {
    _expInsuLessthen30.insert(_index, _value);
  }

  int _superAppi = 0;
  int get superAppi => _superAppi;
  set superAppi(int _value) {
    _superAppi = _value;
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
  set defaultlistFalse(List<bool> _value) {
    _defaultlistFalse = _value;
  }

  void addToDefaultlistFalse(bool _value) {
    _defaultlistFalse.add(_value);
  }

  void removeFromDefaultlistFalse(bool _value) {
    _defaultlistFalse.remove(_value);
  }

  void removeAtIndexFromDefaultlistFalse(int _index) {
    _defaultlistFalse.removeAt(_index);
  }

  void updateDefaultlistFalseAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _defaultlistFalse[_index] = updateFn(_defaultlistFalse[_index]);
  }

  void insertAtIndexInDefaultlistFalse(int _index, bool _value) {
    _defaultlistFalse.insert(_index, _value);
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
  set falselistPersistd(List<bool> _value) {
    _falselistPersistd = _value;
    secureStorage.setStringList(
        'ff_falselistPersistd', _value.map((x) => x.toString()).toList());
  }

  void deleteFalselistPersistd() {
    secureStorage.delete(key: 'ff_falselistPersistd');
  }

  void addToFalselistPersistd(bool _value) {
    _falselistPersistd.add(_value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeFromFalselistPersistd(bool _value) {
    _falselistPersistd.remove(_value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFalselistPersistd(int _index) {
    _falselistPersistd.removeAt(_index);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void updateFalselistPersistdAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _falselistPersistd[_index] = updateFn(_falselistPersistd[_index]);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFalselistPersistd(int _index, bool _value) {
    _falselistPersistd.insert(_index, _value);
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
  set InsuranceLicenseStatusCodeDefault(List<int> _value) {
    _InsuranceLicenseStatusCodeDefault = _value;
  }

  void addToInsuranceLicenseStatusCodeDefault(int _value) {
    _InsuranceLicenseStatusCodeDefault.add(_value);
  }

  void removeFromInsuranceLicenseStatusCodeDefault(int _value) {
    _InsuranceLicenseStatusCodeDefault.remove(_value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCodeDefault(int _index) {
    _InsuranceLicenseStatusCodeDefault.removeAt(_index);
  }

  void updateInsuranceLicenseStatusCodeDefaultAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _InsuranceLicenseStatusCodeDefault[_index] =
        updateFn(_InsuranceLicenseStatusCodeDefault[_index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCodeDefault(
      int _index, int _value) {
    _InsuranceLicenseStatusCodeDefault.insert(_index, _value);
  }

  String _changeBranchName = '[branch_name]';
  String get changeBranchName => _changeBranchName;
  set changeBranchName(String _value) {
    _changeBranchName = _value;
  }

  bool _isGetDataViaFirebase = false;
  bool get isGetDataViaFirebase => _isGetDataViaFirebase;
  set isGetDataViaFirebase(bool _value) {
    _isGetDataViaFirebase = _value;
  }

  String _departmentProfile = '';
  String get departmentProfile => _departmentProfile;
  set departmentProfile(String _value) {
    _departmentProfile = _value;
  }

  List<String> _adminEMP = [];
  List<String> get adminEMP => _adminEMP;
  set adminEMP(List<String> _value) {
    _adminEMP = _value;
  }

  void addToAdminEMP(String _value) {
    _adminEMP.add(_value);
  }

  void removeFromAdminEMP(String _value) {
    _adminEMP.remove(_value);
  }

  void removeAtIndexFromAdminEMP(int _index) {
    _adminEMP.removeAt(_index);
  }

  void updateAdminEMPAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _adminEMP[_index] = updateFn(_adminEMP[_index]);
  }

  void insertAtIndexInAdminEMP(int _index, String _value) {
    _adminEMP.insert(_index, _value);
  }

  bool _checkBranchDropdown = false;
  bool get checkBranchDropdown => _checkBranchDropdown;
  set checkBranchDropdown(bool _value) {
    _checkBranchDropdown = _value;
  }

  bool _BioAuthCheck = false;
  bool get BioAuthCheck => _BioAuthCheck;
  set BioAuthCheck(bool _value) {
    _BioAuthCheck = _value;
    secureStorage.setBool('ff_BioAuthCheck', _value);
  }

  void deleteBioAuthCheck() {
    secureStorage.delete(key: 'ff_BioAuthCheck');
  }

  String _bossCheckFlag = '';
  String get bossCheckFlag => _bossCheckFlag;
  set bossCheckFlag(String _value) {
    _bossCheckFlag = _value;
  }

  bool _ApproveAllCheck = false;
  bool get ApproveAllCheck => _ApproveAllCheck;
  set ApproveAllCheck(bool _value) {
    _ApproveAllCheck = _value;
  }

  List<String> _ApproveSelect = [];
  List<String> get ApproveSelect => _ApproveSelect;
  set ApproveSelect(List<String> _value) {
    _ApproveSelect = _value;
  }

  void addToApproveSelect(String _value) {
    _ApproveSelect.add(_value);
  }

  void removeFromApproveSelect(String _value) {
    _ApproveSelect.remove(_value);
  }

  void removeAtIndexFromApproveSelect(int _index) {
    _ApproveSelect.removeAt(_index);
  }

  void updateApproveSelectAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _ApproveSelect[_index] = updateFn(_ApproveSelect[_index]);
  }

  void insertAtIndexInApproveSelect(int _index, String _value) {
    _ApproveSelect.insert(_index, _value);
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
  set tiktokNameList(List<String> _value) {
    _tiktokNameList = _value;
  }

  void addToTiktokNameList(String _value) {
    _tiktokNameList.add(_value);
  }

  void removeFromTiktokNameList(String _value) {
    _tiktokNameList.remove(_value);
  }

  void removeAtIndexFromTiktokNameList(int _index) {
    _tiktokNameList.removeAt(_index);
  }

  void updateTiktokNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tiktokNameList[_index] = updateFn(_tiktokNameList[_index]);
  }

  void insertAtIndexInTiktokNameList(int _index, String _value) {
    _tiktokNameList.insert(_index, _value);
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
  set tiktokLastnameList(List<String> _value) {
    _tiktokLastnameList = _value;
  }

  void addToTiktokLastnameList(String _value) {
    _tiktokLastnameList.add(_value);
  }

  void removeFromTiktokLastnameList(String _value) {
    _tiktokLastnameList.remove(_value);
  }

  void removeAtIndexFromTiktokLastnameList(int _index) {
    _tiktokLastnameList.removeAt(_index);
  }

  void updateTiktokLastnameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tiktokLastnameList[_index] = updateFn(_tiktokLastnameList[_index]);
  }

  void insertAtIndexInTiktokLastnameList(int _index, String _value) {
    _tiktokLastnameList.insert(_index, _value);
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
  set tiktokEmployeeIdList(List<String> _value) {
    _tiktokEmployeeIdList = _value;
  }

  void addToTiktokEmployeeIdList(String _value) {
    _tiktokEmployeeIdList.add(_value);
  }

  void removeFromTiktokEmployeeIdList(String _value) {
    _tiktokEmployeeIdList.remove(_value);
  }

  void removeAtIndexFromTiktokEmployeeIdList(int _index) {
    _tiktokEmployeeIdList.removeAt(_index);
  }

  void updateTiktokEmployeeIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tiktokEmployeeIdList[_index] = updateFn(_tiktokEmployeeIdList[_index]);
  }

  void insertAtIndexInTiktokEmployeeIdList(int _index, String _value) {
    _tiktokEmployeeIdList.insert(_index, _value);
  }

  int _maxPage = 0;
  int get maxPage => _maxPage;
  set maxPage(int _value) {
    _maxPage = _value;
  }

  List<String> _pageSelectionList = ['1', '2', '3', '4', '5'];
  List<String> get pageSelectionList => _pageSelectionList;
  set pageSelectionList(List<String> _value) {
    _pageSelectionList = _value;
  }

  void addToPageSelectionList(String _value) {
    _pageSelectionList.add(_value);
  }

  void removeFromPageSelectionList(String _value) {
    _pageSelectionList.remove(_value);
  }

  void removeAtIndexFromPageSelectionList(int _index) {
    _pageSelectionList.removeAt(_index);
  }

  void updatePageSelectionListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _pageSelectionList[_index] = updateFn(_pageSelectionList[_index]);
  }

  void insertAtIndexInPageSelectionList(int _index, String _value) {
    _pageSelectionList.insert(_index, _value);
  }

  bool _visible = false;
  bool get visible => _visible;
  set visible(bool _value) {
    _visible = _value;
  }

  bool _previousButtonVisible = false;
  bool get previousButtonVisible => _previousButtonVisible;
  set previousButtonVisible(bool _value) {
    _previousButtonVisible = _value;
  }

  bool _nextButtonVisible = false;
  bool get nextButtonVisible => _nextButtonVisible;
  set nextButtonVisible(bool _value) {
    _nextButtonVisible = _value;
  }

  List<int> _reportItemIndexList = [];
  List<int> get reportItemIndexList => _reportItemIndexList;
  set reportItemIndexList(List<int> _value) {
    _reportItemIndexList = _value;
  }

  void addToReportItemIndexList(int _value) {
    _reportItemIndexList.add(_value);
  }

  void removeFromReportItemIndexList(int _value) {
    _reportItemIndexList.remove(_value);
  }

  void removeAtIndexFromReportItemIndexList(int _index) {
    _reportItemIndexList.removeAt(_index);
  }

  void updateReportItemIndexListAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _reportItemIndexList[_index] = updateFn(_reportItemIndexList[_index]);
  }

  void insertAtIndexInReportItemIndexList(int _index, int _value) {
    _reportItemIndexList.insert(_index, _value);
  }

  List<String> _leadIdSurvey = [];
  List<String> get leadIdSurvey => _leadIdSurvey;
  set leadIdSurvey(List<String> _value) {
    _leadIdSurvey = _value;
  }

  void addToLeadIdSurvey(String _value) {
    _leadIdSurvey.add(_value);
  }

  void removeFromLeadIdSurvey(String _value) {
    _leadIdSurvey.remove(_value);
  }

  void removeAtIndexFromLeadIdSurvey(int _index) {
    _leadIdSurvey.removeAt(_index);
  }

  void updateLeadIdSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadIdSurvey[_index] = updateFn(_leadIdSurvey[_index]);
  }

  void insertAtIndexInLeadIdSurvey(int _index, String _value) {
    _leadIdSurvey.insert(_index, _value);
  }

  List<String> _leadCustomerNameSurvey = [];
  List<String> get leadCustomerNameSurvey => _leadCustomerNameSurvey;
  set leadCustomerNameSurvey(List<String> _value) {
    _leadCustomerNameSurvey = _value;
  }

  void addToLeadCustomerNameSurvey(String _value) {
    _leadCustomerNameSurvey.add(_value);
  }

  void removeFromLeadCustomerNameSurvey(String _value) {
    _leadCustomerNameSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCustomerNameSurvey(int _index) {
    _leadCustomerNameSurvey.removeAt(_index);
  }

  void updateLeadCustomerNameSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCustomerNameSurvey[_index] = updateFn(_leadCustomerNameSurvey[_index]);
  }

  void insertAtIndexInLeadCustomerNameSurvey(int _index, String _value) {
    _leadCustomerNameSurvey.insert(_index, _value);
  }

  List<String> _leadCreatedTimeSurvey = [];
  List<String> get leadCreatedTimeSurvey => _leadCreatedTimeSurvey;
  set leadCreatedTimeSurvey(List<String> _value) {
    _leadCreatedTimeSurvey = _value;
  }

  void addToLeadCreatedTimeSurvey(String _value) {
    _leadCreatedTimeSurvey.add(_value);
  }

  void removeFromLeadCreatedTimeSurvey(String _value) {
    _leadCreatedTimeSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCreatedTimeSurvey(int _index) {
    _leadCreatedTimeSurvey.removeAt(_index);
  }

  void updateLeadCreatedTimeSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCreatedTimeSurvey[_index] = updateFn(_leadCreatedTimeSurvey[_index]);
  }

  void insertAtIndexInLeadCreatedTimeSurvey(int _index, String _value) {
    _leadCreatedTimeSurvey.insert(_index, _value);
  }

  List<String> _leadCallStatusSurvey = [];
  List<String> get leadCallStatusSurvey => _leadCallStatusSurvey;
  set leadCallStatusSurvey(List<String> _value) {
    _leadCallStatusSurvey = _value;
  }

  void addToLeadCallStatusSurvey(String _value) {
    _leadCallStatusSurvey.add(_value);
  }

  void removeFromLeadCallStatusSurvey(String _value) {
    _leadCallStatusSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCallStatusSurvey(int _index) {
    _leadCallStatusSurvey.removeAt(_index);
  }

  void updateLeadCallStatusSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCallStatusSurvey[_index] = updateFn(_leadCallStatusSurvey[_index]);
  }

  void insertAtIndexInLeadCallStatusSurvey(int _index, String _value) {
    _leadCallStatusSurvey.insert(_index, _value);
  }

  List<String> _leadPhoneNumberSurvey = [];
  List<String> get leadPhoneNumberSurvey => _leadPhoneNumberSurvey;
  set leadPhoneNumberSurvey(List<String> _value) {
    _leadPhoneNumberSurvey = _value;
  }

  void addToLeadPhoneNumberSurvey(String _value) {
    _leadPhoneNumberSurvey.add(_value);
  }

  void removeFromLeadPhoneNumberSurvey(String _value) {
    _leadPhoneNumberSurvey.remove(_value);
  }

  void removeAtIndexFromLeadPhoneNumberSurvey(int _index) {
    _leadPhoneNumberSurvey.removeAt(_index);
  }

  void updateLeadPhoneNumberSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadPhoneNumberSurvey[_index] = updateFn(_leadPhoneNumberSurvey[_index]);
  }

  void insertAtIndexInLeadPhoneNumberSurvey(int _index, String _value) {
    _leadPhoneNumberSurvey.insert(_index, _value);
  }

  List<String> _leadEmployeeIdSurvey = [];
  List<String> get leadEmployeeIdSurvey => _leadEmployeeIdSurvey;
  set leadEmployeeIdSurvey(List<String> _value) {
    _leadEmployeeIdSurvey = _value;
  }

  void addToLeadEmployeeIdSurvey(String _value) {
    _leadEmployeeIdSurvey.add(_value);
  }

  void removeFromLeadEmployeeIdSurvey(String _value) {
    _leadEmployeeIdSurvey.remove(_value);
  }

  void removeAtIndexFromLeadEmployeeIdSurvey(int _index) {
    _leadEmployeeIdSurvey.removeAt(_index);
  }

  void updateLeadEmployeeIdSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadEmployeeIdSurvey[_index] = updateFn(_leadEmployeeIdSurvey[_index]);
  }

  void insertAtIndexInLeadEmployeeIdSurvey(int _index, String _value) {
    _leadEmployeeIdSurvey.insert(_index, _value);
  }

  List<String> _leadChannelSurvey = [];
  List<String> get leadChannelSurvey => _leadChannelSurvey;
  set leadChannelSurvey(List<String> _value) {
    _leadChannelSurvey = _value;
  }

  void addToLeadChannelSurvey(String _value) {
    _leadChannelSurvey.add(_value);
  }

  void removeFromLeadChannelSurvey(String _value) {
    _leadChannelSurvey.remove(_value);
  }

  void removeAtIndexFromLeadChannelSurvey(int _index) {
    _leadChannelSurvey.removeAt(_index);
  }

  void updateLeadChannelSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadChannelSurvey[_index] = updateFn(_leadChannelSurvey[_index]);
  }

  void insertAtIndexInLeadChannelSurvey(int _index, String _value) {
    _leadChannelSurvey.insert(_index, _value);
  }

  List<String> _leadBranchCodeSurvey = [];
  List<String> get leadBranchCodeSurvey => _leadBranchCodeSurvey;
  set leadBranchCodeSurvey(List<String> _value) {
    _leadBranchCodeSurvey = _value;
  }

  void addToLeadBranchCodeSurvey(String _value) {
    _leadBranchCodeSurvey.add(_value);
  }

  void removeFromLeadBranchCodeSurvey(String _value) {
    _leadBranchCodeSurvey.remove(_value);
  }

  void removeAtIndexFromLeadBranchCodeSurvey(int _index) {
    _leadBranchCodeSurvey.removeAt(_index);
  }

  void updateLeadBranchCodeSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadBranchCodeSurvey[_index] = updateFn(_leadBranchCodeSurvey[_index]);
  }

  void insertAtIndexInLeadBranchCodeSurvey(int _index, String _value) {
    _leadBranchCodeSurvey.insert(_index, _value);
  }

  List<String> _leadUserLevelSurvey = [];
  List<String> get leadUserLevelSurvey => _leadUserLevelSurvey;
  set leadUserLevelSurvey(List<String> _value) {
    _leadUserLevelSurvey = _value;
  }

  void addToLeadUserLevelSurvey(String _value) {
    _leadUserLevelSurvey.add(_value);
  }

  void removeFromLeadUserLevelSurvey(String _value) {
    _leadUserLevelSurvey.remove(_value);
  }

  void removeAtIndexFromLeadUserLevelSurvey(int _index) {
    _leadUserLevelSurvey.removeAt(_index);
  }

  void updateLeadUserLevelSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadUserLevelSurvey[_index] = updateFn(_leadUserLevelSurvey[_index]);
  }

  void insertAtIndexInLeadUserLevelSurvey(int _index, String _value) {
    _leadUserLevelSurvey.insert(_index, _value);
  }

  List<String> _leadCountCalledSurvey = [];
  List<String> get leadCountCalledSurvey => _leadCountCalledSurvey;
  set leadCountCalledSurvey(List<String> _value) {
    _leadCountCalledSurvey = _value;
  }

  void addToLeadCountCalledSurvey(String _value) {
    _leadCountCalledSurvey.add(_value);
  }

  void removeFromLeadCountCalledSurvey(String _value) {
    _leadCountCalledSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCountCalledSurvey(int _index) {
    _leadCountCalledSurvey.removeAt(_index);
  }

  void updateLeadCountCalledSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCountCalledSurvey[_index] = updateFn(_leadCountCalledSurvey[_index]);
  }

  void insertAtIndexInLeadCountCalledSurvey(int _index, String _value) {
    _leadCountCalledSurvey.insert(_index, _value);
  }

  List<String> _leadCarVahicleNameSurvey = [];
  List<String> get leadCarVahicleNameSurvey => _leadCarVahicleNameSurvey;
  set leadCarVahicleNameSurvey(List<String> _value) {
    _leadCarVahicleNameSurvey = _value;
  }

  void addToLeadCarVahicleNameSurvey(String _value) {
    _leadCarVahicleNameSurvey.add(_value);
  }

  void removeFromLeadCarVahicleNameSurvey(String _value) {
    _leadCarVahicleNameSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCarVahicleNameSurvey(int _index) {
    _leadCarVahicleNameSurvey.removeAt(_index);
  }

  void updateLeadCarVahicleNameSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCarVahicleNameSurvey[_index] =
        updateFn(_leadCarVahicleNameSurvey[_index]);
  }

  void insertAtIndexInLeadCarVahicleNameSurvey(int _index, String _value) {
    _leadCarVahicleNameSurvey.insert(_index, _value);
  }

  List<String> _leadAmountRequestSurvey = [];
  List<String> get leadAmountRequestSurvey => _leadAmountRequestSurvey;
  set leadAmountRequestSurvey(List<String> _value) {
    _leadAmountRequestSurvey = _value;
  }

  void addToLeadAmountRequestSurvey(String _value) {
    _leadAmountRequestSurvey.add(_value);
  }

  void removeFromLeadAmountRequestSurvey(String _value) {
    _leadAmountRequestSurvey.remove(_value);
  }

  void removeAtIndexFromLeadAmountRequestSurvey(int _index) {
    _leadAmountRequestSurvey.removeAt(_index);
  }

  void updateLeadAmountRequestSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadAmountRequestSurvey[_index] =
        updateFn(_leadAmountRequestSurvey[_index]);
  }

  void insertAtIndexInLeadAmountRequestSurvey(int _index, String _value) {
    _leadAmountRequestSurvey.insert(_index, _value);
  }

  List<String> _leadCalledStatusReasonSurvey = [];
  List<String> get leadCalledStatusReasonSurvey =>
      _leadCalledStatusReasonSurvey;
  set leadCalledStatusReasonSurvey(List<String> _value) {
    _leadCalledStatusReasonSurvey = _value;
  }

  void addToLeadCalledStatusReasonSurvey(String _value) {
    _leadCalledStatusReasonSurvey.add(_value);
  }

  void removeFromLeadCalledStatusReasonSurvey(String _value) {
    _leadCalledStatusReasonSurvey.remove(_value);
  }

  void removeAtIndexFromLeadCalledStatusReasonSurvey(int _index) {
    _leadCalledStatusReasonSurvey.removeAt(_index);
  }

  void updateLeadCalledStatusReasonSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadCalledStatusReasonSurvey[_index] =
        updateFn(_leadCalledStatusReasonSurvey[_index]);
  }

  void insertAtIndexInLeadCalledStatusReasonSurvey(int _index, String _value) {
    _leadCalledStatusReasonSurvey.insert(_index, _value);
  }

  List<String> _leadContractStatusSurvey = [];
  List<String> get leadContractStatusSurvey => _leadContractStatusSurvey;
  set leadContractStatusSurvey(List<String> _value) {
    _leadContractStatusSurvey = _value;
  }

  void addToLeadContractStatusSurvey(String _value) {
    _leadContractStatusSurvey.add(_value);
  }

  void removeFromLeadContractStatusSurvey(String _value) {
    _leadContractStatusSurvey.remove(_value);
  }

  void removeAtIndexFromLeadContractStatusSurvey(int _index) {
    _leadContractStatusSurvey.removeAt(_index);
  }

  void updateLeadContractStatusSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadContractStatusSurvey[_index] =
        updateFn(_leadContractStatusSurvey[_index]);
  }

  void insertAtIndexInLeadContractStatusSurvey(int _index, String _value) {
    _leadContractStatusSurvey.insert(_index, _value);
  }

  List<String> _leadContractDateSurvey = [];
  List<String> get leadContractDateSurvey => _leadContractDateSurvey;
  set leadContractDateSurvey(List<String> _value) {
    _leadContractDateSurvey = _value;
  }

  void addToLeadContractDateSurvey(String _value) {
    _leadContractDateSurvey.add(_value);
  }

  void removeFromLeadContractDateSurvey(String _value) {
    _leadContractDateSurvey.remove(_value);
  }

  void removeAtIndexFromLeadContractDateSurvey(int _index) {
    _leadContractDateSurvey.removeAt(_index);
  }

  void updateLeadContractDateSurveyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadContractDateSurvey[_index] = updateFn(_leadContractDateSurvey[_index]);
  }

  void insertAtIndexInLeadContractDateSurvey(int _index, String _value) {
    _leadContractDateSurvey.insert(_index, _value);
  }

  List<String> _leadListViewItem = [];
  List<String> get leadListViewItem => _leadListViewItem;
  set leadListViewItem(List<String> _value) {
    _leadListViewItem = _value;
  }

  void addToLeadListViewItem(String _value) {
    _leadListViewItem.add(_value);
  }

  void removeFromLeadListViewItem(String _value) {
    _leadListViewItem.remove(_value);
  }

  void removeAtIndexFromLeadListViewItem(int _index) {
    _leadListViewItem.removeAt(_index);
  }

  void updateLeadListViewItemAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _leadListViewItem[_index] = updateFn(_leadListViewItem[_index]);
  }

  void insertAtIndexInLeadListViewItem(int _index, String _value) {
    _leadListViewItem.insert(_index, _value);
  }

  String _profileImage =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
  String get profileImage => _profileImage;
  set profileImage(String _value) {
    _profileImage = _value;
    secureStorage.setString('ff_profileImage', _value);
  }

  void deleteProfileImage() {
    secureStorage.delete(key: 'ff_profileImage');
  }

  List<bool> _timeChatIsVisibleList = [];
  List<bool> get timeChatIsVisibleList => _timeChatIsVisibleList;
  set timeChatIsVisibleList(List<bool> _value) {
    _timeChatIsVisibleList = _value;
  }

  void addToTimeChatIsVisibleList(bool _value) {
    _timeChatIsVisibleList.add(_value);
  }

  void removeFromTimeChatIsVisibleList(bool _value) {
    _timeChatIsVisibleList.remove(_value);
  }

  void removeAtIndexFromTimeChatIsVisibleList(int _index) {
    _timeChatIsVisibleList.removeAt(_index);
  }

  void updateTimeChatIsVisibleListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _timeChatIsVisibleList[_index] = updateFn(_timeChatIsVisibleList[_index]);
  }

  void insertAtIndexInTimeChatIsVisibleList(int _index, bool _value) {
    _timeChatIsVisibleList.insert(_index, _value);
  }

  bool _isSendMessageSuccess = false;
  bool get isSendMessageSuccess => _isSendMessageSuccess;
  set isSendMessageSuccess(bool _value) {
    _isSendMessageSuccess = _value;
  }

  String _chatMessagesTemp = '';
  String get chatMessagesTemp => _chatMessagesTemp;
  set chatMessagesTemp(String _value) {
    _chatMessagesTemp = _value;
  }

  int _idNumberTemp = 1;
  int get idNumberTemp => _idNumberTemp;
  set idNumberTemp(int _value) {
    _idNumberTemp = _value;
  }

  bool _insuranceRequestState = false;
  bool get insuranceRequestState => _insuranceRequestState;
  set insuranceRequestState(bool _value) {
    _insuranceRequestState = _value;
  }

  String _operationChoiceChips = 'งานใหม่';
  String get operationChoiceChips => _operationChoiceChips;
  set operationChoiceChips(String _value) {
    _operationChoiceChips = _value;
  }

  String _customerTypeChoiceChips = 'บุคคลธรรมดา';
  String get customerTypeChoiceChips => _customerTypeChoiceChips;
  set customerTypeChoiceChips(String _value) {
    _customerTypeChoiceChips = _value;
  }

  String _vehicleTypeDropdown = 'กรุณาเลือก';
  String get vehicleTypeDropdown => _vehicleTypeDropdown;
  set vehicleTypeDropdown(String _value) {
    _vehicleTypeDropdown = _value;
  }

  String _boxTypeChoiceChips = 'ตู้แห้ง';
  String get boxTypeChoiceChips => _boxTypeChoiceChips;
  set boxTypeChoiceChips(String _value) {
    _boxTypeChoiceChips = _value;
  }

  bool _isEquipedMetalBox = false;
  bool get isEquipedMetalBox => _isEquipedMetalBox;
  set isEquipedMetalBox(bool _value) {
    _isEquipedMetalBox = _value;
  }

  String _insuranceBasicCusName = '';
  String get insuranceBasicCusName => _insuranceBasicCusName;
  set insuranceBasicCusName(String _value) {
    _insuranceBasicCusName = _value;
  }

  String _insuranceBasicCusLastname = '';
  String get insuranceBasicCusLastname => _insuranceBasicCusLastname;
  set insuranceBasicCusLastname(String _value) {
    _insuranceBasicCusLastname = _value;
  }

  String _insuranceBasicPlateNo = '';
  String get insuranceBasicPlateNo => _insuranceBasicPlateNo;
  set insuranceBasicPlateNo(String _value) {
    _insuranceBasicPlateNo = _value;
  }

  String _insuranceBasicPlateAdditional = '';
  String get insuranceBasicPlateAdditional => _insuranceBasicPlateAdditional;
  set insuranceBasicPlateAdditional(String _value) {
    _insuranceBasicPlateAdditional = _value;
  }

  String _insuranceBasicBrandId = '';
  String get insuranceBasicBrandId => _insuranceBasicBrandId;
  set insuranceBasicBrandId(String _value) {
    _insuranceBasicBrandId = _value;
  }

  String _insuranceBasicBrandCode = '';
  String get insuranceBasicBrandCode => _insuranceBasicBrandCode;
  set insuranceBasicBrandCode(String _value) {
    _insuranceBasicBrandCode = _value;
  }

  String _insuranceBasicBrandName = 'เลือกยี่ห้อรถ';
  String get insuranceBasicBrandName => _insuranceBasicBrandName;
  set insuranceBasicBrandName(String _value) {
    _insuranceBasicBrandName = _value;
  }

  String _insuranceBasicModelId = '';
  String get insuranceBasicModelId => _insuranceBasicModelId;
  set insuranceBasicModelId(String _value) {
    _insuranceBasicModelId = _value;
  }

  String _insuranceBasicModelCode = '';
  String get insuranceBasicModelCode => _insuranceBasicModelCode;
  set insuranceBasicModelCode(String _value) {
    _insuranceBasicModelCode = _value;
  }

  String _insuranceBasicModelName = 'เลือกรุ่นรถ';
  String get insuranceBasicModelName => _insuranceBasicModelName;
  set insuranceBasicModelName(String _value) {
    _insuranceBasicModelName = _value;
  }

  String _insuranceBasicYear = 'เลือกปีจดทะเบียน พ.ศ.';
  String get insuranceBasicYear => _insuranceBasicYear;
  set insuranceBasicYear(String _value) {
    _insuranceBasicYear = _value;
  }

  String _insuranceBasicProvinceId = '';
  String get insuranceBasicProvinceId => _insuranceBasicProvinceId;
  set insuranceBasicProvinceId(String _value) {
    _insuranceBasicProvinceId = _value;
  }

  String _insuranceBasicProvinceName = '';
  String get insuranceBasicProvinceName => _insuranceBasicProvinceName;
  set insuranceBasicProvinceName(String _value) {
    _insuranceBasicProvinceName = _value;
  }

  String _insuranceBasicUsedType = '';
  String get insuranceBasicUsedType => _insuranceBasicUsedType;
  set insuranceBasicUsedType(String _value) {
    _insuranceBasicUsedType = _value;
  }

  bool _insuranceBasicCarModify = false;
  bool get insuranceBasicCarModify => _insuranceBasicCarModify;
  set insuranceBasicCarModify(bool _value) {
    _insuranceBasicCarModify = _value;
  }

  String _insuranceBasicAccessoryProtected = '';
  String get insuranceBasicAccessoryProtected =>
      _insuranceBasicAccessoryProtected;
  set insuranceBasicAccessoryProtected(String _value) {
    _insuranceBasicAccessoryProtected = _value;
  }

  String _insuranceBasicCusPhone = '';
  String get insuranceBasicCusPhone => _insuranceBasicCusPhone;
  set insuranceBasicCusPhone(String _value) {
    _insuranceBasicCusPhone = _value;
  }

  String _insuranceBasicDriverType = '';
  String get insuranceBasicDriverType => _insuranceBasicDriverType;
  set insuranceBasicDriverType(String _value) {
    _insuranceBasicDriverType = _value;
  }

  String _insuranceBasicIdCardNo = '';
  String get insuranceBasicIdCardNo => _insuranceBasicIdCardNo;
  set insuranceBasicIdCardNo(String _value) {
    _insuranceBasicIdCardNo = _value;
  }

  String _insuranceBasicOldLicenseNo = '';
  String get insuranceBasicOldLicenseNo => _insuranceBasicOldLicenseNo;
  set insuranceBasicOldLicenseNo(String _value) {
    _insuranceBasicOldLicenseNo = _value;
  }

  bool _insuranceBasicMetalBox = false;
  bool get insuranceBasicMetalBox => _insuranceBasicMetalBox;
  set insuranceBasicMetalBox(bool _value) {
    _insuranceBasicMetalBox = _value;
  }

  bool _insuranceBasicCoop = false;
  bool get insuranceBasicCoop => _insuranceBasicCoop;
  set insuranceBasicCoop(bool _value) {
    _insuranceBasicCoop = _value;
  }

  String _insuranceBasicPickupBoxType = '';
  String get insuranceBasicPickupBoxType => _insuranceBasicPickupBoxType;
  set insuranceBasicPickupBoxType(String _value) {
    _insuranceBasicPickupBoxType = _value;
  }

  String _insuranceBasicPickupBoxPrice = '';
  String get insuranceBasicPickupBoxPrice => _insuranceBasicPickupBoxPrice;
  set insuranceBasicPickupBoxPrice(String _value) {
    _insuranceBasicPickupBoxPrice = _value;
  }

  String _insuranceBasicTruckCurrentPrice = '';
  String get insuranceBasicTruckCurrentPrice =>
      _insuranceBasicTruckCurrentPrice;
  set insuranceBasicTruckCurrentPrice(String _value) {
    _insuranceBasicTruckCurrentPrice = _value;
  }

  String _insuranceBasicCarryPurpose = '';
  String get insuranceBasicCarryPurpose => _insuranceBasicCarryPurpose;
  set insuranceBasicCarryPurpose(String _value) {
    _insuranceBasicCarryPurpose = _value;
  }

  bool _insurancePackageInsurer = false;
  bool get insurancePackageInsurer => _insurancePackageInsurer;
  set insurancePackageInsurer(bool _value) {
    _insurancePackageInsurer = _value;
  }

  String _insuranceBasicMemberType = '';
  String get insuranceBasicMemberType => _insuranceBasicMemberType;
  set insuranceBasicMemberType(String _value) {
    _insuranceBasicMemberType = _value;
  }

  String _insuranceBasicRemark = '';
  String get insuranceBasicRemark => _insuranceBasicRemark;
  set insuranceBasicRemark(String _value) {
    _insuranceBasicRemark = _value;
  }

  List<String> _teleProvinceId = [];
  List<String> get teleProvinceId => _teleProvinceId;
  set teleProvinceId(List<String> _value) {
    _teleProvinceId = _value;
  }

  void addToTeleProvinceId(String _value) {
    _teleProvinceId.add(_value);
  }

  void removeFromTeleProvinceId(String _value) {
    _teleProvinceId.remove(_value);
  }

  void removeAtIndexFromTeleProvinceId(int _index) {
    _teleProvinceId.removeAt(_index);
  }

  void updateTeleProvinceIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teleProvinceId[_index] = updateFn(_teleProvinceId[_index]);
  }

  void insertAtIndexInTeleProvinceId(int _index, String _value) {
    _teleProvinceId.insert(_index, _value);
  }

  bool _insuranceModelIsGenerating = false;
  bool get insuranceModelIsGenerating => _insuranceModelIsGenerating;
  set insuranceModelIsGenerating(bool _value) {
    _insuranceModelIsGenerating = _value;
  }

  List<String> _insuranceBasicOriginalModelName = [];
  List<String> get insuranceBasicOriginalModelName =>
      _insuranceBasicOriginalModelName;
  set insuranceBasicOriginalModelName(List<String> _value) {
    _insuranceBasicOriginalModelName = _value;
  }

  void addToInsuranceBasicOriginalModelName(String _value) {
    _insuranceBasicOriginalModelName.add(_value);
  }

  void removeFromInsuranceBasicOriginalModelName(String _value) {
    _insuranceBasicOriginalModelName.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicOriginalModelName(int _index) {
    _insuranceBasicOriginalModelName.removeAt(_index);
  }

  void updateInsuranceBasicOriginalModelNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicOriginalModelName[_index] =
        updateFn(_insuranceBasicOriginalModelName[_index]);
  }

  void insertAtIndexInInsuranceBasicOriginalModelName(
      int _index, String _value) {
    _insuranceBasicOriginalModelName.insert(_index, _value);
  }

  List<String> _insuranceBasicBrandIdList = [];
  List<String> get insuranceBasicBrandIdList => _insuranceBasicBrandIdList;
  set insuranceBasicBrandIdList(List<String> _value) {
    _insuranceBasicBrandIdList = _value;
  }

  void addToInsuranceBasicBrandIdList(String _value) {
    _insuranceBasicBrandIdList.add(_value);
  }

  void removeFromInsuranceBasicBrandIdList(String _value) {
    _insuranceBasicBrandIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicBrandIdList(int _index) {
    _insuranceBasicBrandIdList.removeAt(_index);
  }

  void updateInsuranceBasicBrandIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicBrandIdList[_index] =
        updateFn(_insuranceBasicBrandIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicBrandIdList(int _index, String _value) {
    _insuranceBasicBrandIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicBrandNameList = [];
  List<String> get insuranceBasicBrandNameList => _insuranceBasicBrandNameList;
  set insuranceBasicBrandNameList(List<String> _value) {
    _insuranceBasicBrandNameList = _value;
  }

  void addToInsuranceBasicBrandNameList(String _value) {
    _insuranceBasicBrandNameList.add(_value);
  }

  void removeFromInsuranceBasicBrandNameList(String _value) {
    _insuranceBasicBrandNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicBrandNameList(int _index) {
    _insuranceBasicBrandNameList.removeAt(_index);
  }

  void updateInsuranceBasicBrandNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicBrandNameList[_index] =
        updateFn(_insuranceBasicBrandNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicBrandNameList(int _index, String _value) {
    _insuranceBasicBrandNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicModelIdListOriginal = [];
  List<String> get insuranceBasicModelIdListOriginal =>
      _insuranceBasicModelIdListOriginal;
  set insuranceBasicModelIdListOriginal(List<String> _value) {
    _insuranceBasicModelIdListOriginal = _value;
  }

  void addToInsuranceBasicModelIdListOriginal(String _value) {
    _insuranceBasicModelIdListOriginal.add(_value);
  }

  void removeFromInsuranceBasicModelIdListOriginal(String _value) {
    _insuranceBasicModelIdListOriginal.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelIdListOriginal(int _index) {
    _insuranceBasicModelIdListOriginal.removeAt(_index);
  }

  void updateInsuranceBasicModelIdListOriginalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelIdListOriginal[_index] =
        updateFn(_insuranceBasicModelIdListOriginal[_index]);
  }

  void insertAtIndexInInsuranceBasicModelIdListOriginal(
      int _index, String _value) {
    _insuranceBasicModelIdListOriginal.insert(_index, _value);
  }

  List<String> _insuranceBasicModelIdList = [];
  List<String> get insuranceBasicModelIdList => _insuranceBasicModelIdList;
  set insuranceBasicModelIdList(List<String> _value) {
    _insuranceBasicModelIdList = _value;
  }

  void addToInsuranceBasicModelIdList(String _value) {
    _insuranceBasicModelIdList.add(_value);
  }

  void removeFromInsuranceBasicModelIdList(String _value) {
    _insuranceBasicModelIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelIdList(int _index) {
    _insuranceBasicModelIdList.removeAt(_index);
  }

  void updateInsuranceBasicModelIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelIdList[_index] =
        updateFn(_insuranceBasicModelIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicModelIdList(int _index, String _value) {
    _insuranceBasicModelIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicModelNameListOriginal = [];
  List<String> get insuranceBasicModelNameListOriginal =>
      _insuranceBasicModelNameListOriginal;
  set insuranceBasicModelNameListOriginal(List<String> _value) {
    _insuranceBasicModelNameListOriginal = _value;
  }

  void addToInsuranceBasicModelNameListOriginal(String _value) {
    _insuranceBasicModelNameListOriginal.add(_value);
  }

  void removeFromInsuranceBasicModelNameListOriginal(String _value) {
    _insuranceBasicModelNameListOriginal.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelNameListOriginal(int _index) {
    _insuranceBasicModelNameListOriginal.removeAt(_index);
  }

  void updateInsuranceBasicModelNameListOriginalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelNameListOriginal[_index] =
        updateFn(_insuranceBasicModelNameListOriginal[_index]);
  }

  void insertAtIndexInInsuranceBasicModelNameListOriginal(
      int _index, String _value) {
    _insuranceBasicModelNameListOriginal.insert(_index, _value);
  }

  List<String> _insuranceBasicModelNameList = [];
  List<String> get insuranceBasicModelNameList => _insuranceBasicModelNameList;
  set insuranceBasicModelNameList(List<String> _value) {
    _insuranceBasicModelNameList = _value;
  }

  void addToInsuranceBasicModelNameList(String _value) {
    _insuranceBasicModelNameList.add(_value);
  }

  void removeFromInsuranceBasicModelNameList(String _value) {
    _insuranceBasicModelNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelNameList(int _index) {
    _insuranceBasicModelNameList.removeAt(_index);
  }

  void updateInsuranceBasicModelNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelNameList[_index] =
        updateFn(_insuranceBasicModelNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicModelNameList(int _index, String _value) {
    _insuranceBasicModelNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicProvinceIdList = [];
  List<String> get insuranceBasicProvinceIdList =>
      _insuranceBasicProvinceIdList;
  set insuranceBasicProvinceIdList(List<String> _value) {
    _insuranceBasicProvinceIdList = _value;
  }

  void addToInsuranceBasicProvinceIdList(String _value) {
    _insuranceBasicProvinceIdList.add(_value);
  }

  void removeFromInsuranceBasicProvinceIdList(String _value) {
    _insuranceBasicProvinceIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicProvinceIdList(int _index) {
    _insuranceBasicProvinceIdList.removeAt(_index);
  }

  void updateInsuranceBasicProvinceIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicProvinceIdList[_index] =
        updateFn(_insuranceBasicProvinceIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicProvinceIdList(int _index, String _value) {
    _insuranceBasicProvinceIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicProvinceNameList = [];
  List<String> get insuranceBasicProvinceNameList =>
      _insuranceBasicProvinceNameList;
  set insuranceBasicProvinceNameList(List<String> _value) {
    _insuranceBasicProvinceNameList = _value;
  }

  void addToInsuranceBasicProvinceNameList(String _value) {
    _insuranceBasicProvinceNameList.add(_value);
  }

  void removeFromInsuranceBasicProvinceNameList(String _value) {
    _insuranceBasicProvinceNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicProvinceNameList(int _index) {
    _insuranceBasicProvinceNameList.removeAt(_index);
  }

  void updateInsuranceBasicProvinceNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicProvinceNameList[_index] =
        updateFn(_insuranceBasicProvinceNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicProvinceNameList(
      int _index, String _value) {
    _insuranceBasicProvinceNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicVehicleUsedTypeIdList = [];
  List<String> get insuranceBasicVehicleUsedTypeIdList =>
      _insuranceBasicVehicleUsedTypeIdList;
  set insuranceBasicVehicleUsedTypeIdList(List<String> _value) {
    _insuranceBasicVehicleUsedTypeIdList = _value;
  }

  void addToInsuranceBasicVehicleUsedTypeIdList(String _value) {
    _insuranceBasicVehicleUsedTypeIdList.add(_value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeIdList(String _value) {
    _insuranceBasicVehicleUsedTypeIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeIdList(int _index) {
    _insuranceBasicVehicleUsedTypeIdList.removeAt(_index);
  }

  void updateInsuranceBasicVehicleUsedTypeIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicVehicleUsedTypeIdList[_index] =
        updateFn(_insuranceBasicVehicleUsedTypeIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeIdList(
      int _index, String _value) {
    _insuranceBasicVehicleUsedTypeIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicVehicleUsedTypeNameList = [];
  List<String> get insuranceBasicVehicleUsedTypeNameList =>
      _insuranceBasicVehicleUsedTypeNameList;
  set insuranceBasicVehicleUsedTypeNameList(List<String> _value) {
    _insuranceBasicVehicleUsedTypeNameList = _value;
  }

  void addToInsuranceBasicVehicleUsedTypeNameList(String _value) {
    _insuranceBasicVehicleUsedTypeNameList.add(_value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeNameList(String _value) {
    _insuranceBasicVehicleUsedTypeNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeNameList(int _index) {
    _insuranceBasicVehicleUsedTypeNameList.removeAt(_index);
  }

  void updateInsuranceBasicVehicleUsedTypeNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicVehicleUsedTypeNameList[_index] =
        updateFn(_insuranceBasicVehicleUsedTypeNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeNameList(
      int _index, String _value) {
    _insuranceBasicVehicleUsedTypeNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicVehicleUsedTypeTypeList = [];
  List<String> get insuranceBasicVehicleUsedTypeTypeList =>
      _insuranceBasicVehicleUsedTypeTypeList;
  set insuranceBasicVehicleUsedTypeTypeList(List<String> _value) {
    _insuranceBasicVehicleUsedTypeTypeList = _value;
  }

  void addToInsuranceBasicVehicleUsedTypeTypeList(String _value) {
    _insuranceBasicVehicleUsedTypeTypeList.add(_value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeTypeList(String _value) {
    _insuranceBasicVehicleUsedTypeTypeList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeTypeList(int _index) {
    _insuranceBasicVehicleUsedTypeTypeList.removeAt(_index);
  }

  void updateInsuranceBasicVehicleUsedTypeTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicVehicleUsedTypeTypeList[_index] =
        updateFn(_insuranceBasicVehicleUsedTypeTypeList[_index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeTypeList(
      int _index, String _value) {
    _insuranceBasicVehicleUsedTypeTypeList.insert(_index, _value);
  }

  List<String> _insuranceBasicModelBrandIdListOriginal = [];
  List<String> get insuranceBasicModelBrandIdListOriginal =>
      _insuranceBasicModelBrandIdListOriginal;
  set insuranceBasicModelBrandIdListOriginal(List<String> _value) {
    _insuranceBasicModelBrandIdListOriginal = _value;
  }

  void addToInsuranceBasicModelBrandIdListOriginal(String _value) {
    _insuranceBasicModelBrandIdListOriginal.add(_value);
  }

  void removeFromInsuranceBasicModelBrandIdListOriginal(String _value) {
    _insuranceBasicModelBrandIdListOriginal.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelBrandIdListOriginal(int _index) {
    _insuranceBasicModelBrandIdListOriginal.removeAt(_index);
  }

  void updateInsuranceBasicModelBrandIdListOriginalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelBrandIdListOriginal[_index] =
        updateFn(_insuranceBasicModelBrandIdListOriginal[_index]);
  }

  void insertAtIndexInInsuranceBasicModelBrandIdListOriginal(
      int _index, String _value) {
    _insuranceBasicModelBrandIdListOriginal.insert(_index, _value);
  }

  List<String> _insuranceBasicVehicleUsedTypeCodeList = [];
  List<String> get insuranceBasicVehicleUsedTypeCodeList =>
      _insuranceBasicVehicleUsedTypeCodeList;
  set insuranceBasicVehicleUsedTypeCodeList(List<String> _value) {
    _insuranceBasicVehicleUsedTypeCodeList = _value;
  }

  void addToInsuranceBasicVehicleUsedTypeCodeList(String _value) {
    _insuranceBasicVehicleUsedTypeCodeList.add(_value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeCodeList(String _value) {
    _insuranceBasicVehicleUsedTypeCodeList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeCodeList(int _index) {
    _insuranceBasicVehicleUsedTypeCodeList.removeAt(_index);
  }

  void updateInsuranceBasicVehicleUsedTypeCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicVehicleUsedTypeCodeList[_index] =
        updateFn(_insuranceBasicVehicleUsedTypeCodeList[_index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeCodeList(
      int _index, String _value) {
    _insuranceBasicVehicleUsedTypeCodeList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerIdList = [];
  List<String> get insuranceBasicInsurerIdList => _insuranceBasicInsurerIdList;
  set insuranceBasicInsurerIdList(List<String> _value) {
    _insuranceBasicInsurerIdList = _value;
  }

  void addToInsuranceBasicInsurerIdList(String _value) {
    _insuranceBasicInsurerIdList.add(_value);
  }

  void removeFromInsuranceBasicInsurerIdList(String _value) {
    _insuranceBasicInsurerIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdList(int _index) {
    _insuranceBasicInsurerIdList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerIdList[_index] =
        updateFn(_insuranceBasicInsurerIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdList(int _index, String _value) {
    _insuranceBasicInsurerIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerCodeList = [];
  List<String> get insuranceBasicInsurerCodeList =>
      _insuranceBasicInsurerCodeList;
  set insuranceBasicInsurerCodeList(List<String> _value) {
    _insuranceBasicInsurerCodeList = _value;
  }

  void addToInsuranceBasicInsurerCodeList(String _value) {
    _insuranceBasicInsurerCodeList.add(_value);
  }

  void removeFromInsuranceBasicInsurerCodeList(String _value) {
    _insuranceBasicInsurerCodeList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeList(int _index) {
    _insuranceBasicInsurerCodeList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerCodeList[_index] =
        updateFn(_insuranceBasicInsurerCodeList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeList(int _index, String _value) {
    _insuranceBasicInsurerCodeList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerShortNameList = [];
  List<String> get insuranceBasicInsurerShortNameList =>
      _insuranceBasicInsurerShortNameList;
  set insuranceBasicInsurerShortNameList(List<String> _value) {
    _insuranceBasicInsurerShortNameList = _value;
  }

  void addToInsuranceBasicInsurerShortNameList(String _value) {
    _insuranceBasicInsurerShortNameList.add(_value);
  }

  void removeFromInsuranceBasicInsurerShortNameList(String _value) {
    _insuranceBasicInsurerShortNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameList(int _index) {
    _insuranceBasicInsurerShortNameList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerShortNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerShortNameList[_index] =
        updateFn(_insuranceBasicInsurerShortNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameList(
      int _index, String _value) {
    _insuranceBasicInsurerShortNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerFullNameList = [];
  List<String> get insuranceBasicInsurerFullNameList =>
      _insuranceBasicInsurerFullNameList;
  set insuranceBasicInsurerFullNameList(List<String> _value) {
    _insuranceBasicInsurerFullNameList = _value;
  }

  void addToInsuranceBasicInsurerFullNameList(String _value) {
    _insuranceBasicInsurerFullNameList.add(_value);
  }

  void removeFromInsuranceBasicInsurerFullNameList(String _value) {
    _insuranceBasicInsurerFullNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameList(int _index) {
    _insuranceBasicInsurerFullNameList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerFullNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerFullNameList[_index] =
        updateFn(_insuranceBasicInsurerFullNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameList(
      int _index, String _value) {
    _insuranceBasicInsurerFullNameList.insert(_index, _value);
  }

  String _insuranceBasicTruckPart = '';
  String get insuranceBasicTruckPart => _insuranceBasicTruckPart;
  set insuranceBasicTruckPart(String _value) {
    _insuranceBasicTruckPart = _value;
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
  set upLoadedPic2(List<bool> _value) {
    _upLoadedPic2 = _value;
  }

  void addToUpLoadedPic2(bool _value) {
    _upLoadedPic2.add(_value);
  }

  void removeFromUpLoadedPic2(bool _value) {
    _upLoadedPic2.remove(_value);
  }

  void removeAtIndexFromUpLoadedPic2(int _index) {
    _upLoadedPic2.removeAt(_index);
  }

  void updateUpLoadedPic2AtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _upLoadedPic2[_index] = updateFn(_upLoadedPic2[_index]);
  }

  void insertAtIndexInUpLoadedPic2(int _index, bool _value) {
    _upLoadedPic2.insert(_index, _value);
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
  set upLoadedPic3(List<bool> _value) {
    _upLoadedPic3 = _value;
  }

  void addToUpLoadedPic3(bool _value) {
    _upLoadedPic3.add(_value);
  }

  void removeFromUpLoadedPic3(bool _value) {
    _upLoadedPic3.remove(_value);
  }

  void removeAtIndexFromUpLoadedPic3(int _index) {
    _upLoadedPic3.removeAt(_index);
  }

  void updateUpLoadedPic3AtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _upLoadedPic3[_index] = updateFn(_upLoadedPic3[_index]);
  }

  void insertAtIndexInUpLoadedPic3(int _index, bool _value) {
    _upLoadedPic3.insert(_index, _value);
  }

  String _insuranceBasicGarageId = '';
  String get insuranceBasicGarageId => _insuranceBasicGarageId;
  set insuranceBasicGarageId(String _value) {
    _insuranceBasicGarageId = _value;
  }

  String _insuranceBasicGarageName = 'เลือกประเภทการซ่อม';
  String get insuranceBasicGarageName => _insuranceBasicGarageName;
  set insuranceBasicGarageName(String _value) {
    _insuranceBasicGarageName = _value;
  }

  String _insuranceBasicCoverTypeId = '';
  String get insuranceBasicCoverTypeId => _insuranceBasicCoverTypeId;
  set insuranceBasicCoverTypeId(String _value) {
    _insuranceBasicCoverTypeId = _value;
  }

  String _insuranceBasicCoverTypeCode = '';
  String get insuranceBasicCoverTypeCode => _insuranceBasicCoverTypeCode;
  set insuranceBasicCoverTypeCode(String _value) {
    _insuranceBasicCoverTypeCode = _value;
  }

  String _insuranceBasicCoverTypeName = 'เลือกชั้นประกัน';
  String get insuranceBasicCoverTypeName => _insuranceBasicCoverTypeName;
  set insuranceBasicCoverTypeName(String _value) {
    _insuranceBasicCoverTypeName = _value;
  }

  List<String> _insuranceBasicCoverTypeIdList = [];
  List<String> get insuranceBasicCoverTypeIdList =>
      _insuranceBasicCoverTypeIdList;
  set insuranceBasicCoverTypeIdList(List<String> _value) {
    _insuranceBasicCoverTypeIdList = _value;
  }

  void addToInsuranceBasicCoverTypeIdList(String _value) {
    _insuranceBasicCoverTypeIdList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeIdList(String _value) {
    _insuranceBasicCoverTypeIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeIdList(int _index) {
    _insuranceBasicCoverTypeIdList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeIdList[_index] =
        updateFn(_insuranceBasicCoverTypeIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeIdList(int _index, String _value) {
    _insuranceBasicCoverTypeIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicCoverTypeCodeList = [];
  List<String> get insuranceBasicCoverTypeCodeList =>
      _insuranceBasicCoverTypeCodeList;
  set insuranceBasicCoverTypeCodeList(List<String> _value) {
    _insuranceBasicCoverTypeCodeList = _value;
  }

  void addToInsuranceBasicCoverTypeCodeList(String _value) {
    _insuranceBasicCoverTypeCodeList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeCodeList(String _value) {
    _insuranceBasicCoverTypeCodeList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeCodeList(int _index) {
    _insuranceBasicCoverTypeCodeList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeCodeList[_index] =
        updateFn(_insuranceBasicCoverTypeCodeList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeCodeList(
      int _index, String _value) {
    _insuranceBasicCoverTypeCodeList.insert(_index, _value);
  }

  List<String> _insuranceBasicCoverTypeNameList = [];
  List<String> get insuranceBasicCoverTypeNameList =>
      _insuranceBasicCoverTypeNameList;
  set insuranceBasicCoverTypeNameList(List<String> _value) {
    _insuranceBasicCoverTypeNameList = _value;
  }

  void addToInsuranceBasicCoverTypeNameList(String _value) {
    _insuranceBasicCoverTypeNameList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeNameList(String _value) {
    _insuranceBasicCoverTypeNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeNameList(int _index) {
    _insuranceBasicCoverTypeNameList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeNameList[_index] =
        updateFn(_insuranceBasicCoverTypeNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeNameList(
      int _index, String _value) {
    _insuranceBasicCoverTypeNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerIdOutput = [];
  List<String> get insuranceBasicInsurerIdOutput =>
      _insuranceBasicInsurerIdOutput;
  set insuranceBasicInsurerIdOutput(List<String> _value) {
    _insuranceBasicInsurerIdOutput = _value;
  }

  void addToInsuranceBasicInsurerIdOutput(String _value) {
    _insuranceBasicInsurerIdOutput.add(_value);
  }

  void removeFromInsuranceBasicInsurerIdOutput(String _value) {
    _insuranceBasicInsurerIdOutput.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdOutput(int _index) {
    _insuranceBasicInsurerIdOutput.removeAt(_index);
  }

  void updateInsuranceBasicInsurerIdOutputAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerIdOutput[_index] =
        updateFn(_insuranceBasicInsurerIdOutput[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdOutput(int _index, String _value) {
    _insuranceBasicInsurerIdOutput.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerCodeOutput = [];
  List<String> get insuranceBasicInsurerCodeOutput =>
      _insuranceBasicInsurerCodeOutput;
  set insuranceBasicInsurerCodeOutput(List<String> _value) {
    _insuranceBasicInsurerCodeOutput = _value;
  }

  void addToInsuranceBasicInsurerCodeOutput(String _value) {
    _insuranceBasicInsurerCodeOutput.add(_value);
  }

  void removeFromInsuranceBasicInsurerCodeOutput(String _value) {
    _insuranceBasicInsurerCodeOutput.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeOutput(int _index) {
    _insuranceBasicInsurerCodeOutput.removeAt(_index);
  }

  void updateInsuranceBasicInsurerCodeOutputAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerCodeOutput[_index] =
        updateFn(_insuranceBasicInsurerCodeOutput[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeOutput(
      int _index, String _value) {
    _insuranceBasicInsurerCodeOutput.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerShortNameOutput = [];
  List<String> get insuranceBasicInsurerShortNameOutput =>
      _insuranceBasicInsurerShortNameOutput;
  set insuranceBasicInsurerShortNameOutput(List<String> _value) {
    _insuranceBasicInsurerShortNameOutput = _value;
  }

  void addToInsuranceBasicInsurerShortNameOutput(String _value) {
    _insuranceBasicInsurerShortNameOutput.add(_value);
  }

  void removeFromInsuranceBasicInsurerShortNameOutput(String _value) {
    _insuranceBasicInsurerShortNameOutput.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameOutput(int _index) {
    _insuranceBasicInsurerShortNameOutput.removeAt(_index);
  }

  void updateInsuranceBasicInsurerShortNameOutputAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerShortNameOutput[_index] =
        updateFn(_insuranceBasicInsurerShortNameOutput[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameOutput(
      int _index, String _value) {
    _insuranceBasicInsurerShortNameOutput.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerFullNameOutput = [];
  List<String> get insuranceBasicInsurerFullNameOutput =>
      _insuranceBasicInsurerFullNameOutput;
  set insuranceBasicInsurerFullNameOutput(List<String> _value) {
    _insuranceBasicInsurerFullNameOutput = _value;
  }

  void addToInsuranceBasicInsurerFullNameOutput(String _value) {
    _insuranceBasicInsurerFullNameOutput.add(_value);
  }

  void removeFromInsuranceBasicInsurerFullNameOutput(String _value) {
    _insuranceBasicInsurerFullNameOutput.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameOutput(int _index) {
    _insuranceBasicInsurerFullNameOutput.removeAt(_index);
  }

  void updateInsuranceBasicInsurerFullNameOutputAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerFullNameOutput[_index] =
        updateFn(_insuranceBasicInsurerFullNameOutput[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameOutput(
      int _index, String _value) {
    _insuranceBasicInsurerFullNameOutput.insert(_index, _value);
  }

  String _insuranceBasicActFlag = '';
  String get insuranceBasicActFlag => _insuranceBasicActFlag;
  set insuranceBasicActFlag(String _value) {
    _insuranceBasicActFlag = _value;
  }

  String _insuranceBasicVehicleUsedTypeId = '';
  String get insuranceBasicVehicleUsedTypeId =>
      _insuranceBasicVehicleUsedTypeId;
  set insuranceBasicVehicleUsedTypeId(String _value) {
    _insuranceBasicVehicleUsedTypeId = _value;
  }

  String _insuranceBasicVehicleUsedTypeCode = '';
  String get insuranceBasicVehicleUsedTypeCode =>
      _insuranceBasicVehicleUsedTypeCode;
  set insuranceBasicVehicleUsedTypeCode(String _value) {
    _insuranceBasicVehicleUsedTypeCode = _value;
  }

  String _insuranceBasicVehicleUsedTypeName = 'เลือกการใช้งาน';
  String get insuranceBasicVehicleUsedTypeName =>
      _insuranceBasicVehicleUsedTypeName;
  set insuranceBasicVehicleUsedTypeName(String _value) {
    _insuranceBasicVehicleUsedTypeName = _value;
  }

  String _insuranceBasicSumInsured = '';
  String get insuranceBasicSumInsured => _insuranceBasicSumInsured;
  set insuranceBasicSumInsured(String _value) {
    _insuranceBasicSumInsured = _value;
  }

  bool _insuranceRequestIsLoadedData = false;
  bool get insuranceRequestIsLoadedData => _insuranceRequestIsLoadedData;
  set insuranceRequestIsLoadedData(bool _value) {
    _insuranceRequestIsLoadedData = _value;
  }

  int _successStatusCode = 201;
  int get successStatusCode => _successStatusCode;
  set successStatusCode(int _value) {
    _successStatusCode = _value;
  }

  String _insuranceBasicTrailerSumInsured = '';
  String get insuranceBasicTrailerSumInsured =>
      _insuranceBasicTrailerSumInsured;
  set insuranceBasicTrailerSumInsured(String _value) {
    _insuranceBasicTrailerSumInsured = _value;
  }

  String _insuranceBasicListFlagRenew = '1';
  String get insuranceBasicListFlagRenew => _insuranceBasicListFlagRenew;
  set insuranceBasicListFlagRenew(String _value) {
    _insuranceBasicListFlagRenew = _value;
  }

  List<String> _insuranceBasicInsurerListNameList = [];
  List<String> get insuranceBasicInsurerListNameList =>
      _insuranceBasicInsurerListNameList;
  set insuranceBasicInsurerListNameList(List<String> _value) {
    _insuranceBasicInsurerListNameList = _value;
  }

  void addToInsuranceBasicInsurerListNameList(String _value) {
    _insuranceBasicInsurerListNameList.add(_value);
  }

  void removeFromInsuranceBasicInsurerListNameList(String _value) {
    _insuranceBasicInsurerListNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameList(int _index) {
    _insuranceBasicInsurerListNameList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerListNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerListNameList[_index] =
        updateFn(_insuranceBasicInsurerListNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameList(
      int _index, String _value) {
    _insuranceBasicInsurerListNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicInsurerListNameRandomList = [];
  List<String> get insuranceBasicInsurerListNameRandomList =>
      _insuranceBasicInsurerListNameRandomList;
  set insuranceBasicInsurerListNameRandomList(List<String> _value) {
    _insuranceBasicInsurerListNameRandomList = _value;
  }

  void addToInsuranceBasicInsurerListNameRandomList(String _value) {
    _insuranceBasicInsurerListNameRandomList.add(_value);
  }

  void removeFromInsuranceBasicInsurerListNameRandomList(String _value) {
    _insuranceBasicInsurerListNameRandomList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameRandomList(int _index) {
    _insuranceBasicInsurerListNameRandomList.removeAt(_index);
  }

  void updateInsuranceBasicInsurerListNameRandomListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicInsurerListNameRandomList[_index] =
        updateFn(_insuranceBasicInsurerListNameRandomList[_index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameRandomList(
      int _index, String _value) {
    _insuranceBasicInsurerListNameRandomList.insert(_index, _value);
  }

  String _fromPage = 'Dashboard';
  String get fromPage => _fromPage;
  set fromPage(String _value) {
    _fromPage = _value;
  }

  String _insuranceOperationChoiceChips = 'งานใหม่          ';
  String get insuranceOperationChoiceChips => _insuranceOperationChoiceChips;
  set insuranceOperationChoiceChips(String _value) {
    _insuranceOperationChoiceChips = _value;
  }

  String _insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
  String get insuranceCustomerTypeChoiceChips =>
      _insuranceCustomerTypeChoiceChips;
  set insuranceCustomerTypeChoiceChips(String _value) {
    _insuranceCustomerTypeChoiceChips = _value;
  }

  bool _insuranceBoxCheckbokValue = false;
  bool get insuranceBoxCheckbokValue => _insuranceBoxCheckbokValue;
  set insuranceBoxCheckbokValue(bool _value) {
    _insuranceBoxCheckbokValue = _value;
  }

  String _insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
  String get insuranceBoxTypeChoiceChip => _insuranceBoxTypeChoiceChip;
  set insuranceBoxTypeChoiceChip(String _value) {
    _insuranceBoxTypeChoiceChip = _value;
  }

  String _insuranceVehicleTypeDropDown = 'เลือกประเภทรถ';
  String get insuranceVehicleTypeDropDown => _insuranceVehicleTypeDropDown;
  set insuranceVehicleTypeDropDown(String _value) {
    _insuranceVehicleTypeDropDown = _value;
  }

  String _imageOtherName = '';
  String get imageOtherName => _imageOtherName;
  set imageOtherName(String _value) {
    _imageOtherName = _value;
  }

  bool _checkBoxNotSatisfied = false;
  bool get checkBoxNotSatisfied => _checkBoxNotSatisfied;
  set checkBoxNotSatisfied(bool _value) {
    _checkBoxNotSatisfied = _value;
  }

  bool _checkBoxNotInRate = false;
  bool get checkBoxNotInRate => _checkBoxNotInRate;
  set checkBoxNotInRate(bool _value) {
    _checkBoxNotInRate = _value;
  }

  bool _checkBoxCustomCar = false;
  bool get checkBoxCustomCar => _checkBoxCustomCar;
  set checkBoxCustomCar(bool _value) {
    _checkBoxCustomCar = _value;
  }

  bool _buttonOrdinary = false;
  bool get buttonOrdinary => _buttonOrdinary;
  set buttonOrdinary(bool _value) {
    _buttonOrdinary = _value;
  }

  bool _buttonCorporation = false;
  bool get buttonCorporation => _buttonCorporation;
  set buttonCorporation(bool _value) {
    _buttonCorporation = _value;
  }

  List<String> _insuranceBasicBrandTypeList = [];
  List<String> get insuranceBasicBrandTypeList => _insuranceBasicBrandTypeList;
  set insuranceBasicBrandTypeList(List<String> _value) {
    _insuranceBasicBrandTypeList = _value;
  }

  void addToInsuranceBasicBrandTypeList(String _value) {
    _insuranceBasicBrandTypeList.add(_value);
  }

  void removeFromInsuranceBasicBrandTypeList(String _value) {
    _insuranceBasicBrandTypeList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicBrandTypeList(int _index) {
    _insuranceBasicBrandTypeList.removeAt(_index);
  }

  void updateInsuranceBasicBrandTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicBrandTypeList[_index] =
        updateFn(_insuranceBasicBrandTypeList[_index]);
  }

  void insertAtIndexInInsuranceBasicBrandTypeList(int _index, String _value) {
    _insuranceBasicBrandTypeList.insert(_index, _value);
  }

  List<String> _insuranceBasicModelList = [];
  List<String> get insuranceBasicModelList => _insuranceBasicModelList;
  set insuranceBasicModelList(List<String> _value) {
    _insuranceBasicModelList = _value;
  }

  void addToInsuranceBasicModelList(String _value) {
    _insuranceBasicModelList.add(_value);
  }

  void removeFromInsuranceBasicModelList(String _value) {
    _insuranceBasicModelList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicModelList(int _index) {
    _insuranceBasicModelList.removeAt(_index);
  }

  void updateInsuranceBasicModelListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicModelList[_index] =
        updateFn(_insuranceBasicModelList[_index]);
  }

  void insertAtIndexInInsuranceBasicModelList(int _index, String _value) {
    _insuranceBasicModelList.insert(_index, _value);
  }

  List<String> _insuranceBasicCoverTypeNameOutputList = [];
  List<String> get insuranceBasicCoverTypeNameOutputList =>
      _insuranceBasicCoverTypeNameOutputList;
  set insuranceBasicCoverTypeNameOutputList(List<String> _value) {
    _insuranceBasicCoverTypeNameOutputList = _value;
  }

  void addToInsuranceBasicCoverTypeNameOutputList(String _value) {
    _insuranceBasicCoverTypeNameOutputList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeNameOutputList(String _value) {
    _insuranceBasicCoverTypeNameOutputList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeNameOutputList(int _index) {
    _insuranceBasicCoverTypeNameOutputList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeNameOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeNameOutputList[_index] =
        updateFn(_insuranceBasicCoverTypeNameOutputList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeNameOutputList(
      int _index, String _value) {
    _insuranceBasicCoverTypeNameOutputList.insert(_index, _value);
  }

  List<String> _insuranceBasicCoverTypeIdOutputList = [];
  List<String> get insuranceBasicCoverTypeIdOutputList =>
      _insuranceBasicCoverTypeIdOutputList;
  set insuranceBasicCoverTypeIdOutputList(List<String> _value) {
    _insuranceBasicCoverTypeIdOutputList = _value;
  }

  void addToInsuranceBasicCoverTypeIdOutputList(String _value) {
    _insuranceBasicCoverTypeIdOutputList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeIdOutputList(String _value) {
    _insuranceBasicCoverTypeIdOutputList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeIdOutputList(int _index) {
    _insuranceBasicCoverTypeIdOutputList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeIdOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeIdOutputList[_index] =
        updateFn(_insuranceBasicCoverTypeIdOutputList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeIdOutputList(
      int _index, String _value) {
    _insuranceBasicCoverTypeIdOutputList.insert(_index, _value);
  }

  List<String> _insuranceBasicCoverTypeCodeOutputList = [];
  List<String> get insuranceBasicCoverTypeCodeOutputList =>
      _insuranceBasicCoverTypeCodeOutputList;
  set insuranceBasicCoverTypeCodeOutputList(List<String> _value) {
    _insuranceBasicCoverTypeCodeOutputList = _value;
  }

  void addToInsuranceBasicCoverTypeCodeOutputList(String _value) {
    _insuranceBasicCoverTypeCodeOutputList.add(_value);
  }

  void removeFromInsuranceBasicCoverTypeCodeOutputList(String _value) {
    _insuranceBasicCoverTypeCodeOutputList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeCodeOutputList(int _index) {
    _insuranceBasicCoverTypeCodeOutputList.removeAt(_index);
  }

  void updateInsuranceBasicCoverTypeCodeOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicCoverTypeCodeOutputList[_index] =
        updateFn(_insuranceBasicCoverTypeCodeOutputList[_index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeCodeOutputList(
      int _index, String _value) {
    _insuranceBasicCoverTypeCodeOutputList.insert(_index, _value);
  }

  List<String> _insuranceBasicGarageTypeInPackage = [];
  List<String> get insuranceBasicGarageTypeInPackage =>
      _insuranceBasicGarageTypeInPackage;
  set insuranceBasicGarageTypeInPackage(List<String> _value) {
    _insuranceBasicGarageTypeInPackage = _value;
  }

  void addToInsuranceBasicGarageTypeInPackage(String _value) {
    _insuranceBasicGarageTypeInPackage.add(_value);
  }

  void removeFromInsuranceBasicGarageTypeInPackage(String _value) {
    _insuranceBasicGarageTypeInPackage.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeInPackage(int _index) {
    _insuranceBasicGarageTypeInPackage.removeAt(_index);
  }

  void updateInsuranceBasicGarageTypeInPackageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicGarageTypeInPackage[_index] =
        updateFn(_insuranceBasicGarageTypeInPackage[_index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeInPackage(
      int _index, String _value) {
    _insuranceBasicGarageTypeInPackage.insert(_index, _value);
  }

  List<String> _searchableListComponentData = [];
  List<String> get searchableListComponentData => _searchableListComponentData;
  set searchableListComponentData(List<String> _value) {
    _searchableListComponentData = _value;
  }

  void addToSearchableListComponentData(String _value) {
    _searchableListComponentData.add(_value);
  }

  void removeFromSearchableListComponentData(String _value) {
    _searchableListComponentData.remove(_value);
  }

  void removeAtIndexFromSearchableListComponentData(int _index) {
    _searchableListComponentData.removeAt(_index);
  }

  void updateSearchableListComponentDataAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchableListComponentData[_index] =
        updateFn(_searchableListComponentData[_index]);
  }

  void insertAtIndexInSearchableListComponentData(int _index, String _value) {
    _searchableListComponentData.insert(_index, _value);
  }

  List<bool> _searchableListComponentSelectedList = [];
  List<bool> get searchableListComponentSelectedList =>
      _searchableListComponentSelectedList;
  set searchableListComponentSelectedList(List<bool> _value) {
    _searchableListComponentSelectedList = _value;
  }

  void addToSearchableListComponentSelectedList(bool _value) {
    _searchableListComponentSelectedList.add(_value);
  }

  void removeFromSearchableListComponentSelectedList(bool _value) {
    _searchableListComponentSelectedList.remove(_value);
  }

  void removeAtIndexFromSearchableListComponentSelectedList(int _index) {
    _searchableListComponentSelectedList.removeAt(_index);
  }

  void updateSearchableListComponentSelectedListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _searchableListComponentSelectedList[_index] =
        updateFn(_searchableListComponentSelectedList[_index]);
  }

  void insertAtIndexInSearchableListComponentSelectedList(
      int _index, bool _value) {
    _searchableListComponentSelectedList.insert(_index, _value);
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
  set insuranceBasicVehicleTypeDropdownList(List<String> _value) {
    _insuranceBasicVehicleTypeDropdownList = _value;
  }

  void addToInsuranceBasicVehicleTypeDropdownList(String _value) {
    _insuranceBasicVehicleTypeDropdownList.add(_value);
  }

  void removeFromInsuranceBasicVehicleTypeDropdownList(String _value) {
    _insuranceBasicVehicleTypeDropdownList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicVehicleTypeDropdownList(int _index) {
    _insuranceBasicVehicleTypeDropdownList.removeAt(_index);
  }

  void updateInsuranceBasicVehicleTypeDropdownListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicVehicleTypeDropdownList[_index] =
        updateFn(_insuranceBasicVehicleTypeDropdownList[_index]);
  }

  void insertAtIndexInInsuranceBasicVehicleTypeDropdownList(
      int _index, String _value) {
    _insuranceBasicVehicleTypeDropdownList.insert(_index, _value);
  }

  List<String> _insuranceBasicGarageTypeIdList = ['2', '1'];
  List<String> get insuranceBasicGarageTypeIdList =>
      _insuranceBasicGarageTypeIdList;
  set insuranceBasicGarageTypeIdList(List<String> _value) {
    _insuranceBasicGarageTypeIdList = _value;
  }

  void addToInsuranceBasicGarageTypeIdList(String _value) {
    _insuranceBasicGarageTypeIdList.add(_value);
  }

  void removeFromInsuranceBasicGarageTypeIdList(String _value) {
    _insuranceBasicGarageTypeIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeIdList(int _index) {
    _insuranceBasicGarageTypeIdList.removeAt(_index);
  }

  void updateInsuranceBasicGarageTypeIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicGarageTypeIdList[_index] =
        updateFn(_insuranceBasicGarageTypeIdList[_index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeIdList(
      int _index, String _value) {
    _insuranceBasicGarageTypeIdList.insert(_index, _value);
  }

  List<String> _insuranceBasicGarageTypeNameList = ['ซ่อมอู่', 'ซ่อมห้าง'];
  List<String> get insuranceBasicGarageTypeNameList =>
      _insuranceBasicGarageTypeNameList;
  set insuranceBasicGarageTypeNameList(List<String> _value) {
    _insuranceBasicGarageTypeNameList = _value;
  }

  void addToInsuranceBasicGarageTypeNameList(String _value) {
    _insuranceBasicGarageTypeNameList.add(_value);
  }

  void removeFromInsuranceBasicGarageTypeNameList(String _value) {
    _insuranceBasicGarageTypeNameList.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeNameList(int _index) {
    _insuranceBasicGarageTypeNameList.removeAt(_index);
  }

  void updateInsuranceBasicGarageTypeNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicGarageTypeNameList[_index] =
        updateFn(_insuranceBasicGarageTypeNameList[_index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeNameList(
      int _index, String _value) {
    _insuranceBasicGarageTypeNameList.insert(_index, _value);
  }

  List<String> _insuranceBasicGarageTypeIdInPackage = [];
  List<String> get insuranceBasicGarageTypeIdInPackage =>
      _insuranceBasicGarageTypeIdInPackage;
  set insuranceBasicGarageTypeIdInPackage(List<String> _value) {
    _insuranceBasicGarageTypeIdInPackage = _value;
  }

  void addToInsuranceBasicGarageTypeIdInPackage(String _value) {
    _insuranceBasicGarageTypeIdInPackage.add(_value);
  }

  void removeFromInsuranceBasicGarageTypeIdInPackage(String _value) {
    _insuranceBasicGarageTypeIdInPackage.remove(_value);
  }

  void removeAtIndexFromInsuranceBasicGarageTypeIdInPackage(int _index) {
    _insuranceBasicGarageTypeIdInPackage.removeAt(_index);
  }

  void updateInsuranceBasicGarageTypeIdInPackageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceBasicGarageTypeIdInPackage[_index] =
        updateFn(_insuranceBasicGarageTypeIdInPackage[_index]);
  }

  void insertAtIndexInInsuranceBasicGarageTypeIdInPackage(
      int _index, String _value) {
    _insuranceBasicGarageTypeIdInPackage.insert(_index, _value);
  }

  bool _isSelectBrandInPackage = false;
  bool get isSelectBrandInPackage => _isSelectBrandInPackage;
  set isSelectBrandInPackage(bool _value) {
    _isSelectBrandInPackage = _value;
  }

  List<String> _tpbiPerson = [];
  List<String> get tpbiPerson => _tpbiPerson;
  set tpbiPerson(List<String> _value) {
    _tpbiPerson = _value;
  }

  void addToTpbiPerson(String _value) {
    _tpbiPerson.add(_value);
  }

  void removeFromTpbiPerson(String _value) {
    _tpbiPerson.remove(_value);
  }

  void removeAtIndexFromTpbiPerson(int _index) {
    _tpbiPerson.removeAt(_index);
  }

  void updateTpbiPersonAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tpbiPerson[_index] = updateFn(_tpbiPerson[_index]);
  }

  void insertAtIndexInTpbiPerson(int _index, String _value) {
    _tpbiPerson.insert(_index, _value);
  }

  List<String> _tpbiAccident = [];
  List<String> get tpbiAccident => _tpbiAccident;
  set tpbiAccident(List<String> _value) {
    _tpbiAccident = _value;
  }

  void addToTpbiAccident(String _value) {
    _tpbiAccident.add(_value);
  }

  void removeFromTpbiAccident(String _value) {
    _tpbiAccident.remove(_value);
  }

  void removeAtIndexFromTpbiAccident(int _index) {
    _tpbiAccident.removeAt(_index);
  }

  void updateTpbiAccidentAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tpbiAccident[_index] = updateFn(_tpbiAccident[_index]);
  }

  void insertAtIndexInTpbiAccident(int _index, String _value) {
    _tpbiAccident.insert(_index, _value);
  }

  List<String> _effectiveDate = [];
  List<String> get effectiveDate => _effectiveDate;
  set effectiveDate(List<String> _value) {
    _effectiveDate = _value;
  }

  void addToEffectiveDate(String _value) {
    _effectiveDate.add(_value);
  }

  void removeFromEffectiveDate(String _value) {
    _effectiveDate.remove(_value);
  }

  void removeAtIndexFromEffectiveDate(int _index) {
    _effectiveDate.removeAt(_index);
  }

  void updateEffectiveDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _effectiveDate[_index] = updateFn(_effectiveDate[_index]);
  }

  void insertAtIndexInEffectiveDate(int _index, String _value) {
    _effectiveDate.insert(_index, _value);
  }

  List<String> _filterInsurerList = [];
  List<String> get filterInsurerList => _filterInsurerList;
  set filterInsurerList(List<String> _value) {
    _filterInsurerList = _value;
  }

  void addToFilterInsurerList(String _value) {
    _filterInsurerList.add(_value);
  }

  void removeFromFilterInsurerList(String _value) {
    _filterInsurerList.remove(_value);
  }

  void removeAtIndexFromFilterInsurerList(int _index) {
    _filterInsurerList.removeAt(_index);
  }

  void updateFilterInsurerListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterInsurerList[_index] = updateFn(_filterInsurerList[_index]);
  }

  void insertAtIndexInFilterInsurerList(int _index, String _value) {
    _filterInsurerList.insert(_index, _value);
  }

  List<String> _filterCoverTypeList = [];
  List<String> get filterCoverTypeList => _filterCoverTypeList;
  set filterCoverTypeList(List<String> _value) {
    _filterCoverTypeList = _value;
  }

  void addToFilterCoverTypeList(String _value) {
    _filterCoverTypeList.add(_value);
  }

  void removeFromFilterCoverTypeList(String _value) {
    _filterCoverTypeList.remove(_value);
  }

  void removeAtIndexFromFilterCoverTypeList(int _index) {
    _filterCoverTypeList.removeAt(_index);
  }

  void updateFilterCoverTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterCoverTypeList[_index] = updateFn(_filterCoverTypeList[_index]);
  }

  void insertAtIndexInFilterCoverTypeList(int _index, String _value) {
    _filterCoverTypeList.insert(_index, _value);
  }

  List<String> _filterGarageTypeList = [];
  List<String> get filterGarageTypeList => _filterGarageTypeList;
  set filterGarageTypeList(List<String> _value) {
    _filterGarageTypeList = _value;
  }

  void addToFilterGarageTypeList(String _value) {
    _filterGarageTypeList.add(_value);
  }

  void removeFromFilterGarageTypeList(String _value) {
    _filterGarageTypeList.remove(_value);
  }

  void removeAtIndexFromFilterGarageTypeList(int _index) {
    _filterGarageTypeList.removeAt(_index);
  }

  void updateFilterGarageTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterGarageTypeList[_index] = updateFn(_filterGarageTypeList[_index]);
  }

  void insertAtIndexInFilterGarageTypeList(int _index, String _value) {
    _filterGarageTypeList.insert(_index, _value);
  }

  List<String> _searchRegisYearList = [];
  List<String> get searchRegisYearList => _searchRegisYearList;
  set searchRegisYearList(List<String> _value) {
    _searchRegisYearList = _value;
  }

  void addToSearchRegisYearList(String _value) {
    _searchRegisYearList.add(_value);
  }

  void removeFromSearchRegisYearList(String _value) {
    _searchRegisYearList.remove(_value);
  }

  void removeAtIndexFromSearchRegisYearList(int _index) {
    _searchRegisYearList.removeAt(_index);
  }

  void updateSearchRegisYearListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchRegisYearList[_index] = updateFn(_searchRegisYearList[_index]);
  }

  void insertAtIndexInSearchRegisYearList(int _index, String _value) {
    _searchRegisYearList.insert(_index, _value);
  }

  List<String> _insuranceCardType = [];
  List<String> get insuranceCardType => _insuranceCardType;
  set insuranceCardType(List<String> _value) {
    _insuranceCardType = _value;
  }

  void addToInsuranceCardType(String _value) {
    _insuranceCardType.add(_value);
  }

  void removeFromInsuranceCardType(String _value) {
    _insuranceCardType.remove(_value);
  }

  void removeAtIndexFromInsuranceCardType(int _index) {
    _insuranceCardType.removeAt(_index);
  }

  void updateInsuranceCardTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceCardType[_index] = updateFn(_insuranceCardType[_index]);
  }

  void insertAtIndexInInsuranceCardType(int _index, String _value) {
    _insuranceCardType.insert(_index, _value);
  }

  List<String> _insuranceCusGender = [];
  List<String> get insuranceCusGender => _insuranceCusGender;
  set insuranceCusGender(List<String> _value) {
    _insuranceCusGender = _value;
  }

  void addToInsuranceCusGender(String _value) {
    _insuranceCusGender.add(_value);
  }

  void removeFromInsuranceCusGender(String _value) {
    _insuranceCusGender.remove(_value);
  }

  void removeAtIndexFromInsuranceCusGender(int _index) {
    _insuranceCusGender.removeAt(_index);
  }

  void updateInsuranceCusGenderAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceCusGender[_index] = updateFn(_insuranceCusGender[_index]);
  }

  void insertAtIndexInInsuranceCusGender(int _index, String _value) {
    _insuranceCusGender.insert(_index, _value);
  }

  List<String> _searchDriverList = [];
  List<String> get searchDriverList => _searchDriverList;
  set searchDriverList(List<String> _value) {
    _searchDriverList = _value;
  }

  void addToSearchDriverList(String _value) {
    _searchDriverList.add(_value);
  }

  void removeFromSearchDriverList(String _value) {
    _searchDriverList.remove(_value);
  }

  void removeAtIndexFromSearchDriverList(int _index) {
    _searchDriverList.removeAt(_index);
  }

  void updateSearchDriverListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchDriverList[_index] = updateFn(_searchDriverList[_index]);
  }

  void insertAtIndexInSearchDriverList(int _index, String _value) {
    _searchDriverList.insert(_index, _value);
  }

  List<String> _searchShortName = [];
  List<String> get searchShortName => _searchShortName;
  set searchShortName(List<String> _value) {
    _searchShortName = _value;
  }

  void addToSearchShortName(String _value) {
    _searchShortName.add(_value);
  }

  void removeFromSearchShortName(String _value) {
    _searchShortName.remove(_value);
  }

  void removeAtIndexFromSearchShortName(int _index) {
    _searchShortName.removeAt(_index);
  }

  void updateSearchShortNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchShortName[_index] = updateFn(_searchShortName[_index]);
  }

  void insertAtIndexInSearchShortName(int _index, String _value) {
    _searchShortName.insert(_index, _value);
  }

  List<bool> _selectInsurerList = [];
  List<bool> get selectInsurerList => _selectInsurerList;
  set selectInsurerList(List<bool> _value) {
    _selectInsurerList = _value;
  }

  void addToSelectInsurerList(bool _value) {
    _selectInsurerList.add(_value);
  }

  void removeFromSelectInsurerList(bool _value) {
    _selectInsurerList.remove(_value);
  }

  void removeAtIndexFromSelectInsurerList(int _index) {
    _selectInsurerList.removeAt(_index);
  }

  void updateSelectInsurerListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _selectInsurerList[_index] = updateFn(_selectInsurerList[_index]);
  }

  void insertAtIndexInSelectInsurerList(int _index, bool _value) {
    _selectInsurerList.insert(_index, _value);
  }

  List<String> _cardType = ['บัตรประชาชน', 'Passport'];
  List<String> get cardType => _cardType;
  set cardType(List<String> _value) {
    _cardType = _value;
  }

  void addToCardType(String _value) {
    _cardType.add(_value);
  }

  void removeFromCardType(String _value) {
    _cardType.remove(_value);
  }

  void removeAtIndexFromCardType(int _index) {
    _cardType.removeAt(_index);
  }

  void updateCardTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _cardType[_index] = updateFn(_cardType[_index]);
  }

  void insertAtIndexInCardType(int _index, String _value) {
    _cardType.insert(_index, _value);
  }

  List<String> _gender = ['ชาย', 'หญิง'];
  List<String> get gender => _gender;
  set gender(List<String> _value) {
    _gender = _value;
  }

  void addToGender(String _value) {
    _gender.add(_value);
  }

  void removeFromGender(String _value) {
    _gender.remove(_value);
  }

  void removeAtIndexFromGender(int _index) {
    _gender.removeAt(_index);
  }

  void updateGenderAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gender[_index] = updateFn(_gender[_index]);
  }

  void insertAtIndexInGender(int _index, String _value) {
    _gender.insert(_index, _value);
  }

  List<String> _searchLogo = [];
  List<String> get searchLogo => _searchLogo;
  set searchLogo(List<String> _value) {
    _searchLogo = _value;
  }

  void addToSearchLogo(String _value) {
    _searchLogo.add(_value);
  }

  void removeFromSearchLogo(String _value) {
    _searchLogo.remove(_value);
  }

  void removeAtIndexFromSearchLogo(int _index) {
    _searchLogo.removeAt(_index);
  }

  void updateSearchLogoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchLogo[_index] = updateFn(_searchLogo[_index]);
  }

  void insertAtIndexInSearchLogo(int _index, String _value) {
    _searchLogo.insert(_index, _value);
  }

  String _insuranceInfoCardType = 'เลือกประเภทบัตร';
  String get insuranceInfoCardType => _insuranceInfoCardType;
  set insuranceInfoCardType(String _value) {
    _insuranceInfoCardType = _value;
  }

  String _insuranceInfoGender = 'เลือกเพศ';
  String get insuranceInfoGender => _insuranceInfoGender;
  set insuranceInfoGender(String _value) {
    _insuranceInfoGender = _value;
  }

  String _insuranceInfoTitle = 'เลือกคำนำหน้าชื่อ';
  String get insuranceInfoTitle => _insuranceInfoTitle;
  set insuranceInfoTitle(String _value) {
    _insuranceInfoTitle = _value;
  }

  String _insuranceInfoOccupationGroup = 'เลือกกลุ่มอาชีพ';
  String get insuranceInfoOccupationGroup => _insuranceInfoOccupationGroup;
  set insuranceInfoOccupationGroup(String _value) {
    _insuranceInfoOccupationGroup = _value;
  }

  String _insuranceInfoIdCard = '';
  String get insuranceInfoIdCard => _insuranceInfoIdCard;
  set insuranceInfoIdCard(String _value) {
    _insuranceInfoIdCard = _value;
  }

  String _insuranceInfoFirstName = '';
  String get insuranceInfoFirstName => _insuranceInfoFirstName;
  set insuranceInfoFirstName(String _value) {
    _insuranceInfoFirstName = _value;
  }

  String _insuranceInfoLastName = '';
  String get insuranceInfoLastName => _insuranceInfoLastName;
  set insuranceInfoLastName(String _value) {
    _insuranceInfoLastName = _value;
  }

  String _insuranceInfoBirthDate = '';
  String get insuranceInfoBirthDate => _insuranceInfoBirthDate;
  set insuranceInfoBirthDate(String _value) {
    _insuranceInfoBirthDate = _value;
  }

  String _insuranceInfoOccupation = '';
  String get insuranceInfoOccupation => _insuranceInfoOccupation;
  set insuranceInfoOccupation(String _value) {
    _insuranceInfoOccupation = _value;
  }

  String _insuranceInfoPhonenumber = '';
  String get insuranceInfoPhonenumber => _insuranceInfoPhonenumber;
  set insuranceInfoPhonenumber(String _value) {
    _insuranceInfoPhonenumber = _value;
  }

  String _insuranceInfoOtherPhone = '';
  String get insuranceInfoOtherPhone => _insuranceInfoOtherPhone;
  set insuranceInfoOtherPhone(String _value) {
    _insuranceInfoOtherPhone = _value;
  }

  String _insuranceInfoEmail = '';
  String get insuranceInfoEmail => _insuranceInfoEmail;
  set insuranceInfoEmail(String _value) {
    _insuranceInfoEmail = _value;
  }

  String _insuranceInfoAge = '';
  String get insuranceInfoAge => _insuranceInfoAge;
  set insuranceInfoAge(String _value) {
    _insuranceInfoAge = _value;
  }

  String _insuranceInfoGarageType = '';
  String get insuranceInfoGarageType => _insuranceInfoGarageType;
  set insuranceInfoGarageType(String _value) {
    _insuranceInfoGarageType = _value;
  }

  String _insuranceInfocoverType = '';
  String get insuranceInfocoverType => _insuranceInfocoverType;
  set insuranceInfocoverType(String _value) {
    _insuranceInfocoverType = _value;
  }

  String _insuranceInfoGrossTotal = '';
  String get insuranceInfoGrossTotal => _insuranceInfoGrossTotal;
  set insuranceInfoGrossTotal(String _value) {
    _insuranceInfoGrossTotal = _value;
  }

  String _insuranceInfoImgUrl = '';
  String get insuranceInfoImgUrl => _insuranceInfoImgUrl;
  set insuranceInfoImgUrl(String _value) {
    _insuranceInfoImgUrl = _value;
  }

  bool _nonePackageFlagCarrier = false;
  bool get nonePackageFlagCarrier => _nonePackageFlagCarrier;
  set nonePackageFlagCarrier(bool _value) {
    _nonePackageFlagCarrier = _value;
  }

  String _nonePackageVehicleType = 'กรุณาเลือกประเภทรถ';
  String get nonePackageVehicleType => _nonePackageVehicleType;
  set nonePackageVehicleType(String _value) {
    _nonePackageVehicleType = _value;
  }

  String _nonePackageBrandName = 'กรุณาเลือกยี่ห้อรถ';
  String get nonePackageBrandName => _nonePackageBrandName;
  set nonePackageBrandName(String _value) {
    _nonePackageBrandName = _value;
  }

  String _nonePackageBrandId = '';
  String get nonePackageBrandId => _nonePackageBrandId;
  set nonePackageBrandId(String _value) {
    _nonePackageBrandId = _value;
  }

  String _nonePackageModelName = 'กรุณากรอกรุ่นรถ';
  String get nonePackageModelName => _nonePackageModelName;
  set nonePackageModelName(String _value) {
    _nonePackageModelName = _value;
  }

  String _nonePackageModelCode = '';
  String get nonePackageModelCode => _nonePackageModelCode;
  set nonePackageModelCode(String _value) {
    _nonePackageModelCode = _value;
  }

  String _nonePackageYear = 'กรุณาเลือกปีจดทะเบียน';
  String get nonePackageYear => _nonePackageYear;
  set nonePackageYear(String _value) {
    _nonePackageYear = _value;
  }

  String _nonePackageUsedTypeId = '';
  String get nonePackageUsedTypeId => _nonePackageUsedTypeId;
  set nonePackageUsedTypeId(String _value) {
    _nonePackageUsedTypeId = _value;
  }

  List<String> _nonePackageSearchModelList = [];
  List<String> get nonePackageSearchModelList => _nonePackageSearchModelList;
  set nonePackageSearchModelList(List<String> _value) {
    _nonePackageSearchModelList = _value;
  }

  void addToNonePackageSearchModelList(String _value) {
    _nonePackageSearchModelList.add(_value);
  }

  void removeFromNonePackageSearchModelList(String _value) {
    _nonePackageSearchModelList.remove(_value);
  }

  void removeAtIndexFromNonePackageSearchModelList(int _index) {
    _nonePackageSearchModelList.removeAt(_index);
  }

  void updateNonePackageSearchModelListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageSearchModelList[_index] =
        updateFn(_nonePackageSearchModelList[_index]);
  }

  void insertAtIndexInNonePackageSearchModelList(int _index, String _value) {
    _nonePackageSearchModelList.insert(_index, _value);
  }

  String _nonePackageUsedTypeCode = '';
  String get nonePackageUsedTypeCode => _nonePackageUsedTypeCode;
  set nonePackageUsedTypeCode(String _value) {
    _nonePackageUsedTypeCode = _value;
  }

  String _nonePackageUsedTypeName = 'กรุณาเลือกลักษณะการใช้รถ';
  String get nonePackageUsedTypeName => _nonePackageUsedTypeName;
  set nonePackageUsedTypeName(String _value) {
    _nonePackageUsedTypeName = _value;
  }

  String _nonePackageCusFullname = 'กรุณากรอกชื่อ';
  String get nonePackageCusFullname => _nonePackageCusFullname;
  set nonePackageCusFullname(String _value) {
    _nonePackageCusFullname = _value;
  }

  String _nonePackageCusPhone = 'กรุณากรอกเบอร์โทรศัพท์';
  String get nonePackageCusPhone => _nonePackageCusPhone;
  set nonePackageCusPhone(String _value) {
    _nonePackageCusPhone = _value;
  }

  String _nonePackagePlate = '';
  String get nonePackagePlate => _nonePackagePlate;
  set nonePackagePlate(String _value) {
    _nonePackagePlate = _value;
  }

  String _nonePackageProvince = 'กรุณาเลือกจังหวัดจดทะเบียน';
  String get nonePackageProvince => _nonePackageProvince;
  set nonePackageProvince(String _value) {
    _nonePackageProvince = _value;
  }

  String _nonePackageProvinceId = '';
  String get nonePackageProvinceId => _nonePackageProvinceId;
  set nonePackageProvinceId(String _value) {
    _nonePackageProvinceId = _value;
  }

  String _nonePackageSumInsured = 'กรุณากรอกทุนประกัน';
  String get nonePackageSumInsured => _nonePackageSumInsured;
  set nonePackageSumInsured(String _value) {
    _nonePackageSumInsured = _value;
  }

  bool _nonePackageFlagAct = true;
  bool get nonePackageFlagAct => _nonePackageFlagAct;
  set nonePackageFlagAct(bool _value) {
    _nonePackageFlagAct = _value;
  }

  String _insuranceInfoVehicleType = '';
  String get insuranceInfoVehicleType => _insuranceInfoVehicleType;
  set insuranceInfoVehicleType(String _value) {
    _insuranceInfoVehicleType = _value;
  }

  String _insuranceInfoBrandName = '';
  String get insuranceInfoBrandName => _insuranceInfoBrandName;
  set insuranceInfoBrandName(String _value) {
    _insuranceInfoBrandName = _value;
  }

  String _insuranceInfoModelName = '';
  String get insuranceInfoModelName => _insuranceInfoModelName;
  set insuranceInfoModelName(String _value) {
    _insuranceInfoModelName = _value;
  }

  String _insuranceInfoRegisYear = '';
  String get insuranceInfoRegisYear => _insuranceInfoRegisYear;
  set insuranceInfoRegisYear(String _value) {
    _insuranceInfoRegisYear = _value;
  }

  String _insuranceInfoProductYear = 'กรุณาเลือกปีผลิต';
  String get insuranceInfoProductYear => _insuranceInfoProductYear;
  set insuranceInfoProductYear(String _value) {
    _insuranceInfoProductYear = _value;
  }

  String _insuranceInfoVehicleUsage = '';
  String get insuranceInfoVehicleUsage => _insuranceInfoVehicleUsage;
  set insuranceInfoVehicleUsage(String _value) {
    _insuranceInfoVehicleUsage = _value;
  }

  String _insuranceInfoCarRegis = '';
  String get insuranceInfoCarRegis => _insuranceInfoCarRegis;
  set insuranceInfoCarRegis(String _value) {
    _insuranceInfoCarRegis = _value;
  }

  String _insuranceInfoBodyNumber = '';
  String get insuranceInfoBodyNumber => _insuranceInfoBodyNumber;
  set insuranceInfoBodyNumber(String _value) {
    _insuranceInfoBodyNumber = _value;
  }

  String _insuranceInfoEngineNumber = '';
  String get insuranceInfoEngineNumber => _insuranceInfoEngineNumber;
  set insuranceInfoEngineNumber(String _value) {
    _insuranceInfoEngineNumber = _value;
  }

  String _insuranceInfoCarSeat = '';
  String get insuranceInfoCarSeat => _insuranceInfoCarSeat;
  set insuranceInfoCarSeat(String _value) {
    _insuranceInfoCarSeat = _value;
  }

  String _insuranceInfoSizeCar = '';
  String get insuranceInfoSizeCar => _insuranceInfoSizeCar;
  set insuranceInfoSizeCar(String _value) {
    _insuranceInfoSizeCar = _value;
  }

  String _insuranceInfoWeightCar = '';
  String get insuranceInfoWeightCar => _insuranceInfoWeightCar;
  set insuranceInfoWeightCar(String _value) {
    _insuranceInfoWeightCar = _value;
  }

  bool _nonePackageIsBrandSelect = false;
  bool get nonePackageIsBrandSelect => _nonePackageIsBrandSelect;
  set nonePackageIsBrandSelect(bool _value) {
    _nonePackageIsBrandSelect = _value;
  }

  List<String> _nonePackageSearchModelIdList = [];
  List<String> get nonePackageSearchModelIdList =>
      _nonePackageSearchModelIdList;
  set nonePackageSearchModelIdList(List<String> _value) {
    _nonePackageSearchModelIdList = _value;
  }

  void addToNonePackageSearchModelIdList(String _value) {
    _nonePackageSearchModelIdList.add(_value);
  }

  void removeFromNonePackageSearchModelIdList(String _value) {
    _nonePackageSearchModelIdList.remove(_value);
  }

  void removeAtIndexFromNonePackageSearchModelIdList(int _index) {
    _nonePackageSearchModelIdList.removeAt(_index);
  }

  void updateNonePackageSearchModelIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageSearchModelIdList[_index] =
        updateFn(_nonePackageSearchModelIdList[_index]);
  }

  void insertAtIndexInNonePackageSearchModelIdList(int _index, String _value) {
    _nonePackageSearchModelIdList.insert(_index, _value);
  }

  List<String> _searchAccessoryList = [];
  List<String> get searchAccessoryList => _searchAccessoryList;
  set searchAccessoryList(List<String> _value) {
    _searchAccessoryList = _value;
  }

  void addToSearchAccessoryList(String _value) {
    _searchAccessoryList.add(_value);
  }

  void removeFromSearchAccessoryList(String _value) {
    _searchAccessoryList.remove(_value);
  }

  void removeAtIndexFromSearchAccessoryList(int _index) {
    _searchAccessoryList.removeAt(_index);
  }

  void updateSearchAccessoryListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchAccessoryList[_index] = updateFn(_searchAccessoryList[_index]);
  }

  void insertAtIndexInSearchAccessoryList(int _index, String _value) {
    _searchAccessoryList.insert(_index, _value);
  }

  String _insuranceInfoActAmount = '';
  String get insuranceInfoActAmount => _insuranceInfoActAmount;
  set insuranceInfoActAmount(String _value) {
    _insuranceInfoActAmount = _value;
  }

  String _insuranceInfoAccessory = '';
  String get insuranceInfoAccessory => _insuranceInfoAccessory;
  set insuranceInfoAccessory(String _value) {
    _insuranceInfoAccessory = _value;
  }

  String _insuranceInfoAccessoryProtect = '';
  String get insuranceInfoAccessoryProtect => _insuranceInfoAccessoryProtect;
  set insuranceInfoAccessoryProtect(String _value) {
    _insuranceInfoAccessoryProtect = _value;
  }

  List<String> _nonePackageCarrierTypeList = ['ตู้แห้ง', 'ตู้เย็น'];
  List<String> get nonePackageCarrierTypeList => _nonePackageCarrierTypeList;
  set nonePackageCarrierTypeList(List<String> _value) {
    _nonePackageCarrierTypeList = _value;
  }

  void addToNonePackageCarrierTypeList(String _value) {
    _nonePackageCarrierTypeList.add(_value);
  }

  void removeFromNonePackageCarrierTypeList(String _value) {
    _nonePackageCarrierTypeList.remove(_value);
  }

  void removeAtIndexFromNonePackageCarrierTypeList(int _index) {
    _nonePackageCarrierTypeList.removeAt(_index);
  }

  void updateNonePackageCarrierTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageCarrierTypeList[_index] =
        updateFn(_nonePackageCarrierTypeList[_index]);
  }

  void insertAtIndexInNonePackageCarrierTypeList(int _index, String _value) {
    _nonePackageCarrierTypeList.insert(_index, _value);
  }

  String _nonePackageCarrierType = 'กรุณาเลือกประเภทตู้เหล็ก';
  String get nonePackageCarrierType => _nonePackageCarrierType;
  set nonePackageCarrierType(String _value) {
    _nonePackageCarrierType = _value;
  }

  bool _nonePackageFlagCoop = false;
  bool get nonePackageFlagCoop => _nonePackageFlagCoop;
  set nonePackageFlagCoop(bool _value) {
    _nonePackageFlagCoop = _value;
  }

  List<String> _nonePackageTruckPartList = ['เฉพาะหัวลาก', 'หัวลาก + หางพ่วง'];
  List<String> get nonePackageTruckPartList => _nonePackageTruckPartList;
  set nonePackageTruckPartList(List<String> _value) {
    _nonePackageTruckPartList = _value;
  }

  void addToNonePackageTruckPartList(String _value) {
    _nonePackageTruckPartList.add(_value);
  }

  void removeFromNonePackageTruckPartList(String _value) {
    _nonePackageTruckPartList.remove(_value);
  }

  void removeAtIndexFromNonePackageTruckPartList(int _index) {
    _nonePackageTruckPartList.removeAt(_index);
  }

  void updateNonePackageTruckPartListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTruckPartList[_index] =
        updateFn(_nonePackageTruckPartList[_index]);
  }

  void insertAtIndexInNonePackageTruckPartList(int _index, String _value) {
    _nonePackageTruckPartList.insert(_index, _value);
  }

  String _nonePackageTruckPart = 'กรุณาเลือกส่วนของรถบรรทุก';
  String get nonePackageTruckPart => _nonePackageTruckPart;
  set nonePackageTruckPart(String _value) {
    _nonePackageTruckPart = _value;
  }

  List<String> _nonePackageCusMembershipList = ['ลูกค้าสินเชื่อ', 'ลูกค้านอก'];
  List<String> get nonePackageCusMembershipList =>
      _nonePackageCusMembershipList;
  set nonePackageCusMembershipList(List<String> _value) {
    _nonePackageCusMembershipList = _value;
  }

  void addToNonePackageCusMembershipList(String _value) {
    _nonePackageCusMembershipList.add(_value);
  }

  void removeFromNonePackageCusMembershipList(String _value) {
    _nonePackageCusMembershipList.remove(_value);
  }

  void removeAtIndexFromNonePackageCusMembershipList(int _index) {
    _nonePackageCusMembershipList.removeAt(_index);
  }

  void updateNonePackageCusMembershipListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageCusMembershipList[_index] =
        updateFn(_nonePackageCusMembershipList[_index]);
  }

  void insertAtIndexInNonePackageCusMembershipList(int _index, String _value) {
    _nonePackageCusMembershipList.insert(_index, _value);
  }

  String _nonePackageCusMembership = 'กรุณาเลือกประเภทลูกค้า';
  String get nonePackageCusMembership => _nonePackageCusMembership;
  set nonePackageCusMembership(String _value) {
    _nonePackageCusMembership = _value;
  }

  String _nonePackageTruckCurrentPrice = 'กรุณากรอกราคาซื้อขายปัจจุบัน';
  String get nonePackageTruckCurrentPrice => _nonePackageTruckCurrentPrice;
  set nonePackageTruckCurrentPrice(String _value) {
    _nonePackageTruckCurrentPrice = _value;
  }

  String _nonePackagePlateAdditional = 'กรุณากรอกเลขทะเบียนหางพ่วง';
  String get nonePackagePlateAdditional => _nonePackagePlateAdditional;
  set nonePackagePlateAdditional(String _value) {
    _nonePackagePlateAdditional = _value;
  }

  String _nonePackageTruckCarryPurpose = 'กรุณากรอกรถใช้บรรทุกอะไร';
  String get nonePackageTruckCarryPurpose => _nonePackageTruckCarryPurpose;
  set nonePackageTruckCarryPurpose(String _value) {
    _nonePackageTruckCarryPurpose = _value;
  }

  String _nonePackageTrailerSumInsured = 'กรุณากรอกทุนประกันหางพ่วง';
  String get nonePackageTrailerSumInsured => _nonePackageTrailerSumInsured;
  set nonePackageTrailerSumInsured(String _value) {
    _nonePackageTrailerSumInsured = _value;
  }

  String _nonePackageCarrierPrice = '';
  String get nonePackageCarrierPrice => _nonePackageCarrierPrice;
  set nonePackageCarrierPrice(String _value) {
    _nonePackageCarrierPrice = _value;
  }

  List<String> _nonePackageInsurerIdList = [];
  List<String> get nonePackageInsurerIdList => _nonePackageInsurerIdList;
  set nonePackageInsurerIdList(List<String> _value) {
    _nonePackageInsurerIdList = _value;
  }

  void addToNonePackageInsurerIdList(String _value) {
    _nonePackageInsurerIdList.add(_value);
  }

  void removeFromNonePackageInsurerIdList(String _value) {
    _nonePackageInsurerIdList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerIdList(int _index) {
    _nonePackageInsurerIdList.removeAt(_index);
  }

  void updateNonePackageInsurerIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerIdList[_index] =
        updateFn(_nonePackageInsurerIdList[_index]);
  }

  void insertAtIndexInNonePackageInsurerIdList(int _index, String _value) {
    _nonePackageInsurerIdList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerCodeList = [];
  List<String> get nonePackageInsurerCodeList => _nonePackageInsurerCodeList;
  set nonePackageInsurerCodeList(List<String> _value) {
    _nonePackageInsurerCodeList = _value;
  }

  void addToNonePackageInsurerCodeList(String _value) {
    _nonePackageInsurerCodeList.add(_value);
  }

  void removeFromNonePackageInsurerCodeList(String _value) {
    _nonePackageInsurerCodeList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerCodeList(int _index) {
    _nonePackageInsurerCodeList.removeAt(_index);
  }

  void updateNonePackageInsurerCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerCodeList[_index] =
        updateFn(_nonePackageInsurerCodeList[_index]);
  }

  void insertAtIndexInNonePackageInsurerCodeList(int _index, String _value) {
    _nonePackageInsurerCodeList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerShortNameList = [];
  List<String> get nonePackageInsurerShortNameList =>
      _nonePackageInsurerShortNameList;
  set nonePackageInsurerShortNameList(List<String> _value) {
    _nonePackageInsurerShortNameList = _value;
  }

  void addToNonePackageInsurerShortNameList(String _value) {
    _nonePackageInsurerShortNameList.add(_value);
  }

  void removeFromNonePackageInsurerShortNameList(String _value) {
    _nonePackageInsurerShortNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameList(int _index) {
    _nonePackageInsurerShortNameList.removeAt(_index);
  }

  void updateNonePackageInsurerShortNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerShortNameList[_index] =
        updateFn(_nonePackageInsurerShortNameList[_index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameList(
      int _index, String _value) {
    _nonePackageInsurerShortNameList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerNameList = [];
  List<String> get nonePackageInsurerNameList => _nonePackageInsurerNameList;
  set nonePackageInsurerNameList(List<String> _value) {
    _nonePackageInsurerNameList = _value;
  }

  void addToNonePackageInsurerNameList(String _value) {
    _nonePackageInsurerNameList.add(_value);
  }

  void removeFromNonePackageInsurerNameList(String _value) {
    _nonePackageInsurerNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerNameList(int _index) {
    _nonePackageInsurerNameList.removeAt(_index);
  }

  void updateNonePackageInsurerNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerNameList[_index] =
        updateFn(_nonePackageInsurerNameList[_index]);
  }

  void insertAtIndexInNonePackageInsurerNameList(int _index, String _value) {
    _nonePackageInsurerNameList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerDisplayName = [];
  List<String> get nonePackageInsurerDisplayName =>
      _nonePackageInsurerDisplayName;
  set nonePackageInsurerDisplayName(List<String> _value) {
    _nonePackageInsurerDisplayName = _value;
  }

  void addToNonePackageInsurerDisplayName(String _value) {
    _nonePackageInsurerDisplayName.add(_value);
  }

  void removeFromNonePackageInsurerDisplayName(String _value) {
    _nonePackageInsurerDisplayName.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerDisplayName(int _index) {
    _nonePackageInsurerDisplayName.removeAt(_index);
  }

  void updateNonePackageInsurerDisplayNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerDisplayName[_index] =
        updateFn(_nonePackageInsurerDisplayName[_index]);
  }

  void insertAtIndexInNonePackageInsurerDisplayName(int _index, String _value) {
    _nonePackageInsurerDisplayName.insert(_index, _value);
  }

  String _addAddressAtIdCard = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard => _addAddressAtIdCard;
  set addAddressAtIdCard(String _value) {
    _addAddressAtIdCard = _value;
  }

  String _addAddressAtIdCard2 = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard2 => _addAddressAtIdCard2;
  set addAddressAtIdCard2(String _value) {
    _addAddressAtIdCard2 = _value;
  }

  String _addAddressAtIdCard3 = 'กรุณากรอกที่อยู่';
  String get addAddressAtIdCard3 => _addAddressAtIdCard3;
  set addAddressAtIdCard3(String _value) {
    _addAddressAtIdCard3 = _value;
  }

  String _addAddressForDoc = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc => _addAddressForDoc;
  set addAddressForDoc(String _value) {
    _addAddressForDoc = _value;
  }

  String _addAddressForDoc2 = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc2 => _addAddressForDoc2;
  set addAddressForDoc2(String _value) {
    _addAddressForDoc2 = _value;
  }

  String _addAddressForDoc3 = 'กรุณากรอกที่อยู่';
  String get addAddressForDoc3 => _addAddressForDoc3;
  set addAddressForDoc3(String _value) {
    _addAddressForDoc3 = _value;
  }

  bool _addAddressAtIdCardBool = false;
  bool get addAddressAtIdCardBool => _addAddressAtIdCardBool;
  set addAddressAtIdCardBool(bool _value) {
    _addAddressAtIdCardBool = _value;
  }

  bool _addAddressForDocBool = false;
  bool get addAddressForDocBool => _addAddressForDocBool;
  set addAddressForDocBool(bool _value) {
    _addAddressForDocBool = _value;
  }

  List<String> _nonePackageInsurerIdOutputList = [];
  List<String> get nonePackageInsurerIdOutputList =>
      _nonePackageInsurerIdOutputList;
  set nonePackageInsurerIdOutputList(List<String> _value) {
    _nonePackageInsurerIdOutputList = _value;
  }

  void addToNonePackageInsurerIdOutputList(String _value) {
    _nonePackageInsurerIdOutputList.add(_value);
  }

  void removeFromNonePackageInsurerIdOutputList(String _value) {
    _nonePackageInsurerIdOutputList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerIdOutputList(int _index) {
    _nonePackageInsurerIdOutputList.removeAt(_index);
  }

  void updateNonePackageInsurerIdOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerIdOutputList[_index] =
        updateFn(_nonePackageInsurerIdOutputList[_index]);
  }

  void insertAtIndexInNonePackageInsurerIdOutputList(
      int _index, String _value) {
    _nonePackageInsurerIdOutputList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerCodeOutputList = [];
  List<String> get nonePackageInsurerCodeOutputList =>
      _nonePackageInsurerCodeOutputList;
  set nonePackageInsurerCodeOutputList(List<String> _value) {
    _nonePackageInsurerCodeOutputList = _value;
  }

  void addToNonePackageInsurerCodeOutputList(String _value) {
    _nonePackageInsurerCodeOutputList.add(_value);
  }

  void removeFromNonePackageInsurerCodeOutputList(String _value) {
    _nonePackageInsurerCodeOutputList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerCodeOutputList(int _index) {
    _nonePackageInsurerCodeOutputList.removeAt(_index);
  }

  void updateNonePackageInsurerCodeOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerCodeOutputList[_index] =
        updateFn(_nonePackageInsurerCodeOutputList[_index]);
  }

  void insertAtIndexInNonePackageInsurerCodeOutputList(
      int _index, String _value) {
    _nonePackageInsurerCodeOutputList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerShortNameOutputList = [];
  List<String> get nonePackageInsurerShortNameOutputList =>
      _nonePackageInsurerShortNameOutputList;
  set nonePackageInsurerShortNameOutputList(List<String> _value) {
    _nonePackageInsurerShortNameOutputList = _value;
  }

  void addToNonePackageInsurerShortNameOutputList(String _value) {
    _nonePackageInsurerShortNameOutputList.add(_value);
  }

  void removeFromNonePackageInsurerShortNameOutputList(String _value) {
    _nonePackageInsurerShortNameOutputList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameOutputList(int _index) {
    _nonePackageInsurerShortNameOutputList.removeAt(_index);
  }

  void updateNonePackageInsurerShortNameOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerShortNameOutputList[_index] =
        updateFn(_nonePackageInsurerShortNameOutputList[_index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameOutputList(
      int _index, String _value) {
    _nonePackageInsurerShortNameOutputList.insert(_index, _value);
  }

  List<String> _nonePackageInsurerNameOutputList = [];
  List<String> get nonePackageInsurerNameOutputList =>
      _nonePackageInsurerNameOutputList;
  set nonePackageInsurerNameOutputList(List<String> _value) {
    _nonePackageInsurerNameOutputList = _value;
  }

  void addToNonePackageInsurerNameOutputList(String _value) {
    _nonePackageInsurerNameOutputList.add(_value);
  }

  void removeFromNonePackageInsurerNameOutputList(String _value) {
    _nonePackageInsurerNameOutputList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerNameOutputList(int _index) {
    _nonePackageInsurerNameOutputList.removeAt(_index);
  }

  void updateNonePackageInsurerNameOutputListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerNameOutputList[_index] =
        updateFn(_nonePackageInsurerNameOutputList[_index]);
  }

  void insertAtIndexInNonePackageInsurerNameOutputList(
      int _index, String _value) {
    _nonePackageInsurerNameOutputList.insert(_index, _value);
  }

  bool _addAddressCallAPI = false;
  bool get addAddressCallAPI => _addAddressCallAPI;
  set addAddressCallAPI(bool _value) {
    _addAddressCallAPI = _value;
  }

  List<String> _addAddressProvinceId = [];
  List<String> get addAddressProvinceId => _addAddressProvinceId;
  set addAddressProvinceId(List<String> _value) {
    _addAddressProvinceId = _value;
  }

  void addToAddAddressProvinceId(String _value) {
    _addAddressProvinceId.add(_value);
  }

  void removeFromAddAddressProvinceId(String _value) {
    _addAddressProvinceId.remove(_value);
  }

  void removeAtIndexFromAddAddressProvinceId(int _index) {
    _addAddressProvinceId.removeAt(_index);
  }

  void updateAddAddressProvinceIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressProvinceId[_index] = updateFn(_addAddressProvinceId[_index]);
  }

  void insertAtIndexInAddAddressProvinceId(int _index, String _value) {
    _addAddressProvinceId.insert(_index, _value);
  }

  List<String> _addAddressProvinceName = [];
  List<String> get addAddressProvinceName => _addAddressProvinceName;
  set addAddressProvinceName(List<String> _value) {
    _addAddressProvinceName = _value;
  }

  void addToAddAddressProvinceName(String _value) {
    _addAddressProvinceName.add(_value);
  }

  void removeFromAddAddressProvinceName(String _value) {
    _addAddressProvinceName.remove(_value);
  }

  void removeAtIndexFromAddAddressProvinceName(int _index) {
    _addAddressProvinceName.removeAt(_index);
  }

  void updateAddAddressProvinceNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressProvinceName[_index] = updateFn(_addAddressProvinceName[_index]);
  }

  void insertAtIndexInAddAddressProvinceName(int _index, String _value) {
    _addAddressProvinceName.insert(_index, _value);
  }

  List<String> _addAddressDistrictName = [];
  List<String> get addAddressDistrictName => _addAddressDistrictName;
  set addAddressDistrictName(List<String> _value) {
    _addAddressDistrictName = _value;
  }

  void addToAddAddressDistrictName(String _value) {
    _addAddressDistrictName.add(_value);
  }

  void removeFromAddAddressDistrictName(String _value) {
    _addAddressDistrictName.remove(_value);
  }

  void removeAtIndexFromAddAddressDistrictName(int _index) {
    _addAddressDistrictName.removeAt(_index);
  }

  void updateAddAddressDistrictNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressDistrictName[_index] = updateFn(_addAddressDistrictName[_index]);
  }

  void insertAtIndexInAddAddressDistrictName(int _index, String _value) {
    _addAddressDistrictName.insert(_index, _value);
  }

  List<String> _addAddressSubdistrictName = [];
  List<String> get addAddressSubdistrictName => _addAddressSubdistrictName;
  set addAddressSubdistrictName(List<String> _value) {
    _addAddressSubdistrictName = _value;
  }

  void addToAddAddressSubdistrictName(String _value) {
    _addAddressSubdistrictName.add(_value);
  }

  void removeFromAddAddressSubdistrictName(String _value) {
    _addAddressSubdistrictName.remove(_value);
  }

  void removeAtIndexFromAddAddressSubdistrictName(int _index) {
    _addAddressSubdistrictName.removeAt(_index);
  }

  void updateAddAddressSubdistrictNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressSubdistrictName[_index] =
        updateFn(_addAddressSubdistrictName[_index]);
  }

  void insertAtIndexInAddAddressSubdistrictName(int _index, String _value) {
    _addAddressSubdistrictName.insert(_index, _value);
  }

  List<String> _addAddressZipCode = [];
  List<String> get addAddressZipCode => _addAddressZipCode;
  set addAddressZipCode(List<String> _value) {
    _addAddressZipCode = _value;
  }

  void addToAddAddressZipCode(String _value) {
    _addAddressZipCode.add(_value);
  }

  void removeFromAddAddressZipCode(String _value) {
    _addAddressZipCode.remove(_value);
  }

  void removeAtIndexFromAddAddressZipCode(int _index) {
    _addAddressZipCode.removeAt(_index);
  }

  void updateAddAddressZipCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressZipCode[_index] = updateFn(_addAddressZipCode[_index]);
  }

  void insertAtIndexInAddAddressZipCode(int _index, String _value) {
    _addAddressZipCode.insert(_index, _value);
  }

  List<String> _addAddressKeyWord = [];
  List<String> get addAddressKeyWord => _addAddressKeyWord;
  set addAddressKeyWord(List<String> _value) {
    _addAddressKeyWord = _value;
  }

  void addToAddAddressKeyWord(String _value) {
    _addAddressKeyWord.add(_value);
  }

  void removeFromAddAddressKeyWord(String _value) {
    _addAddressKeyWord.remove(_value);
  }

  void removeAtIndexFromAddAddressKeyWord(int _index) {
    _addAddressKeyWord.removeAt(_index);
  }

  void updateAddAddressKeyWordAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressKeyWord[_index] = updateFn(_addAddressKeyWord[_index]);
  }

  void insertAtIndexInAddAddressKeyWord(int _index, String _value) {
    _addAddressKeyWord.insert(_index, _value);
  }

  List<int> _addAddressDistrictId = [];
  List<int> get addAddressDistrictId => _addAddressDistrictId;
  set addAddressDistrictId(List<int> _value) {
    _addAddressDistrictId = _value;
  }

  void addToAddAddressDistrictId(int _value) {
    _addAddressDistrictId.add(_value);
  }

  void removeFromAddAddressDistrictId(int _value) {
    _addAddressDistrictId.remove(_value);
  }

  void removeAtIndexFromAddAddressDistrictId(int _index) {
    _addAddressDistrictId.removeAt(_index);
  }

  void updateAddAddressDistrictIdAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _addAddressDistrictId[_index] = updateFn(_addAddressDistrictId[_index]);
  }

  void insertAtIndexInAddAddressDistrictId(int _index, int _value) {
    _addAddressDistrictId.insert(_index, _value);
  }

  List<int> _addAddressSubdistrictId = [];
  List<int> get addAddressSubdistrictId => _addAddressSubdistrictId;
  set addAddressSubdistrictId(List<int> _value) {
    _addAddressSubdistrictId = _value;
  }

  void addToAddAddressSubdistrictId(int _value) {
    _addAddressSubdistrictId.add(_value);
  }

  void removeFromAddAddressSubdistrictId(int _value) {
    _addAddressSubdistrictId.remove(_value);
  }

  void removeAtIndexFromAddAddressSubdistrictId(int _index) {
    _addAddressSubdistrictId.removeAt(_index);
  }

  void updateAddAddressSubdistrictIdAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _addAddressSubdistrictId[_index] =
        updateFn(_addAddressSubdistrictId[_index]);
  }

  void insertAtIndexInAddAddressSubdistrictId(int _index, int _value) {
    _addAddressSubdistrictId.insert(_index, _value);
  }

  List<bool> _nonePackageReason = [false, false, false];
  List<bool> get nonePackageReason => _nonePackageReason;
  set nonePackageReason(List<bool> _value) {
    _nonePackageReason = _value;
  }

  void addToNonePackageReason(bool _value) {
    _nonePackageReason.add(_value);
  }

  void removeFromNonePackageReason(bool _value) {
    _nonePackageReason.remove(_value);
  }

  void removeAtIndexFromNonePackageReason(int _index) {
    _nonePackageReason.removeAt(_index);
  }

  void updateNonePackageReasonAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _nonePackageReason[_index] = updateFn(_nonePackageReason[_index]);
  }

  void insertAtIndexInNonePackageReason(int _index, bool _value) {
    _nonePackageReason.insert(_index, _value);
  }

  String _addAddressSelectProvinceId = '';
  String get addAddressSelectProvinceId => _addAddressSelectProvinceId;
  set addAddressSelectProvinceId(String _value) {
    _addAddressSelectProvinceId = _value;
  }

  String _addAddressSelectProvinceName = '';
  String get addAddressSelectProvinceName => _addAddressSelectProvinceName;
  set addAddressSelectProvinceName(String _value) {
    _addAddressSelectProvinceName = _value;
  }

  String _addAddressSelectDistrictId = '';
  String get addAddressSelectDistrictId => _addAddressSelectDistrictId;
  set addAddressSelectDistrictId(String _value) {
    _addAddressSelectDistrictId = _value;
  }

  String _addAddressSelectDistrictName = '';
  String get addAddressSelectDistrictName => _addAddressSelectDistrictName;
  set addAddressSelectDistrictName(String _value) {
    _addAddressSelectDistrictName = _value;
  }

  String _addAddressSelectSubdistrictId = '';
  String get addAddressSelectSubdistrictId => _addAddressSelectSubdistrictId;
  set addAddressSelectSubdistrictId(String _value) {
    _addAddressSelectSubdistrictId = _value;
  }

  String _addAddressSelectSubdistrictName = '';
  String get addAddressSelectSubdistrictName =>
      _addAddressSelectSubdistrictName;
  set addAddressSelectSubdistrictName(String _value) {
    _addAddressSelectSubdistrictName = _value;
  }

  String _addAddressSelectZipCode = '';
  String get addAddressSelectZipCode => _addAddressSelectZipCode;
  set addAddressSelectZipCode(String _value) {
    _addAddressSelectZipCode = _value;
  }

  String _addAddressSelectKeyWord = '';
  String get addAddressSelectKeyWord => _addAddressSelectKeyWord;
  set addAddressSelectKeyWord(String _value) {
    _addAddressSelectKeyWord = _value;
  }

  List<bool> _nonePackageInsurerSelectedList = [];
  List<bool> get nonePackageInsurerSelectedList =>
      _nonePackageInsurerSelectedList;
  set nonePackageInsurerSelectedList(List<bool> _value) {
    _nonePackageInsurerSelectedList = _value;
  }

  void addToNonePackageInsurerSelectedList(bool _value) {
    _nonePackageInsurerSelectedList.add(_value);
  }

  void removeFromNonePackageInsurerSelectedList(bool _value) {
    _nonePackageInsurerSelectedList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerSelectedList(int _index) {
    _nonePackageInsurerSelectedList.removeAt(_index);
  }

  void updateNonePackageInsurerSelectedListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _nonePackageInsurerSelectedList[_index] =
        updateFn(_nonePackageInsurerSelectedList[_index]);
  }

  void insertAtIndexInNonePackageInsurerSelectedList(int _index, bool _value) {
    _nonePackageInsurerSelectedList.insert(_index, _value);
  }

  List<String> _addAddressLicenseEmployeeId = [];
  List<String> get addAddressLicenseEmployeeId => _addAddressLicenseEmployeeId;
  set addAddressLicenseEmployeeId(List<String> _value) {
    _addAddressLicenseEmployeeId = _value;
  }

  void addToAddAddressLicenseEmployeeId(String _value) {
    _addAddressLicenseEmployeeId.add(_value);
  }

  void removeFromAddAddressLicenseEmployeeId(String _value) {
    _addAddressLicenseEmployeeId.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseEmployeeId(int _index) {
    _addAddressLicenseEmployeeId.removeAt(_index);
  }

  void updateAddAddressLicenseEmployeeIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseEmployeeId[_index] =
        updateFn(_addAddressLicenseEmployeeId[_index]);
  }

  void insertAtIndexInAddAddressLicenseEmployeeId(int _index, String _value) {
    _addAddressLicenseEmployeeId.insert(_index, _value);
  }

  List<String> _addAddressLicenseTitle = [];
  List<String> get addAddressLicenseTitle => _addAddressLicenseTitle;
  set addAddressLicenseTitle(List<String> _value) {
    _addAddressLicenseTitle = _value;
  }

  void addToAddAddressLicenseTitle(String _value) {
    _addAddressLicenseTitle.add(_value);
  }

  void removeFromAddAddressLicenseTitle(String _value) {
    _addAddressLicenseTitle.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseTitle(int _index) {
    _addAddressLicenseTitle.removeAt(_index);
  }

  void updateAddAddressLicenseTitleAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseTitle[_index] = updateFn(_addAddressLicenseTitle[_index]);
  }

  void insertAtIndexInAddAddressLicenseTitle(int _index, String _value) {
    _addAddressLicenseTitle.insert(_index, _value);
  }

  List<String> _addAddressLicenseFirstName = [];
  List<String> get addAddressLicenseFirstName => _addAddressLicenseFirstName;
  set addAddressLicenseFirstName(List<String> _value) {
    _addAddressLicenseFirstName = _value;
  }

  void addToAddAddressLicenseFirstName(String _value) {
    _addAddressLicenseFirstName.add(_value);
  }

  void removeFromAddAddressLicenseFirstName(String _value) {
    _addAddressLicenseFirstName.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseFirstName(int _index) {
    _addAddressLicenseFirstName.removeAt(_index);
  }

  void updateAddAddressLicenseFirstNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseFirstName[_index] =
        updateFn(_addAddressLicenseFirstName[_index]);
  }

  void insertAtIndexInAddAddressLicenseFirstName(int _index, String _value) {
    _addAddressLicenseFirstName.insert(_index, _value);
  }

  List<String> _addAddressLicenseLastName = [];
  List<String> get addAddressLicenseLastName => _addAddressLicenseLastName;
  set addAddressLicenseLastName(List<String> _value) {
    _addAddressLicenseLastName = _value;
  }

  void addToAddAddressLicenseLastName(String _value) {
    _addAddressLicenseLastName.add(_value);
  }

  void removeFromAddAddressLicenseLastName(String _value) {
    _addAddressLicenseLastName.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseLastName(int _index) {
    _addAddressLicenseLastName.removeAt(_index);
  }

  void updateAddAddressLicenseLastNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseLastName[_index] =
        updateFn(_addAddressLicenseLastName[_index]);
  }

  void insertAtIndexInAddAddressLicenseLastName(int _index, String _value) {
    _addAddressLicenseLastName.insert(_index, _value);
  }

  List<String> _addAddressLicenseLicenseId = [];
  List<String> get addAddressLicenseLicenseId => _addAddressLicenseLicenseId;
  set addAddressLicenseLicenseId(List<String> _value) {
    _addAddressLicenseLicenseId = _value;
  }

  void addToAddAddressLicenseLicenseId(String _value) {
    _addAddressLicenseLicenseId.add(_value);
  }

  void removeFromAddAddressLicenseLicenseId(String _value) {
    _addAddressLicenseLicenseId.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseLicenseId(int _index) {
    _addAddressLicenseLicenseId.removeAt(_index);
  }

  void updateAddAddressLicenseLicenseIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseLicenseId[_index] =
        updateFn(_addAddressLicenseLicenseId[_index]);
  }

  void insertAtIndexInAddAddressLicenseLicenseId(int _index, String _value) {
    _addAddressLicenseLicenseId.insert(_index, _value);
  }

  List<String> _addAddressLicenseExpiredDate = [];
  List<String> get addAddressLicenseExpiredDate =>
      _addAddressLicenseExpiredDate;
  set addAddressLicenseExpiredDate(List<String> _value) {
    _addAddressLicenseExpiredDate = _value;
  }

  void addToAddAddressLicenseExpiredDate(String _value) {
    _addAddressLicenseExpiredDate.add(_value);
  }

  void removeFromAddAddressLicenseExpiredDate(String _value) {
    _addAddressLicenseExpiredDate.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseExpiredDate(int _index) {
    _addAddressLicenseExpiredDate.removeAt(_index);
  }

  void updateAddAddressLicenseExpiredDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseExpiredDate[_index] =
        updateFn(_addAddressLicenseExpiredDate[_index]);
  }

  void insertAtIndexInAddAddressLicenseExpiredDate(int _index, String _value) {
    _addAddressLicenseExpiredDate.insert(_index, _value);
  }

  List<String> _addAddressLicenseMobilePhone = [];
  List<String> get addAddressLicenseMobilePhone =>
      _addAddressLicenseMobilePhone;
  set addAddressLicenseMobilePhone(List<String> _value) {
    _addAddressLicenseMobilePhone = _value;
  }

  void addToAddAddressLicenseMobilePhone(String _value) {
    _addAddressLicenseMobilePhone.add(_value);
  }

  void removeFromAddAddressLicenseMobilePhone(String _value) {
    _addAddressLicenseMobilePhone.remove(_value);
  }

  void removeAtIndexFromAddAddressLicenseMobilePhone(int _index) {
    _addAddressLicenseMobilePhone.removeAt(_index);
  }

  void updateAddAddressLicenseMobilePhoneAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addAddressLicenseMobilePhone[_index] =
        updateFn(_addAddressLicenseMobilePhone[_index]);
  }

  void insertAtIndexInAddAddressLicenseMobilePhone(int _index, String _value) {
    _addAddressLicenseMobilePhone.insert(_index, _value);
  }

  String _insuranceInfoLicenseEmployeeId = '';
  String get insuranceInfoLicenseEmployeeId => _insuranceInfoLicenseEmployeeId;
  set insuranceInfoLicenseEmployeeId(String _value) {
    _insuranceInfoLicenseEmployeeId = _value;
  }

  String _insuranceInfoLicenseTitle = '';
  String get insuranceInfoLicenseTitle => _insuranceInfoLicenseTitle;
  set insuranceInfoLicenseTitle(String _value) {
    _insuranceInfoLicenseTitle = _value;
  }

  String _insuranceInfoLicenseFirstName = '';
  String get insuranceInfoLicenseFirstName => _insuranceInfoLicenseFirstName;
  set insuranceInfoLicenseFirstName(String _value) {
    _insuranceInfoLicenseFirstName = _value;
  }

  String _insuranceInfoLicenseLastName = '';
  String get insuranceInfoLicenseLastName => _insuranceInfoLicenseLastName;
  set insuranceInfoLicenseLastName(String _value) {
    _insuranceInfoLicenseLastName = _value;
  }

  String _insuranceInfoLicenseLicenseId = '';
  String get insuranceInfoLicenseLicenseId => _insuranceInfoLicenseLicenseId;
  set insuranceInfoLicenseLicenseId(String _value) {
    _insuranceInfoLicenseLicenseId = _value;
  }

  String _insuranceInfoLicenseExpiredDate = '';
  String get insuranceInfoLicenseExpiredDate =>
      _insuranceInfoLicenseExpiredDate;
  set insuranceInfoLicenseExpiredDate(String _value) {
    _insuranceInfoLicenseExpiredDate = _value;
  }

  String _insuranceInfoLicenseMobilePhone = '';
  String get insuranceInfoLicenseMobilePhone =>
      _insuranceInfoLicenseMobilePhone;
  set insuranceInfoLicenseMobilePhone(String _value) {
    _insuranceInfoLicenseMobilePhone = _value;
  }

  String _insuranceInfoLicenseImg = '';
  String get insuranceInfoLicenseImg => _insuranceInfoLicenseImg;
  set insuranceInfoLicenseImg(String _value) {
    _insuranceInfoLicenseImg = _value;
  }

  String _nonePackageCoverTypeId = '';
  String get nonePackageCoverTypeId => _nonePackageCoverTypeId;
  set nonePackageCoverTypeId(String _value) {
    _nonePackageCoverTypeId = _value;
  }

  String _nonePackageCoverTypeCode = '';
  String get nonePackageCoverTypeCode => _nonePackageCoverTypeCode;
  set nonePackageCoverTypeCode(String _value) {
    _nonePackageCoverTypeCode = _value;
  }

  String _nonePackageCoverTypeName = 'กรุณาเลือกประเภทชั้นประกัน';
  String get nonePackageCoverTypeName => _nonePackageCoverTypeName;
  set nonePackageCoverTypeName(String _value) {
    _nonePackageCoverTypeName = _value;
  }

  String _nonePackageGarageTypeId = '';
  String get nonePackageGarageTypeId => _nonePackageGarageTypeId;
  set nonePackageGarageTypeId(String _value) {
    _nonePackageGarageTypeId = _value;
  }

  String _nonePackageGarageTypeName = 'กรุณาเลือกประเภทการซ่อม';
  String get nonePackageGarageTypeName => _nonePackageGarageTypeName;
  set nonePackageGarageTypeName(String _value) {
    _nonePackageGarageTypeName = _value;
  }

  String _insuranceInfoActOflLegislation = '';
  String get insuranceInfoActOflLegislation => _insuranceInfoActOflLegislation;
  set insuranceInfoActOflLegislation(String _value) {
    _insuranceInfoActOflLegislation = _value;
  }

  String _addAdressSelectDocProvinceId = '';
  String get addAdressSelectDocProvinceId => _addAdressSelectDocProvinceId;
  set addAdressSelectDocProvinceId(String _value) {
    _addAdressSelectDocProvinceId = _value;
  }

  String _addAdressSelectDocProvinceName = '';
  String get addAdressSelectDocProvinceName => _addAdressSelectDocProvinceName;
  set addAdressSelectDocProvinceName(String _value) {
    _addAdressSelectDocProvinceName = _value;
  }

  String _addAdressSelectDocDistrictName = '';
  String get addAdressSelectDocDistrictName => _addAdressSelectDocDistrictName;
  set addAdressSelectDocDistrictName(String _value) {
    _addAdressSelectDocDistrictName = _value;
  }

  String _addAddressSelectDocDistrictId = '';
  String get addAddressSelectDocDistrictId => _addAddressSelectDocDistrictId;
  set addAddressSelectDocDistrictId(String _value) {
    _addAddressSelectDocDistrictId = _value;
  }

  String _addAddressSelectDocSubdistrictId = '';
  String get addAddressSelectDocSubdistrictId =>
      _addAddressSelectDocSubdistrictId;
  set addAddressSelectDocSubdistrictId(String _value) {
    _addAddressSelectDocSubdistrictId = _value;
  }

  String _addAddressSelectDocSubdistrictName = '';
  String get addAddressSelectDocSubdistrictName =>
      _addAddressSelectDocSubdistrictName;
  set addAddressSelectDocSubdistrictName(String _value) {
    _addAddressSelectDocSubdistrictName = _value;
  }

  String _addAddressSelectDocZipCode = '';
  String get addAddressSelectDocZipCode => _addAddressSelectDocZipCode;
  set addAddressSelectDocZipCode(String _value) {
    _addAddressSelectDocZipCode = _value;
  }

  String _addAddressSelectDocKeyWord = '';
  String get addAddressSelectDocKeyWord => _addAddressSelectDocKeyWord;
  set addAddressSelectDocKeyWord(String _value) {
    _addAddressSelectDocKeyWord = _value;
  }

  String _nonePackageGarageTypeCode = '';
  String get nonePackageGarageTypeCode => _nonePackageGarageTypeCode;
  set nonePackageGarageTypeCode(String _value) {
    _nonePackageGarageTypeCode = _value;
  }

  List<String> _nonePackageGarageTypeCodeList = ['COMPANY', 'DEALER'];
  List<String> get nonePackageGarageTypeCodeList =>
      _nonePackageGarageTypeCodeList;
  set nonePackageGarageTypeCodeList(List<String> _value) {
    _nonePackageGarageTypeCodeList = _value;
  }

  void addToNonePackageGarageTypeCodeList(String _value) {
    _nonePackageGarageTypeCodeList.add(_value);
  }

  void removeFromNonePackageGarageTypeCodeList(String _value) {
    _nonePackageGarageTypeCodeList.remove(_value);
  }

  void removeAtIndexFromNonePackageGarageTypeCodeList(int _index) {
    _nonePackageGarageTypeCodeList.removeAt(_index);
  }

  void updateNonePackageGarageTypeCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageGarageTypeCodeList[_index] =
        updateFn(_nonePackageGarageTypeCodeList[_index]);
  }

  void insertAtIndexInNonePackageGarageTypeCodeList(int _index, String _value) {
    _nonePackageGarageTypeCodeList.insert(_index, _value);
  }

  String _apiUrlInsuranceAppState = 'api_url_insurance';
  String get apiUrlInsuranceAppState => _apiUrlInsuranceAppState;
  set apiUrlInsuranceAppState(String _value) {
    _apiUrlInsuranceAppState = _value;
    secureStorage.setString('ff_apiUrlInsuranceAppState', _value);
  }

  void deleteApiUrlInsuranceAppState() {
    secureStorage.delete(key: 'ff_apiUrlInsuranceAppState');
  }

  bool _nonePackageFlagRenew = false;
  bool get nonePackageFlagRenew => _nonePackageFlagRenew;
  set nonePackageFlagRenew(bool _value) {
    _nonePackageFlagRenew = _value;
  }

  String _nonePackageOldVmiExpDate = 'กรุณาเลือกวันที่หมดอายุประกันเดิม';
  String get nonePackageOldVmiExpDate => _nonePackageOldVmiExpDate;
  set nonePackageOldVmiExpDate(String _value) {
    _nonePackageOldVmiExpDate = _value;
  }

  String _nonePackageOldVmi = '';
  String get nonePackageOldVmi => _nonePackageOldVmi;
  set nonePackageOldVmi(String _value) {
    _nonePackageOldVmi = _value;
  }

  String _nonePackageOldVmiImageUrl = '';
  String get nonePackageOldVmiImageUrl => _nonePackageOldVmiImageUrl;
  set nonePackageOldVmiImageUrl(String _value) {
    _nonePackageOldVmiImageUrl = _value;
  }

  String _nonePackageIdCardImageUrl = '';
  String get nonePackageIdCardImageUrl => _nonePackageIdCardImageUrl;
  set nonePackageIdCardImageUrl(String _value) {
    _nonePackageIdCardImageUrl = _value;
  }

  List<String> _nonePackageRenewImageUrlList = [];
  List<String> get nonePackageRenewImageUrlList =>
      _nonePackageRenewImageUrlList;
  set nonePackageRenewImageUrlList(List<String> _value) {
    _nonePackageRenewImageUrlList = _value;
  }

  void addToNonePackageRenewImageUrlList(String _value) {
    _nonePackageRenewImageUrlList.add(_value);
  }

  void removeFromNonePackageRenewImageUrlList(String _value) {
    _nonePackageRenewImageUrlList.remove(_value);
  }

  void removeAtIndexFromNonePackageRenewImageUrlList(int _index) {
    _nonePackageRenewImageUrlList.removeAt(_index);
  }

  void updateNonePackageRenewImageUrlListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageRenewImageUrlList[_index] =
        updateFn(_nonePackageRenewImageUrlList[_index]);
  }

  void insertAtIndexInNonePackageRenewImageUrlList(int _index, String _value) {
    _nonePackageRenewImageUrlList.insert(_index, _value);
  }

  List<bool> _nonePackageRenewImageCheckList = [];
  List<bool> get nonePackageRenewImageCheckList =>
      _nonePackageRenewImageCheckList;
  set nonePackageRenewImageCheckList(List<bool> _value) {
    _nonePackageRenewImageCheckList = _value;
  }

  void addToNonePackageRenewImageCheckList(bool _value) {
    _nonePackageRenewImageCheckList.add(_value);
  }

  void removeFromNonePackageRenewImageCheckList(bool _value) {
    _nonePackageRenewImageCheckList.remove(_value);
  }

  void removeAtIndexFromNonePackageRenewImageCheckList(int _index) {
    _nonePackageRenewImageCheckList.removeAt(_index);
  }

  void updateNonePackageRenewImageCheckListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _nonePackageRenewImageCheckList[_index] =
        updateFn(_nonePackageRenewImageCheckList[_index]);
  }

  void insertAtIndexInNonePackageRenewImageCheckList(int _index, bool _value) {
    _nonePackageRenewImageCheckList.insert(_index, _value);
  }

  List<String> _insuranceInfoUploadImgOther = [];
  List<String> get insuranceInfoUploadImgOther => _insuranceInfoUploadImgOther;
  set insuranceInfoUploadImgOther(List<String> _value) {
    _insuranceInfoUploadImgOther = _value;
  }

  void addToInsuranceInfoUploadImgOther(String _value) {
    _insuranceInfoUploadImgOther.add(_value);
  }

  void removeFromInsuranceInfoUploadImgOther(String _value) {
    _insuranceInfoUploadImgOther.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgOther(int _index) {
    _insuranceInfoUploadImgOther.removeAt(_index);
  }

  void updateInsuranceInfoUploadImgOtherAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoUploadImgOther[_index] =
        updateFn(_insuranceInfoUploadImgOther[_index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgOther(int _index, String _value) {
    _insuranceInfoUploadImgOther.insert(_index, _value);
  }

  bool _nonePackageOldVmiImageUploadedCheck = false;
  bool get nonePackageOldVmiImageUploadedCheck =>
      _nonePackageOldVmiImageUploadedCheck;
  set nonePackageOldVmiImageUploadedCheck(bool _value) {
    _nonePackageOldVmiImageUploadedCheck = _value;
  }

  bool _nonePackageIdCardWatermarkUploadedCheck = false;
  bool get nonePackageIdCardWatermarkUploadedCheck =>
      _nonePackageIdCardWatermarkUploadedCheck;
  set nonePackageIdCardWatermarkUploadedCheck(bool _value) {
    _nonePackageIdCardWatermarkUploadedCheck = _value;
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
  set insuranceInfoCheckUploadImgBoolList(List<bool> _value) {
    _insuranceInfoCheckUploadImgBoolList = _value;
  }

  void addToInsuranceInfoCheckUploadImgBoolList(bool _value) {
    _insuranceInfoCheckUploadImgBoolList.add(_value);
  }

  void removeFromInsuranceInfoCheckUploadImgBoolList(bool _value) {
    _insuranceInfoCheckUploadImgBoolList.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoCheckUploadImgBoolList(int _index) {
    _insuranceInfoCheckUploadImgBoolList.removeAt(_index);
  }

  void updateInsuranceInfoCheckUploadImgBoolListAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _insuranceInfoCheckUploadImgBoolList[_index] =
        updateFn(_insuranceInfoCheckUploadImgBoolList[_index]);
  }

  void insertAtIndexInInsuranceInfoCheckUploadImgBoolList(
      int _index, bool _value) {
    _insuranceInfoCheckUploadImgBoolList.insert(_index, _value);
  }

  List<String> _insuranceInfoUploadImgAccessory = [];
  List<String> get insuranceInfoUploadImgAccessory =>
      _insuranceInfoUploadImgAccessory;
  set insuranceInfoUploadImgAccessory(List<String> _value) {
    _insuranceInfoUploadImgAccessory = _value;
  }

  void addToInsuranceInfoUploadImgAccessory(String _value) {
    _insuranceInfoUploadImgAccessory.add(_value);
  }

  void removeFromInsuranceInfoUploadImgAccessory(String _value) {
    _insuranceInfoUploadImgAccessory.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgAccessory(int _index) {
    _insuranceInfoUploadImgAccessory.removeAt(_index);
  }

  void updateInsuranceInfoUploadImgAccessoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoUploadImgAccessory[_index] =
        updateFn(_insuranceInfoUploadImgAccessory[_index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgAccessory(
      int _index, String _value) {
    _insuranceInfoUploadImgAccessory.insert(_index, _value);
  }

  List<String> _insuranceInfoUploadImgScar = [];
  List<String> get insuranceInfoUploadImgScar => _insuranceInfoUploadImgScar;
  set insuranceInfoUploadImgScar(List<String> _value) {
    _insuranceInfoUploadImgScar = _value;
  }

  void addToInsuranceInfoUploadImgScar(String _value) {
    _insuranceInfoUploadImgScar.add(_value);
  }

  void removeFromInsuranceInfoUploadImgScar(String _value) {
    _insuranceInfoUploadImgScar.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoUploadImgScar(int _index) {
    _insuranceInfoUploadImgScar.removeAt(_index);
  }

  void updateInsuranceInfoUploadImgScarAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoUploadImgScar[_index] =
        updateFn(_insuranceInfoUploadImgScar[_index]);
  }

  void insertAtIndexInInsuranceInfoUploadImgScar(int _index, String _value) {
    _insuranceInfoUploadImgScar.insert(_index, _value);
  }

  List<bool> _searchPackageCheckFilled = [false, false, false, false, false];
  List<bool> get searchPackageCheckFilled => _searchPackageCheckFilled;
  set searchPackageCheckFilled(List<bool> _value) {
    _searchPackageCheckFilled = _value;
  }

  void addToSearchPackageCheckFilled(bool _value) {
    _searchPackageCheckFilled.add(_value);
  }

  void removeFromSearchPackageCheckFilled(bool _value) {
    _searchPackageCheckFilled.remove(_value);
  }

  void removeAtIndexFromSearchPackageCheckFilled(int _index) {
    _searchPackageCheckFilled.removeAt(_index);
  }

  void updateSearchPackageCheckFilledAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _searchPackageCheckFilled[_index] =
        updateFn(_searchPackageCheckFilled[_index]);
  }

  void insertAtIndexInSearchPackageCheckFilled(int _index, bool _value) {
    _searchPackageCheckFilled.insert(_index, _value);
  }

  List<String> _nonePackageUsedTypeIdList = [];
  List<String> get nonePackageUsedTypeIdList => _nonePackageUsedTypeIdList;
  set nonePackageUsedTypeIdList(List<String> _value) {
    _nonePackageUsedTypeIdList = _value;
  }

  void addToNonePackageUsedTypeIdList(String _value) {
    _nonePackageUsedTypeIdList.add(_value);
  }

  void removeFromNonePackageUsedTypeIdList(String _value) {
    _nonePackageUsedTypeIdList.remove(_value);
  }

  void removeAtIndexFromNonePackageUsedTypeIdList(int _index) {
    _nonePackageUsedTypeIdList.removeAt(_index);
  }

  void updateNonePackageUsedTypeIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageUsedTypeIdList[_index] =
        updateFn(_nonePackageUsedTypeIdList[_index]);
  }

  void insertAtIndexInNonePackageUsedTypeIdList(int _index, String _value) {
    _nonePackageUsedTypeIdList.insert(_index, _value);
  }

  List<String> _nonePackageUsedTypeCodeList = [];
  List<String> get nonePackageUsedTypeCodeList => _nonePackageUsedTypeCodeList;
  set nonePackageUsedTypeCodeList(List<String> _value) {
    _nonePackageUsedTypeCodeList = _value;
  }

  void addToNonePackageUsedTypeCodeList(String _value) {
    _nonePackageUsedTypeCodeList.add(_value);
  }

  void removeFromNonePackageUsedTypeCodeList(String _value) {
    _nonePackageUsedTypeCodeList.remove(_value);
  }

  void removeAtIndexFromNonePackageUsedTypeCodeList(int _index) {
    _nonePackageUsedTypeCodeList.removeAt(_index);
  }

  void updateNonePackageUsedTypeCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageUsedTypeCodeList[_index] =
        updateFn(_nonePackageUsedTypeCodeList[_index]);
  }

  void insertAtIndexInNonePackageUsedTypeCodeList(int _index, String _value) {
    _nonePackageUsedTypeCodeList.insert(_index, _value);
  }

  List<String> _nonePackageUsedTypeNameList = [];
  List<String> get nonePackageUsedTypeNameList => _nonePackageUsedTypeNameList;
  set nonePackageUsedTypeNameList(List<String> _value) {
    _nonePackageUsedTypeNameList = _value;
  }

  void addToNonePackageUsedTypeNameList(String _value) {
    _nonePackageUsedTypeNameList.add(_value);
  }

  void removeFromNonePackageUsedTypeNameList(String _value) {
    _nonePackageUsedTypeNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageUsedTypeNameList(int _index) {
    _nonePackageUsedTypeNameList.removeAt(_index);
  }

  void updateNonePackageUsedTypeNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageUsedTypeNameList[_index] =
        updateFn(_nonePackageUsedTypeNameList[_index]);
  }

  void insertAtIndexInNonePackageUsedTypeNameList(int _index, String _value) {
    _nonePackageUsedTypeNameList.insert(_index, _value);
  }

  List<String> _nonePackageUsedTypeTypeList = [];
  List<String> get nonePackageUsedTypeTypeList => _nonePackageUsedTypeTypeList;
  set nonePackageUsedTypeTypeList(List<String> _value) {
    _nonePackageUsedTypeTypeList = _value;
  }

  void addToNonePackageUsedTypeTypeList(String _value) {
    _nonePackageUsedTypeTypeList.add(_value);
  }

  void removeFromNonePackageUsedTypeTypeList(String _value) {
    _nonePackageUsedTypeTypeList.remove(_value);
  }

  void removeAtIndexFromNonePackageUsedTypeTypeList(int _index) {
    _nonePackageUsedTypeTypeList.removeAt(_index);
  }

  void updateNonePackageUsedTypeTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageUsedTypeTypeList[_index] =
        updateFn(_nonePackageUsedTypeTypeList[_index]);
  }

  void insertAtIndexInNonePackageUsedTypeTypeList(int _index, String _value) {
    _nonePackageUsedTypeTypeList.insert(_index, _value);
  }

  bool _nonePackageIsLoadedData = false;
  bool get nonePackageIsLoadedData => _nonePackageIsLoadedData;
  set nonePackageIsLoadedData(bool _value) {
    _nonePackageIsLoadedData = _value;
  }

  List<String> _searchPackageId = [];
  List<String> get searchPackageId => _searchPackageId;
  set searchPackageId(List<String> _value) {
    _searchPackageId = _value;
  }

  void addToSearchPackageId(String _value) {
    _searchPackageId.add(_value);
  }

  void removeFromSearchPackageId(String _value) {
    _searchPackageId.remove(_value);
  }

  void removeAtIndexFromSearchPackageId(int _index) {
    _searchPackageId.removeAt(_index);
  }

  void updateSearchPackageIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchPackageId[_index] = updateFn(_searchPackageId[_index]);
  }

  void insertAtIndexInSearchPackageId(int _index, String _value) {
    _searchPackageId.insert(_index, _value);
  }

  List<String> _serachPackageName = [];
  List<String> get serachPackageName => _serachPackageName;
  set serachPackageName(List<String> _value) {
    _serachPackageName = _value;
  }

  void addToSerachPackageName(String _value) {
    _serachPackageName.add(_value);
  }

  void removeFromSerachPackageName(String _value) {
    _serachPackageName.remove(_value);
  }

  void removeAtIndexFromSerachPackageName(int _index) {
    _serachPackageName.removeAt(_index);
  }

  void updateSerachPackageNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _serachPackageName[_index] = updateFn(_serachPackageName[_index]);
  }

  void insertAtIndexInSerachPackageName(int _index, String _value) {
    _serachPackageName.insert(_index, _value);
  }

  List<String> _searchStamp = [];
  List<String> get searchStamp => _searchStamp;
  set searchStamp(List<String> _value) {
    _searchStamp = _value;
  }

  void addToSearchStamp(String _value) {
    _searchStamp.add(_value);
  }

  void removeFromSearchStamp(String _value) {
    _searchStamp.remove(_value);
  }

  void removeAtIndexFromSearchStamp(int _index) {
    _searchStamp.removeAt(_index);
  }

  void updateSearchStampAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchStamp[_index] = updateFn(_searchStamp[_index]);
  }

  void insertAtIndexInSearchStamp(int _index, String _value) {
    _searchStamp.insert(_index, _value);
  }

  List<String> _searchVat = [];
  List<String> get searchVat => _searchVat;
  set searchVat(List<String> _value) {
    _searchVat = _value;
  }

  void addToSearchVat(String _value) {
    _searchVat.add(_value);
  }

  void removeFromSearchVat(String _value) {
    _searchVat.remove(_value);
  }

  void removeAtIndexFromSearchVat(int _index) {
    _searchVat.removeAt(_index);
  }

  void updateSearchVatAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchVat[_index] = updateFn(_searchVat[_index]);
  }

  void insertAtIndexInSearchVat(int _index, String _value) {
    _searchVat.insert(_index, _value);
  }

  List<String> _searchNetPremium = [];
  List<String> get searchNetPremium => _searchNetPremium;
  set searchNetPremium(List<String> _value) {
    _searchNetPremium = _value;
  }

  void addToSearchNetPremium(String _value) {
    _searchNetPremium.add(_value);
  }

  void removeFromSearchNetPremium(String _value) {
    _searchNetPremium.remove(_value);
  }

  void removeAtIndexFromSearchNetPremium(int _index) {
    _searchNetPremium.removeAt(_index);
  }

  void updateSearchNetPremiumAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchNetPremium[_index] = updateFn(_searchNetPremium[_index]);
  }

  void insertAtIndexInSearchNetPremium(int _index, String _value) {
    _searchNetPremium.insert(_index, _value);
  }

  List<String> _searchSeat = [];
  List<String> get searchSeat => _searchSeat;
  set searchSeat(List<String> _value) {
    _searchSeat = _value;
  }

  void addToSearchSeat(String _value) {
    _searchSeat.add(_value);
  }

  void removeFromSearchSeat(String _value) {
    _searchSeat.remove(_value);
  }

  void removeAtIndexFromSearchSeat(int _index) {
    _searchSeat.removeAt(_index);
  }

  void updateSearchSeatAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchSeat[_index] = updateFn(_searchSeat[_index]);
  }

  void insertAtIndexInSearchSeat(int _index, String _value) {
    _searchSeat.insert(_index, _value);
  }

  List<String> _searchRoadsideAssistance = [];
  List<String> get searchRoadsideAssistance => _searchRoadsideAssistance;
  set searchRoadsideAssistance(List<String> _value) {
    _searchRoadsideAssistance = _value;
  }

  void addToSearchRoadsideAssistance(String _value) {
    _searchRoadsideAssistance.add(_value);
  }

  void removeFromSearchRoadsideAssistance(String _value) {
    _searchRoadsideAssistance.remove(_value);
  }

  void removeAtIndexFromSearchRoadsideAssistance(int _index) {
    _searchRoadsideAssistance.removeAt(_index);
  }

  void updateSearchRoadsideAssistanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchRoadsideAssistance[_index] =
        updateFn(_searchRoadsideAssistance[_index]);
  }

  void insertAtIndexInSearchRoadsideAssistance(int _index, String _value) {
    _searchRoadsideAssistance.insert(_index, _value);
  }

  List<String> _searchbb = [];
  List<String> get searchbb => _searchbb;
  set searchbb(List<String> _value) {
    _searchbb = _value;
  }

  void addToSearchbb(String _value) {
    _searchbb.add(_value);
  }

  void removeFromSearchbb(String _value) {
    _searchbb.remove(_value);
  }

  void removeAtIndexFromSearchbb(int _index) {
    _searchbb.removeAt(_index);
  }

  void updateSearchbbAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchbb[_index] = updateFn(_searchbb[_index]);
  }

  void insertAtIndexInSearchbb(int _index, String _value) {
    _searchbb.insert(_index, _value);
  }

  List<String> _searchme = [];
  List<String> get searchme => _searchme;
  set searchme(List<String> _value) {
    _searchme = _value;
  }

  void addToSearchme(String _value) {
    _searchme.add(_value);
  }

  void removeFromSearchme(String _value) {
    _searchme.remove(_value);
  }

  void removeAtIndexFromSearchme(int _index) {
    _searchme.removeAt(_index);
  }

  void updateSearchmeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchme[_index] = updateFn(_searchme[_index]);
  }

  void insertAtIndexInSearchme(int _index, String _value) {
    _searchme.insert(_index, _value);
  }

  List<String> _searchFlood = [];
  List<String> get searchFlood => _searchFlood;
  set searchFlood(List<String> _value) {
    _searchFlood = _value;
  }

  void addToSearchFlood(String _value) {
    _searchFlood.add(_value);
  }

  void removeFromSearchFlood(String _value) {
    _searchFlood.remove(_value);
  }

  void removeAtIndexFromSearchFlood(int _index) {
    _searchFlood.removeAt(_index);
  }

  void updateSearchFloodAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchFlood[_index] = updateFn(_searchFlood[_index]);
  }

  void insertAtIndexInSearchFlood(int _index, String _value) {
    _searchFlood.insert(_index, _value);
  }

  List<String> _searchDeductible = [];
  List<String> get searchDeductible => _searchDeductible;
  set searchDeductible(List<String> _value) {
    _searchDeductible = _value;
  }

  void addToSearchDeductible(String _value) {
    _searchDeductible.add(_value);
  }

  void removeFromSearchDeductible(String _value) {
    _searchDeductible.remove(_value);
  }

  void removeAtIndexFromSearchDeductible(int _index) {
    _searchDeductible.removeAt(_index);
  }

  void updateSearchDeductibleAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchDeductible[_index] = updateFn(_searchDeductible[_index]);
  }

  void insertAtIndexInSearchDeductible(int _index, String _value) {
    _searchDeductible.insert(_index, _value);
  }

  List<String> _searchContractProcessstate = [];
  List<String> get searchContractProcessstate => _searchContractProcessstate;
  set searchContractProcessstate(List<String> _value) {
    _searchContractProcessstate = _value;
  }

  void addToSearchContractProcessstate(String _value) {
    _searchContractProcessstate.add(_value);
  }

  void removeFromSearchContractProcessstate(String _value) {
    _searchContractProcessstate.remove(_value);
  }

  void removeAtIndexFromSearchContractProcessstate(int _index) {
    _searchContractProcessstate.removeAt(_index);
  }

  void updateSearchContractProcessstateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchContractProcessstate[_index] =
        updateFn(_searchContractProcessstate[_index]);
  }

  void insertAtIndexInSearchContractProcessstate(int _index, String _value) {
    _searchContractProcessstate.insert(_index, _value);
  }

  List<int> _searchId = [];
  List<int> get searchId => _searchId;
  set searchId(List<int> _value) {
    _searchId = _value;
  }

  void addToSearchId(int _value) {
    _searchId.add(_value);
  }

  void removeFromSearchId(int _value) {
    _searchId.remove(_value);
  }

  void removeAtIndexFromSearchId(int _index) {
    _searchId.removeAt(_index);
  }

  void updateSearchIdAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _searchId[_index] = updateFn(_searchId[_index]);
  }

  void insertAtIndexInSearchId(int _index, int _value) {
    _searchId.insert(_index, _value);
  }

  String _nonePackageCustomerType = '';
  String get nonePackageCustomerType => _nonePackageCustomerType;
  set nonePackageCustomerType(String _value) {
    _nonePackageCustomerType = _value;
  }

  List<String> _insuranceInfoFinance = [];
  List<String> get insuranceInfoFinance => _insuranceInfoFinance;
  set insuranceInfoFinance(List<String> _value) {
    _insuranceInfoFinance = _value;
  }

  void addToInsuranceInfoFinance(String _value) {
    _insuranceInfoFinance.add(_value);
  }

  void removeFromInsuranceInfoFinance(String _value) {
    _insuranceInfoFinance.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoFinance(int _index) {
    _insuranceInfoFinance.removeAt(_index);
  }

  void updateInsuranceInfoFinanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoFinance[_index] = updateFn(_insuranceInfoFinance[_index]);
  }

  void insertAtIndexInInsuranceInfoFinance(int _index, String _value) {
    _insuranceInfoFinance.insert(_index, _value);
  }

  String _insuranceInfoBeneficiaryName = '';
  String get insuranceInfoBeneficiaryName => _insuranceInfoBeneficiaryName;
  set insuranceInfoBeneficiaryName(String _value) {
    _insuranceInfoBeneficiaryName = _value;
  }

  String _nonePackageInsurerDisplayNameOutput = '';
  String get nonePackageInsurerDisplayNameOutput =>
      _nonePackageInsurerDisplayNameOutput;
  set nonePackageInsurerDisplayNameOutput(String _value) {
    _nonePackageInsurerDisplayNameOutput = _value;
  }

  List<dynamic> _nonePackageImageOther = [];
  List<dynamic> get nonePackageImageOther => _nonePackageImageOther;
  set nonePackageImageOther(List<dynamic> _value) {
    _nonePackageImageOther = _value;
  }

  void addToNonePackageImageOther(dynamic _value) {
    _nonePackageImageOther.add(_value);
  }

  void removeFromNonePackageImageOther(dynamic _value) {
    _nonePackageImageOther.remove(_value);
  }

  void removeAtIndexFromNonePackageImageOther(int _index) {
    _nonePackageImageOther.removeAt(_index);
  }

  void updateNonePackageImageOtherAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _nonePackageImageOther[_index] = updateFn(_nonePackageImageOther[_index]);
  }

  void insertAtIndexInNonePackageImageOther(int _index, dynamic _value) {
    _nonePackageImageOther.insert(_index, _value);
  }

  List<String> _nonePackageImageFront = [];
  List<String> get nonePackageImageFront => _nonePackageImageFront;
  set nonePackageImageFront(List<String> _value) {
    _nonePackageImageFront = _value;
  }

  void addToNonePackageImageFront(String _value) {
    _nonePackageImageFront.add(_value);
  }

  void removeFromNonePackageImageFront(String _value) {
    _nonePackageImageFront.remove(_value);
  }

  void removeAtIndexFromNonePackageImageFront(int _index) {
    _nonePackageImageFront.removeAt(_index);
  }

  void updateNonePackageImageFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageFront[_index] = updateFn(_nonePackageImageFront[_index]);
  }

  void insertAtIndexInNonePackageImageFront(int _index, String _value) {
    _nonePackageImageFront.insert(_index, _value);
  }

  List<String> _nonePackageImageRightFront = [];
  List<String> get nonePackageImageRightFront => _nonePackageImageRightFront;
  set nonePackageImageRightFront(List<String> _value) {
    _nonePackageImageRightFront = _value;
  }

  void addToNonePackageImageRightFront(String _value) {
    _nonePackageImageRightFront.add(_value);
  }

  void removeFromNonePackageImageRightFront(String _value) {
    _nonePackageImageRightFront.remove(_value);
  }

  void removeAtIndexFromNonePackageImageRightFront(int _index) {
    _nonePackageImageRightFront.removeAt(_index);
  }

  void updateNonePackageImageRightFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageRightFront[_index] =
        updateFn(_nonePackageImageRightFront[_index]);
  }

  void insertAtIndexInNonePackageImageRightFront(int _index, String _value) {
    _nonePackageImageRightFront.insert(_index, _value);
  }

  List<String> _nonePackageImageRight = [];
  List<String> get nonePackageImageRight => _nonePackageImageRight;
  set nonePackageImageRight(List<String> _value) {
    _nonePackageImageRight = _value;
  }

  void addToNonePackageImageRight(String _value) {
    _nonePackageImageRight.add(_value);
  }

  void removeFromNonePackageImageRight(String _value) {
    _nonePackageImageRight.remove(_value);
  }

  void removeAtIndexFromNonePackageImageRight(int _index) {
    _nonePackageImageRight.removeAt(_index);
  }

  void updateNonePackageImageRightAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageRight[_index] = updateFn(_nonePackageImageRight[_index]);
  }

  void insertAtIndexInNonePackageImageRight(int _index, String _value) {
    _nonePackageImageRight.insert(_index, _value);
  }

  List<String> _nonePackageImageRightRear = [];
  List<String> get nonePackageImageRightRear => _nonePackageImageRightRear;
  set nonePackageImageRightRear(List<String> _value) {
    _nonePackageImageRightRear = _value;
  }

  void addToNonePackageImageRightRear(String _value) {
    _nonePackageImageRightRear.add(_value);
  }

  void removeFromNonePackageImageRightRear(String _value) {
    _nonePackageImageRightRear.remove(_value);
  }

  void removeAtIndexFromNonePackageImageRightRear(int _index) {
    _nonePackageImageRightRear.removeAt(_index);
  }

  void updateNonePackageImageRightRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageRightRear[_index] =
        updateFn(_nonePackageImageRightRear[_index]);
  }

  void insertAtIndexInNonePackageImageRightRear(int _index, String _value) {
    _nonePackageImageRightRear.insert(_index, _value);
  }

  List<String> _nonePackageImageRear = [];
  List<String> get nonePackageImageRear => _nonePackageImageRear;
  set nonePackageImageRear(List<String> _value) {
    _nonePackageImageRear = _value;
  }

  void addToNonePackageImageRear(String _value) {
    _nonePackageImageRear.add(_value);
  }

  void removeFromNonePackageImageRear(String _value) {
    _nonePackageImageRear.remove(_value);
  }

  void removeAtIndexFromNonePackageImageRear(int _index) {
    _nonePackageImageRear.removeAt(_index);
  }

  void updateNonePackageImageRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageRear[_index] = updateFn(_nonePackageImageRear[_index]);
  }

  void insertAtIndexInNonePackageImageRear(int _index, String _value) {
    _nonePackageImageRear.insert(_index, _value);
  }

  List<String> _nonePackageImageLeftRear = [];
  List<String> get nonePackageImageLeftRear => _nonePackageImageLeftRear;
  set nonePackageImageLeftRear(List<String> _value) {
    _nonePackageImageLeftRear = _value;
  }

  void addToNonePackageImageLeftRear(String _value) {
    _nonePackageImageLeftRear.add(_value);
  }

  void removeFromNonePackageImageLeftRear(String _value) {
    _nonePackageImageLeftRear.remove(_value);
  }

  void removeAtIndexFromNonePackageImageLeftRear(int _index) {
    _nonePackageImageLeftRear.removeAt(_index);
  }

  void updateNonePackageImageLeftRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageLeftRear[_index] =
        updateFn(_nonePackageImageLeftRear[_index]);
  }

  void insertAtIndexInNonePackageImageLeftRear(int _index, String _value) {
    _nonePackageImageLeftRear.insert(_index, _value);
  }

  List<String> _nonePackageImageLeft = [];
  List<String> get nonePackageImageLeft => _nonePackageImageLeft;
  set nonePackageImageLeft(List<String> _value) {
    _nonePackageImageLeft = _value;
  }

  void addToNonePackageImageLeft(String _value) {
    _nonePackageImageLeft.add(_value);
  }

  void removeFromNonePackageImageLeft(String _value) {
    _nonePackageImageLeft.remove(_value);
  }

  void removeAtIndexFromNonePackageImageLeft(int _index) {
    _nonePackageImageLeft.removeAt(_index);
  }

  void updateNonePackageImageLeftAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageLeft[_index] = updateFn(_nonePackageImageLeft[_index]);
  }

  void insertAtIndexInNonePackageImageLeft(int _index, String _value) {
    _nonePackageImageLeft.insert(_index, _value);
  }

  List<String> _nonePackageImageLeftFront = [];
  List<String> get nonePackageImageLeftFront => _nonePackageImageLeftFront;
  set nonePackageImageLeftFront(List<String> _value) {
    _nonePackageImageLeftFront = _value;
  }

  void addToNonePackageImageLeftFront(String _value) {
    _nonePackageImageLeftFront.add(_value);
  }

  void removeFromNonePackageImageLeftFront(String _value) {
    _nonePackageImageLeftFront.remove(_value);
  }

  void removeAtIndexFromNonePackageImageLeftFront(int _index) {
    _nonePackageImageLeftFront.removeAt(_index);
  }

  void updateNonePackageImageLeftFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageLeftFront[_index] =
        updateFn(_nonePackageImageLeftFront[_index]);
  }

  void insertAtIndexInNonePackageImageLeftFront(int _index, String _value) {
    _nonePackageImageLeftFront.insert(_index, _value);
  }

  List<String> _nonePackageImageRoof = [];
  List<String> get nonePackageImageRoof => _nonePackageImageRoof;
  set nonePackageImageRoof(List<String> _value) {
    _nonePackageImageRoof = _value;
  }

  void addToNonePackageImageRoof(String _value) {
    _nonePackageImageRoof.add(_value);
  }

  void removeFromNonePackageImageRoof(String _value) {
    _nonePackageImageRoof.remove(_value);
  }

  void removeAtIndexFromNonePackageImageRoof(int _index) {
    _nonePackageImageRoof.removeAt(_index);
  }

  void updateNonePackageImageRoofAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageRoof[_index] = updateFn(_nonePackageImageRoof[_index]);
  }

  void insertAtIndexInNonePackageImageRoof(int _index, String _value) {
    _nonePackageImageRoof.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageFront = [];
  List<String> get nonePackageTrailerImageFront =>
      _nonePackageTrailerImageFront;
  set nonePackageTrailerImageFront(List<String> _value) {
    _nonePackageTrailerImageFront = _value;
  }

  void addToNonePackageTrailerImageFront(String _value) {
    _nonePackageTrailerImageFront.add(_value);
  }

  void removeFromNonePackageTrailerImageFront(String _value) {
    _nonePackageTrailerImageFront.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageFront(int _index) {
    _nonePackageTrailerImageFront.removeAt(_index);
  }

  void updateNonePackageTrailerImageFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageFront[_index] =
        updateFn(_nonePackageTrailerImageFront[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageFront(int _index, String _value) {
    _nonePackageTrailerImageFront.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageRightFront = [];
  List<String> get nonePackageTrailerImageRightFront =>
      _nonePackageTrailerImageRightFront;
  set nonePackageTrailerImageRightFront(List<String> _value) {
    _nonePackageTrailerImageRightFront = _value;
  }

  void addToNonePackageTrailerImageRightFront(String _value) {
    _nonePackageTrailerImageRightFront.add(_value);
  }

  void removeFromNonePackageTrailerImageRightFront(String _value) {
    _nonePackageTrailerImageRightFront.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageRightFront(int _index) {
    _nonePackageTrailerImageRightFront.removeAt(_index);
  }

  void updateNonePackageTrailerImageRightFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageRightFront[_index] =
        updateFn(_nonePackageTrailerImageRightFront[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageRightFront(
      int _index, String _value) {
    _nonePackageTrailerImageRightFront.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageRight = [];
  List<String> get nonePackageTrailerImageRight =>
      _nonePackageTrailerImageRight;
  set nonePackageTrailerImageRight(List<String> _value) {
    _nonePackageTrailerImageRight = _value;
  }

  void addToNonePackageTrailerImageRight(String _value) {
    _nonePackageTrailerImageRight.add(_value);
  }

  void removeFromNonePackageTrailerImageRight(String _value) {
    _nonePackageTrailerImageRight.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageRight(int _index) {
    _nonePackageTrailerImageRight.removeAt(_index);
  }

  void updateNonePackageTrailerImageRightAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageRight[_index] =
        updateFn(_nonePackageTrailerImageRight[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageRight(int _index, String _value) {
    _nonePackageTrailerImageRight.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageRightRear = [];
  List<String> get nonePackageTrailerImageRightRear =>
      _nonePackageTrailerImageRightRear;
  set nonePackageTrailerImageRightRear(List<String> _value) {
    _nonePackageTrailerImageRightRear = _value;
  }

  void addToNonePackageTrailerImageRightRear(String _value) {
    _nonePackageTrailerImageRightRear.add(_value);
  }

  void removeFromNonePackageTrailerImageRightRear(String _value) {
    _nonePackageTrailerImageRightRear.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageRightRear(int _index) {
    _nonePackageTrailerImageRightRear.removeAt(_index);
  }

  void updateNonePackageTrailerImageRightRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageRightRear[_index] =
        updateFn(_nonePackageTrailerImageRightRear[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageRightRear(
      int _index, String _value) {
    _nonePackageTrailerImageRightRear.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageRear = [];
  List<String> get nonePackageTrailerImageRear => _nonePackageTrailerImageRear;
  set nonePackageTrailerImageRear(List<String> _value) {
    _nonePackageTrailerImageRear = _value;
  }

  void addToNonePackageTrailerImageRear(String _value) {
    _nonePackageTrailerImageRear.add(_value);
  }

  void removeFromNonePackageTrailerImageRear(String _value) {
    _nonePackageTrailerImageRear.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageRear(int _index) {
    _nonePackageTrailerImageRear.removeAt(_index);
  }

  void updateNonePackageTrailerImageRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageRear[_index] =
        updateFn(_nonePackageTrailerImageRear[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageRear(int _index, String _value) {
    _nonePackageTrailerImageRear.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageLeftRear = [];
  List<String> get nonePackageTrailerImageLeftRear =>
      _nonePackageTrailerImageLeftRear;
  set nonePackageTrailerImageLeftRear(List<String> _value) {
    _nonePackageTrailerImageLeftRear = _value;
  }

  void addToNonePackageTrailerImageLeftRear(String _value) {
    _nonePackageTrailerImageLeftRear.add(_value);
  }

  void removeFromNonePackageTrailerImageLeftRear(String _value) {
    _nonePackageTrailerImageLeftRear.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeftRear(int _index) {
    _nonePackageTrailerImageLeftRear.removeAt(_index);
  }

  void updateNonePackageTrailerImageLeftRearAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageLeftRear[_index] =
        updateFn(_nonePackageTrailerImageLeftRear[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeftRear(
      int _index, String _value) {
    _nonePackageTrailerImageLeftRear.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageLeft = [];
  List<String> get nonePackageTrailerImageLeft => _nonePackageTrailerImageLeft;
  set nonePackageTrailerImageLeft(List<String> _value) {
    _nonePackageTrailerImageLeft = _value;
  }

  void addToNonePackageTrailerImageLeft(String _value) {
    _nonePackageTrailerImageLeft.add(_value);
  }

  void removeFromNonePackageTrailerImageLeft(String _value) {
    _nonePackageTrailerImageLeft.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeft(int _index) {
    _nonePackageTrailerImageLeft.removeAt(_index);
  }

  void updateNonePackageTrailerImageLeftAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageLeft[_index] =
        updateFn(_nonePackageTrailerImageLeft[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeft(int _index, String _value) {
    _nonePackageTrailerImageLeft.insert(_index, _value);
  }

  List<String> _nonePackageTrailerImageLeftFront = [];
  List<String> get nonePackageTrailerImageLeftFront =>
      _nonePackageTrailerImageLeftFront;
  set nonePackageTrailerImageLeftFront(List<String> _value) {
    _nonePackageTrailerImageLeftFront = _value;
  }

  void addToNonePackageTrailerImageLeftFront(String _value) {
    _nonePackageTrailerImageLeftFront.add(_value);
  }

  void removeFromNonePackageTrailerImageLeftFront(String _value) {
    _nonePackageTrailerImageLeftFront.remove(_value);
  }

  void removeAtIndexFromNonePackageTrailerImageLeftFront(int _index) {
    _nonePackageTrailerImageLeftFront.removeAt(_index);
  }

  void updateNonePackageTrailerImageLeftFrontAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageTrailerImageLeftFront[_index] =
        updateFn(_nonePackageTrailerImageLeftFront[_index]);
  }

  void insertAtIndexInNonePackageTrailerImageLeftFront(
      int _index, String _value) {
    _nonePackageTrailerImageLeftFront.insert(_index, _value);
  }

  List<String> _insuranceInfoAddressType = ['REGISTER', 'CURRENT'];
  List<String> get insuranceInfoAddressType => _insuranceInfoAddressType;
  set insuranceInfoAddressType(List<String> _value) {
    _insuranceInfoAddressType = _value;
  }

  void addToInsuranceInfoAddressType(String _value) {
    _insuranceInfoAddressType.add(_value);
  }

  void removeFromInsuranceInfoAddressType(String _value) {
    _insuranceInfoAddressType.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoAddressType(int _index) {
    _insuranceInfoAddressType.removeAt(_index);
  }

  void updateInsuranceInfoAddressTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoAddressType[_index] =
        updateFn(_insuranceInfoAddressType[_index]);
  }

  void insertAtIndexInInsuranceInfoAddressType(int _index, String _value) {
    _insuranceInfoAddressType.insert(_index, _value);
  }

  int _nonePackageInsurerOutputIndex = 0;
  int get nonePackageInsurerOutputIndex => _nonePackageInsurerOutputIndex;
  set nonePackageInsurerOutputIndex(int _value) {
    _nonePackageInsurerOutputIndex = _value;
  }

  String _nonePackageLeadId = '';
  String get nonePackageLeadId => _nonePackageLeadId;
  set nonePackageLeadId(String _value) {
    _nonePackageLeadId = _value;
  }

  String _nonePackageLeadNo = '';
  String get nonePackageLeadNo => _nonePackageLeadNo;
  set nonePackageLeadNo(String _value) {
    _nonePackageLeadNo = _value;
  }

  bool _insuranceInfoHaveLicenseBool = false;
  bool get insuranceInfoHaveLicenseBool => _insuranceInfoHaveLicenseBool;
  set insuranceInfoHaveLicenseBool(bool _value) {
    _insuranceInfoHaveLicenseBool = _value;
  }

  List<String> _nonePackageCarImageUploadedList = [];
  List<String> get nonePackageCarImageUploadedList =>
      _nonePackageCarImageUploadedList;
  set nonePackageCarImageUploadedList(List<String> _value) {
    _nonePackageCarImageUploadedList = _value;
  }

  void addToNonePackageCarImageUploadedList(String _value) {
    _nonePackageCarImageUploadedList.add(_value);
  }

  void removeFromNonePackageCarImageUploadedList(String _value) {
    _nonePackageCarImageUploadedList.remove(_value);
  }

  void removeAtIndexFromNonePackageCarImageUploadedList(int _index) {
    _nonePackageCarImageUploadedList.removeAt(_index);
  }

  void updateNonePackageCarImageUploadedListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageCarImageUploadedList[_index] =
        updateFn(_nonePackageCarImageUploadedList[_index]);
  }

  void insertAtIndexInNonePackageCarImageUploadedList(
      int _index, String _value) {
    _nonePackageCarImageUploadedList.insert(_index, _value);
  }

  String _searchQuotationStatus = '';
  String get searchQuotationStatus => _searchQuotationStatus;
  set searchQuotationStatus(String _value) {
    _searchQuotationStatus = _value;
  }

  List<String> _nonePackageImageOldVmi = [];
  List<String> get nonePackageImageOldVmi => _nonePackageImageOldVmi;
  set nonePackageImageOldVmi(List<String> _value) {
    _nonePackageImageOldVmi = _value;
  }

  void addToNonePackageImageOldVmi(String _value) {
    _nonePackageImageOldVmi.add(_value);
  }

  void removeFromNonePackageImageOldVmi(String _value) {
    _nonePackageImageOldVmi.remove(_value);
  }

  void removeAtIndexFromNonePackageImageOldVmi(int _index) {
    _nonePackageImageOldVmi.removeAt(_index);
  }

  void updateNonePackageImageOldVmiAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageOldVmi[_index] = updateFn(_nonePackageImageOldVmi[_index]);
  }

  void insertAtIndexInNonePackageImageOldVmi(int _index, String _value) {
    _nonePackageImageOldVmi.insert(_index, _value);
  }

  List<String> _nonePackageImageCompanyBook = [];
  List<String> get nonePackageImageCompanyBook => _nonePackageImageCompanyBook;
  set nonePackageImageCompanyBook(List<String> _value) {
    _nonePackageImageCompanyBook = _value;
  }

  void addToNonePackageImageCompanyBook(String _value) {
    _nonePackageImageCompanyBook.add(_value);
  }

  void removeFromNonePackageImageCompanyBook(String _value) {
    _nonePackageImageCompanyBook.remove(_value);
  }

  void removeAtIndexFromNonePackageImageCompanyBook(int _index) {
    _nonePackageImageCompanyBook.removeAt(_index);
  }

  void updateNonePackageImageCompanyBookAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageCompanyBook[_index] =
        updateFn(_nonePackageImageCompanyBook[_index]);
  }

  void insertAtIndexInNonePackageImageCompanyBook(int _index, String _value) {
    _nonePackageImageCompanyBook.insert(_index, _value);
  }

  List<String> _nonePackageImageIdCard = [];
  List<String> get nonePackageImageIdCard => _nonePackageImageIdCard;
  set nonePackageImageIdCard(List<String> _value) {
    _nonePackageImageIdCard = _value;
  }

  void addToNonePackageImageIdCard(String _value) {
    _nonePackageImageIdCard.add(_value);
  }

  void removeFromNonePackageImageIdCard(String _value) {
    _nonePackageImageIdCard.remove(_value);
  }

  void removeAtIndexFromNonePackageImageIdCard(int _index) {
    _nonePackageImageIdCard.removeAt(_index);
  }

  void updateNonePackageImageIdCardAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageIdCard[_index] = updateFn(_nonePackageImageIdCard[_index]);
  }

  void insertAtIndexInNonePackageImageIdCard(int _index, String _value) {
    _nonePackageImageIdCard.insert(_index, _value);
  }

  List<String> _nonePackageImageBlueBook = [];
  List<String> get nonePackageImageBlueBook => _nonePackageImageBlueBook;
  set nonePackageImageBlueBook(List<String> _value) {
    _nonePackageImageBlueBook = _value;
  }

  void addToNonePackageImageBlueBook(String _value) {
    _nonePackageImageBlueBook.add(_value);
  }

  void removeFromNonePackageImageBlueBook(String _value) {
    _nonePackageImageBlueBook.remove(_value);
  }

  void removeAtIndexFromNonePackageImageBlueBook(int _index) {
    _nonePackageImageBlueBook.removeAt(_index);
  }

  void updateNonePackageImageBlueBookAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageBlueBook[_index] =
        updateFn(_nonePackageImageBlueBook[_index]);
  }

  void insertAtIndexInNonePackageImageBlueBook(int _index, String _value) {
    _nonePackageImageBlueBook.insert(_index, _value);
  }

  List<String> _insuranceInfoOccupationCode = [];
  List<String> get insuranceInfoOccupationCode => _insuranceInfoOccupationCode;
  set insuranceInfoOccupationCode(List<String> _value) {
    _insuranceInfoOccupationCode = _value;
  }

  void addToInsuranceInfoOccupationCode(String _value) {
    _insuranceInfoOccupationCode.add(_value);
  }

  void removeFromInsuranceInfoOccupationCode(String _value) {
    _insuranceInfoOccupationCode.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoOccupationCode(int _index) {
    _insuranceInfoOccupationCode.removeAt(_index);
  }

  void updateInsuranceInfoOccupationCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoOccupationCode[_index] =
        updateFn(_insuranceInfoOccupationCode[_index]);
  }

  void insertAtIndexInInsuranceInfoOccupationCode(int _index, String _value) {
    _insuranceInfoOccupationCode.insert(_index, _value);
  }

  List<String> _insuranceInfoOccupationName = [];
  List<String> get insuranceInfoOccupationName => _insuranceInfoOccupationName;
  set insuranceInfoOccupationName(List<String> _value) {
    _insuranceInfoOccupationName = _value;
  }

  void addToInsuranceInfoOccupationName(String _value) {
    _insuranceInfoOccupationName.add(_value);
  }

  void removeFromInsuranceInfoOccupationName(String _value) {
    _insuranceInfoOccupationName.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoOccupationName(int _index) {
    _insuranceInfoOccupationName.removeAt(_index);
  }

  void updateInsuranceInfoOccupationNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoOccupationName[_index] =
        updateFn(_insuranceInfoOccupationName[_index]);
  }

  void insertAtIndexInInsuranceInfoOccupationName(int _index, String _value) {
    _insuranceInfoOccupationName.insert(_index, _value);
  }

  List<String> _insuranceInfoOccupationSubCode = [];
  List<String> get insuranceInfoOccupationSubCode =>
      _insuranceInfoOccupationSubCode;
  set insuranceInfoOccupationSubCode(List<String> _value) {
    _insuranceInfoOccupationSubCode = _value;
  }

  void addToInsuranceInfoOccupationSubCode(String _value) {
    _insuranceInfoOccupationSubCode.add(_value);
  }

  void removeFromInsuranceInfoOccupationSubCode(String _value) {
    _insuranceInfoOccupationSubCode.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoOccupationSubCode(int _index) {
    _insuranceInfoOccupationSubCode.removeAt(_index);
  }

  void updateInsuranceInfoOccupationSubCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoOccupationSubCode[_index] =
        updateFn(_insuranceInfoOccupationSubCode[_index]);
  }

  void insertAtIndexInInsuranceInfoOccupationSubCode(
      int _index, String _value) {
    _insuranceInfoOccupationSubCode.insert(_index, _value);
  }

  List<String> _insuranceInfoOccupationSubName = [];
  List<String> get insuranceInfoOccupationSubName =>
      _insuranceInfoOccupationSubName;
  set insuranceInfoOccupationSubName(List<String> _value) {
    _insuranceInfoOccupationSubName = _value;
  }

  void addToInsuranceInfoOccupationSubName(String _value) {
    _insuranceInfoOccupationSubName.add(_value);
  }

  void removeFromInsuranceInfoOccupationSubName(String _value) {
    _insuranceInfoOccupationSubName.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoOccupationSubName(int _index) {
    _insuranceInfoOccupationSubName.removeAt(_index);
  }

  void updateInsuranceInfoOccupationSubNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoOccupationSubName[_index] =
        updateFn(_insuranceInfoOccupationSubName[_index]);
  }

  void insertAtIndexInInsuranceInfoOccupationSubName(
      int _index, String _value) {
    _insuranceInfoOccupationSubName.insert(_index, _value);
  }

  String _insuranceInfoSelectOccupationCode = '';
  String get insuranceInfoSelectOccupationCode =>
      _insuranceInfoSelectOccupationCode;
  set insuranceInfoSelectOccupationCode(String _value) {
    _insuranceInfoSelectOccupationCode = _value;
  }

  String _insuranceInfoSelectOccupationName = '';
  String get insuranceInfoSelectOccupationName =>
      _insuranceInfoSelectOccupationName;
  set insuranceInfoSelectOccupationName(String _value) {
    _insuranceInfoSelectOccupationName = _value;
  }

  List<String> _insuranceInfoSelectOccupationSubCode = [];
  List<String> get insuranceInfoSelectOccupationSubCode =>
      _insuranceInfoSelectOccupationSubCode;
  set insuranceInfoSelectOccupationSubCode(List<String> _value) {
    _insuranceInfoSelectOccupationSubCode = _value;
  }

  void addToInsuranceInfoSelectOccupationSubCode(String _value) {
    _insuranceInfoSelectOccupationSubCode.add(_value);
  }

  void removeFromInsuranceInfoSelectOccupationSubCode(String _value) {
    _insuranceInfoSelectOccupationSubCode.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoSelectOccupationSubCode(int _index) {
    _insuranceInfoSelectOccupationSubCode.removeAt(_index);
  }

  void updateInsuranceInfoSelectOccupationSubCodeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoSelectOccupationSubCode[_index] =
        updateFn(_insuranceInfoSelectOccupationSubCode[_index]);
  }

  void insertAtIndexInInsuranceInfoSelectOccupationSubCode(
      int _index, String _value) {
    _insuranceInfoSelectOccupationSubCode.insert(_index, _value);
  }

  List<String> _insuranceInfoSelectOccupationSubName = [];
  List<String> get insuranceInfoSelectOccupationSubName =>
      _insuranceInfoSelectOccupationSubName;
  set insuranceInfoSelectOccupationSubName(List<String> _value) {
    _insuranceInfoSelectOccupationSubName = _value;
  }

  void addToInsuranceInfoSelectOccupationSubName(String _value) {
    _insuranceInfoSelectOccupationSubName.add(_value);
  }

  void removeFromInsuranceInfoSelectOccupationSubName(String _value) {
    _insuranceInfoSelectOccupationSubName.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoSelectOccupationSubName(int _index) {
    _insuranceInfoSelectOccupationSubName.removeAt(_index);
  }

  void updateInsuranceInfoSelectOccupationSubNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoSelectOccupationSubName[_index] =
        updateFn(_insuranceInfoSelectOccupationSubName[_index]);
  }

  void insertAtIndexInInsuranceInfoSelectOccupationSubName(
      int _index, String _value) {
    _insuranceInfoSelectOccupationSubName.insert(_index, _value);
  }

  bool _nonePackageCompanyBookImageUploadedCheck = false;
  bool get nonePackageCompanyBookImageUploadedCheck =>
      _nonePackageCompanyBookImageUploadedCheck;
  set nonePackageCompanyBookImageUploadedCheck(bool _value) {
    _nonePackageCompanyBookImageUploadedCheck = _value;
  }

  String _nonePackageCompanyBookImageUrl = '';
  String get nonePackageCompanyBookImageUrl => _nonePackageCompanyBookImageUrl;
  set nonePackageCompanyBookImageUrl(String _value) {
    _nonePackageCompanyBookImageUrl = _value;
  }

  String _insuranceInfoImageApplication = '';
  String get insuranceInfoImageApplication => _insuranceInfoImageApplication;
  set insuranceInfoImageApplication(String _value) {
    _insuranceInfoImageApplication = _value;
  }

  String _insuranceInfoImageFileloanApplicationRegister = '';
  String get insuranceInfoImageFileloanApplicationRegister =>
      _insuranceInfoImageFileloanApplicationRegister;
  set insuranceInfoImageFileloanApplicationRegister(String _value) {
    _insuranceInfoImageFileloanApplicationRegister = _value;
  }

  String _nonePackageImageFrontUploaded = '';
  String get nonePackageImageFrontUploaded => _nonePackageImageFrontUploaded;
  set nonePackageImageFrontUploaded(String _value) {
    _nonePackageImageFrontUploaded = _value;
  }

  String _nonePackageImageRightFrontUploaded = '';
  String get nonePackageImageRightFrontUploaded =>
      _nonePackageImageRightFrontUploaded;
  set nonePackageImageRightFrontUploaded(String _value) {
    _nonePackageImageRightFrontUploaded = _value;
  }

  String _nonePackageImageRightUploaded = '';
  String get nonePackageImageRightUploaded => _nonePackageImageRightUploaded;
  set nonePackageImageRightUploaded(String _value) {
    _nonePackageImageRightUploaded = _value;
  }

  String _nonePackageImageRightRearUploaded = '';
  String get nonePackageImageRightRearUploaded =>
      _nonePackageImageRightRearUploaded;
  set nonePackageImageRightRearUploaded(String _value) {
    _nonePackageImageRightRearUploaded = _value;
  }

  String _nonePackageImageRearUploaded = '';
  String get nonePackageImageRearUploaded => _nonePackageImageRearUploaded;
  set nonePackageImageRearUploaded(String _value) {
    _nonePackageImageRearUploaded = _value;
  }

  String _nonePackageImageLeftRearUploaded = '';
  String get nonePackageImageLeftRearUploaded =>
      _nonePackageImageLeftRearUploaded;
  set nonePackageImageLeftRearUploaded(String _value) {
    _nonePackageImageLeftRearUploaded = _value;
  }

  String _nonePackageImageLeftUploaded = '';
  String get nonePackageImageLeftUploaded => _nonePackageImageLeftUploaded;
  set nonePackageImageLeftUploaded(String _value) {
    _nonePackageImageLeftUploaded = _value;
  }

  String _nonePackageImageLeftFrontUploaded = '';
  String get nonePackageImageLeftFrontUploaded =>
      _nonePackageImageLeftFrontUploaded;
  set nonePackageImageLeftFrontUploaded(String _value) {
    _nonePackageImageLeftFrontUploaded = _value;
  }

  String _nonePackageImageRoofUploaded = '';
  String get nonePackageImageRoofUploaded => _nonePackageImageRoofUploaded;
  set nonePackageImageRoofUploaded(String _value) {
    _nonePackageImageRoofUploaded = _value;
  }

  String _nonePackageTrailerImageFrontUploaded = '';
  String get nonePackageTrailerImageFrontUploaded =>
      _nonePackageTrailerImageFrontUploaded;
  set nonePackageTrailerImageFrontUploaded(String _value) {
    _nonePackageTrailerImageFrontUploaded = _value;
  }

  String _nonePackageTrailerImageRightFrontUploaded = '';
  String get nonePackageTrailerImageRightFrontUploaded =>
      _nonePackageTrailerImageRightFrontUploaded;
  set nonePackageTrailerImageRightFrontUploaded(String _value) {
    _nonePackageTrailerImageRightFrontUploaded = _value;
  }

  String _nonePackageTrailerImageRightUploaded = '';
  String get nonePackageTrailerImageRightUploaded =>
      _nonePackageTrailerImageRightUploaded;
  set nonePackageTrailerImageRightUploaded(String _value) {
    _nonePackageTrailerImageRightUploaded = _value;
  }

  String _nonePackageTrailerImageRightRearUploaded = '';
  String get nonePackageTrailerImageRightRearUploaded =>
      _nonePackageTrailerImageRightRearUploaded;
  set nonePackageTrailerImageRightRearUploaded(String _value) {
    _nonePackageTrailerImageRightRearUploaded = _value;
  }

  String _nonePackageTrailerImageRearUploaded = '';
  String get nonePackageTrailerImageRearUploaded =>
      _nonePackageTrailerImageRearUploaded;
  set nonePackageTrailerImageRearUploaded(String _value) {
    _nonePackageTrailerImageRearUploaded = _value;
  }

  String _nonePackageTrailerImageLeftRearUploaded = '';
  String get nonePackageTrailerImageLeftRearUploaded =>
      _nonePackageTrailerImageLeftRearUploaded;
  set nonePackageTrailerImageLeftRearUploaded(String _value) {
    _nonePackageTrailerImageLeftRearUploaded = _value;
  }

  String _nonePackageTrailerImageLeftUploaded = '';
  String get nonePackageTrailerImageLeftUploaded =>
      _nonePackageTrailerImageLeftUploaded;
  set nonePackageTrailerImageLeftUploaded(String _value) {
    _nonePackageTrailerImageLeftUploaded = _value;
  }

  String _nonePackageTrailerImageLeftFrontUploaded = '';
  String get nonePackageTrailerImageLeftFrontUploaded =>
      _nonePackageTrailerImageLeftFrontUploaded;
  set nonePackageTrailerImageLeftFrontUploaded(String _value) {
    _nonePackageTrailerImageLeftFrontUploaded = _value;
  }

  String _nonePackageImageBlueBookUploaded = '';
  String get nonePackageImageBlueBookUploaded =>
      _nonePackageImageBlueBookUploaded;
  set nonePackageImageBlueBookUploaded(String _value) {
    _nonePackageImageBlueBookUploaded = _value;
  }

  String _nonePackageImageOther1 = '';
  String get nonePackageImageOther1 => _nonePackageImageOther1;
  set nonePackageImageOther1(String _value) {
    _nonePackageImageOther1 = _value;
  }

  String _nonePackageImageOther2 = '';
  String get nonePackageImageOther2 => _nonePackageImageOther2;
  set nonePackageImageOther2(String _value) {
    _nonePackageImageOther2 = _value;
  }

  String _nonePackageImageOther3 = '';
  String get nonePackageImageOther3 => _nonePackageImageOther3;
  set nonePackageImageOther3(String _value) {
    _nonePackageImageOther3 = _value;
  }

  String _nonePackageImageOther4 = '';
  String get nonePackageImageOther4 => _nonePackageImageOther4;
  set nonePackageImageOther4(String _value) {
    _nonePackageImageOther4 = _value;
  }

  String _nonePackageImageOther5 = '';
  String get nonePackageImageOther5 => _nonePackageImageOther5;
  set nonePackageImageOther5(String _value) {
    _nonePackageImageOther5 = _value;
  }

  List<String> _nonePackageImageOtherNameList = [];
  List<String> get nonePackageImageOtherNameList =>
      _nonePackageImageOtherNameList;
  set nonePackageImageOtherNameList(List<String> _value) {
    _nonePackageImageOtherNameList = _value;
  }

  void addToNonePackageImageOtherNameList(String _value) {
    _nonePackageImageOtherNameList.add(_value);
  }

  void removeFromNonePackageImageOtherNameList(String _value) {
    _nonePackageImageOtherNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageImageOtherNameList(int _index) {
    _nonePackageImageOtherNameList.removeAt(_index);
  }

  void updateNonePackageImageOtherNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageImageOtherNameList[_index] =
        updateFn(_nonePackageImageOtherNameList[_index]);
  }

  void insertAtIndexInNonePackageImageOtherNameList(int _index, String _value) {
    _nonePackageImageOtherNameList.insert(_index, _value);
  }

  String _paymentQrCodeGen = '';
  String get paymentQrCodeGen => _paymentQrCodeGen;
  set paymentQrCodeGen(String _value) {
    _paymentQrCodeGen = _value;
  }

  bool _insuranceInfoCardCheckBool = false;
  bool get insuranceInfoCardCheckBool => _insuranceInfoCardCheckBool;
  set insuranceInfoCardCheckBool(bool _value) {
    _insuranceInfoCardCheckBool = _value;
  }

  String _insuranceInfoPage4PaymentChannel = '';
  String get insuranceInfoPage4PaymentChannel =>
      _insuranceInfoPage4PaymentChannel;
  set insuranceInfoPage4PaymentChannel(String _value) {
    _insuranceInfoPage4PaymentChannel = _value;
  }

  String _insuranceInfoPage4PaymentType = '';
  String get insuranceInfoPage4PaymentType => _insuranceInfoPage4PaymentType;
  set insuranceInfoPage4PaymentType(String _value) {
    _insuranceInfoPage4PaymentType = _value;
  }

  String _insuranceInfo4pagePaymentStatus = '';
  String get insuranceInfo4pagePaymentStatus =>
      _insuranceInfo4pagePaymentStatus;
  set insuranceInfo4pagePaymentStatus(String _value) {
    _insuranceInfo4pagePaymentStatus = _value;
  }

  String _insuranceInfo4pageStatus = '';
  String get insuranceInfo4pageStatus => _insuranceInfo4pageStatus;
  set insuranceInfo4pageStatus(String _value) {
    _insuranceInfo4pageStatus = _value;
  }

  String _insuranceInfoPage4SelectTenor = '';
  String get insuranceInfoPage4SelectTenor => _insuranceInfoPage4SelectTenor;
  set insuranceInfoPage4SelectTenor(String _value) {
    _insuranceInfoPage4SelectTenor = _value;
  }

  String _insuranceInfoPage4SelectInstallMentFirstDue = '';
  String get insuranceInfoPage4SelectInstallMentFirstDue =>
      _insuranceInfoPage4SelectInstallMentFirstDue;
  set insuranceInfoPage4SelectInstallMentFirstDue(String _value) {
    _insuranceInfoPage4SelectInstallMentFirstDue = _value;
  }

  String _insuranceInfoPage4SelectInstallMentLastDue = '';
  String get insuranceInfoPage4SelectInstallMentLastDue =>
      _insuranceInfoPage4SelectInstallMentLastDue;
  set insuranceInfoPage4SelectInstallMentLastDue(String _value) {
    _insuranceInfoPage4SelectInstallMentLastDue = _value;
  }

  String _profileInsuranceLicenseFullName = '';
  String get profileInsuranceLicenseFullName =>
      _profileInsuranceLicenseFullName;
  set profileInsuranceLicenseFullName(String _value) {
    _profileInsuranceLicenseFullName = _value;
  }

  String _profileInsuranceLicenseIdCard = '';
  String get profileInsuranceLicenseIdCard => _profileInsuranceLicenseIdCard;
  set profileInsuranceLicenseIdCard(String _value) {
    _profileInsuranceLicenseIdCard = _value;
  }

  String _profileInsuranceLicenseLicenseNo = '';
  String get profileInsuranceLicenseLicenseNo =>
      _profileInsuranceLicenseLicenseNo;
  set profileInsuranceLicenseLicenseNo(String _value) {
    _profileInsuranceLicenseLicenseNo = _value;
  }

  String _profileInsuranceLicenseStartDate = '';
  String get profileInsuranceLicenseStartDate =>
      _profileInsuranceLicenseStartDate;
  set profileInsuranceLicenseStartDate(String _value) {
    _profileInsuranceLicenseStartDate = _value;
  }

  String _profileInsuranceLicenseExpireDate = '';
  String get profileInsuranceLicenseExpireDate =>
      _profileInsuranceLicenseExpireDate;
  set profileInsuranceLicenseExpireDate(String _value) {
    _profileInsuranceLicenseExpireDate = _value;
  }

  String _fcmToken = 'fcm_token';
  String get fcmToken => _fcmToken;
  set fcmToken(String _value) {
    _fcmToken = _value;
    secureStorage.setString('ff_fcmToken', _value);
  }

  void deleteFcmToken() {
    secureStorage.delete(key: 'ff_fcmToken');
  }

  bool _profileIsHaveInsuranceCard = false;
  bool get profileIsHaveInsuranceCard => _profileIsHaveInsuranceCard;
  set profileIsHaveInsuranceCard(bool _value) {
    _profileIsHaveInsuranceCard = _value;
  }

  List<String> _insuranceInfoImgUrlInsurerList = [];
  List<String> get insuranceInfoImgUrlInsurerList =>
      _insuranceInfoImgUrlInsurerList;
  set insuranceInfoImgUrlInsurerList(List<String> _value) {
    _insuranceInfoImgUrlInsurerList = _value;
  }

  void addToInsuranceInfoImgUrlInsurerList(String _value) {
    _insuranceInfoImgUrlInsurerList.add(_value);
  }

  void removeFromInsuranceInfoImgUrlInsurerList(String _value) {
    _insuranceInfoImgUrlInsurerList.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoImgUrlInsurerList(int _index) {
    _insuranceInfoImgUrlInsurerList.removeAt(_index);
  }

  void updateInsuranceInfoImgUrlInsurerListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoImgUrlInsurerList[_index] =
        updateFn(_insuranceInfoImgUrlInsurerList[_index]);
  }

  void insertAtIndexInInsuranceInfoImgUrlInsurerList(
      int _index, String _value) {
    _insuranceInfoImgUrlInsurerList.insert(_index, _value);
  }

  List<String> _insuranceInfoCompanyIdList = [];
  List<String> get insuranceInfoCompanyIdList => _insuranceInfoCompanyIdList;
  set insuranceInfoCompanyIdList(List<String> _value) {
    _insuranceInfoCompanyIdList = _value;
  }

  void addToInsuranceInfoCompanyIdList(String _value) {
    _insuranceInfoCompanyIdList.add(_value);
  }

  void removeFromInsuranceInfoCompanyIdList(String _value) {
    _insuranceInfoCompanyIdList.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoCompanyIdList(int _index) {
    _insuranceInfoCompanyIdList.removeAt(_index);
  }

  void updateInsuranceInfoCompanyIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoCompanyIdList[_index] =
        updateFn(_insuranceInfoCompanyIdList[_index]);
  }

  void insertAtIndexInInsuranceInfoCompanyIdList(int _index, String _value) {
    _insuranceInfoCompanyIdList.insert(_index, _value);
  }

  String _insuranceInfoCompayId = '';
  String get insuranceInfoCompayId => _insuranceInfoCompayId;
  set insuranceInfoCompayId(String _value) {
    _insuranceInfoCompayId = _value;
  }

  String _nonePackageSelectedInsurerShortName = '';
  String get nonePackageSelectedInsurerShortName =>
      _nonePackageSelectedInsurerShortName;
  set nonePackageSelectedInsurerShortName(String _value) {
    _nonePackageSelectedInsurerShortName = _value;
  }

  String _nonePackageSelectedInsurerName = '';
  String get nonePackageSelectedInsurerName => _nonePackageSelectedInsurerName;
  set nonePackageSelectedInsurerName(String _value) {
    _nonePackageSelectedInsurerName = _value;
  }

  List<String> _nonePackageSelectedInsurerShortNameList = [];
  List<String> get nonePackageSelectedInsurerShortNameList =>
      _nonePackageSelectedInsurerShortNameList;
  set nonePackageSelectedInsurerShortNameList(List<String> _value) {
    _nonePackageSelectedInsurerShortNameList = _value;
  }

  void addToNonePackageSelectedInsurerShortNameList(String _value) {
    _nonePackageSelectedInsurerShortNameList.add(_value);
  }

  void removeFromNonePackageSelectedInsurerShortNameList(String _value) {
    _nonePackageSelectedInsurerShortNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageSelectedInsurerShortNameList(int _index) {
    _nonePackageSelectedInsurerShortNameList.removeAt(_index);
  }

  void updateNonePackageSelectedInsurerShortNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageSelectedInsurerShortNameList[_index] =
        updateFn(_nonePackageSelectedInsurerShortNameList[_index]);
  }

  void insertAtIndexInNonePackageSelectedInsurerShortNameList(
      int _index, String _value) {
    _nonePackageSelectedInsurerShortNameList.insert(_index, _value);
  }

  List<String> _nonePackageSelectedInsurerNameList = [];
  List<String> get nonePackageSelectedInsurerNameList =>
      _nonePackageSelectedInsurerNameList;
  set nonePackageSelectedInsurerNameList(List<String> _value) {
    _nonePackageSelectedInsurerNameList = _value;
  }

  void addToNonePackageSelectedInsurerNameList(String _value) {
    _nonePackageSelectedInsurerNameList.add(_value);
  }

  void removeFromNonePackageSelectedInsurerNameList(String _value) {
    _nonePackageSelectedInsurerNameList.remove(_value);
  }

  void removeAtIndexFromNonePackageSelectedInsurerNameList(int _index) {
    _nonePackageSelectedInsurerNameList.removeAt(_index);
  }

  void updateNonePackageSelectedInsurerNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageSelectedInsurerNameList[_index] =
        updateFn(_nonePackageSelectedInsurerNameList[_index]);
  }

  void insertAtIndexInNonePackageSelectedInsurerNameList(
      int _index, String _value) {
    _nonePackageSelectedInsurerNameList.insert(_index, _value);
  }

  String _insuranceInfoLeadDetailId = '';
  String get insuranceInfoLeadDetailId => _insuranceInfoLeadDetailId;
  set insuranceInfoLeadDetailId(String _value) {
    _insuranceInfoLeadDetailId = _value;
  }

  String _insuranceInfoSelectOccupationSubNameChoose = '';
  String get insuranceInfoSelectOccupationSubNameChoose =>
      _insuranceInfoSelectOccupationSubNameChoose;
  set insuranceInfoSelectOccupationSubNameChoose(String _value) {
    _insuranceInfoSelectOccupationSubNameChoose = _value;
  }

  List<String> _addaddresslicensenBranch = [];
  List<String> get addaddresslicensenBranch => _addaddresslicensenBranch;
  set addaddresslicensenBranch(List<String> _value) {
    _addaddresslicensenBranch = _value;
  }

  void addToAddaddresslicensenBranch(String _value) {
    _addaddresslicensenBranch.add(_value);
  }

  void removeFromAddaddresslicensenBranch(String _value) {
    _addaddresslicensenBranch.remove(_value);
  }

  void removeAtIndexFromAddaddresslicensenBranch(int _index) {
    _addaddresslicensenBranch.removeAt(_index);
  }

  void updateAddaddresslicensenBranchAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _addaddresslicensenBranch[_index] =
        updateFn(_addaddresslicensenBranch[_index]);
  }

  void insertAtIndexInAddaddresslicensenBranch(int _index, String _value) {
    _addaddresslicensenBranch.insert(_index, _value);
  }

  String _insuranceInfoLicenseBranch = '';
  String get insuranceInfoLicenseBranch => _insuranceInfoLicenseBranch;
  set insuranceInfoLicenseBranch(String _value) {
    _insuranceInfoLicenseBranch = _value;
  }

  String _insuranceInfoQuotationId = '';
  String get insuranceInfoQuotationId => _insuranceInfoQuotationId;
  set insuranceInfoQuotationId(String _value) {
    _insuranceInfoQuotationId = _value;
  }

  String _insuranceInfoQrcodeTaxId = '';
  String get insuranceInfoQrcodeTaxId => _insuranceInfoQrcodeTaxId;
  set insuranceInfoQrcodeTaxId(String _value) {
    _insuranceInfoQrcodeTaxId = _value;
  }

  String _insuranceInfoQrcodeSuffix = '';
  String get insuranceInfoQrcodeSuffix => _insuranceInfoQrcodeSuffix;
  set insuranceInfoQrcodeSuffix(String _value) {
    _insuranceInfoQrcodeSuffix = _value;
  }

  String _insuranceInfoQrcodeRef1 = '';
  String get insuranceInfoQrcodeRef1 => _insuranceInfoQrcodeRef1;
  set insuranceInfoQrcodeRef1(String _value) {
    _insuranceInfoQrcodeRef1 = _value;
  }

  String _insuranceInfoQrcodeRef2 = '';
  String get insuranceInfoQrcodeRef2 => _insuranceInfoQrcodeRef2;
  set insuranceInfoQrcodeRef2(String _value) {
    _insuranceInfoQrcodeRef2 = _value;
  }

  String _insuranceInfoQrcodeAmount = '';
  String get insuranceInfoQrcodeAmount => _insuranceInfoQrcodeAmount;
  set insuranceInfoQrcodeAmount(String _value) {
    _insuranceInfoQrcodeAmount = _value;
  }

  bool _insuranceInfoPage1SaveDataCheckBool = false;
  bool get insuranceInfoPage1SaveDataCheckBool =>
      _insuranceInfoPage1SaveDataCheckBool;
  set insuranceInfoPage1SaveDataCheckBool(bool _value) {
    _insuranceInfoPage1SaveDataCheckBool = _value;
  }

  bool _insuranceInfoPage2SaveDataCheckBool = false;
  bool get insuranceInfoPage2SaveDataCheckBool =>
      _insuranceInfoPage2SaveDataCheckBool;
  set insuranceInfoPage2SaveDataCheckBool(bool _value) {
    _insuranceInfoPage2SaveDataCheckBool = _value;
  }

  bool _insuranceInfoPage3SaveDataCheckBool = false;
  bool get insuranceInfoPage3SaveDataCheckBool =>
      _insuranceInfoPage3SaveDataCheckBool;
  set insuranceInfoPage3SaveDataCheckBool(bool _value) {
    _insuranceInfoPage3SaveDataCheckBool = _value;
  }

  String _insuranceInfoVehicleCode = '';
  String get insuranceInfoVehicleCode => _insuranceInfoVehicleCode;
  set insuranceInfoVehicleCode(String _value) {
    _insuranceInfoVehicleCode = _value;
  }

  List<String> _followUpListSelected = ['manual', 'auto'];
  List<String> get followUpListSelected => _followUpListSelected;
  set followUpListSelected(List<String> _value) {
    _followUpListSelected = _value;
  }

  void addToFollowUpListSelected(String _value) {
    _followUpListSelected.add(_value);
  }

  void removeFromFollowUpListSelected(String _value) {
    _followUpListSelected.remove(_value);
  }

  void removeAtIndexFromFollowUpListSelected(int _index) {
    _followUpListSelected.removeAt(_index);
  }

  void updateFollowUpListSelectedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _followUpListSelected[_index] = updateFn(_followUpListSelected[_index]);
  }

  void insertAtIndexInFollowUpListSelected(int _index, String _value) {
    _followUpListSelected.insert(_index, _value);
  }

  List<String> _listForSearchFollowUp = ['เตรียมข้อมูล'];
  List<String> get listForSearchFollowUp => _listForSearchFollowUp;
  set listForSearchFollowUp(List<String> _value) {
    _listForSearchFollowUp = _value;
  }

  void addToListForSearchFollowUp(String _value) {
    _listForSearchFollowUp.add(_value);
  }

  void removeFromListForSearchFollowUp(String _value) {
    _listForSearchFollowUp.remove(_value);
  }

  void removeAtIndexFromListForSearchFollowUp(int _index) {
    _listForSearchFollowUp.removeAt(_index);
  }

  void updateListForSearchFollowUpAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listForSearchFollowUp[_index] = updateFn(_listForSearchFollowUp[_index]);
  }

  void insertAtIndexInListForSearchFollowUp(int _index, String _value) {
    _listForSearchFollowUp.insert(_index, _value);
  }

  dynamic _successStatusJson = jsonDecode('201');
  dynamic get successStatusJson => _successStatusJson;
  set successStatusJson(dynamic _value) {
    _successStatusJson = _value;
  }

  List<String> _inputPinValue = [];
  List<String> get inputPinValue => _inputPinValue;
  set inputPinValue(List<String> _value) {
    _inputPinValue = _value;
  }

  void addToInputPinValue(String _value) {
    _inputPinValue.add(_value);
  }

  void removeFromInputPinValue(String _value) {
    _inputPinValue.remove(_value);
  }

  void removeAtIndexFromInputPinValue(int _index) {
    _inputPinValue.removeAt(_index);
  }

  void updateInputPinValueAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _inputPinValue[_index] = updateFn(_inputPinValue[_index]);
  }

  void insertAtIndexInInputPinValue(int _index, String _value) {
    _inputPinValue.insert(_index, _value);
  }

  bool _printQuotation = false;
  bool get printQuotation => _printQuotation;
  set printQuotation(bool _value) {
    _printQuotation = _value;
  }

  bool _printCompare = false;
  bool get printCompare => _printCompare;
  set printCompare(bool _value) {
    _printCompare = _value;
  }

  List<String> _insuranceInfoRegistrationCodeList = [];
  List<String> get insuranceInfoRegistrationCodeList =>
      _insuranceInfoRegistrationCodeList;
  set insuranceInfoRegistrationCodeList(List<String> _value) {
    _insuranceInfoRegistrationCodeList = _value;
  }

  void addToInsuranceInfoRegistrationCodeList(String _value) {
    _insuranceInfoRegistrationCodeList.add(_value);
  }

  void removeFromInsuranceInfoRegistrationCodeList(String _value) {
    _insuranceInfoRegistrationCodeList.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoRegistrationCodeList(int _index) {
    _insuranceInfoRegistrationCodeList.removeAt(_index);
  }

  void updateInsuranceInfoRegistrationCodeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoRegistrationCodeList[_index] =
        updateFn(_insuranceInfoRegistrationCodeList[_index]);
  }

  void insertAtIndexInInsuranceInfoRegistrationCodeList(
      int _index, String _value) {
    _insuranceInfoRegistrationCodeList.insert(_index, _value);
  }

  List<String> _insuranceInfoRegistrationprovinceList = [];
  List<String> get insuranceInfoRegistrationprovinceList =>
      _insuranceInfoRegistrationprovinceList;
  set insuranceInfoRegistrationprovinceList(List<String> _value) {
    _insuranceInfoRegistrationprovinceList = _value;
  }

  void addToInsuranceInfoRegistrationprovinceList(String _value) {
    _insuranceInfoRegistrationprovinceList.add(_value);
  }

  void removeFromInsuranceInfoRegistrationprovinceList(String _value) {
    _insuranceInfoRegistrationprovinceList.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoRegistrationprovinceList(int _index) {
    _insuranceInfoRegistrationprovinceList.removeAt(_index);
  }

  void updateInsuranceInfoRegistrationprovinceListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoRegistrationprovinceList[_index] =
        updateFn(_insuranceInfoRegistrationprovinceList[_index]);
  }

  void insertAtIndexInInsuranceInfoRegistrationprovinceList(
      int _index, String _value) {
    _insuranceInfoRegistrationprovinceList.insert(_index, _value);
  }

  String _insuranceInfoRegistrationCodeSelect = '';
  String get insuranceInfoRegistrationCodeSelect =>
      _insuranceInfoRegistrationCodeSelect;
  set insuranceInfoRegistrationCodeSelect(String _value) {
    _insuranceInfoRegistrationCodeSelect = _value;
  }

  String _insuranceInfoRegistrationProvinceSelect = '';
  String get insuranceInfoRegistrationProvinceSelect =>
      _insuranceInfoRegistrationProvinceSelect;
  set insuranceInfoRegistrationProvinceSelect(String _value) {
    _insuranceInfoRegistrationProvinceSelect = _value;
  }

  dynamic _quotationTypeJson =
      jsonDecode('{\"auto\":\"auto\",\"manual\":\"manual\"}');
  dynamic get quotationTypeJson => _quotationTypeJson;
  set quotationTypeJson(dynamic _value) {
    _quotationTypeJson = _value;
  }

  bool _maxCurrentSelected = false;
  bool get maxCurrentSelected => _maxCurrentSelected;
  set maxCurrentSelected(bool _value) {
    _maxCurrentSelected = _value;
  }

  bool _installmentSelected = false;
  bool get installmentSelected => _installmentSelected;
  set installmentSelected(bool _value) {
    _installmentSelected = _value;
  }

  String _AddCustomerPageFirstname = '';
  String get AddCustomerPageFirstname => _AddCustomerPageFirstname;
  set AddCustomerPageFirstname(String _value) {
    _AddCustomerPageFirstname = _value;
  }

  String _AddCustomerPageLastname = '';
  String get AddCustomerPageLastname => _AddCustomerPageLastname;
  set AddCustomerPageLastname(String _value) {
    _AddCustomerPageLastname = _value;
  }

  String _AddCustomerPagePhone = '';
  String get AddCustomerPagePhone => _AddCustomerPagePhone;
  set AddCustomerPagePhone(String _value) {
    _AddCustomerPagePhone = _value;
  }

  String _AddCustomerPageCarRegistration = '';
  String get AddCustomerPageCarRegistration => _AddCustomerPageCarRegistration;
  set AddCustomerPageCarRegistration(String _value) {
    _AddCustomerPageCarRegistration = _value;
  }

  bool _addCustomerQuotationSaveSuccess = false;
  bool get addCustomerQuotationSaveSuccess => _addCustomerQuotationSaveSuccess;
  set addCustomerQuotationSaveSuccess(bool _value) {
    _addCustomerQuotationSaveSuccess = _value;
  }

  List<String> _insurarerQuotationPdf = [];
  List<String> get insurarerQuotationPdf => _insurarerQuotationPdf;
  set insurarerQuotationPdf(List<String> _value) {
    _insurarerQuotationPdf = _value;
  }

  void addToInsurarerQuotationPdf(String _value) {
    _insurarerQuotationPdf.add(_value);
  }

  void removeFromInsurarerQuotationPdf(String _value) {
    _insurarerQuotationPdf.remove(_value);
  }

  void removeAtIndexFromInsurarerQuotationPdf(int _index) {
    _insurarerQuotationPdf.removeAt(_index);
  }

  void updateInsurarerQuotationPdfAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insurarerQuotationPdf[_index] = updateFn(_insurarerQuotationPdf[_index]);
  }

  void insertAtIndexInInsurarerQuotationPdf(int _index, String _value) {
    _insurarerQuotationPdf.insert(_index, _value);
  }

  String _page5QuotationStatus = '';
  String get page5QuotationStatus => _page5QuotationStatus;
  set page5QuotationStatus(String _value) {
    _page5QuotationStatus = _value;
  }

  String _page5CreatedDate = '';
  String get page5CreatedDate => _page5CreatedDate;
  set page5CreatedDate(String _value) {
    _page5CreatedDate = _value;
  }

  String _page5CompletedDate = '';
  String get page5CompletedDate => _page5CompletedDate;
  set page5CompletedDate(String _value) {
    _page5CompletedDate = _value;
  }

  String _page5ContractId = '';
  String get page5ContractId => _page5ContractId;
  set page5ContractId(String _value) {
    _page5ContractId = _value;
  }

  String _page5VmiPolicyNo = '';
  String get page5VmiPolicyNo => _page5VmiPolicyNo;
  set page5VmiPolicyNo(String _value) {
    _page5VmiPolicyNo = _value;
  }

  String _page5Reason = '';
  String get page5Reason => _page5Reason;
  set page5Reason(String _value) {
    _page5Reason = _value;
  }

  String _page5PaymentStatus = '';
  String get page5PaymentStatus => _page5PaymentStatus;
  set page5PaymentStatus(String _value) {
    _page5PaymentStatus = _value;
  }

  String _page5PaymentType = '';
  String get page5PaymentType => _page5PaymentType;
  set page5PaymentType(String _value) {
    _page5PaymentType = _value;
  }

  String _page5PaymentChannel = '';
  String get page5PaymentChannel => _page5PaymentChannel;
  set page5PaymentChannel(String _value) {
    _page5PaymentChannel = _value;
  }

  String _page5NetPremium = '';
  String get page5NetPremium => _page5NetPremium;
  set page5NetPremium(String _value) {
    _page5NetPremium = _value;
  }

  String _page5ActPrice = '';
  String get page5ActPrice => _page5ActPrice;
  set page5ActPrice(String _value) {
    _page5ActPrice = _value;
  }

  String _page5GrossTotalNet = '';
  String get page5GrossTotalNet => _page5GrossTotalNet;
  set page5GrossTotalNet(String _value) {
    _page5GrossTotalNet = _value;
  }

  String _page5FirstDue = '';
  String get page5FirstDue => _page5FirstDue;
  set page5FirstDue(String _value) {
    _page5FirstDue = _value;
  }

  String _page5LastDue = '';
  String get page5LastDue => _page5LastDue;
  set page5LastDue(String _value) {
    _page5LastDue = _value;
  }

  String _page5VloneContNo = '';
  String get page5VloneContNo => _page5VloneContNo;
  set page5VloneContNo(String _value) {
    _page5VloneContNo = _value;
  }

  String _page5CusIdCardNo = '';
  String get page5CusIdCardNo => _page5CusIdCardNo;
  set page5CusIdCardNo(String _value) {
    _page5CusIdCardNo = _value;
  }

  String _insuranceinfoPage3PdfFileapplication = '';
  String get insuranceinfoPage3PdfFileapplication =>
      _insuranceinfoPage3PdfFileapplication;
  set insuranceinfoPage3PdfFileapplication(String _value) {
    _insuranceinfoPage3PdfFileapplication = _value;
  }

  String _insuranceInfoApplicationType = '';
  String get insuranceInfoApplicationType => _insuranceInfoApplicationType;
  set insuranceInfoApplicationType(String _value) {
    _insuranceInfoApplicationType = _value;
  }

  List<String> _InsuranceInfoPage4PaymentFirst = [];
  List<String> get InsuranceInfoPage4PaymentFirst =>
      _InsuranceInfoPage4PaymentFirst;
  set InsuranceInfoPage4PaymentFirst(List<String> _value) {
    _InsuranceInfoPage4PaymentFirst = _value;
  }

  void addToInsuranceInfoPage4PaymentFirst(String _value) {
    _InsuranceInfoPage4PaymentFirst.add(_value);
  }

  void removeFromInsuranceInfoPage4PaymentFirst(String _value) {
    _InsuranceInfoPage4PaymentFirst.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage4PaymentFirst(int _index) {
    _InsuranceInfoPage4PaymentFirst.removeAt(_index);
  }

  void updateInsuranceInfoPage4PaymentFirstAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _InsuranceInfoPage4PaymentFirst[_index] =
        updateFn(_InsuranceInfoPage4PaymentFirst[_index]);
  }

  void insertAtIndexInInsuranceInfoPage4PaymentFirst(
      int _index, String _value) {
    _InsuranceInfoPage4PaymentFirst.insert(_index, _value);
  }

  List<String> _InsuranceInfoPage4InstallmentFirstDue = [];
  List<String> get InsuranceInfoPage4InstallmentFirstDue =>
      _InsuranceInfoPage4InstallmentFirstDue;
  set InsuranceInfoPage4InstallmentFirstDue(List<String> _value) {
    _InsuranceInfoPage4InstallmentFirstDue = _value;
  }

  void addToInsuranceInfoPage4InstallmentFirstDue(String _value) {
    _InsuranceInfoPage4InstallmentFirstDue.add(_value);
  }

  void removeFromInsuranceInfoPage4InstallmentFirstDue(String _value) {
    _InsuranceInfoPage4InstallmentFirstDue.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage4InstallmentFirstDue(int _index) {
    _InsuranceInfoPage4InstallmentFirstDue.removeAt(_index);
  }

  void updateInsuranceInfoPage4InstallmentFirstDueAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _InsuranceInfoPage4InstallmentFirstDue[_index] =
        updateFn(_InsuranceInfoPage4InstallmentFirstDue[_index]);
  }

  void insertAtIndexInInsuranceInfoPage4InstallmentFirstDue(
      int _index, String _value) {
    _InsuranceInfoPage4InstallmentFirstDue.insert(_index, _value);
  }

  List<String> _InsuranceInfoPage4InstallmentLastDue = [];
  List<String> get InsuranceInfoPage4InstallmentLastDue =>
      _InsuranceInfoPage4InstallmentLastDue;
  set InsuranceInfoPage4InstallmentLastDue(List<String> _value) {
    _InsuranceInfoPage4InstallmentLastDue = _value;
  }

  void addToInsuranceInfoPage4InstallmentLastDue(String _value) {
    _InsuranceInfoPage4InstallmentLastDue.add(_value);
  }

  void removeFromInsuranceInfoPage4InstallmentLastDue(String _value) {
    _InsuranceInfoPage4InstallmentLastDue.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage4InstallmentLastDue(int _index) {
    _InsuranceInfoPage4InstallmentLastDue.removeAt(_index);
  }

  void updateInsuranceInfoPage4InstallmentLastDueAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _InsuranceInfoPage4InstallmentLastDue[_index] =
        updateFn(_InsuranceInfoPage4InstallmentLastDue[_index]);
  }

  void insertAtIndexInInsuranceInfoPage4InstallmentLastDue(
      int _index, String _value) {
    _InsuranceInfoPage4InstallmentLastDue.insert(_index, _value);
  }

  List<String> _InsuranceInfoPage4Tenor = [];
  List<String> get InsuranceInfoPage4Tenor => _InsuranceInfoPage4Tenor;
  set InsuranceInfoPage4Tenor(List<String> _value) {
    _InsuranceInfoPage4Tenor = _value;
  }

  void addToInsuranceInfoPage4Tenor(String _value) {
    _InsuranceInfoPage4Tenor.add(_value);
  }

  void removeFromInsuranceInfoPage4Tenor(String _value) {
    _InsuranceInfoPage4Tenor.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage4Tenor(int _index) {
    _InsuranceInfoPage4Tenor.removeAt(_index);
  }

  void updateInsuranceInfoPage4TenorAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _InsuranceInfoPage4Tenor[_index] =
        updateFn(_InsuranceInfoPage4Tenor[_index]);
  }

  void insertAtIndexInInsuranceInfoPage4Tenor(int _index, String _value) {
    _InsuranceInfoPage4Tenor.insert(_index, _value);
  }

  String _insuranceInfoPage4NetPremiumTotal = '';
  String get insuranceInfoPage4NetPremiumTotal =>
      _insuranceInfoPage4NetPremiumTotal;
  set insuranceInfoPage4NetPremiumTotal(String _value) {
    _insuranceInfoPage4NetPremiumTotal = _value;
  }

  String _insuranceInfoPage4GrossTotalNet = '';
  String get insuranceInfoPage4GrossTotalNet =>
      _insuranceInfoPage4GrossTotalNet;
  set insuranceInfoPage4GrossTotalNet(String _value) {
    _insuranceInfoPage4GrossTotalNet = _value;
  }

  String _insuranceInfoPage4ActTotal = '';
  String get insuranceInfoPage4ActTotal => _insuranceInfoPage4ActTotal;
  set insuranceInfoPage4ActTotal(String _value) {
    _insuranceInfoPage4ActTotal = _value;
  }

  String _insuranceInfoPage4FileLoanApplicationRegister = '';
  String get insuranceInfoPage4FileLoanApplicationRegister =>
      _insuranceInfoPage4FileLoanApplicationRegister;
  set insuranceInfoPage4FileLoanApplicationRegister(String _value) {
    _insuranceInfoPage4FileLoanApplicationRegister = _value;
  }

  String _insuranceInfoPage4ImageApplication = '';
  String get insuranceInfoPage4ImageApplication =>
      _insuranceInfoPage4ImageApplication;
  set insuranceInfoPage4ImageApplication(String _value) {
    _insuranceInfoPage4ImageApplication = _value;
  }

  String _insuranceInfoPage3ImageIdCard = '';
  String get insuranceInfoPage3ImageIdCard => _insuranceInfoPage3ImageIdCard;
  set insuranceInfoPage3ImageIdCard(String _value) {
    _insuranceInfoPage3ImageIdCard = _value;
  }

  String _insuranceInfoPage3ImageBluebook = '';
  String get insuranceInfoPage3ImageBluebook =>
      _insuranceInfoPage3ImageBluebook;
  set insuranceInfoPage3ImageBluebook(String _value) {
    _insuranceInfoPage3ImageBluebook = _value;
  }

  String _insuranceInfoPage3ImageExamination = '';
  String get insuranceInfoPage3ImageExamination =>
      _insuranceInfoPage3ImageExamination;
  set insuranceInfoPage3ImageExamination(String _value) {
    _insuranceInfoPage3ImageExamination = _value;
  }

  String _insuranceInfoPage3ImageFront = '';
  String get insuranceInfoPage3ImageFront => _insuranceInfoPage3ImageFront;
  set insuranceInfoPage3ImageFront(String _value) {
    _insuranceInfoPage3ImageFront = _value;
  }

  String _insuranceInfoPageImageRear = '';
  String get insuranceInfoPageImageRear => _insuranceInfoPageImageRear;
  set insuranceInfoPageImageRear(String _value) {
    _insuranceInfoPageImageRear = _value;
  }

  String _insuranceInfoPage3ImageLeft = '';
  String get insuranceInfoPage3ImageLeft => _insuranceInfoPage3ImageLeft;
  set insuranceInfoPage3ImageLeft(String _value) {
    _insuranceInfoPage3ImageLeft = _value;
  }

  String _insuranceInfoPage3ImageRight = '';
  String get insuranceInfoPage3ImageRight => _insuranceInfoPage3ImageRight;
  set insuranceInfoPage3ImageRight(String _value) {
    _insuranceInfoPage3ImageRight = _value;
  }

  String _insuranceInfoPage3ImageRightFront = '';
  String get insuranceInfoPage3ImageRightFront =>
      _insuranceInfoPage3ImageRightFront;
  set insuranceInfoPage3ImageRightFront(String _value) {
    _insuranceInfoPage3ImageRightFront = _value;
  }

  String _insuranceInfoPage3ImageRightRear = '';
  String get insuranceInfoPage3ImageRightRear =>
      _insuranceInfoPage3ImageRightRear;
  set insuranceInfoPage3ImageRightRear(String _value) {
    _insuranceInfoPage3ImageRightRear = _value;
  }

  String _insuranceInfoPage3ImageLeftFront = '';
  String get insuranceInfoPage3ImageLeftFront =>
      _insuranceInfoPage3ImageLeftFront;
  set insuranceInfoPage3ImageLeftFront(String _value) {
    _insuranceInfoPage3ImageLeftFront = _value;
  }

  String _insuranceInfoPage3ImageLeftRear = '';
  String get insuranceInfoPage3ImageLeftRear =>
      _insuranceInfoPage3ImageLeftRear;
  set insuranceInfoPage3ImageLeftRear(String _value) {
    _insuranceInfoPage3ImageLeftRear = _value;
  }

  String _insuranceInfoPage3ImageRoof = '';
  String get insuranceInfoPage3ImageRoof => _insuranceInfoPage3ImageRoof;
  set insuranceInfoPage3ImageRoof(String _value) {
    _insuranceInfoPage3ImageRoof = _value;
  }

  List<String> _insuranceInfoPage3ImageWound = [];
  List<String> get insuranceInfoPage3ImageWound =>
      _insuranceInfoPage3ImageWound;
  set insuranceInfoPage3ImageWound(List<String> _value) {
    _insuranceInfoPage3ImageWound = _value;
  }

  void addToInsuranceInfoPage3ImageWound(String _value) {
    _insuranceInfoPage3ImageWound.add(_value);
  }

  void removeFromInsuranceInfoPage3ImageWound(String _value) {
    _insuranceInfoPage3ImageWound.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage3ImageWound(int _index) {
    _insuranceInfoPage3ImageWound.removeAt(_index);
  }

  void updateInsuranceInfoPage3ImageWoundAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoPage3ImageWound[_index] =
        updateFn(_insuranceInfoPage3ImageWound[_index]);
  }

  void insertAtIndexInInsuranceInfoPage3ImageWound(int _index, String _value) {
    _insuranceInfoPage3ImageWound.insert(_index, _value);
  }

  List<String> _insuranceInfoPage3ImageAccessories = [];
  List<String> get insuranceInfoPage3ImageAccessories =>
      _insuranceInfoPage3ImageAccessories;
  set insuranceInfoPage3ImageAccessories(List<String> _value) {
    _insuranceInfoPage3ImageAccessories = _value;
  }

  void addToInsuranceInfoPage3ImageAccessories(String _value) {
    _insuranceInfoPage3ImageAccessories.add(_value);
  }

  void removeFromInsuranceInfoPage3ImageAccessories(String _value) {
    _insuranceInfoPage3ImageAccessories.remove(_value);
  }

  void removeAtIndexFromInsuranceInfoPage3ImageAccessories(int _index) {
    _insuranceInfoPage3ImageAccessories.removeAt(_index);
  }

  void updateInsuranceInfoPage3ImageAccessoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _insuranceInfoPage3ImageAccessories[_index] =
        updateFn(_insuranceInfoPage3ImageAccessories[_index]);
  }

  void insertAtIndexInInsuranceInfoPage3ImageAccessories(
      int _index, String _value) {
    _insuranceInfoPage3ImageAccessories.insert(_index, _value);
  }

  String _insuranceInfoPage3ImageOther = '';
  String get insuranceInfoPage3ImageOther => _insuranceInfoPage3ImageOther;
  set insuranceInfoPage3ImageOther(String _value) {
    _insuranceInfoPage3ImageOther = _value;
  }

  String _typeList = 'list';
  String get typeList => _typeList;
  set typeList(String _value) {
    _typeList = _value;
  }

  String _insuranceInfoPage4FirstPay = '';
  String get insuranceInfoPage4FirstPay => _insuranceInfoPage4FirstPay;
  set insuranceInfoPage4FirstPay(String _value) {
    _insuranceInfoPage4FirstPay = _value;
  }

  String _page5Tenor = '';
  String get page5Tenor => _page5Tenor;
  set page5Tenor(String _value) {
    _page5Tenor = _value;
  }

  String _insuranceInfoBrandId = '';
  String get insuranceInfoBrandId => _insuranceInfoBrandId;
  set insuranceInfoBrandId(String _value) {
    _insuranceInfoBrandId = _value;
  }

  String _insuarnceInfoModelId = '';
  String get insuarnceInfoModelId => _insuarnceInfoModelId;
  set insuarnceInfoModelId(String _value) {
    _insuarnceInfoModelId = _value;
  }

  String _insuranceInfoVehicleId = '';
  String get insuranceInfoVehicleId => _insuranceInfoVehicleId;
  set insuranceInfoVehicleId(String _value) {
    _insuranceInfoVehicleId = _value;
  }

  String _insuranceInfoVehicleName = '';
  String get insuranceInfoVehicleName => _insuranceInfoVehicleName;
  set insuranceInfoVehicleName(String _value) {
    _insuranceInfoVehicleName = _value;
  }

  bool _insuranceinfoFirstInAppStep1 = false;
  bool get insuranceinfoFirstInAppStep1 => _insuranceinfoFirstInAppStep1;
  set insuranceinfoFirstInAppStep1(bool _value) {
    _insuranceinfoFirstInAppStep1 = _value;
  }

  String _insuranceInfoPage5Document = '';
  String get insuranceInfoPage5Document => _insuranceInfoPage5Document;
  set insuranceInfoPage5Document(String _value) {
    _insuranceInfoPage5Document = _value;
  }

  String _searchList1 = '';
  String get searchList1 => _searchList1;
  set searchList1(String _value) {
    _searchList1 = _value;
  }

  String _page5VloanCustomerNo = '';
  String get page5VloanCustomerNo => _page5VloanCustomerNo;
  set page5VloanCustomerNo(String _value) {
    _page5VloanCustomerNo = _value;
  }

  String _insuranceInfoGrosstotalNet = '';
  String get insuranceInfoGrosstotalNet => _insuranceInfoGrosstotalNet;
  set insuranceInfoGrosstotalNet(String _value) {
    _insuranceInfoGrosstotalNet = _value;
  }

  String _insuranceInfoActFlag = '';
  String get insuranceInfoActFlag => _insuranceInfoActFlag;
  set insuranceInfoActFlag(String _value) {
    _insuranceInfoActFlag = _value;
  }

  String _nonePackageFlagOldVmi = '';
  String get nonePackageFlagOldVmi => _nonePackageFlagOldVmi;
  set nonePackageFlagOldVmi(String _value) {
    _nonePackageFlagOldVmi = _value;
  }

  String _nonePackageWorkType = '';
  String get nonePackageWorkType => _nonePackageWorkType;
  set nonePackageWorkType(String _value) {
    _nonePackageWorkType = _value;
  }

  String _insuranceInfoEffectiveDateAct = '';
  String get insuranceInfoEffectiveDateAct => _insuranceInfoEffectiveDateAct;
  set insuranceInfoEffectiveDateAct(String _value) {
    _insuranceInfoEffectiveDateAct = _value;
  }

  String _insuranceInfoBranchCode = '';
  String get insuranceInfoBranchCode => _insuranceInfoBranchCode;
  set insuranceInfoBranchCode(String _value) {
    _insuranceInfoBranchCode = _value;
  }

  String _insuranceInfoBranchNameOutput = '';
  String get insuranceInfoBranchNameOutput => _insuranceInfoBranchNameOutput;
  set insuranceInfoBranchNameOutput(String _value) {
    _insuranceInfoBranchNameOutput = _value;
  }

  dynamic _coverTypeJson = jsonDecode('null');
  dynamic get coverTypeJson => _coverTypeJson;
  set coverTypeJson(dynamic _value) {
    _coverTypeJson = _value;
  }

  String _insuranceinfoApplicationNo = '';
  String get insuranceinfoApplicationNo => _insuranceinfoApplicationNo;
  set insuranceinfoApplicationNo(String _value) {
    _insuranceinfoApplicationNo = _value;
  }

  String _page5DateNow = '';
  String get page5DateNow => _page5DateNow;
  set page5DateNow(String _value) {
    _page5DateNow = _value;
  }

  String _insuranceInfoEffectiveDateInsure = '';
  String get insuranceInfoEffectiveDateInsure =>
      _insuranceInfoEffectiveDateInsure;
  set insuranceInfoEffectiveDateInsure(String _value) {
    _insuranceInfoEffectiveDateInsure = _value;
  }

  String _nonePackageRemark = '';
  String get nonePackageRemark => _nonePackageRemark;
  set nonePackageRemark(String _value) {
    _nonePackageRemark = _value;
  }

  int _statusCodeUnSuccess = 500;
  int get statusCodeUnSuccess => _statusCodeUnSuccess;
  set statusCodeUnSuccess(int _value) {
    _statusCodeUnSuccess = _value;
  }

  dynamic _unsuccessStatusJson = jsonDecode('500');
  dynamic get unsuccessStatusJson => _unsuccessStatusJson;
  set unsuccessStatusJson(dynamic _value) {
    _unsuccessStatusJson = _value;
  }

  String _nonePackageBranchCode = '';
  String get nonePackageBranchCode => _nonePackageBranchCode;
  set nonePackageBranchCode(String _value) {
    _nonePackageBranchCode = _value;
  }

  String _nonePackageBranchName = '';
  String get nonePackageBranchName => _nonePackageBranchName;
  set nonePackageBranchName(String _value) {
    _nonePackageBranchName = _value;
  }

  String _nonePackageImageQuotationPdfUploaded = '';
  String get nonePackageImageQuotationPdfUploaded =>
      _nonePackageImageQuotationPdfUploaded;
  set nonePackageImageQuotationPdfUploaded(String _value) {
    _nonePackageImageQuotationPdfUploaded = _value;
  }

  List<String> _nonePackageInsurerShortNameDupList = [];
  List<String> get nonePackageInsurerShortNameDupList =>
      _nonePackageInsurerShortNameDupList;
  set nonePackageInsurerShortNameDupList(List<String> _value) {
    _nonePackageInsurerShortNameDupList = _value;
  }

  void addToNonePackageInsurerShortNameDupList(String _value) {
    _nonePackageInsurerShortNameDupList.add(_value);
  }

  void removeFromNonePackageInsurerShortNameDupList(String _value) {
    _nonePackageInsurerShortNameDupList.remove(_value);
  }

  void removeAtIndexFromNonePackageInsurerShortNameDupList(int _index) {
    _nonePackageInsurerShortNameDupList.removeAt(_index);
  }

  void updateNonePackageInsurerShortNameDupListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nonePackageInsurerShortNameDupList[_index] =
        updateFn(_nonePackageInsurerShortNameDupList[_index]);
  }

  void insertAtIndexInNonePackageInsurerShortNameDupList(
      int _index, String _value) {
    _nonePackageInsurerShortNameDupList.insert(_index, _value);
  }

  String _insuranceInfoPage5CMIDocUrl = '';
  String get insuranceInfoPage5CMIDocUrl => _insuranceInfoPage5CMIDocUrl;
  set insuranceInfoPage5CMIDocUrl(String _value) {
    _insuranceInfoPage5CMIDocUrl = _value;
  }

  String _insuranceInfoInsuranceLogo = '';
  String get insuranceInfoInsuranceLogo => _insuranceInfoInsuranceLogo;
  set insuranceInfoInsuranceLogo(String _value) {
    _insuranceInfoInsuranceLogo = _value;
  }

  List<String> _listSelectionPdfQuotation = [];
  List<String> get listSelectionPdfQuotation => _listSelectionPdfQuotation;
  set listSelectionPdfQuotation(List<String> _value) {
    _listSelectionPdfQuotation = _value;
  }

  void addToListSelectionPdfQuotation(String _value) {
    _listSelectionPdfQuotation.add(_value);
  }

  void removeFromListSelectionPdfQuotation(String _value) {
    _listSelectionPdfQuotation.remove(_value);
  }

  void removeAtIndexFromListSelectionPdfQuotation(int _index) {
    _listSelectionPdfQuotation.removeAt(_index);
  }

  void updateListSelectionPdfQuotationAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listSelectionPdfQuotation[_index] =
        updateFn(_listSelectionPdfQuotation[_index]);
  }

  void insertAtIndexInListSelectionPdfQuotation(int _index, String _value) {
    _listSelectionPdfQuotation.insert(_index, _value);
  }

  List<int> _listValuePdfQuotation = [];
  List<int> get listValuePdfQuotation => _listValuePdfQuotation;
  set listValuePdfQuotation(List<int> _value) {
    _listValuePdfQuotation = _value;
  }

  void addToListValuePdfQuotation(int _value) {
    _listValuePdfQuotation.add(_value);
  }

  void removeFromListValuePdfQuotation(int _value) {
    _listValuePdfQuotation.remove(_value);
  }

  void removeAtIndexFromListValuePdfQuotation(int _index) {
    _listValuePdfQuotation.removeAt(_index);
  }

  void updateListValuePdfQuotationAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _listValuePdfQuotation[_index] = updateFn(_listValuePdfQuotation[_index]);
  }

  void insertAtIndexInListValuePdfQuotation(int _index, int _value) {
    _listValuePdfQuotation.insert(_index, _value);
  }

  int _indexPdfQuotation = 0;
  int get indexPdfQuotation => _indexPdfQuotation;
  set indexPdfQuotation(int _value) {
    _indexPdfQuotation = _value;
  }

  int _lengthListPdfQuotation = 0;
  int get lengthListPdfQuotation => _lengthListPdfQuotation;
  set lengthListPdfQuotation(int _value) {
    _lengthListPdfQuotation = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
