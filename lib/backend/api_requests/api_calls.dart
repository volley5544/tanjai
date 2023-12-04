import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthenAPICall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiUrl = '1',
    String? fcmToken = '',
    String? uid = '',
    String? check = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}",
  "api_url": "${apiUrl}",
  "fcm_token": "${fcmToken}",
  "uid": "${uid}",
  "check": "${check}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authenAPI',
      apiUrl: '${apiUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.user.employee_id''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.user.branch_code''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CheckInAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckInAPI',
      apiUrl: '${apiUrl}/api/send-data/check-in',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class GetTimesheetAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetTimesheetAPI',
      apiUrl: '${apiUrl}/api/detail/timesheet',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].RecordId''',
      );
  static dynamic jobType(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Job_Type''',
      );
  static dynamic clockIn(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].ClockIn''',
      );
  static dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Latitude''',
      );
  static dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Longitude''',
      );
  static dynamic timesheetData(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data''',
      );
}

class GetApprovedAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? approvedTypes = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "approved_types": "${approvedTypes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getApprovedAPI',
      apiUrl: '${apiUrl}/api/leave/${approvedTypes}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic approvedID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic approvedEmpID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic approvedEmpName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
  static dynamic approvedLeaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic approvedLeaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic approvedLeaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic approvedLeavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic approvedLeaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic approvedLeaveDoc(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic approvedEmpTel(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic approvedLeaveCreateDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class SendResignFormEmailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? leaveDocId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "leave_doc_id": "${leaveDocId}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendResignFormEmailAPI',
      apiUrl: '${apiUrl}/api/leave/sendmail/${leaveDocId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
}

class TimesheetDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? pageName = '',
    String? recordId = '',
    String? editCheck = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "page_name": "${pageName}",
  "RecordId": "${recordId}",
  "editCheck": "${editCheck}",
  "Remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TimesheetDetailAPI',
      apiUrl: '${apiUrl}/api/detail/${pageName}/${recordId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].RecordId''',
      );
  static dynamic citizenID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].CitizenId''',
      );
  static dynamic customerName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Customer_Name''',
      );
  static dynamic landmark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Landmark''',
      );
  static dynamic remark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Remark''',
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Description''',
      );
  static dynamic contNo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].ContNo''',
      );
  static dynamic assetID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].AssetId''',
      );
  static dynamic matName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Material_Name''',
        true,
      );
  static dynamic matImg(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Img_Url''',
        true,
      );
  static dynamic material(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:]''',
        true,
      );
  static dynamic marketingBranchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Branch_Code''',
      );
  static dynamic marketingAreaDescription(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Area_Description''',
      );
  static dynamic marketingDetail(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Detail''',
      );
  static dynamic marketingRemark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Remark''',
      );
  static dynamic marketingRecordId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].RecordId''',
      );
  static dynamic statusDescription(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status_desc''',
      );
}

class GetUserProfileAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserProfileAPI',
      apiUrl: '${apiUrl}/api/user-profile',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic profileEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      );
  static dynamic profileFullName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      );
  static dynamic profileNickName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      );
  static dynamic profileHiredDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      );
  static dynamic profileServiceDurationYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      );
  static dynamic profileServiceDurationMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      );
  static dynamic profileServiceDurationDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      );
  static dynamic profileArea(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      );
  static dynamic profileRegion(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      );
  static dynamic profliePositionName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      );
  static dynamic profileBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      );
  static dynamic profileBirthDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static dynamic profilePositionAgeYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.year''',
      );
  static dynamic profilePositionAgeMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.month''',
      );
  static dynamic profilePositionAgeDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.day''',
      );
  static dynamic profilePositionAgeCheck(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].checkPositionAge''',
      );
  static dynamic profilePhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].MobileNumber''',
      );
  static dynamic profileFirstBossEmpID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeBefore''',
      );
  static dynamic profileFirstBossName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameBefore''',
      );
  static dynamic profileSecondBossEmpID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeAfter''',
      );
  static dynamic profileSecondBossName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameAfter''',
      );
  static dynamic profileLevel(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Level''',
      );
  static dynamic profileBranch(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Branch''',
      );
  static dynamic insurancePlan(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].InsurancePlan''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchCode''',
      );
  static dynamic department(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Department''',
      );
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class GetUserInsuranceLicenseCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserInsuranceLicense',
      apiUrl: '${apiUrl}/api/insurance/license-insurance-broker',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic jsonData(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo''',
      );
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic employeeId(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].EmployeeID''',
      );
  static dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].FullName''',
      );
  static dynamic idCard(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].IDCard''',
      );
  static dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].LicenseNumber''',
      );
  static dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].IssuuedDate''',
      );
  static dynamic expireDate(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].ExpirationDate''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.message''',
      );
}

class ActionUserAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'actionUserAPI',
      apiUrl: '${apiUrl}/api/action-user',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic profileEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      );
  static dynamic profileFullName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      );
  static dynamic profileNickName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      );
  static dynamic profileHiredDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      );
  static dynamic profileServiceDurationYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      );
  static dynamic profileServiceDurationMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      );
  static dynamic profileServiceDurationDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      );
  static dynamic profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static dynamic profileArea(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      );
  static dynamic profileRegion(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      );
  static dynamic profliePositionName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      );
  static dynamic profileBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      );
  static dynamic profileBirthDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetLeadDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadDetailAPI',
      apiUrl: '${apiUrl}/api/lead/getlead',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic connectStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic dataStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.status''',
      );
  static dynamic dataLeadID(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_id''',
        true,
      );
  static dynamic dataFirstName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].first_name''',
        true,
      );
  static dynamic dataPhoneNum(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].phone_number''',
        true,
      );
  static dynamic dataCallStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].call_status''',
        true,
      );
  static dynamic dataCreatedAt(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].created_at''',
        true,
      );
  static dynamic dataLeadChannel(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].channel''',
        true,
      );
  static dynamic dataEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].employee_id''',
        true,
      );
  static dynamic dataBranchCode(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_code''',
        true,
      );
  static dynamic dataBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_name''',
        true,
      );
  static dynamic dataMessage(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.message''',
      );
  static dynamic dataLevel(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.level''',
      );
  static dynamic connectionMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic countCalled(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].countCall''',
        true,
      );
  static dynamic firstName2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.first_name2''',
        true,
      );
  static dynamic phoneNumber2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.phone_number2''',
        true,
      );
  static dynamic lastName2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.last_name2''',
        true,
      );
  static dynamic descInfo(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info''',
        true,
      );
  static dynamic carVehicleName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].car_vehicle_name''',
        true,
      );
  static dynamic amountRequest(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      );
  static dynamic statusReason(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].statusCallOut''',
        true,
      );
  static dynamic contractStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].StatusContract''',
        true,
      );
  static dynamic contractDate(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].contract_date''',
        true,
      );
}

class GetWelfareKpiCurrentMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiCurrentMonthAPI',
      apiUrl: '${apiUrl}/api/incentive/incentive-current-month',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      );
  static dynamic percentSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      );
  static dynamic flagSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      );
  static dynamic percentTarget(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      );
  static dynamic branchDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      );
}

class GetWelfareKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? branchCode = '',
    String? branchType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "branchType": "${branchType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/incentive',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2CM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].status''',
      );
  static dynamic messageLayer2CM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].message''',
      );
  static dynamic statusLayer2LM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].status''',
      );
  static dynamic messageLayer2LM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].message''',
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchCode''',
      );
  static dynamic branchNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchName''',
      );
  static dynamic successPercentLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessPercent''',
      );
  static dynamic succesFlagLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessFlag''',
      );
  static dynamic targetSuccessLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].TargetPercent''',
      );
  static dynamic regionCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionCode''',
      );
  static dynamic regionNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionName''',
      );
  static dynamic areaCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaCode''',
      );
  static dynamic areaNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaName''',
      );
  static dynamic branchCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchCode''',
      );
  static dynamic branchNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchName''',
      );
  static dynamic successPercentCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessPercent''',
      );
  static dynamic succesFlagCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessFlag''',
      );
  static dynamic targetSuccessCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].TargetPercent''',
      );
  static dynamic regionCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionCode''',
      );
  static dynamic regionNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionName''',
      );
  static dynamic areaCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaCode''',
      );
  static dynamic areaNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaName''',
      );
  static dynamic branchDetailCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchDetail''',
      );
  static dynamic branchDetailLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchDetail''',
      );
}

class GetWelfareKpiLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiLastMonthAPI',
      apiUrl: '${apiUrl}/api/incentive/incentive-last-month',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      );
  static dynamic percentSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      );
  static dynamic flagSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      );
  static dynamic percentTarget(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      );
  static dynamic branchDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      );
}

class LeaveDayAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LeaveDayAPI',
      apiUrl: '${apiUrl}/api/leave/leave-day',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic connectStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic connectionMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic dateInfo(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic statusCheckCount(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].StatusCheckCount''',
        true,
      );
  static dynamic totalLeave(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TotalLeave''',
        true,
      );
  static dynamic countLeave(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].CountLeave''',
        true,
      );
  static dynamic leaveTypeDay(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveDay''',
        true,
      );
  static dynamic leaveTypeName(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveName''',
        true,
      );
  static dynamic leaveTypeId(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveID''',
        true,
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
}

class LogoutAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logoutAPI',
      apiUrl: '${apiUrl}/api/logout',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class SurveyAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? landmark = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "Landmark": "${landmark}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SurveyAPI',
      apiUrl: '${apiUrl}/api/send-data/survey',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class CollectionAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? contNo = '',
    String? apiUrl = '',
    String? vLoanServer = '',
    String? urlImg = '',
    String? branchLocation = '',
    String? branchName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "ContNo": "${contNo}",
  "api_url": "${apiUrl}",
  "VLoan_Server": "${vLoanServer}",
  "url_img": "${urlImg}",
  "Branch_Location": "${branchLocation}",
  "Branch_Name": "${branchName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CollectionAPI',
      apiUrl: '${apiUrl}/api/send-data/collection',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class CheckerAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? contNo = '',
    String? apiUrl = '',
    String? vLoanServer = '',
    String? urlImg = '',
    String? branchLocation = '',
    String? branchName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "ContNo": "${contNo}",
  "api_url": "${apiUrl}",
  "VLoan_Server": "${vLoanServer}",
  "url_img": "${urlImg}",
  "Branch_Location": "${branchLocation}",
  "Branch_Name": "${branchName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckerAPI ',
      apiUrl: '${apiUrl}/api/send-data/checker',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class GetMaterialAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMaterialAPI',
      apiUrl: '${apiUrl}/api/get-materials',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$[:].RecordId''',
      );
  static dynamic materialName(dynamic response) => getJsonField(
        response,
        r'''$[:].Material_Name''',
      );
  static dynamic imgUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].Img_Url''',
      );
}

class GetCheckinTimeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinTimeAPI',
      apiUrl: '${apiUrl}/api/check-in/getdate-time',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$[:].RecordId''',
      );
  static dynamic materialName(dynamic response) => getJsonField(
        response,
        r'''$[:].Material_Name''',
      );
  static dynamic imgUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].Img_Url''',
      );
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic checkinDate(dynamic response) => getJsonField(
        response,
        r'''$.info.Date''',
        true,
      );
  static dynamic checkinTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Time''',
        true,
      );
}

class MarketingAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
    String? branchCode = '',
    String? areaDescription = '',
    String? detail = '',
    String? materialRecordId = '',
    String? amount = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}",
  "Branch_Code": "${branchCode}",
  "Area_Description": "${areaDescription}",
  "Detail": "${detail}",
  "Material_RecordId": "${materialRecordId}",
  "Amount": "${amount}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MarketingAPI',
      apiUrl: '${apiUrl}/api/send-data/marketing',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class NpaAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
    String? assetId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}",
  "AssetId": "${assetId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'npaAPI',
      apiUrl: '${apiUrl}/api/send-data/survey-npa',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class OpsAPICall {
  static Future<ApiCallResponse> call({
    String? coordinate = '',
    String? branchCode = '',
    String? assetRef = '',
    String? assetType = '',
    String? assetDetail = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "coordinate": "${coordinate}",
  "branch_code": "${branchCode}",
  "asset_ref": "${assetRef}",
  "asset_type": "${assetType}",
  "asset_detail": "${assetDetail}",
  "remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'opsAPI',
      apiUrl:
          'https://efa0-122-154-11-110.ap.ngrok.io/Services/MobileService.asmx/Save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NpaCheckAssetIdAPICall {
  static Future<ApiCallResponse> call({
    String? assetid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "assetid": "${assetid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'npaCheckAssetIdAPI',
      apiUrl:
          'http://27.254.207.150:86/Services/MobileService.asmx/CheckAssetId',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic resultResponse(dynamic response) => getJsonField(
        response,
        r'''$.d''',
      );
}

class ListAPITestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'listAPITest',
      apiUrl: 'https://reqres.in/api/unknown',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
}

class GetVloanContractAPICall {
  static Future<ApiCallResponse> call({
    String? cuscod = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getVloanContractAPI',
      apiUrl: 'http://115.31.145.26/api/v1/branchview/contract',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic YnJhbmNodmlldzpidjEyMzQq',
      },
      params: {
        'func': "get_contract",
        'cuscod': cuscod,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic contNo(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[0]''',
        true,
      );
  static dynamic customerName(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[3]''',
        true,
      );
  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
  static dynamic vloanServer(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[4]''',
        true,
      );
}

class RemarkVLoneAPICall {
  static Future<ApiCallResponse> call({
    String? cuscod = '',
    String? lat = '',
    String? long = '',
    String? contno = '',
    String? server = '',
    String? msg = '',
    String? func = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'remarkVLoneAPI',
      apiUrl: 'http://115.31.145.26/api/v1/branchview/remark',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic YnJhbmNodmlldzpidjEyMzQq',
      },
      params: {
        'func': func,
        'cuscod': cuscod,
        'lat': lat,
        'long': long,
        'contno': contno,
        'server': server,
        'msg': msg,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
}

class GetlocationAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branch = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branch": "${branch}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetlocationAPI',
      apiUrl: '${apiUrl}/api/check-in/location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic group(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Group''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_CODE''',
        true,
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_NAME''',
        true,
      );
  static dynamic branchLat(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].LATITUDE''',
        true,
      );
  static dynamic branchLong(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].LONGITUDE''',
        true,
      );
  static dynamic branchRadius(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].RADIUS''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic statusLayer3(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetBranchAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branchCode": "${branchCode}",
  "api_url": "${apiUrl}",
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBranchAPI',
      apiUrl: '${apiUrl}/api/branchkpi/getbranch',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchCode''',
        true,
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchName''',
        true,
      );
  static dynamic regionCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].RegionCode''',
        true,
      );
  static dynamic regionName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].RegionName''',
        true,
      );
  static dynamic areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].AreaCode''',
        true,
      );
  static dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].AreaName''',
        true,
      );
  static dynamic groupCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].GroupCode''',
        true,
      );
  static dynamic branchSize(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchSize''',
        true,
      );
}

class GetRegionAreaAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchType = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branchType": "${branchType}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRegionAreaAPI',
      apiUrl: '${apiUrl}/api/branchkpi/getall-branch',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaCode''',
        true,
      );
  static dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaName''',
        true,
      );
  static dynamic areaType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].Type''',
        true,
      );
  static dynamic regionCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].RegionCode''',
        true,
      );
  static dynamic regionName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].RegionName''',
        true,
      );
  static dynamic regionType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].Type''',
        true,
      );
}

class GetEmployeeIdFromNicknameAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? searchName = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "searchName": "${searchName}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeeIdFromNicknameAPI',
      apiUrl: '${apiUrl}/api/branchkpi/searchname-getempcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].EmpCode''',
        true,
      );
  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].FirstName''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].LastName''',
        true,
      );
  static dynamic nickName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].NickName''',
        true,
      );
  static dynamic mapNickname(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].MapNickName''',
        true,
      );
  static dynamic branch(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].Brach''',
        true,
      );
  static dynamic getKeyWordName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].GetKeyWord''',
        true,
      );
  static dynamic detailMessage(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail''',
        true,
      );
}

class GetAllEmployeeAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? searchKeyname = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "search_keyname": "${searchKeyname}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllEmployeeAPI',
      apiUrl: '${apiUrl}/api/internal-service/get-list-name',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessages''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.message''',
      );
  static dynamic fullname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].FullName''',
        true,
      );
  static dynamic employeeId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].EmployeeCode''',
        true,
      );
  static dynamic workPosition(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].BranchCode''',
        true,
      );
}

class CheckinAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? latitude = '',
    String? urlImg = '',
    String? branch = '',
    String? token = '',
    String? longitude = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branch": "${branch}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "api_url": "${apiUrl}",
  "url_img": "${urlImg}",
  "remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckinAPI',
      apiUrl: '${apiUrl}/api/check-in/work-check',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic checkinMessage(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic massageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetDateTimeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDateTimeAPI',
      apiUrl: '${apiUrl}/api/check-in/getdate-time',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic currentDate(dynamic response) => getJsonField(
        response,
        r'''$.info.Date''',
      );
  static dynamic currentTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Time''',
      );
  static dynamic currentDateYMD(dynamic response) => getJsonField(
        response,
        r'''$.info.DateYMD''',
      );
}

class AddPhoneCalledLeadAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? leadID = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "leadID": "${leadID}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addPhoneCalledLeadAPI',
      apiUrl: '${apiUrl}/api/lead/call-out',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info[:].info''',
      );
  static dynamic countCalled(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CountCall''',
      );
}

class CheckinoutThisMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkinoutThisMonthAPI',
      apiUrl: '${apiUrl}/api/check-in/current-month',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic flagCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.flag''',
      );
  static dynamic listBranchCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      );
  static dynamic listTimeCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      );
  static dynamic listDateCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      );
  static dynamic listActionStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      );
  static dynamic listCheckinoutDate(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic workInStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      );
  static dynamic workInDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      );
  static dynamic workInTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      );
  static dynamic workOutStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      );
  static dynamic workOutDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      );
  static dynamic workOutTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      );
  static dynamic infoCheckCurrent(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      );
}

class CheckinoutLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkinoutLastMonthAPI',
      apiUrl: '${apiUrl}/api/check-in/last-month',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic flagCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.flag''',
      );
  static dynamic listBranchCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      );
  static dynamic listTimeCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      );
  static dynamic listDateCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      );
  static dynamic listActionStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      );
  static dynamic listCheckinoutDate(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic workInStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      );
  static dynamic workInDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      );
  static dynamic workInTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      );
  static dynamic workOutStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      );
  static dynamic workOutDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      );
  static dynamic workOutTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      );
}

class GetTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetContractKPIAPI',
      apiUrl: '${apiUrl}/api/actual/target-contract',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic positionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actualLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic monthLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
}

class GetEmpTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "empCode": "${empCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpTargetContractKPIAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-contract-empcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic positionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actualLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic monthLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic employeeIdTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
}

class GetTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetBudgetKPIAPI',
      apiUrl: '${apiUrl}/api/actual/target-budget-set',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      );
  static dynamic branchCodeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic areaGradeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      );
  static dynamic employeeIDLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
      );
}

class GetEmpTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "empCode": "${empCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpTargetBudgetKPIAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-amount-empcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeIdTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      );
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
      );
}

class GetTargetBudgetKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetBudgetKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-amount',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
}

class GetTargetContractKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetContractKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-contract',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
}

class TelePackageSearchAPICall {
  static Future<ApiCallResponse> call({
    String? brandCode = '',
    String? modelCode = '',
    String? year = '',
    String? province = '',
    String? carRegistration = '',
    String? driver = '',
    String? vehicleUsage = '',
    List<String>? companyIdList,
    String? coverType = '',
    String? apiUrl = '',
    String? insuranceUrl = '',
    String? garageType = '',
  }) async {
    final companyId = _serializeList(companyIdList);

    final ffApiRequestBody = '''
{
  "brand_code": "${brandCode}",
  "model_code": "${modelCode}",
  "year": "${year}",
  "vehicle_usage": "${vehicleUsage}",
  "cover_type": [${coverType}],
 "garage_type":[${garageType}]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'telePackageSearchAPI',
      apiUrl: '${insuranceUrl}/api/insurance/get_package',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic coverType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      );
  static dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic grossTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      );
  static dynamic expiryDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      );
  static dynamic pa(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      );
  static dynamic tppd(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      );
  static dynamic garageType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      );
  static dynamic brandCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      );
  static dynamic modelCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      );
  static dynamic actAmount(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      );
  static dynamic statusLayer1Message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      );
  static dynamic serialName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      );
  static dynamic tpbiPerson(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tpbi_person''',
        true,
      );
  static dynamic tpbiAccident(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tpbi_accident''',
        true,
      );
  static dynamic effectiveDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].effective_date''',
        true,
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic registrationYear(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].registration_year''',
        true,
      );
  static dynamic shortName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      );
  static dynamic companyId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      );
  static dynamic logo(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      );
  static dynamic accessory(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].assessory''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].id''',
        true,
      );
  static dynamic packageId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].package_id''',
        true,
      );
  static dynamic packageName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].package_name''',
        true,
      );
  static dynamic stamp(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].stamp''',
        true,
      );
  static dynamic vat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vat''',
        true,
      );
  static dynamic netPremium(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].net_premium''',
        true,
      );
  static dynamic seat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].seat''',
        true,
      );
  static dynamic roadsideAssistance(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].roadside_assistance''',
        true,
      );
  static dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].bb''',
        true,
      );
  static dynamic me(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].me''',
        true,
      );
  static dynamic flood(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].flood''',
        true,
      );
  static dynamic deductible(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].deductible''',
        true,
      );
  static dynamic contractProcessstate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].contractprocessstate''',
        true,
      );
}

class TelePackageSearchAPICopyCall {
  static Future<ApiCallResponse> call({
    String? brandCode = '',
    String? modelCode = '',
    String? year = '',
    String? province = '',
    String? carRegistration = '',
    String? driver = '',
    String? vehicleUsage = '',
    String? companyId = '',
    String? coverType = '',
    String? apiUrl = '',
    String? insuranceUrl = '',
    List<String>? garageTypeList,
  }) async {
    final garageType = _serializeList(garageTypeList);

    final ffApiRequestBody = '''
{
  "brand_code": "${brandCode}",
  "model_code": "${modelCode}",
  "year": "${year}",
  "vehicle_usage": "${vehicleUsage}",
  "cover_type": [
    ${coverType}
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'telePackageSearchAPI Copy',
      apiUrl: '${insuranceUrl}/api/insurance/get_package',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic coverType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      );
  static dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic grossTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      );
  static dynamic expiryDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      );
  static dynamic pa(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      );
  static dynamic tppd(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      );
  static dynamic garageType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      );
  static dynamic brandCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      );
  static dynamic modelCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      );
  static dynamic actAmount(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      );
  static dynamic statusLayer1Message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      );
  static dynamic serialName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      );
  static dynamic tpbiPerson(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tpbi_person''',
        true,
      );
  static dynamic tpbiAccident(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tpbi_accident''',
        true,
      );
  static dynamic effectiveDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].effective_date''',
        true,
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic registrationYear(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].registration_year''',
        true,
      );
  static dynamic shortName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      );
  static dynamic companyId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      );
  static dynamic logo(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      );
  static dynamic accessory(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].assessory''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].id''',
        true,
      );
  static dynamic packageId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].package_id''',
        true,
      );
  static dynamic packageName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].package_name''',
        true,
      );
  static dynamic stamp(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].stamp''',
        true,
      );
  static dynamic vat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vat''',
        true,
      );
  static dynamic netPremium(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].net_premium''',
        true,
      );
  static dynamic seat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].seat''',
        true,
      );
  static dynamic roadsideAssistance(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].roadside_assistance''',
        true,
      );
  static dynamic bb(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].bb''',
        true,
      );
  static dynamic me(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].me''',
        true,
      );
  static dynamic flood(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].flood''',
        true,
      );
  static dynamic deductible(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].deductible''',
        true,
      );
  static dynamic contractProcessstate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].contractprocessstate''',
        true,
      );
}

class TeleGetBrandAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetBrandAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_brands',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalBrand(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic brandID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      );
  static dynamic brandType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].type''',
        true,
      );
}

class TeleGetModelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{"api_url":"${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetModelAPI ',
      apiUrl: '${apiUrl}/api/insurance/master/get_models',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalModel(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic brandID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      );
  static dynamic modelCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      );
  static dynamic modelVehicleGroup(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].veh_group''',
        true,
      );
  static dynamic modelNubmerSeat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].no_seats''',
        true,
      );
  static dynamic modelEnginCapacity(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].engine_capacity''',
        true,
      );
  static dynamic modelWeight(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].weight''',
        true,
      );
}

class TeleGetInsurersAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetInsurersAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_insurers',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalInsurers(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic companyCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      );
  static dynamic companyShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      );
  static dynamic companyFullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic companyID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      );
}

class TeleGetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetProvinceAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_province',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      );
  static dynamic provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      );
  static dynamic provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      );
}

class TeleGetGarageTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetGarageTypeAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_garage_type',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      );
  static dynamic provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      );
  static dynamic provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      );
}

class TeleGetCoverTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetCoverTypeAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_cover_type',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic coverTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_name''',
        true,
      );
  static dynamic coverTypeCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      );
  static dynamic coverTypeId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_id''',
        true,
      );
}

class LeaveRequestFirstAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? leaveCountDay = '',
    String? leaveStartDate = '',
    String? leaveEndDate = '',
    String? leavePeriod = '',
    String? empTel = '',
    String? leaveReason = '',
    String? leaveDocument = '',
    String? reasonResign = '',
    String? otherReasonResign = '',
    String? willComeBack = '',
    String? address = '',
    String? province = '',
    String? district = '',
    String? subdistrict = '',
    String? postcode = '',
    String? asset = '',
    String? otherAsset = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "leave_count_day": "${leaveCountDay}",
  "leave_start_date": "${leaveStartDate}",
  "leave_end_date": "${leaveEndDate}",
  "leave_period": "${leavePeriod}",
  "emp_tel": "${empTel}",
  "leave_reason": "${leaveReason}",
  "leave_document": "${leaveDocument}",
  "reason_resign": "${reasonResign}",
  "other_reason_resign": "${otherReasonResign}",
  "will_come_back": "${willComeBack}",
  "address": "${address}",
  "province": "${province}",
  "district": "${district}",
  "subdistrict": "${subdistrict}",
  "postcode": "${postcode}",
  "asset": "${asset}",
  "other_asset": "${otherAsset}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveRequestFirstAPI',
      apiUrl: '${apiUrl}/api/leave/leave-request/1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoMessage(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class LeaveEditAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? leaveCountDay = '',
    String? leaveStartDate = '',
    String? leaveEndDate = '',
    String? leavePeriod = '',
    String? empTel = '',
    String? leaveReason = '',
    String? leaveDocument = '',
    String? leaveListId = '',
    String? reasonResign = '',
    String? otherReasonResign = '',
    String? willComeBack = '',
    String? address = '',
    String? province = '',
    String? district = '',
    String? subdistrict = '',
    String? postcode = '',
    String? asset = '',
    String? otherAsset = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "leave_count_day": "${leaveCountDay}",
  "leave_start_date": "${leaveStartDate}",
  "leave_end_date": "${leaveEndDate}",
  "leave_period": "${leavePeriod}",
  "emp_tel": "${empTel}",
  "leave_reason": "${leaveReason}",
  "leave_document": "${leaveDocument}",
  "leave_list_id": "${leaveListId}",
  "reason_resign": "${reasonResign}",
  "other_reason_resign": "${otherReasonResign}",
  "will_come_back": "${willComeBack}",
  "address": "${address}",
  "province": "${province}",
  "district": "${district}",
  "subdistrict": "${subdistrict}",
  "postcode": "${postcode}",
  "asset": "${asset}",
  "other_asset": "${otherAsset}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveEditAPI ',
      apiUrl: '${apiUrl}/api/leave/leave-list/${leaveListId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoMessage(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class LeaveListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic headBefore(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      );
  static dynamic headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic headAfter(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic checkEdit(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ResignListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resignListAPI',
      apiUrl: '${apiUrl}/api/leave/resign-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic headBefore(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      );
  static dynamic headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveStartDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDateStart''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic headAfter(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic checkEdit(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      );
  static dynamic otherAsset(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].OtherAsset''',
        true,
      );
  static dynamic asset(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Asset''',
        true,
      );
  static dynamic postCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].PostCode''',
        true,
      );
  static dynamic subDistrict(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].SubDistrict''',
        true,
      );
  static dynamic district(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].District''',
        true,
      );
  static dynamic province(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Province''',
        true,
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Address''',
        true,
      );
  static dynamic flagComback(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FlagComeBack''',
        true,
      );
  static dynamic otherReasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].OtherReasonResign''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
  static dynamic cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      );
  static dynamic leaveDateEnd(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDateEnd''',
        true,
      );
}

class LeaveListAprroveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAprroveAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list-approve',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic leaveUserName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
  static dynamic empIdBoss1(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Username_O''',
      );
  static dynamic fcmBoss1(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Head_O''',
      );
  static dynamic empIdBoss2(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Username_T''',
      );
  static dynamic fcmBoss2(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Head_T''',
      );
  static dynamic massageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic nickName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].NickName''',
        true,
      );
  static dynamic department(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].Department''',
        true,
      );
}

class LeaveListAprroveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAprroveTwoAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list-approve-two',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic leaveUserName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
}

class LeaveListCancelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? reasonCancel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "reason_cancel": "${reasonCancel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListCancelAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list/${leaveId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.detail''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class LeaveFlagApproveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "flagApprove": "${flagApprove}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveFlagApproveAPI',
      apiUrl: '${apiUrl}/api/leave/leave-approve/${leaveId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class SendFCMNotificationAPICall {
  static Future<ApiCallResponse> call({
    String? to = '',
    dynamic? notificationJson,
    dynamic? dataJson,
  }) async {
    final notification = _serializeJson(notificationJson);
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "to": "${to}",
  "notification": ${notification},
  "data": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendFCMNotificationAPI',
      apiUrl: 'https://fcm.googleapis.com/fcm/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'key=AAAAWEYHwRs:APA91bG7ezsMWzUoITp6S--2hs3LdrivYaMprdAPl42YdwC1CIu6e8FkOSOGhbtJvaYkdCIjsKBU_U76PKM-bhrwWrPJQy3gHg3ZSi6Uqb76XIuNSh-lIPQ_rloc5wXnTlQlzbaWUSpk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic failure(dynamic response) => getJsonField(
        response,
        r'''$.failure''',
      );
  static dynamic errerMessage(dynamic response) => getJsonField(
        response,
        r'''$.results[:].error''',
      );
  static dynamic messageID(dynamic response) => getJsonField(
        response,
        r'''$.results[:].message_id''',
      );
}

class LeaveFlagApproveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "flagApprove": "${flagApprove}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveFlagApproveTwoAPI',
      apiUrl: '${apiUrl}/api/leave/leave-approve-two/${leaveId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class GetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetProvinceAPI',
      apiUrl: '${apiUrl}/api/province-master/get-province',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic provCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      );
  static dynamic provName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvName''',
        true,
      );
}

class ChangeLocationAPICall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? flag = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "flag": "${flag}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeLocationAPI',
      apiUrl: '${apiUrl}/api/hr-management/change-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.status''',
      );
  static dynamic oldLat(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.info[:].LATITUDE''',
      );
  static dynamic oldLng(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.info[:].LONGITUDE''',
      );
  static dynamic statusConfirm(dynamic response) => getJsonField(
        response,
        r'''$.returnDataToEdit.status''',
      );
  static dynamic messageView(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.message''',
      );
  static dynamic messageEdit(dynamic response) => getJsonField(
        response,
        r'''$.returnDataToEdit.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.info[:].BRANCH_NAME''',
      );
}

class InsertLocationAPICall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? token = '',
    String? branchName = '',
    String? groupCode = '',
    String? regionCode = '',
    String? radius = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "branch_code": "${branchCode}",
  "token": "${token}",
  "branch_name": "${branchName}",
  "group_code": "${groupCode}",
  "region_code": "${regionCode}",
  "radius": "${radius}",
  "area_code": "${areaCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InsertLocationAPI',
      apiUrl: '${apiUrl}/api/hr-management/insert-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.returnDataInsert.status''',
      );
  static dynamic statusMessage(dynamic response) => getJsonField(
        response,
        r'''$.returnDataInsert.message''',
      );
}

class GetBossAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetBossAPI',
      apiUrl: '${apiUrl}/api/checkhead/getcheck',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic bossCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetHolidayAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetHolidayAPI',
      apiUrl: '${apiUrl}/api/holiday/get-holiday',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic holidayDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].DATE_OF_YEAR''',
        true,
      );
  static dynamic holidayName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NAME_TH''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetLeaveDateCheckinAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLeaveDateCheckinAPI',
      apiUrl: '${apiUrl}/api/leave/check-leave',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.message''',
      );
  static dynamic statusLayer3CM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.status''',
      );
  static dynamic messageLayer3CM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.message''',
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.message''',
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Employee''',
        true,
      );
  static dynamic fullnameLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].FullName''',
        true,
      );
  static dynamic leaveTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].LeaveType''',
        true,
      );
  static dynamic countDayLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].CountDay''',
        true,
      );
  static dynamic startLeaveDateLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].StartDate''',
        true,
      );
  static dynamic endLeaveDateLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].EndDate''',
        true,
      );
  static dynamic subLeaveTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Type''',
        true,
      );
  static dynamic employeeIdCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Employee''',
        true,
      );
  static dynamic fullnameCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].FullName''',
        true,
      );
  static dynamic leaveTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].LeaveType''',
        true,
      );
  static dynamic countDayCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].CountDay''',
        true,
      );
  static dynamic startLeaveDateCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].StartDate''',
        true,
      );
  static dynamic endLeaveDateCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].EndDate''',
        true,
      );
  static dynamic subLeaveTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Type''',
        true,
      );
}

class GetDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? provCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "provCode": "${provCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetDistrictAPI',
      apiUrl: '${apiUrl}/api/province-master/get-district/${provCode}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic provCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      );
  static dynamic postCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].PostCode''',
        true,
      );
  static dynamic districtName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictName''',
        true,
      );
  static dynamic districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetLeadCalledStatusDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadChannel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadChannel": "${leadChannel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadCalledStatusDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/statuscall',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic callStatusId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      );
  static dynamic channel(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Channel''',
        true,
      );
  static dynamic callStatusType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusType''',
        true,
      );
  static dynamic callStatusCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusCode''',
        true,
      );
  static dynamic callStatusName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusName''',
        true,
      );
}

class GetLeadCalledHistoryAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadID": "${leadID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadCalledHistoryAPI',
      apiUrl: '${apiUrl}/api/lead/call-history',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
  static dynamic callStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallStatus''',
        true,
      );
  static dynamic reasonName(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryReasonName''',
        true,
      );
  static dynamic note(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryNote''',
        true,
      );
  static dynamic callTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallTime''',
        true,
      );
  static dynamic historyStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryStatus''',
        true,
      );
  static dynamic employeeId(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryUserID''',
        true,
      );
}

class SaveCallStatusAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
    String? statusCallID = '',
    String? reasonID = '',
    String? reasonDetail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadID": "${leadID}",
  "statusCall_ID": "${statusCallID}",
  "reason_ID": "${reasonID}",
  "reasonDetail": "${reasonDetail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveCallStatusAPI',
      apiUrl: '${apiUrl}/api/lead/save-call',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info[:].info''',
      );
  static dynamic callStatus(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.call''',
      );
  static dynamic callStatusReason(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callStatus''',
      );
  static dynamic statusReasonDetail(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callReason''',
      );
}

class GetLeadReasonCallDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? callStatusId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "call_status_id": "${callStatusId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadReasonCallDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/reasoncall/${callStatusId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic callStatusId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      );
  static dynamic reasonId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ReasonID''',
        true,
      );
  static dynamic reasonName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ReasonName''',
        true,
      );
}

class GetSubDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? districtCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "districtCode": "${districtCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetSubDistrictAPI',
      apiUrl: '${apiUrl}/api/province-master/get-sub-district/${districtCode}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      );
  static dynamic subName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].SubDistrictName''',
        true,
      );
  static dynamic subCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].SubDistrictCode''',
        true,
      );
}

class ThaipaiboonAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'thaipaiboonAPI',
      apiUrl: '${apiUrl}/api/insurance/thaipaiboon',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Date''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic statuslayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic groupCampaign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].GroupCampaign''',
        true,
      );
  static dynamic premiums(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Premiums''',
        true,
      );
  static dynamic noOfPolicy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NoOfPolicy''',
        true,
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
        true,
      );
}

class GetUniversalTimeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUniversalTime',
      apiUrl: 'http://worldtimeapi.org/api/timezone/Asia/Bangkok',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic unixTime(dynamic response) => getJsonField(
        response,
        r'''$.unixtime''',
      );
  static dynamic dateTime(dynamic response) => getJsonField(
        response,
        r'''$.datetime''',
      );
  static dynamic dateTime1(dynamic response) => getJsonField(
        response,
        r'''$.utc_datetime''',
      );
}

class GetCheckinImgUrlApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinImgUrlApi',
      apiUrl: 'https://40dd-223-27-201-20.ngrok-free.app/api/get',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$[:].time''',
        true,
      );
  static dynamic dateFlag(dynamic response) => getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      );
}

class GetCheckinImgUrlUrlApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinImgUrlUrlApi',
      apiUrl: 'https://40dd-223-27-201-20.ngrok-free.app/api/get1',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$[:].time''',
        true,
      );
  static dynamic dateFlag(dynamic response) => getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      );
}

class InsuranceRequestSendEmailAPICall {
  static Future<ApiCallResponse> call({
    String? carBrandId = '',
    String? carBrandName = '',
    String? carModelId = '',
    String? carModelName = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? driverType = '',
    String? carProvinceCode = '',
    String? carProvinceName = '',
    String? idNumber = '',
    String? carRegistration = '',
    String? carRegistrationYear = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? idType = '',
    String? branchCode = '',
    String? apiUrl = '',
    List<String>? insurerCodeList,
    List<String>? insurerIdList,
    List<String>? insurerNameList,
    List<String>? insurerShortNameList,
    List<String>? coverTypeIdList,
    List<String>? coverTypeCodeList,
    List<String>? coverTypeNameList,
    List<String>? garageTypeIdList,
    List<String>? garageTypeNameList,
    String? companyName = '',
    String? flgRenew = '',
    String? oldVMIPolicyNumber = '',
    String? flgDecoration = '',
    String? decorationDetail = '',
    String? flgCarrier = '',
    String? flgCoOrg = '',
    String? carrierType = '',
    String? carrierPrice = '',
    String? customerType = '',
    String? trailerCarRegistration = '',
    String? carrierPropose = '',
    String? remark = '',
    String? carType = '',
    String? customerMemberchip = '',
    String? truckPart = '',
    String? flgAct = '',
    String? sumInsured = '',
    String? trailerSumInsured = '',
    String? truckCurrentPrice = '',
    String? token = '',
    List<String>? garageTypeCodeList,
    String? oldVMIExpriedDate = '',
    String? reason = '',
    String? imageIdcard = '',
    String? oldVMIImage = '',
    String? imageCompanyBook = '',
    String? imageFront = '',
    String? imageRightfront = '',
    String? imageRight = '',
    String? imageRightrear = '',
    String? imageRear = '',
    String? imageLeftrear = '',
    String? imageLeft = '',
    String? imageLeftfront = '',
    String? imageRoof = '',
    String? imageFrontTrailer = '',
    String? imageRightfrontTrailer = '',
    String? imageRightTrailer = '',
    String? imageRightrearTrailer = '',
    String? imageRearTrailer = '',
    String? imageLeftrearTrailer = '',
    String? imageLeftTrailer = '',
    String? imageLeftfrontTrailer = '',
    String? imageBluebook = '',
    String? imageOther1 = '',
    String? imageOther2 = '',
    String? imageOther3 = '',
    String? imageOther4 = '',
    String? imageOther5 = '',
    String? branchName = '',
    String? ownerId = '',
    String? ownerName = '',
  }) async {
    final insurerCode = _serializeList(insurerCodeList);
    final insurerId = _serializeList(insurerIdList);
    final insurerName = _serializeList(insurerNameList);
    final insurerShortName = _serializeList(insurerShortNameList);
    final coverTypeId = _serializeList(coverTypeIdList);
    final coverTypeCode = _serializeList(coverTypeCodeList);
    final coverTypeName = _serializeList(coverTypeNameList);
    final garageTypeId = _serializeList(garageTypeIdList);
    final garageTypeName = _serializeList(garageTypeNameList);
    final garageTypeCode = _serializeList(garageTypeCodeList);

    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestSendEmailAPI',
      apiUrl: '${apiUrl}/api/manual-insurance/save',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'car_brand_id': carBrandId,
        'car_brand_name': carBrandName,
        'car_model_id': carModelId,
        'car_model_name': carModelName,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'driver_type': driverType,
        'car_province_code': carProvinceCode,
        'car_province_name': carProvinceName,
        'id_number': idNumber,
        'car_registration': carRegistration,
        'car_registration_year': carRegistrationYear,
        'vehicle_id': vehicleId,
        'vehicle_code': vehicleCode,
        'vehicle_name': vehicleName,
        'id_type': idType,
        'branch_code': branchCode,
        'api_url': apiUrl,
        'insurer_code': insurerCode,
        'insurer_id': insurerId,
        'insurer_name': insurerName,
        'insurer_short_name': insurerShortName,
        'cover_type_id': coverTypeId,
        'cover_type_code': coverTypeCode,
        'cover_type_name': coverTypeName,
        'garage_type_id': garageTypeId,
        'garage_type_name': garageTypeName,
        'company_name': companyName,
        'flg_renew': flgRenew,
        'old_VMI_policyNumber': oldVMIPolicyNumber,
        'flg_decoration': flgDecoration,
        'decoration_detail': decorationDetail,
        'flg_carrier': flgCarrier,
        'flg_co_org': flgCoOrg,
        'carrier_type': carrierType,
        'carrier_price': carrierPrice,
        'customer_type': customerType,
        'trailer_car_registration': trailerCarRegistration,
        'carrier_propose': carrierPropose,
        'remark': remark,
        'car_type': carType,
        'customer_memberchip': customerMemberchip,
        'truck_part': truckPart,
        'flg_act': flgAct,
        'sum_insured': sumInsured,
        'trailer_sum_insured': trailerSumInsured,
        'truck_current_price': truckCurrentPrice,
        'garage_type_code': garageTypeCode,
        'old_VMI_expriedDate': oldVMIExpriedDate,
        'reason': reason,
        'image_idcard': imageIdcard,
        'old_VMI_image': oldVMIImage,
        'image_company_book': imageCompanyBook,
        'image_front': imageFront,
        'image_rightfront': imageRightfront,
        'image_right': imageRight,
        'image_rightrear': imageRightrear,
        'image_rear': imageRear,
        'image_leftrear': imageLeftrear,
        'image_left': imageLeft,
        'image_leftfront': imageLeftfront,
        'image_roof': imageRoof,
        'image_front_trailer': imageFrontTrailer,
        'image_rightfront_trailer': imageRightfrontTrailer,
        'image_right_trailer': imageRightTrailer,
        'image_rightrear_trailer': imageRightrearTrailer,
        'image_rear_trailer': imageRearTrailer,
        'image_leftrear_trailer': imageLeftrearTrailer,
        'image_left_trailer': imageLeftTrailer,
        'image_leftfront_trailer': imageLeftfrontTrailer,
        'image_bluebook': imageBluebook,
        'image_other1': imageOther1,
        'image_other2': imageOther2,
        'image_other3': imageOther3,
        'image_other4': imageOther4,
        'image_other5': imageOther5,
        'branch_name': branchName,
        'owner_id': ownerId,
        'owner_name': ownerName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic resultInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
      );
}

class GetNonePackageHistoryAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? quotationId = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getNonePackageHistoryAPI',
      apiUrl: '${apiUrl}/api/lead/get-history',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.total''',
      );
  static dynamic quotationId(dynamic response) => getJsonField(
        response,
        r'''$.results[:].quotation_id''',
        true,
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results[:].status''',
        true,
      );
  static dynamic reasonName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].reason_name''',
        true,
      );
  static dynamic updateAt(dynamic response) => getJsonField(
        response,
        r'''$.results[:].updated_at''',
        true,
      );
  static dynamic updaterName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name_th''',
        true,
      );
}

class InsuranceRequestSendEmailAPICopyCall {
  static Future<ApiCallResponse> call({
    String? carBrandId = '',
    String? carBrandName = '',
    String? carModelId = '',
    String? carModelName = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? driverType = '',
    String? carProvinceCode = '',
    String? carProvinceName = '',
    String? idNumber = '',
    String? carRegistration = '',
    String? carRegistrationYear = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? idType = '',
    String? branchCode = '',
    FFUploadedFile? imageFront,
    FFUploadedFile? imageRear,
    FFUploadedFile? imageLeft,
    FFUploadedFile? imageRight,
    FFUploadedFile? imageRightfront,
    FFUploadedFile? imageRightrear,
    FFUploadedFile? imageLeftfront,
    FFUploadedFile? imageLeftrear,
    FFUploadedFile? imageRoof,
    FFUploadedFile? imageApplication,
    FFUploadedFile? imageIdcard,
    FFUploadedFile? imageBluebook,
    FFUploadedFile? imageExamination,
    FFUploadedFile? imageOther1,
    String? apiUrl = '',
    FFUploadedFile? imageOther2,
    FFUploadedFile? imageOther3,
    FFUploadedFile? imageOther4,
    FFUploadedFile? imageOther5,
    List<String>? insurerCodeList,
    List<String>? insurerIdList,
    List<String>? insurerNameList,
    List<String>? insurerShortNameList,
    List<String>? coverTypeIdList,
    List<String>? coverTypeCodeList,
    List<String>? coverTypeNameList,
    List<String>? garageTypeIdList,
    List<String>? garageTypeNameList,
    String? companyName = '',
    String? flgRenew = '',
    String? oldVMIPolicyNumber = '',
    String? flgDecoration = '',
    String? decorationDetail = '',
    String? flgCarrier = '',
    String? flgCoOrg = '',
    String? carrierType = '',
    String? carrierPrice = '',
    String? customerType = '',
    String? trailerCarRegistration = '',
    String? carrierPropose = '',
    String? remark = '',
    FFUploadedFile? imageFrontTrailer,
    FFUploadedFile? imageRearTrailer,
    FFUploadedFile? imageLeftTrailer,
    FFUploadedFile? imageRightTrailer,
    FFUploadedFile? imageRightfrontTrailer,
    FFUploadedFile? imageRightrearTrailer,
    FFUploadedFile? imageLeftfrontTrailer,
    FFUploadedFile? imageLeftrearTrailer,
    FFUploadedFile? imageRoofTrailer,
    String? carType = '',
    String? customerMemberchip = '',
    String? truckPart = '',
    String? flgAct = '',
    String? sumInsured = '',
    String? trailerSumInsured = '',
    String? truckCurrentPrice = '',
    String? token = '',
  }) async {
    final insurerCode = _serializeList(insurerCodeList);
    final insurerId = _serializeList(insurerIdList);
    final insurerName = _serializeList(insurerNameList);
    final insurerShortName = _serializeList(insurerShortNameList);
    final coverTypeId = _serializeList(coverTypeIdList);
    final coverTypeCode = _serializeList(coverTypeCodeList);
    final coverTypeName = _serializeList(coverTypeNameList);
    final garageTypeId = _serializeList(garageTypeIdList);
    final garageTypeName = _serializeList(garageTypeNameList);

    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestSendEmailAPI Copy',
      apiUrl: '${apiUrl}/api/manual-insurance/save',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'car_brand_id': carBrandId,
        'car_brand_name': carBrandName,
        'car_model_id': carModelId,
        'car_model_name': carModelName,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'driver_type': driverType,
        'car_province_code': carProvinceCode,
        'car_province_name': carProvinceName,
        'id_number': idNumber,
        'car_registration': carRegistration,
        'car_registration_year': carRegistrationYear,
        'vehicle_id': vehicleId,
        'vehicle_code': vehicleCode,
        'vehicle_name': vehicleName,
        'id_type': idType,
        'branch_code': branchCode,
        'image_front': imageFront,
        'image_rear': imageRear,
        'image_left': imageLeft,
        'image_right': imageRight,
        'image_rightfront': imageRightfront,
        'image_rightrear': imageRightrear,
        'image_leftfront': imageLeftfront,
        'image_leftrear': imageLeftrear,
        'image_roof': imageRoof,
        'image_application': imageApplication,
        'image_idcard': imageIdcard,
        'image_bluebook': imageBluebook,
        'image_examination': imageExamination,
        'image_other1': imageOther1,
        'api_url': apiUrl,
        'image_other2': imageOther2,
        'image_other3': imageOther3,
        'image_other4': imageOther4,
        'image_other5': imageOther5,
        'insurer_code': insurerCode,
        'insurer_id': insurerId,
        'insurer_name': insurerName,
        'insurer_short_name': insurerShortName,
        'cover_type_id': coverTypeId,
        'cover_type_code': coverTypeCode,
        'cover_type_name': coverTypeName,
        'garage_type_id': garageTypeId,
        'garage_type_name': garageTypeName,
        'company_name': companyName,
        'flg_renew': flgRenew,
        'old_VMI_policyNumber': oldVMIPolicyNumber,
        'flg_decoration': flgDecoration,
        'decoration_detail': decorationDetail,
        'flg_carrier': flgCarrier,
        'flg_co_org': flgCoOrg,
        'carrier_type': carrierType,
        'carrier_price': carrierPrice,
        'customer_type': customerType,
        'trailer_car_registration': trailerCarRegistration,
        'carrier_propose': carrierPropose,
        'remark': remark,
        'image_front_trailer': imageFrontTrailer,
        'image_rear_trailer': imageRearTrailer,
        'image_left_trailer': imageLeftTrailer,
        'image_right_trailer': imageRightTrailer,
        'image_rightfront_trailer': imageRightfrontTrailer,
        'image_rightrear_trailer': imageRightrearTrailer,
        'image_leftfront_trailer': imageLeftfrontTrailer,
        'image_leftrear_trailer': imageLeftrearTrailer,
        'image_roof_trailer': imageRoofTrailer,
        'car_type': carType,
        'customer_memberchip': customerMemberchip,
        'truck_part': truckPart,
        'flg_act': flgAct,
        'sum_insured': sumInsured,
        'trailer_sum_insured': trailerSumInsured,
        'truck_current_price': truckCurrentPrice,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic resultInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
      );
}

class InsuranceRequestEditAPICall {
  static Future<ApiCallResponse> call({
    String? imageFront = '',
    String? imageRear = '',
    String? imageLeft = '',
    String? imageRight = '',
    String? imageRightfront = '',
    String? imageRightrear = '',
    String? imageLeftfront = '',
    String? imageLeftrear = '',
    String? imageRoof = '',
    String? imageIdcard = '',
    String? imageBluebook = '',
    String? imageOther1 = '',
    String? apiUrl = '',
    String? imageOther2 = '',
    String? imageOther3 = '',
    String? imageOther4 = '',
    String? imageOther5 = '',
    String? insurerShortName = '',
    String? imageFrontTrailer = '',
    String? imageRearTrailer = '',
    String? imageLeftTrailer = '',
    String? imageRightTrailer = '',
    String? imageRightfrontTrailer = '',
    String? imageRightrearTrailer = '',
    String? imageLeftfrontTrailer = '',
    String? imageLeftrearTrailer = '',
    String? token = '',
    String? leadId = '',
    String? leadNo = '',
    String? imageOtherName = '',
    String? oldVMIImage = '',
    String? imageCompanyBook = '',
    String? checkEdit = '',
    String? branchCode = '',
    String? branchName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestEditAPI',
      apiUrl: '${apiUrl}/api/manual-insurance/edit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'image_front': imageFront,
        'image_rear': imageRear,
        'image_left': imageLeft,
        'image_right': imageRight,
        'image_rightfront': imageRightfront,
        'image_rightrear': imageRightrear,
        'image_leftfront': imageLeftfront,
        'image_leftrear': imageLeftrear,
        'image_roof': imageRoof,
        'image_idcard': imageIdcard,
        'image_bluebook': imageBluebook,
        'image_other1': imageOther1,
        'api_url': apiUrl,
        'image_other2': imageOther2,
        'image_other3': imageOther3,
        'image_other4': imageOther4,
        'image_other5': imageOther5,
        'insurer_short_name': insurerShortName,
        'image_front_trailer': imageFrontTrailer,
        'image_rear_trailer': imageRearTrailer,
        'image_left_trailer': imageLeftTrailer,
        'image_right_trailer': imageRightTrailer,
        'image_rightfront_trailer': imageRightfrontTrailer,
        'image_rightrear_trailer': imageRightrearTrailer,
        'image_leftfront_trailer': imageLeftfrontTrailer,
        'image_leftrear_trailer': imageLeftrearTrailer,
        'lead_id': leadId,
        'lead_no': leadNo,
        'image_other_name': imageOtherName,
        'old_VMI_image': oldVMIImage,
        'image_company_book': imageCompanyBook,
        'check_edit': checkEdit,
        'branch_code': branchCode,
        'branch_name': branchName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic resultInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
      );
}

class InsuranceRequestListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? ownerId = '',
    String? mode = '',
    String? list = '',
  }) async {
    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}",
  "mode": "${mode}",
  "list": "${list}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestListAPI',
      apiUrl: '${apiUrl}/api/lead/get-lead-list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic listTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic leadId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      );
  static dynamic leadNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      );
  static dynamic leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      );
  static dynamic lastname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      );
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      );
  static dynamic customerType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      );
  static dynamic flagRenew(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      );
  static dynamic coverTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      );
  static dynamic resultsData(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
        true,
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].created_at''',
        true,
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_status''',
        true,
      );
  static dynamic quotationDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_date''',
        true,
      );
  static dynamic quotationType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_type''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image''',
        true,
      );
  static dynamic stampAct(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].stamp_act''',
        true,
      );
  static dynamic applicationType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].application_type''',
        true,
      );
  static dynamic netPremium(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].net_premium''',
        true,
      );
  static dynamic garageTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].garage_type_name''',
        true,
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
        true,
      );
  static dynamic insurerShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].insurer_short_name''',
        true,
      );
  static dynamic insurerName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].insurer_name''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].title_th''',
        true,
      );
  static dynamic netPremiumTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].net_premium_total''',
        true,
      );
  static dynamic waitingInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_waiting_info''',
      );
  static dynamic waitingCar(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_waiting_car''',
      );
  static dynamic approve(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_approve''',
      );
  static dynamic notApprove(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_not_approve''',
      );
  static dynamic payment(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_payment''',
      );
  static dynamic cancle(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_cancle''',
      );
  static dynamic auto(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.auto''',
      );
  static dynamic manual(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.manual''',
      );
  static dynamic expireDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].expire_date''',
        true,
      );
  static dynamic expireCheck(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].expire_date_check''',
        true,
      );
  static dynamic applicationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].application_status''',
        true,
      );
  static dynamic grossTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].gross_total''',
        true,
      );
  static dynamic flagExpired(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flag_expired''',
        true,
      );
  static dynamic quotationId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_id''',
        true,
      );
  static dynamic waitingInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo''',
        true,
      );
  static dynamic waitingCarList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.waitingCar''',
        true,
      );
  static dynamic paymentList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.payments''',
        true,
      );
  static dynamic notApproveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.notApprove''',
        true,
      );
  static dynamic approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      );
  static dynamic insurerNameInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo[:].insurer_name''',
        true,
      );
  static dynamic quotationNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_no''',
        true,
      );
  static dynamic oldVMIFlg(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_flg''',
        true,
      );
  static dynamic cancleList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.cancle''',
        true,
      );
  static dynamic refundList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.refund''',
        true,
      );
  static dynamic refund(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_refund''',
      );
  static dynamic refundSuccess(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_refund_success''',
      );
  static dynamic refundSuccessList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.refund_success''',
        true,
      );
}

class InsuranceRequestListAPIDashBoardCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadId = '',
    String? mode = '',
    String? list = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lead_id": "${leadId}",
  "mode": "${mode}",
  "list": "${list}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestListAPIDashBoard',
      apiUrl: '${apiUrl}/api/lead/get-lead-by-id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic listTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic leadId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      );
  static dynamic leadNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      );
  static dynamic leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      );
  static dynamic lastname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      );
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      );
  static dynamic customerType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      );
  static dynamic flagRenew(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      );
  static dynamic coverTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      );
  static dynamic resultsData(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
        true,
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].created_at''',
        true,
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_status''',
        true,
      );
  static dynamic quotationDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_date''',
        true,
      );
  static dynamic quotationType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_type''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image''',
        true,
      );
  static dynamic stampAct(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].stamp_act''',
        true,
      );
  static dynamic applicationType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].application_type''',
        true,
      );
  static dynamic netPremium(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].net_premium''',
        true,
      );
  static dynamic garageTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].garage_type_name''',
        true,
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
        true,
      );
  static dynamic insurerShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].insurer_short_name''',
        true,
      );
  static dynamic insurerName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].insurer_name''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].title_th''',
        true,
      );
  static dynamic netPremiumTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].net_premium_total''',
        true,
      );
  static dynamic waitingInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_waiting_info''',
      );
  static dynamic waitingCar(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_waiting_car''',
      );
  static dynamic approve(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_approve''',
      );
  static dynamic notApprove(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_not_approve''',
      );
  static dynamic payment(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_payment''',
      );
  static dynamic cancle(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.status_cancle''',
      );
  static dynamic auto(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.auto''',
      );
  static dynamic manual(dynamic response) => getJsonField(
        response,
        r'''$.results.counting.manual''',
      );
  static dynamic expireDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].expire_date''',
        true,
      );
  static dynamic expireCheck(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].expire_date_check''',
        true,
      );
  static dynamic applicationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].application_status''',
        true,
      );
  static dynamic grossTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].gross_total''',
        true,
      );
  static dynamic flagExpired(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flag_expired''',
        true,
      );
  static dynamic quotationId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_id''',
        true,
      );
  static dynamic waitingInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo''',
        true,
      );
  static dynamic waitingCarList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.waitingCar''',
        true,
      );
  static dynamic paymentList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.payments''',
        true,
      );
  static dynamic notApproveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.notApprove''',
        true,
      );
  static dynamic approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      );
  static dynamic insurerNameInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo[:].insurer_name''',
        true,
      );
  static dynamic quotationNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation_no''',
        true,
      );
}

class SaveInsurerAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? insurerShortName = '',
    String? netPremium = '',
    String? accessoryTotal = '',
    String? actAmount = '',
    String? leadId = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurer_short_name": "${insurerShortName}",
  "net_premium": "${netPremium}",
  "accessory_total": "${accessoryTotal}",
  "act_amount": "${actAmount}",
  "lead_id": "${leadId}",
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveInsurerAPI',
      apiUrl: '${apiUrl}/api/manual-insurance/save-insurer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.info.statusCode''',
      );
  static dynamic massageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.info.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic massageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
}

class InsuranceRequestDetailAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lead_id": "${leadId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestDetailAPI',
      apiUrl: '${apiUrl}/api/lead/get-lead-detail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic leadId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
      );
  static dynamic leadNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
      );
  static dynamic leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].first_name''',
      );
  static dynamic lastname(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].last_name''',
      );
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
      );
  static dynamic customerType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
      );
  static dynamic flagRenew(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
      );
  static dynamic idCardNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].id_number''',
      );
  static dynamic carType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_type''',
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_brand_name''',
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_model_name''',
      );
  static dynamic province(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_province_name''',
      );
  static dynamic plateNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_registration''',
      );
  static dynamic year(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_registration_year''',
      );
  static dynamic vehicleCode(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].vehicle_code''',
      );
  static dynamic vehicleName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].vehicle_name''',
      );
  static dynamic vehicleId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].vehicle_id''',
      );
  static dynamic flagDecoration(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_decoration''',
      );
  static dynamic decorationDetail(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].decoration_detail''',
      );
  static dynamic flagCarrier(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_carrier''',
      );
  static dynamic flagCoop(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_co_org''',
      );
  static dynamic carrierType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].carrier_type''',
      );
  static dynamic carrierPrice(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].carrier_price''',
      );
  static dynamic remark(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].remark''',
      );
  static dynamic flagAct(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].flg_act''',
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
      );
  static dynamic insurerNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_name''',
        true,
      );
  static dynamic coverTypeNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_name''',
        true,
      );
  static dynamic garageTypeNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_name''',
        true,
      );
  static dynamic leadDetailId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].lead_dtl_id''',
        true,
      );
  static dynamic insurerShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_short_name''',
        true,
      );
  static dynamic imageFrontList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front''',
        true,
      );
  static dynamic imageRearList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear''',
        true,
      );
  static dynamic imageLeftList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left''',
        true,
      );
  static dynamic imageRightList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right''',
        true,
      );
  static dynamic imageRightFrontList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront''',
        true,
      );
  static dynamic imageRightRearList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear''',
        true,
      );
  static dynamic imageLeftFrontList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront''',
        true,
      );
  static dynamic imageLeftRearList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear''',
        true,
      );
  static dynamic imageRoofList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof''',
        true,
      );
  static dynamic imageFrontTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front_trailer''',
        true,
      );
  static dynamic imageRearTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear_trailer''',
        true,
      );
  static dynamic imageLeftTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left_trailer''',
        true,
      );
  static dynamic imageRightTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right_trailer''',
        true,
      );
  static dynamic imageRightFrontTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront_trailer''',
        true,
      );
  static dynamic imageRightRearTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear_trailer''',
        true,
      );
  static dynamic imageLeftFrontTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront_trailer''',
        true,
      );
  static dynamic imageLeftRearTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear_trailer''',
        true,
      );
  static dynamic imageRoofTrailerList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof_trailer''',
        true,
      );
  static dynamic imageBluebookList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_bluebook''',
        true,
      );
  static dynamic imageIdCardList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_idcard''',
        true,
      );
  static dynamic imageOtherList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other''',
        true,
      );
  static dynamic oldVmiPolicyNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_policyNumber''',
      );
  static dynamic truckPart(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].truck_part''',
      );
  static dynamic customerMemberchip(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].customer_memberchip''',
      );
  static dynamic trailerPlateNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_car_registration''',
      );
  static dynamic carrierPropose(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].carrier_propose''',
      );
  static dynamic trailerSumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_sum_insured''',
      );
  static dynamic truckCurrentPrice(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].truck_current_price''',
      );
  static dynamic imageOtherName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other_name''',
        true,
      );
  static dynamic quotationNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_no''',
      );
  static dynamic quotationDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_date''',
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_status''',
      );
  static dynamic quotataionType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_type''',
      );
  static dynamic oldVmiExpriedDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_expriedDate''',
      );
  static dynamic idType(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].id_type''',
      );
  static dynamic carBrandId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_brand_id''',
      );
  static dynamic carModelId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_model_id''',
      );
  static dynamic carProvinceCode(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].car_province_code''',
      );
  static dynamic imageRear(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image_rear''',
      );
  static dynamic imageRight(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image_right''',
      );
  static dynamic imageLeftRear(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image_leftrear''',
      );
  static dynamic imageIdCard(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image_idcard''',
      );
  static dynamic imageOther(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].image_other''',
        true,
      );
  static dynamic oldVmiImage(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_image''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].branch_code''',
      );
  static dynamic coverTypeId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_id''',
        true,
      );
  static dynamic coverTypeCode(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_code''',
        true,
      );
  static dynamic garageTypeId(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_id''',
        true,
      );
  static dynamic imageCompanyBook(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_company_book''',
        true,
      );
  static dynamic imageOldVmi(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].old_VMI_image''',
        true,
      );
  static dynamic oldVmiPolicyNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_policyNumber''',
      );
  static dynamic pldVmiExpDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_expriedDate''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].branch_name''',
      );
  static dynamic reason(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].reason''',
      );
  static dynamic garageTypeCodeList(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_code''',
        true,
      );
  static dynamic insurerStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_status''',
        true,
      );
  static dynamic insurerRemark(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_remark''',
        true,
      );
}

class InsuranceRequestGetVehicleAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? vehicleCategory = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vehicle_category": "${vehicleCategory}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestGetVehicleAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_vehicle',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic vehicleId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vehicle_id''',
        true,
      );
  static dynamic vehicleCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vehicle_code''',
        true,
      );
  static dynamic vehicleName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vehicle_name''',
        true,
      );
  static dynamic vehicletype(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].vehicle_type''',
        true,
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class InsuranceRequestGetInsurerAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestGetInsurerAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_insurers_all',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic companyId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      );
  static dynamic companyCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      );
  static dynamic companyShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      );
  static dynamic companyFullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic companyListName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].list_name''',
        true,
      );
  static dynamic insurerLogo(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      );
}

class GetAddressMasterCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAddressMaster',
      apiUrl: '${insuranceUrl}/api/insurance/master/get_zipcode',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic keyword(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].keyword''',
        true,
      );
  static dynamic zipcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].zip_code''',
        true,
      );
  static dynamic subdistrictname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].subdistrict_name''',
        true,
      );
  static dynamic subdistrictid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].subdistrict_id''',
        true,
      );
  static dynamic districtname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].district_name''',
        true,
      );
  static dynamic districtid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].district_id''',
        true,
      );
  static dynamic provincename(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].province_name''',
        true,
      );
  static dynamic provinceid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].province_id''',
        true,
      );
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class GetLicenseListCall {
  static Future<ApiCallResponse> call({
    String? flagGet = '',
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "flag_get": "${flagGet}",
  "insurance_url": "${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLicenseList',
      apiUrl: '${insuranceUrl}/api/insurance/master/get_license_list',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic mobilephone(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].mobile_phone''',
        true,
      );
  static dynamic expireddate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].expired_date''',
        true,
      );
  static dynamic licenseid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].license_id''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].lastName''',
        true,
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].firstname''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].title''',
        true,
      );
  static dynamic employeeid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].employee_id''',
        true,
      );
  static dynamic branchcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].branch_code''',
        true,
      );
}

class GetFinanceCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinance',
      apiUrl: '${insuranceUrl}/api/insurance/master/get_finance',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic financeid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].finance_id''',
        true,
      );
  static dynamic beneficiaryname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].beneficiary_name''',
        true,
      );
}

class GetPrefixCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPrefix',
      apiUrl: '${insuranceUrl}/api/insurance/master/get_prefix',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic titlethid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].title_th_id''',
        true,
      );
  static dynamic titleth(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].title_th''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].description''',
        true,
      );
}

class GetVMICall {
  static Future<ApiCallResponse> call({
    String? url = '',
    String? ownerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetVMI',
      apiUrl: '${url}/api/insurance/master/getVMI',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic massageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic massageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic leadIdList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].lead_id''',
        true,
      );
  static dynamic firstNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].first_name''',
        true,
      );
  static dynamic lastNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].last_name''',
        true,
      );
  static dynamic insurerNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].insurer_name''',
        true,
      );
  static dynamic insurerShortNameList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].insurer_short_name''',
        true,
      );
  static dynamic quotationIdList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].quotation_id''',
        true,
      );
  static dynamic createdAtList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].created_at''',
        true,
      );
  static dynamic netPremiumTotalList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].gross_total''',
        true,
      );
  static dynamic expireDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].expire_date''',
        true,
      );
  static dynamic quotationType(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].quotation_type''',
        true,
      );
  static dynamic quotationTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation.total''',
      );
  static dynamic flgRenew(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].flg_renew''',
        true,
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].quotation_status''',
        true,
      );
  static dynamic dateFullText(dynamic response) => getJsonField(
        response,
        r'''$.results.info.current_time.date_full_text''',
      );
  static dynamic monthText(dynamic response) => getJsonField(
        response,
        r'''$.results.info.current_time.month_text''',
      );
  static dynamic oldVMIFlg(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation[*].old_VMI_flg''',
        true,
      );
  static dynamic approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      );
  static dynamic approve(dynamic response) => getJsonField(
        response,
        r'''$.results.info.count.status_approve''',
      );
}

class ConfirmLeadStatusCall {
  static Future<ApiCallResponse> call({
    String? url = '',
    String? leadId = '',
    String? token = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lead_id": "${leadId}",
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConfirmLeadStatus',
      apiUrl: '${url}/api/lead/comfirm-leads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
  static dynamic massageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusMessage''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic massageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
}

class GetProfileImageCall {
  static Future<ApiCallResponse> call({
    String? employeeCode = '',
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "employeeCode": "${employeeCode}",
"insurance_url":"${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getProfileImage',
      apiUrl: 'https://dev.swpfin.com/firestore/get-profile/${employeeCode}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imgProfile(dynamic response) => getJsonField(
        response,
        r'''$.data.img_profile''',
      );
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.statusCode''',
      );
}

class IbsQuotationsSaveCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? phoneNumber = '',
    String? carType = '',
    String? carRegistration = '',
    String? driverType = '',
    String? carRegistrationYear = '',
    String? carBrandId = '',
    String? carBrandName = '',
    String? carModelName = '',
    String? carModelId = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? ownerName = '',
    String? ownerPhone = '',
    String? branchCode = '',
    String? branchName = '',
    dynamic? insurerPackageJson,
    String? insuranceUrl = '',
    String? lastName = '',
    String? token = '',
    String? ownerId = '',
  }) async {
    final insurerPackage = _serializeJson(insurerPackageJson);
    final ffApiRequestBody = '''
{"owner_id":"${ownerId}",
"token":"${token}",
  "first_name": "${firstName}",
  "phone_number": "${phoneNumber}",
  "car_type": "${carType}",
  "car_registration": "${carRegistration}",
  "driver_type": "${driverType}",
  "car_registration_year": "${carRegistrationYear}",
  "car_brand_id": "${carBrandId}",
  "car_brand_name": "${carBrandName}",
  "car_model_name": "${carModelName}",
  "car_model_id": "${carModelId}",
  "vehicle_id": "${vehicleId}",
  "vehicle_code": "${vehicleCode}",
  "vehicle_name": "${vehicleName}",
  "owner_name": "${ownerName}",
  "owner_phone": "${ownerPhone}",
  "branch_code": "${branchCode}",
  "branch_name": "${branchName}",
  "insurer_package": ${insurerPackage},
  "insurance_url": "${insuranceUrl}",
  "last_name": "${lastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsQuotationsSave',
      apiUrl: '${insuranceUrl}/api/quotations/save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic leads(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads''',
      );
  static dynamic leadid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads.lead_id''',
      );
  static dynamic detail(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail''',
        true,
      );
  static dynamic leaddtlid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail[:].lead_dtl_id''',
        true,
      );
  static dynamic insurershortname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail[:].insurer_short_name''',
        true,
      );
  static dynamic covertypecode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail[:].cover_type_code''',
        true,
      );
  static dynamic garagetypecode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail[:].garage_type_code''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail[:].url''',
        true,
      );
  static dynamic quotationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation.quotation_id''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation.quotation_status''',
      );
  static dynamic urlCompare(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads.url''',
      );
}

class IbsApplicationsSaveCall {
  static Future<ApiCallResponse> call({
    String? action = '',
    String? quotationId = '',
    String? leadDtlId = '',
    String? idTypeId = '',
    String? nationalThaiId = '',
    String? gender = '',
    String? titleThId = '',
    String? titleTh = '',
    String? firstNameTh = '',
    String? lastNameTh = '',
    String? birthDay = '',
    String? occupationId = '',
    String? occupationCode = '',
    String? occupationName = '',
    String? occupationSubcode = '',
    String? occupationSubname = '',
    String? mobile1 = '',
    String? mobile2 = '',
    String? email1 = '',
    dynamic? addressJson,
    String? carType = '',
    String? brandId = '',
    String? brandName = '',
    String? modelId = '',
    String? modelName = '',
    String? carRegistration = '',
    String? registrationYear = '',
    String? makeYear = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? bodyNumber = '',
    String? engineNumber = '',
    String? seat = '',
    String? cc = '',
    String? weight = '',
    String? driverType = '',
    String? accessoryFlg = '',
    String? actFlg = '',
    String? beneficiaryName = '',
    String? imageExamination = '',
    String? imageBluebook = '',
    String? imageIdcard = '',
    String? imageOther = '',
    String? imageWound1 = '',
    String? imageWound2 = '',
    String? imageWound3 = '',
    String? imageWound4 = '',
    String? imageWound5 = '',
    String? imageWound6 = '',
    String? imageAccessories1 = '',
    String? imageAccessories2 = '',
    String? imageAccessories3 = '',
    String? imageAccessories4 = '',
    String? imageAccessories5 = '',
    String? imageAccessories6 = '',
    String? imageFront = '',
    String? imageRear = '',
    String? imageLeft = '',
    String? imageRight = '',
    String? imageRightfront = '',
    String? imageRightrear = '',
    String? imageLeftfront = '',
    String? imageLeftrear = '',
    String? imageRoof = '',
    String? insuranceUrl = '',
    String? imageWound = '',
    String? imageAccessories = '',
    String? step = '',
    String? paymentType = '',
    String? imageApplication = '',
    String? fileLoanApplicationRegister = '',
    String? branchCode = '',
    String? branchName = '',
    String? employeeCodeLicense = '',
    String? employeeFirstnameLicense = '',
    String? employeeLastnameLicense = '',
    String? employeeBranchLicense = '',
    String? employeeLicenseIDLicense = '',
    String? employeeLicenseImgLicense = '',
    String? employeeLicenseExpLicense = '',
    String? registrationCode = '',
    String? registrationProvince = '',
    String? employeePhoneNumberLicense = '',
    String? token = '',
    String? carProvinceName = '',
    String? carProvinceCode = '',
    String? quotationType = '',
    String? flgCarrier = '',
    String? flgCoOrg = '',
    String? carrierType = '',
    String? carrierPrice = '',
    String? truckPart = '',
    String? customerMemberchip = '',
    String? carrierPropose = '',
    String? truckCurrentPrice = '',
    String? trailerCarRegistration = '',
    String? trailerSumInsured = '',
    String? imageFrontTrailer = '',
    String? imageRightfrontTrailer = '',
    String? imageRightTrailer = '',
    String? imageRightrearTrailer = '',
    String? imageRearTrailer = '',
    String? imageLeftrearTrailer = '',
    String? imageLeftTrailer = '',
    String? imageLeftfrontTrailer = '',
    String? sensitiveConsent = '',
    String? privacyConsent = '',
    String? sanctionConsent = '',
    String? accessoryTotal = '',
    String? customerType = '',
    String? flgRenew = '',
    String? imageCompanyBook = '',
    String? oldVMIImage = '',
    String? oldVMIExpriedDate = '',
    String? oldVMIPolicyNumber = '',
    String? effectiveDateAct = '',
    String? effectiveDateInsure = '',
    String? imageQuotationInsurer = '',
  }) async {
    final address = _serializeJson(addressJson);
    final ffApiRequestBody = '''
{
  "image_quotation_insurer": "${imageQuotationInsurer}",
  "effective_date_insure": "${effectiveDateInsure}",
  "effective_date_act": "${effectiveDateAct}",
  "customer_type": "${customerType}",
  "flg_renew": "${flgRenew}",
  "image_company_book": "${imageCompanyBook}",
  "old_VMI_image": "${oldVMIImage}",
  "old_VMI_expriedDate": "${oldVMIExpriedDate}",
  "old_VMI_policyNumber": "${oldVMIPolicyNumber}",
  "accessory_total": "${accessoryTotal}",
  "sensitive_consent": "${sensitiveConsent}",
  "privacy_consent": "${privacyConsent}",
  "sanction_consent": "${sanctionConsent}",
  "image_front_trailer": "${imageFrontTrailer}",
  "image_rightfront_trailer": "${imageRightfrontTrailer}",
  "image_right_trailer": "${imageRightTrailer}",
  "image_rightrear_trailer": "${imageRightrearTrailer}",
  "image_rear_trailer": "${imageRearTrailer}",
  "image_leftrear_trailer": "${imageLeftrearTrailer}",
  "image_left_trailer": "${imageLeftTrailer}",
  "image_leftfront_trailer": "${imageLeftfrontTrailer}",
  "flg_carrier": "${flgCarrier}",
  "flg_co_org": "${flgCoOrg}",
  "carrier_type": "${carrierType}",
  "carrier_price": "${carrierPrice}",
  "truck_part": "${truckPart}",
  "customer_memberchip": "${customerMemberchip}",
  "carrier_propose": "${carrierPropose}",
  "truck_current_price": "${truckCurrentPrice}",
  "trailer_car_registration": "${trailerCarRegistration}",
  "trailer_sum_insured": "${trailerSumInsured}",
  "quotation_type": "${quotationType}",
  "car_province_code": "${carProvinceCode}",
  "car_province_name": "${carProvinceName}",
  "token": "${token}",
  "employee_phone_number_license": "${employeePhoneNumberLicense}",
  "registration_province": "${registrationProvince}",
  "registration_code": "${registrationCode}",
  "employee_licenseExp_license": "${employeeLicenseExpLicense}",
  "employee_licenseImg_license": "${employeeLicenseImgLicense}",
  "employee_licenseID_license": "${employeeLicenseIDLicense}",
  "employee_code_license": "${employeeCodeLicense}",
  "employee_firstname_license": "${employeeFirstnameLicense}",
  "employee_lastname_license": "${employeeLastnameLicense}",
  "employee_branch_license": "${employeeBranchLicense}",
  "branch_code": "${branchCode}",
  "branch_name": "${branchName}",
  "file_loan_application_register": "${fileLoanApplicationRegister}",
  "image_application": "${imageApplication}",
  "payment_type": "${paymentType}",
  "step": "${step}",
  "image_wound": "${imageWound}",
  "image_accessories": "${imageAccessories}",
  "insurance_url": "${insuranceUrl}",
  "model_name": "${modelName}",
  "car_registration": "${carRegistration}",
  "registration_year": "${registrationYear}",
  "make_year": "${makeYear}",
  "vehicle_id": "${vehicleId}",
  "vehicle_code": "${vehicleCode}",
  "vehicle_name": "${vehicleName}",
  "occupation_name": "${occupationName}",
  "occupation_subcode": "${occupationSubcode}",
  "occupation_subname": "${occupationSubname}",
  "mobile1": "${mobile1}",
  "mobile2": "${mobile2}",
  "email1": "${email1}",
  "address": ${address},
  "car_type": "${carType}",
  "brand_id": "${brandId}",
  "brand_name": "${brandName}",
  "model_id": "${modelId}",
  "body_number": "${bodyNumber}",
  "engine_number": "${engineNumber}",
  "seat": "${seat}",
  "cc": "${cc}",
  "weight": "${weight}",
  "driver_type": "${driverType}",
  "accessory_flg": "${accessoryFlg}",
  "act_flg": "${actFlg}",
  "beneficiary_name": "${beneficiaryName}",
  "image_examination": "${imageExamination}",
  "image_bluebook": "${imageBluebook}",
  "image_idcard": "${imageIdcard}",
  "image_other": "${imageOther}",
  "image_wound1": "${imageWound1}",
  "image_wound2": "${imageWound2}",
  "image_wound3": "${imageWound3}",
  "image_wound4": "${imageWound4}",
  "image_wound5": "${imageWound5}",
  "image_wound6": "${imageWound6}",
  "image_accessories1": "${imageAccessories1}",
  "image_accessories2": "${imageAccessories2}",
  "image_accessories3": "${imageAccessories3}",
  "image_accessories4": "${imageAccessories4}",
  "image_accessories5": "${imageAccessories5}",
  "image_accessories6": "${imageAccessories6}",
  "image_front": "${imageFront}",
  "image_rear": "${imageRear}",
  "image_left": "${imageLeft}",
  "image_right": "${imageRight}",
  "image_rightfront": "${imageRightfront}",
  "image_rightrear": "${imageRightrear}",
  "image_leftfront": "${imageLeftfront}",
  "image_leftrear": "${imageLeftrear}",
  "image_roof": "${imageRoof}",
  "action": "${action}",
  "quotation_id": "${quotationId}",
  "lead_dtl_id": "${leadDtlId}",
  "id_type_id": "${idTypeId}",
  "national_thai_id": "${nationalThaiId}",
  "gender": "${gender}",
  "title_th_id": "${titleThId}",
  "title_th": "${titleTh}",
  "first_name_th": "${firstNameTh}",
  "last_name_th": "${lastNameTh}",
  "birth_day": "${birthDay}",
  "occupation_id": "${occupationId}",
  "occupation_code": "${occupationCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsApplicationsSave',
      apiUrl: '${insuranceUrl}/api/applications/save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationshistory(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotations_history''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      );
  static dynamic quotationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_id''',
      );
  static dynamic documentsid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.application.document.documents_id''',
      );
  static dynamic applicationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.application.application_id''',
      );
  static dynamic paymentstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.payment_status''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.status''',
      );
  static dynamic netpremiumtotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.net_premium_total''',
      );
  static dynamic grosstotalnet(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.gross_total_net''',
      );
  static dynamic paymentfirst(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.installment[:].payment_first''',
        true,
      );
  static dynamic installmentlastdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_last_due''',
        true,
      );
  static dynamic installmentfirstdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_first_due''',
        true,
      );
  static dynamic tenor(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.installment[:].tenor''',
        true,
      );
  static dynamic acttotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.act_total''',
      );
  static dynamic paymentchannel(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.payment_channel''',
      );
  static dynamic paymenttype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.payment_type''',
      );
  static dynamic fileapplication(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].file_application''',
      );
}

class IbsApplicationsDetailCall {
  static Future<ApiCallResponse> call({
    String? quotationId = '',
    String? insuranceUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "insurance_url": "${insuranceUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsApplicationsDetail',
      apiUrl: '${insuranceUrl}/api/applications/list/${quotationId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      );
  static dynamic vehiclename(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_name''',
      );
  static dynamic vehiclecode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_code''',
      );
  static dynamic vehicleid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_id''',
      );
  static dynamic carregistrationyear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_registration_year''',
      );
  static dynamic carregistration(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_registration''',
      );
  static dynamic carmodelname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_model_name''',
      );
  static dynamic carmodelid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_model_id''',
      );
  static dynamic carbrandname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_brand_name''',
      );
  static dynamic carbrandid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_brand_id''',
      );
  static dynamic cartype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_type''',
      );
  static dynamic drivertype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].driver_type''',
      );
  static dynamic phonenumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].phone_number''',
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].first_name''',
      );
  static dynamic insurercode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_code''',
        true,
      );
  static dynamic lastname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].last_name''',
      );
  static dynamic idtypeid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.id_type_id''',
      );
  static dynamic nationalthaiid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.national_thai_id''',
      );
  static dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.results.data.gender''',
      );
  static dynamic titleth(dynamic response) => getJsonField(
        response,
        r'''$.results.data.title_th''',
      );
  static dynamic occupationname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.occupation_name''',
      );
  static dynamic occupationsubname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.occupation_subname''',
      );
  static dynamic applicationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.application_id''',
      );
  static dynamic firstnameth(dynamic response) => getJsonField(
        response,
        r'''$.results.data.first_name_th''',
      );
  static dynamic lastnameth(dynamic response) => getJsonField(
        response,
        r'''$.results.data.last_name_th''',
      );
  static dynamic birthday(dynamic response) => getJsonField(
        response,
        r'''$.results.data.birth_day''',
      );
  static dynamic age(dynamic response) => getJsonField(
        response,
        r'''$.results.data.age''',
      );
  static dynamic occupationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.occupation_id''',
      );
  static dynamic mobile1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.mobile1''',
      );
  static dynamic mobile2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.mobile2''',
      );
  static dynamic email1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.email1''',
      );
  static dynamic beneficiaryname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.beneficiary_name''',
      );
  static dynamic registrationyear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.registration_year''',
      );
  static dynamic brandid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.brand_id''',
      );
  static dynamic brandname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.brand_name''',
      );
  static dynamic modelid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.model_id''',
      );
  static dynamic modelname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.model_name''',
      );
  static dynamic makeyear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.make_year''',
      );
  static dynamic bodynumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.body_number''',
      );
  static dynamic enginenumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.engine_number''',
      );
  static dynamic seat(dynamic response) => getJsonField(
        response,
        r'''$.results.data.seat''',
      );
  static dynamic cc(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cc''',
      );
  static dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.results.data.weight''',
      );
  static dynamic accessoryflg(dynamic response) => getJsonField(
        response,
        r'''$.results.data.accessory_flg''',
      );
  static dynamic actflg(dynamic response) => getJsonField(
        response,
        r'''$.results.data.act_flg''',
      );
  static dynamic applicationtype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.application_type''',
      );
  static dynamic covertypename(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].cover_type_name''',
        true,
      );
  static dynamic garagetypename(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].garage_type_name''',
        true,
      );
  static dynamic accessorytotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].accessory_total''',
        true,
      );
  static dynamic netpremium(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].net_premium''',
        true,
      );
  static dynamic leaddtlid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].lead_dtl_id''',
        true,
      );
  static dynamic addressline1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].address_line1''',
        true,
      );
  static dynamic addressline2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].address_line2''',
        true,
      );
  static dynamic subdistrictid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].subdistrict_id''',
        true,
      );
  static dynamic subdistrictname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].subdistrict_name''',
        true,
      );
  static dynamic districtid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].district_id''',
        true,
      );
  static dynamic districtname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].district_name''',
        true,
      );
  static dynamic provinceid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].province_id''',
        true,
      );
  static dynamic provincename(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].province_name''',
        true,
      );
  static dynamic keyword(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].keyword''',
        true,
      );
  static dynamic zipcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_address[:].zip_code''',
        true,
      );
  static dynamic insurerid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_id''',
        true,
      );
  static dynamic grosstotalnet(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].gross_total_net''',
      );
  static dynamic makeYear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.make_year''',
      );
  static dynamic actAmount(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].act_amount''',
        true,
      );
  static dynamic employeecodelicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_code_license''',
      );
  static dynamic employeefirstnamelicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_firstname_license''',
      );
  static dynamic employeelastnamelicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_lastname_license''',
      );
  static dynamic employeephonenumberlicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_phone_number_license''',
      );
  static dynamic quotationId(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_id''',
      );
  static dynamic paymenttype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_type''',
      );
  static dynamic paymentchannel(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_channel''',
      );
  static dynamic paymentstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      );
  static dynamic acttotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].act_total''',
      );
  static dynamic registrationcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.registration_code''',
      );
  static dynamic registrationprovince(dynamic response) => getJsonField(
        response,
        r'''$.results.data.registration_province''',
      );
  static dynamic employeelicenseidlicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseid_license''',
      );
  static dynamic employeelicenseimglicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseimg_license''',
      );
  static dynamic employeelicenseexplicense(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseexp_license''',
      );
  static dynamic tenor(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].tenor''',
      );
  static dynamic installmentfirstdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_first_due''',
      );
  static dynamic installmentlastdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_last_due''',
      );
  static dynamic grosstotalnetList(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].gross_total_net''',
        true,
      );
  static dynamic netpremiumtotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].net_premium_total''',
      );
  static dynamic imgfileloanapplicationregister(dynamic response) =>
      getJsonField(
        response,
        r'''$.results.data.app_document[:].file_loan_application_register''',
      );
  static dynamic imageapplication(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_application''',
      );
  static dynamic imageidcard(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_idcard''',
      );
  static dynamic imagebluebook(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_bluebook''',
      );
  static dynamic imageexamination(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_examination''',
      );
  static dynamic imagefront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_front''',
      );
  static dynamic imagerear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rear''',
      );
  static dynamic imageleft(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_left''',
      );
  static dynamic imageright(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_right''',
      );
  static dynamic imagerightfront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightfront''',
      );
  static dynamic imagerightrear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightrear''',
      );
  static dynamic imageleftfront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftfront''',
      );
  static dynamic imageleftrear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftrear''',
      );
  static dynamic imageroof(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_roof''',
      );
  static dynamic imagewound1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound1''',
      );
  static dynamic imagewound2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound2''',
      );
  static dynamic imagewound3(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound3''',
      );
  static dynamic imagewound4(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound4''',
      );
  static dynamic imagewound5(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound5''',
      );
  static dynamic imagewound6(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound6''',
      );
  static dynamic imageaccessories1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories1''',
      );
  static dynamic imageaccessories2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories2''',
      );
  static dynamic imageaccessories3(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories3''',
      );
  static dynamic imageaccessories4(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories4''',
      );
  static dynamic imageaccessories5(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories5''',
      );
  static dynamic imageaccessories6(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories6''',
      );
  static dynamic imageother(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_other''',
      );
  static dynamic firstPayAmount(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].sum_insured''',
      );
  static dynamic trailerSumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].trailer_sum_insured''',
      );
  static dynamic flagCarrier(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].flg_carrier''',
      );
  static dynamic flagAct(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].flg_act''',
      );
  static dynamic flagCoop(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].flg_co_org''',
      );
  static dynamic carrierType(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_type''',
      );
  static dynamic carrierPrice(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_price''',
      );
  static dynamic truckPart(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].truck_part''',
      );
  static dynamic nonePackageImageFront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_front''',
      );
  static dynamic nonePackageImageRightFront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightfront''',
      );
  static dynamic nonePackageImageRight(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_right''',
      );
  static dynamic nonePackageImageRightRear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightrear''',
      );
  static dynamic nonePackageImageRear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_rear''',
      );
  static dynamic nonePackageImageLeftRear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftrear''',
      );
  static dynamic nonePackageImageLeft(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_left''',
      );
  static dynamic nonePackageImageLeftFront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftfront''',
      );
  static dynamic nonePackageImageRoof(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_roof''',
      );
  static dynamic nonePackageTrailerImageFront(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_front_trailer''',
      );
  static dynamic nonePackageTrailerImageRightFront(dynamic response) =>
      getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightfront_trailer''',
      );
  static dynamic nonePackageTrailerImageRight(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_right_trailer''',
      );
  static dynamic nonePackageTrailerImageRightRear(dynamic response) =>
      getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightrear_trailer''',
      );
  static dynamic nonePackageTrailerImageRear(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_rear_trailer''',
      );
  static dynamic nonePackageTrailerImageLeftRear(dynamic response) =>
      getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftrear_trailer''',
      );
  static dynamic nonePackageTrailerImageLeft(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_left_trailer''',
      );
  static dynamic nonePackageTrailerImageLeftFront(dynamic response) =>
      getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftfront_trailer''',
      );
  static dynamic truckCarryPurpose(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_propose''',
      );
  static dynamic truckCurrentPrice(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].truck_current_price''',
      );
  static dynamic plateAdditional(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].trailer_car_registration''',
      );
  static dynamic customerMemberchip(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].customer_memberchip''',
      );
  static dynamic customerType(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].customer_type''',
      );
  static dynamic nonePackageImageIdCard(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_idcard''',
      );
  static dynamic nonePackageImageBlueBook(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_bluebook''',
      );
  static dynamic nonePackageImageOther(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_other''',
        true,
      );
  static dynamic quotationtype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_type''',
      );
  static dynamic manualFirstName(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].first_name''',
      );
  static dynamic manualLastName(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].last_name''',
      );
  static dynamic manualPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].phone_number''',
      );
  static dynamic manualCarType(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].car_type''',
      );
  static dynamic occupationCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.occupation_code''',
      );
  static dynamic imageFrontTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_front_trailer''',
      );
  static dynamic imageRearTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rear_trailer''',
      );
  static dynamic imageLeftTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_left_trailer''',
      );
  static dynamic imageRightTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_right_trailer''',
      );
  static dynamic imageRightFrontTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightfront_trailer''',
      );
  static dynamic imageRightRearTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightrear_trailer''',
      );
  static dynamic imageLeftFrontTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftfront_trailer''',
      );
  static dynamic imageLeftRearTrailer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftrear_trailer''',
      );
  static dynamic carregistrationData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.car_registration''',
      );
  static dynamic nonePackageOldVmi(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_policyNumber''',
      );
  static dynamic nonePackageVmiExpDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_expriedDate''',
      );
  static dynamic nonePackageImageOldVmi(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_image''',
      );
  static dynamic nonePackageImageCompanyBook(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].image_company_book''',
      );
  static dynamic imageOldVmi(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].old_VMI_image''',
      );
  static dynamic imageCompanyBook(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_company_book''',
      );
  static dynamic nonePackageFlagRenew(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].flg_renew''',
      );
  static dynamic nonePackageCustomerType(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].customer_type''',
      );
  static dynamic nonePackageFlagOldVmi(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_flg''',
      );
  static dynamic workType(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[0].work_type''',
      );
  static dynamic effectiveDateAct(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[0].effective_date_act''',
      );
  static dynamic incentiveBranchCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[0].branch_code''',
      );
  static dynamic incentiveBranchName(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[0].branch_name''',
      );
  static dynamic insurershortname(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_short_name''',
        true,
      );
  static dynamic applicationNo(dynamic response) => getJsonField(
        response,
        r'''$.results.data.application_no''',
      );
  static dynamic effectiveDateInsure(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[0].effective_date_insure''',
      );
  static dynamic imageQuotationInsurer(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].image_quotation_insurer''',
      );
  static dynamic insurerlogo(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_logo''',
        true,
      );
}

class IbsApplicationsPaymentSaveCall {
  static Future<ApiCallResponse> call({
    String? quotationId = '',
    String? insuranceUrl = '',
    String? leadDtlId = '',
    String? paymentType = '',
    String? paymentChannel = '',
    String? tenor = '',
    String? netPremiumTotal = '',
    String? actTotal = '',
    String? installmentFirstDue = '',
    String? installmentLastDue = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "insurance_url": "${insuranceUrl}",
  "lead_dtl_id": "${leadDtlId}",
  "payment_type": "${paymentType}",
  "payment_channel": "${paymentChannel}",
  "tenor": "${tenor}",
  "net_premium_total": "${netPremiumTotal}",
  "act_total": "${actTotal}",
  "installment_first_due": "${installmentFirstDue}",
  "installment_last_due": "${installmentLastDue}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsApplicationsPaymentSave',
      apiUrl: '${insuranceUrl}/api/payment/save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      );
  static dynamic taxid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.tax_id''',
      );
  static dynamic suffix(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.suffix''',
      );
  static dynamic ref1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.ref1''',
      );
  static dynamic ref2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.ref2''',
      );
}

class CheckBlackListCall {
  static Future<ApiCallResponse> call({
    String? nationalThaiId = '',
    String? insuranceUrl = '',
    String? idTypeId = '',
    String? quotationId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id_type_id": "${idTypeId}",
  "insurance_url": "${insuranceUrl}",
  "national_thai_id": "${nationalThaiId}",
  "quotation_id": "${quotationId}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkBlackList',
      apiUrl: '${insuranceUrl}/api/contract/check/blacklist',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic blacklistflag(dynamic response) => getJsonField(
        response,
        r'''$.results.data.blacklist_flag''',
      );
}

class IbsPaymentSaveCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? quotationId = '',
    String? leadDtlId = '',
    String? paymentType = '',
    String? paymentChannel = '',
    String? tenor = '',
    String? netPremiumTotal = '',
    String? actTotal = '',
    String? installmentFirstDue = '',
    String? installmentLastDue = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "quotation_id": "${quotationId}",
  "lead_dtl_id": "${leadDtlId}",
  "payment_type": "${paymentType}",
  "payment_channel": "${paymentChannel}",
  "tenor": "${tenor}",
  "net_premium_total": "${netPremiumTotal}",
  "act_total": "${actTotal}",
  "installment_first_due": "${installmentFirstDue}",
  "installment_last_due": "${installmentLastDue}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsPaymentSave',
      apiUrl: '${insuranceUrl}/api/payment/save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic blacklistflag(dynamic response) => getJsonField(
        response,
        r'''$.results.data.blacklist_flag''',
      );
  static dynamic ref2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.ref2''',
      );
  static dynamic ref1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.ref1''',
      );
  static dynamic suffix(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.suffix''',
      );
  static dynamic taxid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.tax_id''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      );
}

class GetInsurancePolicyApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getInsurancePolicyApi',
      apiUrl: '${apiUrl}/api/insurance/get/policy',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      );
  static dynamic cancelReason(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      );
  static dynamic cancelDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      );
  static dynamic vmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      );
  static dynamic cmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      );
  static dynamic vmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      );
  static dynamic cmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      );
  static dynamic contractId(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      );
  static dynamic completeDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      );
  static dynamic policyNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      );
  static dynamic vloneContNo(dynamic response) => getJsonField(
        response,
        r'''$.results.data.vloan_contract_no''',
      );
  static dynamic paymenttatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      );
  static dynamic paymentype(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_type''',
      );
  static dynamic paymentChannel(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_channel''',
      );
  static dynamic netPremiumTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].net_premium_total''',
      );
  static dynamic actTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].act_total''',
      );
  static dynamic grossTotalNet(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].gross_total_net''',
      );
  static dynamic tenor(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].tenor''',
      );
  static dynamic installmentFirstDue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_first_due''',
      );
  static dynamic installmentLastDue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_last_due''',
      );
  static dynamic vmiDocumentUrl(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_documentUrl''',
      );
  static dynamic vloanCuscod(dynamic response) => getJsonField(
        response,
        r'''$.results.data.vloan_cuscod''',
      );
  static dynamic cMIdocumentUrl(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_documentUrl''',
      );
}

class CancelInsurancePolicyApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
    String? cancelReasonName = '',
    String? ownerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "cancel_reason_name": "${cancelReasonName}",
  "owner_id": "${ownerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelInsurancePolicyApi',
      apiUrl: '${apiUrl}/api/insurance/cancel/policy',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      );
  static dynamic cancelReason(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      );
  static dynamic cancelDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      );
  static dynamic vmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      );
  static dynamic cmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      );
  static dynamic vmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      );
  static dynamic cmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      );
  static dynamic contractId(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      );
  static dynamic completeDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      );
  static dynamic policyNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      );
  static dynamic vloneContNo(dynamic response) => getJsonField(
        response,
        r'''$.results.data.vloan_contract_no''',
      );
}

class PostInsurancePolicyApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postInsurancePolicyApi',
      apiUrl: '${apiUrl}/api/insurance/post/issue_policy',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      );
  static dynamic cancelReason(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      );
  static dynamic cancelDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      );
  static dynamic vmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      );
  static dynamic cmiMessage(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      );
  static dynamic vmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      );
  static dynamic cmiStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      );
  static dynamic contractId(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      );
  static dynamic completeDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      );
  static dynamic policyNumber(dynamic response) => getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      );
}

class IbsPaymentRetrieveStatusCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? quotationId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "quotation_id": "${quotationId}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsPaymentRetrieveStatus',
      apiUrl: '${insuranceUrl}/api/payment/retrieve/status',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic ref2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].ref2''',
      );
  static dynamic ref1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].ref1''',
      );
  static dynamic suffix(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].suffix''',
      );
  static dynamic taxid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].tax_id''',
      );
  static dynamic paymentstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      );
  static dynamic quotationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_id''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      );
}

class IbsPaymentRegenerateCodeCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? quotationId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "quotation_id": "${quotationId}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsPaymentRegenerateCode',
      apiUrl: '${insuranceUrl}/api/payment/regenerate/code',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic ref2(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].ref2''',
      );
  static dynamic ref1(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].ref1''',
      );
  static dynamic suffix(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].suffix''',
      );
  static dynamic taxid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].tax_id''',
      );
  static dynamic paymentstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      );
  static dynamic quotationstatus(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      );
  static dynamic quotationid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.quotation_id''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      );
}

class IbsCalculateInstallmentCall {
  static Future<ApiCallResponse> call({
    String? grossTotalNet = '',
    String? vehicleCode = '',
    String? actTotal = '',
    String? insuranceUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "gross_total_net": "${grossTotalNet}",
  "vehicle_code": "${vehicleCode}",
  "act_total": "${actTotal}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsCalculateInstallment',
      apiUrl: '${insuranceUrl}/api/payment/calculate/installment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic paymentfirst(dynamic response) => getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].payment_first''',
        true,
      );
  static dynamic installmentlastdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].installment_last_due''',
        true,
      );
  static dynamic installmentfirstdue(dynamic response) => getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].installment_first_due''',
        true,
      );
  static dynamic tenor(dynamic response) => getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].tenor''',
        true,
      );
}

class IbsApplicationsEditCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? quotationId = '',
    String? effectiveDateInsure = '',
    String? effectiveDateAct = '',
    String? firstNameTh = '',
    String? lastNameTh = '',
    String? carRegistration = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "token": "${token}",
  "quotation_id": "${quotationId}",
  "effective_date_insure": "${effectiveDateInsure}",
  "effective_date_act": "${effectiveDateAct}",
  "first_name_th": "${firstNameTh}",
  "last_name_th": "${lastNameTh}",
  "car_registration": "${carRegistration}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ibsApplicationsEdit',
      apiUrl: '${insuranceUrl}/api/applications/edit',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class GetOccupationCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{"insurance_url":"${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetOccupation',
      apiUrl: '${insuranceUrl}/api/insurance/master/get_occupation',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic occupationsubname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].occupation_subname''',
        true,
      );
  static dynamic occupationsubcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].occupation_subcode''',
        true,
      );
  static dynamic occupationname(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].occupation_name''',
        true,
      );
  static dynamic occupationcode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].occupation_code''',
        true,
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
}

class LeadManagementSaveCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? remark = '',
    dynamic? insuranceJson,
    String? token = '',
    String? product = '',
    String? subProduct = '',
    String? sourceBy = '',
    String? channel = '',
    String? leadGroup = '',
    String? leadsApiUrl = '',
    String? ownerId = '',
  }) async {
    final insurance = _serializeJson(insuranceJson);
    final ffApiRequestBody = '''
{
"owner_id":"${ownerId}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}",
  "remark": "${remark}",
  "insurance": ${insurance},
  "token": "${token}",
  "product": "${product}",
  "sub_product": "${subProduct}",
  "source_by": "${sourceBy}",
  "channel": "${channel}",
  "lead_group": "${leadGroup}",
  "leads_api_url": "${leadsApiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LeadManagementSave',
      apiUrl: '${leadsApiUrl}/api/leads/online/save',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.results.data.access_token''',
      );
  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic leadsid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_id''',
      );
}

class LeadManagementCheckDuplicateCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? remark = '',
    dynamic? insuranceJson,
    String? token = '',
    String? product = '',
    String? subProduct = '',
    String? sourceBy = '',
    String? channel = '',
    String? leadGroup = '',
    String? leadsApiUrl = '',
  }) async {
    final insurance = _serializeJson(insuranceJson);
    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}",
  "remark": "${remark}",
  "insurance": ${insurance},
  "token": "${token}",
  "product": "${product}",
  "sub_product": "${subProduct}",
  "source_by": "${sourceBy}",
  "channel": "${channel}",
  "lead_group": "${leadGroup}",
  "leads_api_url": "${leadsApiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LeadManagementCheckDuplicate',
      apiUrl: '${leadsApiUrl}/api/leads/online/check-duplicate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.results.data.access_token''',
      );
  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic leadsid(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads_id''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetTokenLeadManagementCall {
  static Future<ApiCallResponse> call({
    String? nameTh = '',
    String? password = '',
    String? leadsApiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name_th": "${nameTh}",
  "password": "${password}",
  "leads_api_url": "${leadsApiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetTokenLeadManagement',
      apiUrl: '${leadsApiUrl}/api/auth/get-token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.results.data.access_token''',
      );
  static dynamic statuslayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
