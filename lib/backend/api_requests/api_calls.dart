import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HouseInsurance Group Code

class HouseInsuranceGroup {
  static String getBaseUrl({
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) =>
      '${apiUrl}';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetPackageFireInsuranceCall getPackageFireInsuranceCall =
      GetPackageFireInsuranceCall();
  static SaveQuotationCall saveQuotationCall = SaveQuotationCall();
  static HouseCalEstimatedApiCall houseCalEstimatedApiCall =
      HouseCalEstimatedApiCall();
  static FireGetLeadsApiCall fireGetLeadsApiCall = FireGetLeadsApiCall();
  static GetListFireApiCall getListFireApiCall = GetListFireApiCall();
}

class GetPackageFireInsuranceCall {
  Future<ApiCallResponse> call({
    String? yearCoverMin = '',
    String? yearCoverMax = '',
    String? sumInsured = '',
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) async {
    final baseUrl = HouseInsuranceGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "year_cover_min": "${escapeStringForJson(yearCoverMin)}",
  "year_cover_max": "${escapeStringForJson(yearCoverMax)}",
  "sum_insured": "${escapeStringForJson(sumInsured)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPackageFireInsurance',
      apiUrl: '${baseUrl}/api/insurance/house/get_package?flag_get=1',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  List<GetPackageFireInsurerDataTypeStruct>? data(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => GetPackageFireInsurerDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SaveQuotationCall {
  Future<ApiCallResponse> call({
    String? subProduct = '',
    String? ownerId = '',
    String? token = '',
    String? firstName = '',
    String? phoneNumber = '',
    String? ownerName = '',
    String? ownerPhone = '',
    String? branchCode = '',
    String? branchName = '',
    String? sumInsureHouse = '',
    String? sumInsureBuildin = '',
    String? sumInsureTotal = '',
    String? floor = '',
    String? width = '',
    String? length = '',
    String? usableArea = '',
    String? houseTypeCode = '',
    String? houseTypeName = '',
    String? lastName = '',
    dynamic? insurerPackageJson,
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) async {
    final baseUrl = HouseInsuranceGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final insurerPackage = _serializeJson(insurerPackageJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'saveQuotation',
      apiUrl: '${baseUrl}/api/house/quotations/save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'insurer_package': insurerPackage,
        'sub_product': subProduct,
        'owner_id': ownerId,
        'token': token,
        'first_name': firstName,
        'phone_number': phoneNumber,
        'owner_name': ownerName,
        'owner_phone': ownerPhone,
        'branch_code': branchCode,
        'branch_name': branchName,
        'sum_insure_house': sumInsureHouse,
        'sum_insure_buildin': sumInsureBuildin,
        'sum_insure_total': sumInsureTotal,
        'floor': floor,
        'width': width,
        'length': length,
        'usable_area': usableArea,
        'house_type_code': houseTypeCode,
        'house_type_name': houseTypeName,
        'last_name': lastName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic pdfUrl(dynamic response) => getJsonField(
        response,
        r'''$.results.leads_house[0].url''',
      );
}

class HouseCalEstimatedApiCall {
  Future<ApiCallResponse> call({
    String? houseAreaType = '',
    String? houseTypeCode = '',
    String? usableArea = '',
    String? token = '',
    String? floor = '',
    String? width = '',
    String? long = '',
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) async {
    final baseUrl = HouseInsuranceGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "house_area_type": "${escapeStringForJson(houseAreaType)}",
  "house_type_code": "${escapeStringForJson(houseTypeCode)}",
  "usable_area": "${escapeStringForJson(usableArea)}",
  "floor": "${escapeStringForJson(floor)}",
  "width": "${escapeStringForJson(width)}",
  "length": "${escapeStringForJson(long)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'houseCalEstimatedApi',
      apiUrl: '${baseUrl}/api/house/cal-estimated',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  HouseCalEstimatedModelStruct? data(dynamic response) =>
      HouseCalEstimatedModelStruct.maybeFromMap(getJsonField(
        response,
        r'''$.results.data''',
      ));
  int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? messageLayer1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class FireGetLeadsApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? ownerId = '',
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) async {
    final baseUrl = HouseInsuranceGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "owner_id": "${escapeStringForJson(ownerId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FireGetLeadsApi',
      apiUrl: '${baseUrl}/api/house/leads/get',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? statuslayer(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  List? data1(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? packageName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].package_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? insurerCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].insurer_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sumInsuredName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].sum_insured_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? insuranceType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].insurance_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? leadsHouseDtIid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].leads_house_dtl_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? quotationId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? insurerName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? quotationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].quotation_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? insurerStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].insurer_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? netPremiumTotalName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].leads_detail_house[:].net_premium_total_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? checkTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
}

class GetListFireApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? ownerId = '',
    String? apiUrl = 'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
  }) async {
    final baseUrl = HouseInsuranceGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "owner_id": "${escapeStringForJson(ownerId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetListFireApi',
      apiUrl: '${baseUrl}/api/house/quotations/get-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? statusleyer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  int? toTal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.total''',
      ));
  int? notApproveTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.notApprove.total''',
      ));
  dynamic? notApprove(dynamic response) => getJsonField(
        response,
        r'''$.results.data.notApprove''',
      );
  List? notApproveData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.notApprove.data''',
        true,
      ) as List?;
  dynamic? waitingInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.data.waitingInfo''',
      );
  List? waitingInfoData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.waitingInfo.data[:]''',
        true,
      ) as List?;
  int? waitingInfoTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.waitingInfo.total''',
      ));
  dynamic? dataPayment(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment''',
      );
  List? paymentData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.payment.data[:]''',
        true,
      ) as List?;
  int? paymentTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.payment.total''',
      ));
  List? waitingData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.waiting.data[:]''',
        true,
      ) as List?;
  int? waitingTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.waiting.total''',
      ));
  List? approveData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.approve.data[:]''',
        true,
      ) as List?;
  int? approveTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.approve.total''',
      ));
  List? cancelData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.cancel.data[:]''',
        true,
      ) as List?;
  int? cancelTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.cancel.total''',
      ));
}

/// End HouseInsurance Group Code

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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static String? employeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.employee_id''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.branch_code''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].RecordId''',
      ));
  static String? jobType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Job_Type''',
      ));
  static String? clockIn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].ClockIn''',
      ));
  static int? latitude(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Latitude''',
      ));
  static int? longitude(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Longitude''',
      ));
  static dynamic? timesheetData(dynamic response) => getJsonField(
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? approvedID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveDoc(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpTel(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveCreateDate(dynamic response) =>
      (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      ) as List?;
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? statusLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].RecordId''',
      ));
  static String? citizenID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].CitizenId''',
      ));
  static String? customerName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Customer_Name''',
      ));
  static String? landmark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Landmark''',
      ));
  static String? remark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Remark''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Description''',
      ));
  static String? contNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].ContNo''',
      ));
  static String? assetID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].AssetId''',
      ));
  static List<String>? matName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Material_Name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? matImg(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Img_Url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? material(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:]''',
        true,
      ) as List?;
  static String? marketingBranchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Branch_Code''',
      ));
  static String? marketingAreaDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Area_Description''',
      ));
  static String? marketingDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Detail''',
      ));
  static String? marketingRemark(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Remark''',
      ));
  static String? marketingRecordId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profileEmployeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      ));
  static String? profileFullName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      ));
  static String? profileNickName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      ));
  static String? profileHiredDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      ));
  static String? profileServiceDurationYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      ));
  static String? profileServiceDurationMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      ));
  static String? profileServiceDurationDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      ));
  static String? profileArea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      ));
  static String? profileRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      ));
  static String? profliePositionName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      ));
  static String? profileBranchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      ));
  static String? profileBirthDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic? profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static String? profilePositionAgeYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.year''',
      ));
  static String? profilePositionAgeMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.month''',
      ));
  static String? profilePositionAgeDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.day''',
      ));
  static String? profilePositionAgeCheck(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].checkPositionAge''',
      ));
  static String? profilePhoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].MobileNumber''',
      ));
  static String? profileFirstBossEmpID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeBefore''',
      ));
  static String? profileFirstBossName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameBefore''',
      ));
  static String? profileSecondBossEmpID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeAfter''',
      ));
  static String? profileSecondBossName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameAfter''',
      ));
  static String? profileLevel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Level''',
      ));
  static String? profileBranch(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Branch''',
      ));
  static String? insurancePlan(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].InsurancePlan''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchCode''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Department''',
      ));
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? jsonData(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo''',
      );
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? employeeId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].EmployeeID''',
      ));
  static String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].FullName''',
      ));
  static String? idCard(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].IDCard''',
      ));
  static String? licenseNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].LicenseNumber''',
      ));
  static String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].IssuuedDate''',
      ));
  static String? expireDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.data[:].ExpirationDate''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dataInfo.NonLifeInsurance.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profileEmployeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      ));
  static String? profileFullName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      ));
  static String? profileNickName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      ));
  static String? profileHiredDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      ));
  static String? profileServiceDurationYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      ));
  static String? profileServiceDurationMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      ));
  static String? profileServiceDurationDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      ));
  static dynamic? profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static String? profileArea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      ));
  static String? profileRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      ));
  static String? profliePositionName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      ));
  static String? profileBranchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      ));
  static String? profileBirthDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? connectStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? dataStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.DataLeadInfo.status''',
      ));
  static List<String>? dataLeadID(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataFirstName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataPhoneNum(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataCallStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].call_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataCreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataLeadChannel(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataEmployeeID(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].employee_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataBranchCode(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataBranchName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? dataMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.message''',
      ));
  static String? dataLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.level''',
      ));
  static String? connectionMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? countCalled(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].countCall''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.first_name2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.phone_number2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.last_name2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? descInfo(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info''',
        true,
      ) as List?;
  static List<String>? carVehicleName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].car_vehicle_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amountRequest(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? statusReason(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].statusCallOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].StatusContract''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? contractDate(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].contract_date''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      ));
  static String? percentSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      ));
  static String? flagSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      ));
  static String? percentTarget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2CM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].status''',
      ));
  static String? messageLayer2CM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].message''',
      ));
  static int? statusLayer2LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.LastMonth[:].status''',
      ));
  static String? messageLayer2LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].message''',
      ));
  static String? branchCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchCode''',
      ));
  static String? branchNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchName''',
      ));
  static String? successPercentLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessPercent''',
      ));
  static String? succesFlagLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessFlag''',
      ));
  static String? targetSuccessLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].TargetPercent''',
      ));
  static String? regionCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionCode''',
      ));
  static String? regionNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionName''',
      ));
  static String? areaCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaCode''',
      ));
  static String? areaNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaName''',
      ));
  static String? branchCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchCode''',
      ));
  static String? branchNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchName''',
      ));
  static String? successPercentCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessPercent''',
      ));
  static String? succesFlagCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessFlag''',
      ));
  static String? targetSuccessCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].TargetPercent''',
      ));
  static String? regionCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionCode''',
      ));
  static String? regionNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionName''',
      ));
  static String? areaCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaCode''',
      ));
  static String? areaNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaName''',
      ));
  static String? branchDetailCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchDetail''',
      ));
  static String? branchDetailLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchDetail''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      ));
  static String? percentSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      ));
  static String? flagSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      ));
  static String? percentTarget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      ));
  static String? branchDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? connectStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? connectionMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dateInfo(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      ) as List?;
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static List<String>? statusCheckCount(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].StatusCheckCount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? totalLeave(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TotalLeave''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countLeave(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].CountLeave''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeDay(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
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
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? checkinDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.Date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkinTime(dynamic response) => (getJsonField(
        response,
        r'''$.info.Time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? contNo(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? customerName(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[3]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  static List<String>? vloanServer(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[4]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? group(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.Group''',
      ));
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_CODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchName(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_NAME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLat(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LATITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLong(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LONGITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchRadius(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].RADIUS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static int? statusLayer3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.Location.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].RegionCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].RegionName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].AreaCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].AreaName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? groupCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].GroupCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchSize(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchSize''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaCode''',
        true,
      ) as List?;
  static List? areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaName''',
        true,
      ) as List?;
  static List? areaType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].Type''',
        true,
      ) as List?;
  static List<String>? regionCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].RegionCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].RegionName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].FirstName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].LastName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nickName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].NickName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mapNickname(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].MapNickName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branch(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].Brach''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? getKeyWordName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].GetKeyWord''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? detailMessage(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessages''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
  static List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].EmployeeCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workPosition(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].BranchCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? checkinMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? currentDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.Date''',
      ));
  static String? currentTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.Time''',
      ));
  static String? currentDateYMD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.DateYMD''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].info''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? flagCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.flag''',
      ));
  static List<String>? listBranchCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listTimeCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listDateCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listActionStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listCheckinoutDate(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? workInStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? infoCheckCurrent(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? flagCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.flag''',
      ));
  static List<String>? listBranchCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listTimeCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listDateCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listActionStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listCheckinoutDate(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? workInStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? positionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCodeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? monthLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List<String>? dataInfoLastMonth(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? positionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCodeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? monthLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdTM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?;
  static String? position(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      ));
  static String? branchCodeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      ));
  static String? actual(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      ));
  static String? targetBudget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaRespons(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? actualBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      ));
  static String? targetBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaResponsLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static String? areaGradeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      ));
  static String? areaTypeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      ));
  static String? ageOfPositionTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
      ));
  static String? areaGradeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
      ));
  static String? areaTypeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
      ));
  static String? ageOfPositionLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
      ));
  static String? employeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      ));
  static String? employeeIDLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      ));
  static String? branchCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?;
  static String? position(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      ));
  static String? actual(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      ));
  static String? targetBudget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaRespons(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? actualBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      ));
  static String? targetBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaResponsLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static String? employeeIdTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      ));
  static String? employeeIdLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetBudget(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List<String>? dataInfoLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
  static List? areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static List<String>? actualBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
  static List<String>? areaGradeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ageOfPositionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
    List<String>? coverTypeList,
    String? apiUrl = '',
    String? insuranceUrl = '',
    List<String>? garageTypeList,
    int? maxGrossTotal,
    int? minGrossTotal,
    int? maxSumInsured,
    int? minSumInsured,
  }) async {
    final companyId = _serializeList(companyIdList);
    final coverType = _serializeList(coverTypeList);
    final garageType = _serializeList(garageTypeList);

    final ffApiRequestBody = '''
{
  "brand_code": "${brandCode}",
  "model_code": "${modelCode}",
  "year": "${year}",
  "vehicle_usage": "${vehicleUsage}",
  "cover_type": ${coverType},
  "garage_type": ${garageType},
  "province": "${province}",
  "min_sum_insured": ${minSumInsured},
  "max_sum_insured": ${maxSumInsured},
  "min_gross_total": ${minGrossTotal},
  "max_gross_total": ${maxGrossTotal}
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List? statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? coverType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].cover_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiryDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? pa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].pa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tppd(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].tppd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].garage_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].brand_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].model_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actAmount(dynamic response) => (getJsonField(
        response,
        r'''$.results.data..package[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? statusLayer1Message(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? serialName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].serial_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiPerson(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].tpbi_person''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiAccident(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].tpbi_accident''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? effectiveDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].effective_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? total(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? registrationYear(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].registration_year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? shortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accessory(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].assessory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? packageId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].package_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? packageName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].package_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stamp(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].stamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].vat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? seat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].seat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? roadsideAssistance(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].roadside_assistance''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bb(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].bb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? me(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].me''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flood(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].flood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? deductible(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].deductible''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractProcessstate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].contractprocessstate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerCondition(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].insurer_condition''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? cc(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].cc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carlost(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].car_lost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? motoraddon(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].motor_add_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? driverbehavior(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].driver_behavior''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurershortnameall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurercodeall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].insurer_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyidall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? logoall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? covertypelistall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].cover_type_list''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garagetypelistall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].garage_type_list''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? maxnetpremiumall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].max_gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? minnetpremiumall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].min_gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? maxsuminsuredall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].max_sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? minsuminsuredall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].min_sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurernameall(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? inspectionExcept(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*][*].package[:].inspection_except''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TelePackageSearchMCAPICall {
  static Future<ApiCallResponse> call({
    String? brandCode = '',
    String? modelCode = '',
    String? year = '',
    String? province = '',
    String? carRegistration = '',
    String? driver = '',
    String? vehicleUsage = '',
    List<String>? companyIdList,
    List<String>? coverTypeList,
    String? apiUrl = '',
    String? insuranceUrl = '',
    List<String>? garageTypeList,
  }) async {
    final companyId = _serializeList(companyIdList);
    final coverType = _serializeList(coverTypeList);
    final garageType = _serializeList(garageTypeList);

    final ffApiRequestBody = '''
{
  "brand_code": "${brandCode}",
  "model_code": "${modelCode}",
  "year": "${year}",
  "vehicle_usage": "${vehicleUsage}",
  "cover_type": ${coverType},
  "garage_type": ${garageType},
  "province": "${province}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'telePackageSearchMCAPI',
      apiUrl: '${insuranceUrl}/api/insurance/get_package_mc',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List? statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? coverType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiryDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? pa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tppd(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actAmount(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? statusLayer1Message(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? serialName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiPerson(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tpbi_person''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiAccident(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tpbi_accident''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? effectiveDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].effective_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? registrationYear(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].registration_year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? shortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accessory(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].assessory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? packageId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].package_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? packageName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].package_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stamp(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].stamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? seat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].seat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? roadsideAssistance(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].roadside_assistance''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bb(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].bb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? me(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].me''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flood(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].flood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? deductible(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].deductible''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractProcessstate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].contractprocessstate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerCondition(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].insurer_condition''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? cc(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carLost(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_lost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? motorAddOn(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].motor_add_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? driverBehavior(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].driver_behavior''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? inspectionexcept(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].inspection_except''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List? statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? coverType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiryDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? pa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tppd(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actAmount(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? statusLayer1Message(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? serialName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiPerson(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tpbi_person''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tpbiAccident(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tpbi_accident''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? effectiveDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].effective_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? registrationYear(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].registration_year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? shortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accessory(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].assessory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? packageId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].package_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? packageName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].package_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stamp(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].stamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? seat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].seat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? roadsideAssistance(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].roadside_assistance''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bb(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].bb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? me(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].me''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flood(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].flood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? deductible(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].deductible''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractProcessstate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].contractprocessstate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetBrandAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? vehicleGroup = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "vehicle_group": "${vehicleGroup}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalBrand(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TeleGetBrandMCAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetBrandMCAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_brands_mc',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalBrand(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TeleGetModelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? vehicleGroup = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "vehicle_group": "${vehicleGroup}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalModel(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelVehicleGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].veh_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelNubmerSeat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].no_seats''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelEnginCapacity(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].engine_capacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelWeight(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].weight''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroupDetail(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group_detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carDoors(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_doors''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TeleGetModelMCAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{"api_url":"${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetModelMCAPI ',
      apiUrl: '${apiUrl}/api/insurance/master/get_models_mc',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalModel(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelVehicleGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].veh_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelNubmerSeat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].no_seats''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelEnginCapacity(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].engine_capacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelWeight(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].weight''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carGroupDetail(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_group_detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carDoors(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_doors''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalInsurers(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? companyCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyFullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? provinceID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceNameTH(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceNameEN(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List? provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      ) as List?;
  static List? provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      ) as List?;
  static List? provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      ) as List?;
}

class TeleGetCoverTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? carType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "car_type": "${carType}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headBefore(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      ) as List?;
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headAfter(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkEdit(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headBefore(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      ) as List?;
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStartDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDateStart''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headAfter(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkEdit(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? otherAsset(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].OtherAsset''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? asset(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Asset''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].PostCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subDistrict(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].SubDistrict''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].District''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? province(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Province''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagComback(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FlagComeBack''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? otherReasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].OtherReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cancelBy(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDateEnd(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDateEnd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveUserName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? empIdBoss1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Username_O''',
      ));
  static String? fcmBoss1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Head_O''',
      ));
  static String? empIdBoss2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Username_T''',
      ));
  static String? fcmBoss2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Head_T''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? nickName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].NickName''',
        true,
      ) as List?;
  static List? department(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].Department''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveUserName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.success''',
      ));
  static int? failure(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.failure''',
      ));
  static String? errerMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].error''',
      ));
  static String? messageID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].message_id''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? provCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataView.status''',
      ));
  static String? oldLat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].LATITUDE''',
      ));
  static String? oldLng(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].LONGITUDE''',
      ));
  static int? statusConfirm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataToEdit.status''',
      ));
  static String? messageView(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.message''',
      ));
  static String? messageEdit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataToEdit.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].BRANCH_NAME''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataInsert.status''',
      ));
  static String? statusMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataInsert.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? bossCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.info''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? holidayDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].DATE_OF_YEAR''',
        true,
      ) as List?;
  static List? holidayName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NAME_TH''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
  static int? statusLayer3CM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.currentMonth.status''',
      ));
  static String? messageLayer3CM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info.currentMonth.message''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info.lastMonth.message''',
      ));
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].LeaveType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countDayLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].CountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? startLeaveDateLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].StartDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? endLeaveDateLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].EndDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subLeaveTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].LeaveType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countDayCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].CountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? startLeaveDateCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].StartDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? endLeaveDateCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].EndDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subLeaveTypeCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? provCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? postCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].PostCode''',
        true,
      ) as List?;
  static List? districtName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictName''',
        true,
      ) as List?;
  static List? districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? callStatusId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? channel(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
  static List<String>? callStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryReasonName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? note(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryNote''',
        true,
      ) as List?;
  static List<String>? callTime(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? historyStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeId(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryUserID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].info''',
      ));
  static String? callStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.call''',
      ));
  static String? callStatusReason(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.callStatus''',
      ));
  static String? statusReasonDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.callReason''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? callStatusId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? districtCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].SubDistrictName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].SubDistrictCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statuslayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? groupCampaign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].GroupCampaign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? premiums(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Premiums''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? noOfPolicy(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].NoOfPolicy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? unixTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.unixtime''',
      ));
  static String? dateTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.datetime''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$[:].time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateFlag(dynamic response) => (getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$[:].time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateFlag(dynamic response) => (getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
    String? carTypeDetail = '',
    String? oldVMIFlg = '',
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
        'car_type_detail': carTypeDetail,
        'old_VMI_flg': oldVMIFlg,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static String? resultInfo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.total''',
      );
  static List? quotationId(dynamic response) => getJsonField(
        response,
        r'''$.results[:].quotation_id''',
        true,
      ) as List?;
  static List? quotationStatus(dynamic response) => getJsonField(
        response,
        r'''$.results[:].status''',
        true,
      ) as List?;
  static List? reasonName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].reason_name''',
        true,
      ) as List?;
  static List? updateAt(dynamic response) => getJsonField(
        response,
        r'''$.results[:].updated_at''',
        true,
      ) as List?;
  static List? updaterName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name_th''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? listTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<int>? leadId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? leadNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? company(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? customerType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagRenew(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resultsData(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
        true,
      ) as List?;
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stampAct(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].stamp_act''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremiumTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? waitingInfo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_info''',
      ));
  static int? waitingCar(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_car''',
      ));
  static int? approve(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_approve''',
      ));
  static int? notApprove(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_not_approve''',
      ));
  static int? payment(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_payment''',
      ));
  static int? cancle(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_cancle''',
      ));
  static int? auto(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.auto''',
      ));
  static int? manual(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.manual''',
      ));
  static List<String>? expireDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireCheck(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date_check''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? flagExpired(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flag_expired''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? waitingInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo''',
        true,
      ) as List?;
  static List? waitingCarList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.waitingCar''',
        true,
      ) as List?;
  static List? paymentList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.payments''',
        true,
      ) as List?;
  static List? notApproveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.notApprove''',
        true,
      ) as List?;
  static List? approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      ) as List?;
  static List<String>? insurerNameInfoList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldVMIFlg(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].old_VMI_flg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? cancleList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.cancle''',
        true,
      ) as List?;
  static List? refundList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.refund''',
        true,
      ) as List?;
  static int? refund(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_refund''',
      ));
  static int? refundSuccess(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_refund_success''',
      ));
  static List? refundSuccessList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.refund_success''',
        true,
      ) as List?;
  static List<String>? quotationtypebak(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type_bak''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? refRenewId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].ref_renew_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationtypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statustransfer(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_transfer''',
      ));
  static int? statusreject(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_reject''',
      ));
  static List? transfer(dynamic response) => getJsonField(
        response,
        r'''$.results.info.transfer''',
        true,
      ) as List?;
  static List<String>? subproductname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].sub_product_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationtypebakname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type_bak_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeecodelicense(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].employee_code_license''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videourl(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].video_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsuranceRequestListAPIDashBoardCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadId = '',
    String? mode = '',
    String? list = '',
    String? searchBy = '',
    String? search = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lead_id": "${leadId}",
  "mode": "${mode}",
  "list": "${list}",
  "search_by": "${searchBy}",
  "search": "${search}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? listTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<int>? leadId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? leadNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      ) as List?;
  static List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      ) as List?;
  static List<String>? customerType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagRenew(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resultsData(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
        true,
      ) as List?;
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stampAct(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].stamp_act''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremiumTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? waitingInfo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_info''',
      ));
  static int? waitingCar(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_car''',
      ));
  static int? approve(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_approve''',
      ));
  static int? notApprove(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_not_approve''',
      ));
  static int? payment(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_payment''',
      ));
  static int? cancle(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_cancle''',
      ));
  static int? auto(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.auto''',
      ));
  static int? manual(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.manual''',
      ));
  static List<String>? expireDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireCheck(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date_check''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? flagExpired(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flag_expired''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? waitingInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo''',
        true,
      ) as List?;
  static List? waitingCarList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.waitingCar''',
        true,
      ) as List?;
  static List? paymentList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.payments''',
        true,
      ) as List?;
  static List? notApproveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.notApprove''',
        true,
      ) as List?;
  static List? approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      ) as List?;
  static List<String>? insurerNameInfoList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeecodelicense(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].employee_code_license''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videourl(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].video_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? watingInfoleadid(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? watingInfoquotationid(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchOldVmiApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? mode = '',
    String? list = '',
    String? searchBy = '',
    String? search = '',
    String? subProduct = '',
    String? ownerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}",
  "sub_product": "${subProduct}",
  "mode": "${mode}",
  "list": "${list}",
  "search_by": "${searchBy}",
  "search": "${search}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchOldVmiApi',
      apiUrl: '${apiUrl}/api/search-approve',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? listTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<int>? leadId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? leadNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      ) as List?;
  static List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      ) as List?;
  static List<String>? customerType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagRenew(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resultsData(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
        true,
      ) as List?;
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stampAct(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].stamp_act''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremiumTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].net_premium_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? waitingInfo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_info''',
      ));
  static int? waitingCar(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_waiting_car''',
      ));
  static int? approve(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_approve''',
      ));
  static int? notApprove(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_not_approve''',
      ));
  static int? payment(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_payment''',
      ));
  static int? cancle(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.status_cancle''',
      ));
  static int? auto(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.auto''',
      ));
  static int? manual(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.counting.manual''',
      ));
  static List<String>? expireDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireCheck(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].expire_date_check''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? applicationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].application_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? flagExpired(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flag_expired''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? waitingInfoList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.watingInfo''',
        true,
      ) as List?;
  static List? waitingCarList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.waitingCar''',
        true,
      ) as List?;
  static List? paymentList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.payments''',
        true,
      ) as List?;
  static List? notApproveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.notApprove''',
        true,
      ) as List?;
  static List? approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      ) as List?;
  static List<String>? insurerNameInfoList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].quotation_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeecodelicense(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].employee_code_license''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videourl(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].video_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? watingInfoleadid(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? watingInfoquotationid(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.watingInfo[:].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
    String? flgAct = '',
  }) async {
    final ffApiRequestBody = '''
{
  "flg_act": "${flgAct}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.statusCode''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? massageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? leadId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
      ));
  static String? leadNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
      ));
  static dynamic leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
      );
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].first_name''',
      ));
  static String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].last_name''',
      ));
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
      );
  static String? customerType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
      ));
  static String? phoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
      ));
  static String? flagRenew(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
      ));
  static String? idCardNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].id_number''',
      ));
  static String? carType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_type''',
      ));
  static String? brandName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_brand_name''',
      ));
  static String? modelName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_model_name''',
      ));
  static String? province(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_province_name''',
      ));
  static String? plateNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_registration''',
      ));
  static String? year(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_registration_year''',
      ));
  static String? vehicleCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_code''',
      ));
  static String? vehicleName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_name''',
      ));
  static int? vehicleId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_id''',
      ));
  static String? flagDecoration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_decoration''',
      ));
  static String? decorationDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].decoration_detail''',
      ));
  static String? flagCarrier(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_carrier''',
      ));
  static String? flagCoop(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_co_org''',
      ));
  static String? carrierType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_type''',
      ));
  static String? carrierPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_price''',
      ));
  static String? remark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].remark''',
      ));
  static String? flagAct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_act''',
      ));
  static String? sumInsured(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
      ));
  static List<String>? insurerNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? leadDetailId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].lead_dtl_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRoofList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageFrontTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRearTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightFrontTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightRearTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftFrontTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftRearTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRoofTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageBluebookList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_bluebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageIdCardList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_idcard''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageOtherList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? oldVmiPolicyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].old_VMI_policyNumber''',
      ));
  static String? truckPart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].truck_part''',
      ));
  static String? customerMemberchip(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].customer_memberchip''',
      ));
  static dynamic trailerPlateNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_car_registration''',
      );
  static String? carrierPropose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_propose''',
      ));
  static dynamic trailerSumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_sum_insured''',
      );
  static String? truckCurrentPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].truck_current_price''',
      ));
  static List<String>? imageOtherName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? quotationNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_no''',
      ));
  static String? quotationDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_date''',
      ));
  static String? quotationStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_status''',
      ));
  static String? quotataionType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].quotation[:].quotation_type''',
      ));
  static String? oldVmiExpriedDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].old_VMI_expriedDate''',
      ));
  static int? idType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info[:].id_type''',
      ));
  static String? carBrandId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_brand_id''',
      ));
  static String? carModelId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_model_id''',
      ));
  static String? carProvinceCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_province_code''',
      ));
  static String? imageRear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].image_rear''',
      ));
  static String? imageRight(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].image_right''',
      ));
  static String? imageLeftRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].image_leftrear''',
      ));
  static String? imageIdCard(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].image_idcard''',
      ));
  static List<String>? imageOther(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].image_other''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? oldVmiImage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].old_VMI_image''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].branch_code''',
      ));
  static List<String>? coverTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageCompanyBook(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_company_book''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageOldVmi(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].old_VMI_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic oldVmiPolicyNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_policyNumber''',
      );
  static dynamic pldVmiExpDate(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].old_VMI_expriedDate''',
      );
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].branch_name''',
      ));
  static String? reason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].reason''',
      ));
  static List<String>? garageTypeCodeList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? insurerStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_status''',
        true,
      ) as List?;
  static List? insurerRemark(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_remark''',
        true,
      ) as List?;
  static String? oldVmiFlg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].old_VMI_flg''',
      ));
}

class InsuranceRequestGetVehicleAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? vehicleCategory = '',
    String? carType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vehicle_category": "${vehicleCategory}",
  "car_type": "${carType}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? vehicleId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicleCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicleName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicletype(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyFullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyListName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].list_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerLogo(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? keyword(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].keyword''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? zipcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].zip_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subdistrictname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].subdistrict_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? subdistrictid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].subdistrict_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? districtname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].district_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? districtid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].district_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? provincename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].province_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].province_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? mobilephone(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].mobile_phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireddate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expired_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? licenseid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].license_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].lastName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].firstname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].employee_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].branch_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? financeid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].finance_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? beneficiaryname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].beneficiary_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List? titlethid(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].title_th_id''',
        true,
      ) as List?;
  static List? titleth(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].title_th''',
        true,
      ) as List?;
  static List? description(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].description''',
        true,
      ) as List?;
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? massageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? leadIdList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationIdList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].quotation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAtList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netPremiumTotalList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].expire_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].quotation_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? quotationTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.quotation.total''',
      ));
  static List<String>? flgRenew(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].flg_renew''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationStatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].quotation_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? dateFullText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info.current_time.date_full_text''',
      ));
  static String? monthText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info.current_time.month_text''',
      ));
  static List<String>? oldVMIFlg(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].old_VMI_flg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? approveList(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve''',
        true,
      ) as List?;
  static int? approve(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.count.status_approve''',
      ));
  static List<String>? subproductname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].sub_product_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationtypebakname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].quotation_type_bak_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quotationtypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.quotation.data[*].quotation_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadListHouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstNameListHouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastNameListHouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadsDetailHouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].leads_detail_house[:].package_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? suminSureName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].sum_insure_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insuranceType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.House.data[:].insurance_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? dataHouse(dynamic response) => getJsonField(
        response,
        r'''$.results.info.House.data[:]''',
        true,
      ) as List?;
  static List? dataQuotation(dynamic response) => getJsonField(
        response,
        r'''$.results.info.quotation.data[:]''',
        true,
      ) as List?;
  static int? dataHouseTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.House.total''',
      ));
  static int? dataQuotationTotal(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.results.info.quotation.total''',
      ));
  static List? houseApproveData(dynamic response) => getJsonField(
        response,
        r'''$.results.info.approve_house[:]''',
        true,
      ) as List?;
  static int? approveHouse(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.count.status_approve_house''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? massageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? imgProfile(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.img_profile''',
      ));
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
    String? oldVMIExpriedDate = '',
    String? carTypeDetail = '',
    String? carProvinceName = '',
    String? carProvinceCode = '',
    String? subProduct = '',
    String? evFlag = '',
  }) async {
    final insurerPackage = _serializeJson(insurerPackageJson);
    final ffApiRequestBody = '''
{
"ev_flag":"${evFlag}",
"sub_product":"${subProduct}",
"car_province_name":"${carProvinceName}",
"car_province_code":"${carProvinceCode}",
"car_type_detail":"${carTypeDetail}",
"old_VMI_expriedDate":"${oldVMIExpriedDate}",
"owner_id":"${ownerId}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static dynamic? leads(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads''',
      );
  static int? leadid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads.lead_id''',
      ));
  static List? detail(dynamic response) => getJsonField(
        response,
        r'''$.results.data.detail''',
        true,
      ) as List?;
  static List<int>? leaddtlid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.detail[:].lead_dtl_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? insurershortname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.detail[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? covertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.detail[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garagetypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.detail[:].garage_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.detail[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation.quotation_id''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation.quotation_status''',
      ));
  static String? urlCompare(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads.url''',
      ));
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
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
    String? subProduct = '',
    dynamic? appDriverJson,
    String? evFlag = '',
    String? batteryNumber = '',
    String? batteryNumber2 = '',
    String? wallChargerNumber = '',
    String? horsepower = '',
    String? fileCancelLoan = '',
    String? powerOfAttorney = '',
    String? idCardPowerOfAttorney = '',
    String? sumInsureHouse = '',
    String? sumInsureBuildin = '',
    String? sumInsureTotal = '',
    String? wall = '',
    String? floorGround = '',
    String? floorUpper = '',
    String? roofFrame = '',
    String? roof = '',
    String? amoutHouse = '',
    String? floor = '',
    String? width = '',
    String? length = '',
    String? assured = '',
    String? houseTypeCode = '',
    String? houseTypeName = '',
    String? usableArea = '',
    dynamic? appInsuredPersonJson,
    String? imageApplication2 = '',
  }) async {
    final address = _serializeJson(addressJson);
    final appDriver = _serializeJson(appDriverJson, true);
    final appInsuredPerson = _serializeJson(appInsuredPersonJson, true);
    final ffApiRequestBody = '''
{
"image_application_2":"${imageApplication2}",
  "app_insured_person": ${appInsuredPerson},
  "sum_insure_house": "${sumInsureHouse}",
  "sum_insure_buildin": "${sumInsureBuildin}",
  "sum_insure_total": "${sumInsureTotal}",
  "wall": "${wall}",
  "floor_ground": "${floorGround}",
  "floor_upper": "${floorUpper}",
  "roof_frame": "${roofFrame}",
  "roof": "${roof}",
  "amout_house": "${amoutHouse}",
  "floor": "${floor}",
  "width": "${width}",
  "length": "${length}",
  "assured": "${assured}",
  "house_type_code": "${houseTypeCode}",
  "house_type_name": "${houseTypeName}",
  "usable_area": "${usableArea}",
  "id_card_power_of_attorney": "${idCardPowerOfAttorney}",
  "power_of_attorney": "${powerOfAttorney}",
  "file_cancel_loan": "${fileCancelLoan}",
  "customer_type": "${customerType}",
  "horsepower": "${horsepower}",
  "battery_number": "${batteryNumber}",
  "battery_number_2": "${batteryNumber2}",
  "wall_charger_number": "${wallChargerNumber}",
  "ev_flag": "${evFlag}",
  "app_driver": ${appDriver},
  "sub_product": "${subProduct}",
  "image_quotation_insurer": "${imageQuotationInsurer}",
  "effective_date_insure": "${effectiveDateInsure}",
  "effective_date_act": "${effectiveDateAct}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? quotationshistory(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotations.quotations_history''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_id''',
      ));
  static int? documentsid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.application.document.documents_id''',
      ));
  static String? applicationid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.application.application_id''',
      ));
  static String? paymentstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.payment_status''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.status''',
      ));
  static String? netpremiumtotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.net_premium_total''',
      ));
  static String? grosstotalnet(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.gross_total_net''',
      ));
  static List<String>? paymentfirst(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].payment_first''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentlastdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_last_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentfirstdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_first_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tenor(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].tenor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? acttotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.act_total''',
      ));
  static String? paymentchannel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.payment_channel''',
      ));
  static String? paymenttype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.payment_type''',
      ));
  static dynamic fileapplication(dynamic response) => getJsonField(
        response,
        r'''$.results.data.app_document[:].file_application''',
      );
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      ));
  static String? vehiclename(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_name''',
      ));
  static String? vehiclecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_code''',
      ));
  static String? vehicleid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].vehicle_id''',
      ));
  static String? carregistrationyear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_registration_year''',
      ));
  static String? carregistration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_registration''',
      ));
  static String? carmodelname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_model_name''',
      ));
  static String? carmodelid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_model_id''',
      ));
  static String? carbrandname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_brand_name''',
      ));
  static String? carbrandid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_brand_id''',
      ));
  static String? cartype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_type''',
      ));
  static String? drivertype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].driver_type''',
      ));
  static String? phonenumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].phone_number''',
      ));
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].first_name''',
      ));
  static List<String>? insurercode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].last_name''',
      ));
  static String? idtypeid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.id_type_id''',
      ));
  static String? nationalthaiid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.national_thai_id''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.gender''',
      ));
  static String? titleth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.title_th''',
      ));
  static String? occupationname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.occupation_name''',
      ));
  static String? occupationsubname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.occupation_subname''',
      ));
  static String? applicationid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.application_id''',
      ));
  static String? firstnameth(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.first_name_th''',
      ));
  static String? lastnameth(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.last_name_th''',
      ));
  static String? birthday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.birth_day''',
      ));
  static String? age(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.age''',
      ));
  static String? occupationid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.occupation_id''',
      ));
  static String? mobile1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.mobile1''',
      ));
  static String? mobile2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.mobile2''',
      ));
  static String? email1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.email1''',
      ));
  static String? beneficiaryname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.beneficiary_name''',
      ));
  static String? registrationyear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.registration_year''',
      ));
  static String? brandid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.brand_id''',
      ));
  static String? brandname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.brand_name''',
      ));
  static String? modelid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.model_id''',
      ));
  static String? modelname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.model_name''',
      ));
  static String? makeyear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.make_year''',
      ));
  static String? bodynumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.body_number''',
      ));
  static String? enginenumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.engine_number''',
      ));
  static String? seat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.seat''',
      ));
  static String? cc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.cc''',
      ));
  static String? weight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.weight''',
      ));
  static String? accessoryflg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.accessory_flg''',
      ));
  static String? actflg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.act_flg''',
      ));
  static String? applicationtype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.application_type''',
      ));
  static List<String>? covertypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garagetypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accessorytotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].accessory_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? netpremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].net_premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? leaddtlid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].lead_dtl_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? addressline1(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].address_line1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? addressline2(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].address_line2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subdistrictid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].subdistrict_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subdistrictname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].subdistrict_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? districtid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].district_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? districtname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].district_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].province_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provincename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].province_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? keyword(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].keyword''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? zipcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_address[:].zip_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? grosstotalnet(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].gross_total_net''',
      ));
  static String? makeYear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.make_year''',
      ));
  static List<String>? actAmount(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? employeecodelicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_code_license''',
      ));
  static String? employeefirstnamelicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_firstname_license''',
      ));
  static String? employeelastnamelicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_lastname_license''',
      ));
  static String? employeephonenumberlicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_phone_number_license''',
      ));
  static String? quotationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_id''',
      ));
  static String? paymenttype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_type''',
      ));
  static String? paymentchannel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_channel''',
      ));
  static String? paymentstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      ));
  static String? acttotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].act_total''',
      ));
  static String? registrationcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.registration_code''',
      ));
  static String? registrationprovince(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.registration_province''',
      ));
  static String? employeelicenseidlicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseid_license''',
      ));
  static String? employeelicenseimglicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseimg_license''',
      ));
  static String? employeelicenseexplicense(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].employee_licenseexp_license''',
      ));
  static String? tenor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].tenor''',
      ));
  static String? installmentfirstdue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_first_due''',
      ));
  static String? installmentlastdue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_last_due''',
      ));
  static List<String>? grosstotalnetList(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].gross_total_net''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? netpremiumtotalAppdetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].net_premium_total''',
      ));
  static String? imgfileloanapplicationregister(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].file_loan_application_register''',
      ));
  static String? imageapplication(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_application''',
      ));
  static String? imageidcard(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_idcard''',
      ));
  static String? imagebluebook(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_bluebook''',
      ));
  static String? imageexamination(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_examination''',
      ));
  static String? imagefront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_front''',
      ));
  static String? imagerear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rear''',
      ));
  static String? imageleft(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_left''',
      ));
  static String? imageright(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_right''',
      ));
  static String? imagerightfront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightfront''',
      ));
  static String? imagerightrear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightrear''',
      ));
  static String? imageleftfront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftfront''',
      ));
  static String? imageleftrear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftrear''',
      ));
  static String? imageroof(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_roof''',
      ));
  static String? imagewound1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound1''',
      ));
  static String? imagewound2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound2''',
      ));
  static String? imagewound3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound3''',
      ));
  static String? imagewound4(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound4''',
      ));
  static String? imagewound5(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound5''',
      ));
  static String? imagewound6(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_wound6''',
      ));
  static String? imageaccessories1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories1''',
      ));
  static String? imageaccessories2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories2''',
      ));
  static String? imageaccessories3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories3''',
      ));
  static String? imageaccessories4(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories4''',
      ));
  static String? imageaccessories5(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories5''',
      ));
  static String? imageaccessories6(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_accessories6''',
      ));
  static String? imageother(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_other''',
      ));
  static String? firstPayAmount(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      ));
  static String? sumInsured(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].sum_insured''',
      ));
  static String? trailerSumInsured(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].trailer_sum_insured''',
      ));
  static String? flagCarrier(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].flg_carrier''',
      ));
  static String? flagAct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].flg_act''',
      ));
  static String? flagCoop(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].flg_co_org''',
      ));
  static String? carrierType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_type''',
      ));
  static String? carrierPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_price''',
      ));
  static String? truckPart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].truck_part''',
      ));
  static String? nonePackageImageFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_front''',
      ));
  static String? nonePackageImageRightFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightfront''',
      ));
  static String? nonePackageImageRight(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_right''',
      ));
  static String? nonePackageImageRightRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightrear''',
      ));
  static String? nonePackageImageRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rear''',
      ));
  static String? nonePackageImageLeftRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftrear''',
      ));
  static String? nonePackageImageLeft(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_left''',
      ));
  static String? nonePackageImageLeftFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftfront''',
      ));
  static String? nonePackageImageRoof(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_roof''',
      ));
  static String? nonePackageTrailerImageFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_front_trailer''',
      ));
  static String? nonePackageTrailerImageRightFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightfront_trailer''',
      ));
  static String? nonePackageTrailerImageRight(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_right_trailer''',
      ));
  static String? nonePackageTrailerImageRightRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rightrear_trailer''',
      ));
  static String? nonePackageTrailerImageRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_rear_trailer''',
      ));
  static String? nonePackageTrailerImageLeftRear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftrear_trailer''',
      ));
  static String? nonePackageTrailerImageLeft(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_left_trailer''',
      ));
  static String? nonePackageTrailerImageLeftFront(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_leftfront_trailer''',
      ));
  static String? truckCarryPurpose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].carrier_propose''',
      ));
  static String? truckCurrentPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].truck_current_price''',
      ));
  static String? plateAdditional(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].trailer_car_registration''',
      ));
  static String? customerMemberchip(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].customer_memberchip''',
      ));
  static String? customerType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].customer_type''',
      ));
  static String? nonePackageImageIdCard(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_idcard''',
      ));
  static String? nonePackageImageBlueBook(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_bluebook''',
      ));
  static List<String>? nonePackageImageOther(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads[0].image_other''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? quotationtype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_type''',
      ));
  static String? manualFirstName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].first_name''',
      ));
  static String? manualLastName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].last_name''',
      ));
  static String? manualPhoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].phone_number''',
      ));
  static String? manualCarType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_type''',
      ));
  static String? occupationCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.occupation_code''',
      ));
  static String? imageFrontTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_front_trailer''',
      ));
  static String? imageRearTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rear_trailer''',
      ));
  static String? imageLeftTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_left_trailer''',
      ));
  static String? imageRightTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_right_trailer''',
      ));
  static String? imageRightFrontTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightfront_trailer''',
      ));
  static String? imageRightRearTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_rightrear_trailer''',
      ));
  static String? imageLeftFrontTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftfront_trailer''',
      ));
  static String? imageLeftRearTrailer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_leftrear_trailer''',
      ));
  static String? carregistrationData(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.car_registration''',
      ));
  static String? nonePackageOldVmi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_policyNumber''',
      ));
  static String? nonePackageVmiExpDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_expriedDate''',
      ));
  static String? nonePackageImageOldVmi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_image''',
      ));
  static String? nonePackageImageCompanyBook(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].image_company_book''',
      ));
  static String? imageOldVmi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].old_VMI_image''',
      ));
  static String? imageCompanyBook(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_company_book''',
      ));
  static String? nonePackageFlagRenew(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].flg_renew''',
      ));
  static String? nonePackageCustomerType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].customer_type''',
      ));
  static String? nonePackageFlagOldVmi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_flg''',
      ));
  static String? workType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].work_type''',
      ));
  static String? effectiveDateAct(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].effective_date_act''',
      ));
  static String? incentiveBranchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].branch_code''',
      ));
  static String? incentiveBranchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].branch_name''',
      ));
  static List<String>? insurershortname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? applicationNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.application_no''',
      ));
  static String? effectiveDateInsure(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].effective_date_insure''',
      ));
  static String? imageQuotationInsurer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_quotation_insurer''',
      ));
  static List<String>? insurerlogo(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].insurer_logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? oldVMIexpriedDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].old_VMI_expriedDate''',
      ));
  static String? cartypedetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].car_type_detail''',
      ));
  static String? quotationtypebak(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_type_bak''',
      ));
  static String? fileApplication(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].file_application''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? flgrenew(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].flg_renew''',
      ));
  static String? expiryDateInsure(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[0].expiry_date_insure''',
      ));
  static String? subProduct(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[:].sub_product''',
      ));
  static String? carprovincename(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[:].car_province_name''',
      ));
  static String? carprovincecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[:].car_province_code''',
      ));
  static List<String>? leaddetailcc(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].cc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? quotationtypename(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_type_name''',
      ));
  static String? subproductname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.sub_product_name''',
      ));
  static String? quotationtypebakname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_type_bak_name''',
      ));
  static String? refundremark(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].refund_remark''',
      ));
  static String? flgrenewlead(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[:].flg_renew''',
      ));
  static String? applicationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.application_id''',
      ));
  static List<DriverDataStruct>? appdriver(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_driver[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => DriverDataStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<String>? evflag(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads[:].ev_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? batteryNumber1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.battery_number''',
      ));
  static String? batteryNumber2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.battery_number_2''',
      ));
  static String? wallChargerNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.wall_charger_number''',
      ));
  static String? horsePower(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.horsepower''',
      ));
  static String? customertype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].customer_type''',
      ));
  static String? flgactinlead(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads[0].flg_act''',
      ));
  static List<String>? actamountleaddetail(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grosstotalnetleaddetail(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].gross_total_net''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? filecancelloan(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].file_cancel_loan''',
      ));
  static String? powerofattorney(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].power_of_attorney''',
      ));
  static String? idcardpowerofattorney(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].id_card_power_of_attorney''',
      ));
  static String? seatappdetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].seat''',
      ));
  static List<LeadsHouseStruct>? leadshouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LeadsHouseStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<LeadsDetailHouseStruct>? leadsdetailhouse(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.leads_detail_house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LeadsDetailHouseStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<LeadsHouseStruct>? apphouse(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.app_house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LeadsHouseStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<LeadsDetailHouseStruct>? appdetailhouse(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.app_detail_house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LeadsDetailHouseStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<BenefitorModelStruct>? appInsuredPerson(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.app_insured_person[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BenefitorModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static String? imageapplication2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_document[:].image_application_2''',
      ));
  static String? maximuminsuredperson(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.maximum_insured_person''',
      ));
  static List<String>? inspectionexcept(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].inspection_except''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? covertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.leads_detail[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
    String? tenorFirstDue = '',
  }) async {
    final ffApiRequestBody = '''
{
"tenor_first_due":"${tenorFirstDue}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotations.quotation_status''',
      ));
  static String? taxid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.tax_id''',
      ));
  static String? suffix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.suffix''',
      ));
  static String? ref1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.ref1''',
      ));
  static String? ref2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.ref2''',
      ));
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? blacklistflag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.blacklist_flag''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? blacklistflag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.blacklist_flag''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? quotationStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static String? cancelReason(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      ));
  static String? cancelDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      ));
  static String? vmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      ));
  static String? cmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      ));
  static String? vmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      ));
  static String? cmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      ));
  static String? contractId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      ));
  static String? createDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      ));
  static String? completeDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      ));
  static String? policyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      ));
  static String? vloneContNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_contract_no''',
      ));
  static String? paymenttatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      ));
  static String? paymentype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_type''',
      ));
  static String? paymentChannel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_channel''',
      ));
  static String? netPremiumTotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].net_premium_total''',
      ));
  static String? actTotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].act_total''',
      ));
  static String? grossTotalNet(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].gross_total_net''',
      ));
  static String? tenor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].tenor''',
      ));
  static String? installmentFirstDue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_first_due''',
      ));
  static String? installmentLastDue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail[:].installment_last_due''',
      ));
  static String? vmiDocumentUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_documentUrl''',
      ));
  static String? vloanCuscod(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_cuscod''',
      ));
  static String? cMIdocumentUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_documentUrl''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? houseinstallmentlastdue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail_house[:].installment_last_due''',
      ));
  static String? houseinstallmentfirstdue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail_house[:].installment_first_due''',
      ));
  static String? housegrosstotalnet(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail_house[:].gross_total_net''',
      ));
  static String? housenetpremiumtotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.app_detail_house[:].net_premium_total''',
      ));
  static String? houseamount(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      ));
  static String? housepaymentamount(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_amount''',
      ));
}

class GetFileVmiApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
    String? ownerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "owner_id": "${ownerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getFileVmiApi',
      apiUrl: '${apiUrl}/api/quotations/get-file-vmi',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static String? vmiDocumentUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.VMI_documentUrl''',
      ));
}

class GetFileCmiApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
    String? ownerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "owner_id": "${ownerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getFileCmiApi ',
      apiUrl: '${apiUrl}/api/quotations/get-file-cmi',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static String? cMIdocumentUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.CMI_documentUrl''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? quotationStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static String? cancelReason(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      ));
  static String? cancelDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      ));
  static String? vmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      ));
  static String? cmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      ));
  static String? vmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      ));
  static String? cmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      ));
  static String? contractId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      ));
  static String? createDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      ));
  static String? completeDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      ));
  static String? policyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      ));
  static String? vloneContNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_contract_no''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? quotationStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static String? cancelReason(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_reason_name''',
      ));
  static String? cancelDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cancel_date''',
      ));
  static String? vmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_errorMessage''',
      ));
  static String? cmiMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_errorMessage''',
      ));
  static String? vmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyStatus''',
      ));
  static String? cmiStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.CMI.CMI_policyStatus''',
      ));
  static String? contractId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_contractId''',
      ));
  static String? createDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_send_date''',
      ));
  static String? completeDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.api_complete_date''',
      ));
  static String? policyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.VMI.VMI_policyNumber''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? ref2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].ref2''',
      ));
  static String? ref1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].ref1''',
      ));
  static String? suffix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].suffix''',
      ));
  static String? taxid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].tax_id''',
      ));
  static String? paymentstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation_id''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? ref2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].ref2''',
      ));
  static String? ref1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].ref1''',
      ));
  static String? suffix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].suffix''',
      ));
  static String? taxid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].tax_id''',
      ));
  static String? paymentstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].payment_status''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation_id''',
      ));
  static String? amount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.payments[:].amount''',
      ));
}

class IbsCalculateInstallmentCall {
  static Future<ApiCallResponse> call({
    String? grossTotalNet = '',
    String? vehicleCode = '',
    String? actTotal = '',
    String? insuranceUrl = '',
    String? token = '',
    String? subProduct = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "gross_total_net": "${grossTotalNet}",
  "vehicle_code": "${vehicleCode}",
  "act_total": "${actTotal}",
  "token": "${token}",
  "sub_product": "${subProduct}"
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? paymentfirst(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].payment_first''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentlastdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].installment_last_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentfirstdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].installment_first_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tenor(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.calculate.installment[:].tenor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<InstallmentDataTypeStruct>? installmentDataType(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.calculate.installment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => InstallmentDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
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
    String? subProduct = '',
  }) async {
    final ffApiRequestBody = '''
{
"sub_product":"${subProduct}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RenewCheckRenewCall {
  static Future<ApiCallResponse> call({
    String? firstNameTh = '',
    String? lastNameTh = '',
    String? insuranceUrl = '',
    String? mobile1 = '',
    String? token = '',
    String? carRegistration = '',
    String? nationalThaiId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "first_name_th": "${firstNameTh}",
  "last_name_th": "${lastNameTh}",
  "mobile1": "${mobile1}",
  "car_registration": "${carRegistration}",
"national_thai_id":"${nationalThaiId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewCheckRenew',
      apiUrl: '${insuranceUrl}/api/renew/check-renew',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? titleth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].first_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].last_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? telephoneupdate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].telephone_update''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carregistration(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_registration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].insurer_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? refrenewid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].ref_renew_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? mobile1(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].mobile1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldexpirydate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expirydate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? covertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldcovertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldgaragetypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garagetypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saverenewstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].save_renew_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? datajson(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? callstatusflg(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_flg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RenewCallStatusSaveCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? insuranceUrl = '',
    String? refRenewId = '',
    String? callStatus = '',
    String? callStatusDetails = '',
    String? callStatusSub = '',
    String? callStatusCode = '',
    String? branchCode = '',
    String? branchName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "ref_renew_id": "${refRenewId}",
  "call_status": "${callStatus}",
  "call_status_details": "${callStatusDetails}",
  "call_status_sub": "${callStatusSub}",
  "call_status_code": "${callStatusCode}",
  "branch_code": "${branchCode}",
  "branch_name": "${branchName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewCallStatusSave',
      apiUrl: '${insuranceUrl}/api/call-status/save',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? datajson(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
}

class RenewCallStatusGetHistoryCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? insuranceUrl = '',
    String? refRenewId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "ref_renew_id": "${refRenewId}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewCallStatusGetHistory',
      apiUrl: '${insuranceUrl}/api/call-status/get-his-by-id',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? datajson(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? callstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callstatuscode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callstatussub(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_sub''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callstatusdetails(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_details''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calldatetime(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_date_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calltime(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calldate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callemployeeid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_employee_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callemployeename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_employee_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].branch_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiApplicationsSaveRenewCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? employeeLicenseexpLicense = '',
    String? employeeLicenseimgLicense = '',
    String? employeeLicenseidLicense = '',
    String? employeeCodeLicense = '',
    String? employeeFirstnameLicense = '',
    String? employeeLastnameLicense = '',
    String? employeeBranchLicense = '',
    String? branchCode = '',
    String? branchName = '',
    String? ownerId = '',
    String? ownerName = '',
    String? ownerPhone = '',
    String? actFlg = '',
    String? effectiveDateAct = '',
    String? paymentType = '',
    String? paymentChannel = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? sensitiveConsent = '',
    String? privacyConsent = '',
    String? sanctionConsent = '',
    String? imageIdcard = '',
    String? fileLoanApplicationRegister = '',
    String? quotationId = '',
    String? leadDtlId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${quotationId}",
  "lead_dtl_id": "${leadDtlId}",
  "employee_licenseexp_license": "${employeeLicenseexpLicense}",
  "employee_licenseimg_license": "${employeeLicenseimgLicense}",
  "employee_licenseid_license": "${employeeLicenseidLicense}",
  "employee_code_license": "${employeeCodeLicense}",
  "employee_firstname_license": "${employeeFirstnameLicense}",
  "employee_lastname_license": "${employeeLastnameLicense}",
  "employee_branch_license": "${employeeBranchLicense}",
  "branch_code": "${branchCode}",
  "branch_name": "${branchName}",
  "owner_id": "${ownerId}",
  "owner_name": "${ownerName}",
  "owner_phone": "${ownerPhone}",
  "act_flg": "${actFlg}",
  "effective_date_act": "${effectiveDateAct}",
  "payment_type": "${paymentType}",
  "payment_channel": "${paymentChannel}",
  "vehicle_id": "${vehicleId}",
  "vehicle_code": "${vehicleCode}",
  "vehicle_name": "${vehicleName}",
  "sensitive_consent": "${sensitiveConsent}",
  "privacy_consent": "${privacyConsent}",
  "sanction_consent": "${sanctionConsent}",
  "image_idcard": "${imageIdcard}",
  "file_loan_application_register": "${fileLoanApplicationRegister}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiApplicationsSaveRenew',
      apiUrl: '${insuranceUrl}/api/applications/save/renew',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? tenor(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].tenor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentfirstdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_first_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? installmentlastdue(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].installment_last_due''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? paymentfirst(dynamic response) => (getJsonField(
        response,
        r'''$.results.data.payment.installment[:].payment_first''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? netpremiumtotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.net_premium_total''',
      ));
  static String? grosstotalnet(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.payment.gross_total_net''',
      ));
}

class RenewBranchListCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? level = '',
    String? branchCode = '',
    String? page = '',
    String? perPage = '',
  }) async {
    final ffApiRequestBody = '''
{
  "level": "${level}",
  "branch_code": "${branchCode}",
  "page": "${page}",
  "per_page": "${perPage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewBranchList',
      apiUrl: '${insuranceUrl}/api/renew/branch-list',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? titleth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].first_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].last_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? telephoneupdate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].telephone_update''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carregistration(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_registration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].insurer_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? refrenewid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].ref_renew_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? mobile1(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].mobile1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldexpirydate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expirydate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? covertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldcovertypecode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? oldgaragetypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].old_garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garagetypename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saverenewstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].save_renew_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? datajson(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? callstatusflg(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_flg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RenewPoolListCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? level = '',
    String? branchCode = '',
    String? page = '',
    String? perPage = '',
  }) async {
    final ffApiRequestBody = '''
{
  "level": "${level}",
  "branch_code": "${branchCode}",
  "page": "${page}",
  "per_page": "${perPage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewPoolList',
      apiUrl: '${insuranceUrl}/api/renew/pool-list',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? titleth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].title_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].first_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastnameth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].last_name_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? telephoneupdate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].telephone_update''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carregistration(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].car_registration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].insurer_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? refrenewid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].ref_renew_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? mobile1(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].mobile1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? dataJson(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? saverenewstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].save_renew_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RenewSaveCall {
  static Future<ApiCallResponse> call({
    String? titleTh = '',
    String? firstNameTh = '',
    String? lastNameTh = '',
    String? gender = '',
    String? nationalities = '',
    String? birthDay = '',
    String? occupationName = '',
    String? idType = '',
    String? nationalThaiId = '',
    String? carRegistration = '',
    String? registrationProvince = '',
    String? brandId = '',
    String? brandName = '',
    String? modelId = '',
    String? modelName = '',
    String? bodyNumber = '',
    String? oldEffectiveDate = '',
    String? oldExpiryDate = '',
    String? insurerName = '',
    String? oldVMIPolicyNumber = '',
    String? oldCoverTypeCode = '',
    String? oldGarageTypeName = '',
    String? oldCameraFlg = '',
    String? oldDriverType = '',
    String? oldAccessoryFlg = '',
    String? renewNo = '',
    String? effectiveDate = '',
    String? expiryDate = '',
    String? coverTypeCode = '',
    String? garageTypeName = '',
    String? tpbiPerson = '',
    String? tpbiAccident = '',
    String? tppd = '',
    String? carDamage = '',
    String? carLost = '',
    String? flood = '',
    String? deductible = '',
    String? pa = '',
    String? me = '',
    String? bb = '',
    String? seat = '',
    String? cameraFlg = '',
    String? driverType = '',
    String? driverDob1 = '',
    String? driverDob2 = '',
    String? accessoryFlg = '',
    String? accessoryDetail = '',
    String? roadsideAssistance = '',
    String? netPremium = '',
    String? stamp = '',
    String? vatAmount = '',
    String? grossTotal = '',
    String? claimLoss = '',
    String? claimLossPercent = '',
    String? insurerStatus = '',
    String? telephoneUpdate = '',
    String? branchCode = '',
    String? vehicleCode = '',
    String? engineNumber = '',
    String? cc = '',
    String? weight = '',
    String? registrationYear = '',
    String? makeYear = '',
    String? actFlg = '',
    String? effectiveDateAct = '',
    String? expiryDateAct = '',
    String? actAmount = '',
    String? stampAct = '',
    String? vatAmountAct = '',
    String? beneficiaryName = '',
    String? addressLine1REGISTER = '',
    String? addressLine2REGISTER = '',
    String? subdistrictIdREGISTER = '',
    String? subdistrictNameREGISTER = '',
    String? districtIdREGISTER = '',
    String? districtNameREGISTER = '',
    String? provinceIdREGISTER = '',
    String? provinceNameREGISTER = '',
    String? zipCodeREGISTER = '',
    String? addressLine1CURRENT = '',
    String? addressLine2CURRENT = '',
    String? subdistrictIdCURRENT = '',
    String? subdistrictNameCURRENT = '',
    String? districtIdCURRENT = '',
    String? districtNameCURRENT = '',
    String? provinceIdCURRENT = '',
    String? provinceNameCURRENT = '',
    String? zipCodeCURRENT = '',
    String? refRenewId = '',
    String? employeeCodeLicense = '',
    String? employeeFirstnameLicense = '',
    String? employeeLastnameLicense = '',
    String? employeeBranchLicense = '',
    String? employeeCompanyLicense = '',
    String? employeePhoneNumberLicense = '',
    String? employeeLicenseidLicense = '',
    String? employeeLicenseimgLicense = '',
    String? employeeLicenseexpLicense = '',
    String? ownerId = '',
    String? ownerName = '',
    String? ownerPhone = '',
    String? insuranceUrl = '',
    String? token = '',
    dynamic? dataJson,
    String? empBranchName = '',
    String? empBranchCode = '',
  }) async {
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
"emp_branch_code":"${empBranchCode}",
  "emp_branch_name": "${empBranchName}",
  "data": ${data},
  "title_th": "${titleTh}",
  "first_name_th": "${firstNameTh}",
  "last_name_th": "${lastNameTh}",
  "gender": "${gender}",
  "nationalities": "${nationalities}",
  "birth_day": "${birthDay}",
  "occupation_name": "${occupationName}",
  "id_type": "${idType}",
  "national_thai_id": "${nationalThaiId}",
  "car_registration": "${carRegistration}",
  "registration_province": "${registrationProvince}",
  "brand_id": "${brandId}",
  "brand_name": "${brandName}",
  "model_id": "${modelId}",
  "model_name": "${modelName}",
  "body_number": "${bodyNumber}",
  "old_effective_date": "${oldEffectiveDate}",
  "old_expiry_date": "${oldExpiryDate}",
  "insurer_name": "${insurerName}",
  "old_VMI_policyNumber": "${oldVMIPolicyNumber}",
  "old_cover_type_code": "${oldCoverTypeCode}",
  "old_garage_type_name": "${oldGarageTypeName}",
  "old_camera_flg": "${oldCameraFlg}",
  "old_driver_type": "${oldDriverType}",
  "old_accessory_flg": "${oldAccessoryFlg}",
  "renew_no": "${renewNo}",
  "effective_date": "${effectiveDate}",
  "expiry_date": "${expiryDate}",
  "cover_type_code": "${coverTypeCode}",
  "garage_type_name": "${garageTypeName}",
  "tpbi_person": "${tpbiPerson}",
  "tpbi_accident": "${tpbiAccident}",
  "tppd": "${tppd}",
  "car_damage": "${carDamage}",
  "car_lost": "${carLost}",
  "flood": "${flood}",
  "deductible": "${deductible}",
  "pa": "${pa}",
  "me": "${me}",
  "bb": "${bb}",
  "seat": "${seat}",
  "camera_flg": "${cameraFlg}",
  "driver_type": "${driverType}",
  "driver_dob1": "${driverDob1}",
  "driver_dob2": "${driverDob2}",
  "accessory_flg": "${accessoryFlg}",
  "accessory_detail": "${accessoryDetail}",
  "roadside_assistance": "${roadsideAssistance}",
  "net_premium": "${netPremium}",
  "stamp": "${stamp}",
  "vat_amount": "${vatAmount}",
  "gross_total": "${grossTotal}",
  "claim_loss": "${claimLoss}",
  "claim_loss_percent": "${claimLossPercent}",
  "insurer_status": "${insurerStatus}",
  "telephone_update": "${telephoneUpdate}",
  "branch_code": "${branchCode}",
  "vehicle_code": "${vehicleCode}",
  "engine_number": "${engineNumber}",
  "cc": "${cc}",
  "weight": "${weight}",
  "registration_year": "${registrationYear}",
  "make_year": "${makeYear}",
  "act_flg": "${actFlg}",
  "effective_date_act": "${effectiveDateAct}",
  "expiry_date_act": "${expiryDateAct}",
  "act_amount": "${actAmount}",
  "stamp_act": "${stampAct}",
  "vat_amount_act": "${vatAmountAct}",
  "beneficiary_name": "${beneficiaryName}",
  "address_line1_REGISTER": "${addressLine1REGISTER}",
  "address_line2_REGISTER": "${addressLine2REGISTER}",
  "subdistrict_id_REGISTER": "${subdistrictIdREGISTER}",
  "subdistrict_name_REGISTER": "${subdistrictNameREGISTER}",
  "district_id_REGISTER": "${districtIdREGISTER}",
  "district_name_REGISTER": "${districtNameREGISTER}",
  "province_id_REGISTER": "${provinceIdREGISTER}",
  "province_name_REGISTER": "${provinceNameREGISTER}",
  "zip_code_REGISTER": "${zipCodeREGISTER}",
  "address_line1_CURRENT": "${addressLine1CURRENT}",
  "address_line2_CURRENT": "${addressLine2CURRENT}",
  "subdistrict_id_CURRENT": "${subdistrictIdCURRENT}",
  "subdistrict_name_CURRENT": "${subdistrictNameCURRENT}",
  "district_id_CURRENT": "${districtIdCURRENT}",
  "district_name_CURRENT": "${districtNameCURRENT}",
  "province_id_CURRENT": "${provinceIdCURRENT}",
  "province_name_CURRENT": "${provinceNameCURRENT}",
  "zip_code_CURRENT": "${zipCodeCURRENT}",
  "ref_renew_id": "${refRenewId}",
  "employee_code_license": "${employeeCodeLicense}",
  "employee_firstname_license": "${employeeFirstnameLicense}",
  "employee_lastname_license": "${employeeLastnameLicense}",
  "employee_branch_license": "${employeeBranchLicense}",
  "employee_company_license": "${employeeCompanyLicense}",
  "employee_phone_number_license": "${employeePhoneNumberLicense}",
  "employee_licenseid_license": "${employeeLicenseidLicense}",
  "employee_licenseimg_license": "${employeeLicenseimgLicense}",
  "employee_licenseexp_license": "${employeeLicenseexpLicense}",
  "owner_id": "${ownerId}",
  "owner_name": "${ownerName}",
  "owner_phone": "${ownerPhone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewSave',
      apiUrl: '${insuranceUrl}/api/renew/save',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation.quotation_id''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation.quotation_status''',
      ));
  static int? leaddtlid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_detail[:].lead_dtl_id''',
      ));
  static String? pdfquotation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.leads_detail[:].pdf_quotation''',
      ));
}

class GetDataRenewCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? refRenewId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "ref_renew_id": "${refRenewId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDataRenew',
      apiUrl: '${insuranceUrl}/api/renew/get-data-renew',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static String? titleth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.title_th''',
      ));
  static String? firstnameth(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.first_name_th''',
      ));
  static String? lastnameth(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.last_name_th''',
      ));
  static String? nationalthaiid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.national_thai_id''',
      ));
  static String? carregistration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.car_registration''',
      ));
  static String? brandname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.brand_name''',
      ));
  static String? modelname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.model_name''',
      ));
  static String? bodynumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.body_number''',
      ));
  static String? oldeffectivedate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_effective_date''',
      ));
  static String? oldexpirydate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_expiry_date''',
      ));
  static String? insurername(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.insurer_name''',
      ));
  static String? oldVMIpolicyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_VMI_policyNumber''',
      ));
  static String? oldcovertypecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_cover_type_code''',
      ));
  static String? oldgaragetypename(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_garage_type_name''',
      ));
  static String? oldcameraflg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_camera_flg''',
      ));
  static String? olddrivertype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_driver_type''',
      ));
  static String? oldaccessoryflg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.old_accessory_flg''',
      ));
  static String? effectivedate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.effective_date''',
      ));
  static String? expirydate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.expiry_date''',
      ));
  static String? covertypecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.cover_type_code''',
      ));
  static String? garagetypename(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.garage_type_name''',
      ));
  static String? tpbiperson(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.tpbi_person''',
      ));
  static String? tpbiaccident(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.tpbi_accident''',
      ));
  static String? tppd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.tppd''',
      ));
  static String? cardamage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.car_damage''',
      ));
  static String? carlost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.car_lost''',
      ));
  static String? deductible(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.deductible''',
      ));
  static String? pa(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.pa''',
      ));
  static String? me(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.me''',
      ));
  static String? bb(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.bb''',
      ));
  static String? seat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.seat''',
      ));
  static String? cameraflg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.camera_flg''',
      ));
  static String? roadsideassistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.roadside_assistance''',
      ));
  static String? netpremium(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.net_premium''',
      ));
  static String? stamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.stamp''',
      ));
  static String? vatamount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.vat_amount''',
      ));
  static String? grosstotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.gross_total''',
      ));
  static String? claimloss(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.claim_loss''',
      ));
  static String? claimlosspercent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.claim_loss_percent''',
      ));
  static String? insurerstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.insurer_status''',
      ));
  static String? branchcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.branch_code''',
      ));
  static String? refrenewid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.ref_renew_id''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.gender''',
      ));
  static String? nationalities(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.nationalities''',
      ));
  static String? birthday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.birth_day''',
      ));
  static String? occupationname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.occupation_name''',
      ));
  static String? idtype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.id_type''',
      ));
  static String? registrationprovince(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.registration_province''',
      ));
  static String? brandid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.brand_id''',
      ));
  static String? modelid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.model_id''',
      ));
  static String? renewno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.renew_no''',
      ));
  static String? flood(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.flood''',
      ));
  static String? drivertype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.driver_type''',
      ));
  static String? driverdob1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.driver_dob1''',
      ));
  static String? driverdob2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.driver_dob2''',
      ));
  static String? accessoryflg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.accessory_flg''',
      ));
  static String? accessorydetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.accessory_detail''',
      ));
  static String? telephoneupdate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.telephone_update''',
      ));
  static String? vehiclecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vehicle_code''',
      ));
  static String? enginenumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.engine_number''',
      ));
  static String? cc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.cc''',
      ));
  static String? weight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.weight''',
      ));
  static String? registrationyear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.registration_year''',
      ));
  static String? makeyear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.make_year''',
      ));
  static String? actflg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.act_flg''',
      ));
  static String? effectivedateact(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.effective_date_act''',
      ));
  static String? expirydateact(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.expiry_date_act''',
      ));
  static String? actamount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.act_amount''',
      ));
  static String? stampact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.stamp_act''',
      ));
  static String? vatamountact(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vat_amount_act''',
      ));
  static String? beneficiaryname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.beneficiary_name''',
      ));
  static String? addressline1REGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.address_line1_REGISTER''',
      ));
  static String? addressline2REGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.address_line2_REGISTER''',
      ));
  static String? subdistrictidREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.subdistrict_id_REGISTER''',
      ));
  static String? subdistrictnameREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.subdistrict_name_REGISTER''',
      ));
  static String? districtidREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.district_id_REGISTER''',
      ));
  static String? districtnameREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.district_name_REGISTER''',
      ));
  static String? provinceidREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.province_id_REGISTER''',
      ));
  static String? provincenameREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.province_name_REGISTER''',
      ));
  static String? zipcodeREGISTER(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.zip_code_REGISTER''',
      ));
  static String? addressline1CURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.address_line1_CURRENT''',
      ));
  static String? addressline2CURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.address_line2_CURRENT''',
      ));
  static String? subdistrictidCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.subdistrict_id_CURRENT''',
      ));
  static String? subdistrictnameCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.subdistrict_name_CURRENT''',
      ));
  static String? districtidCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.district_id_CURRENT''',
      ));
  static String? districtnameCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.district_name_CURRENT''',
      ));
  static String? provinceidCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.province_id_CURRENT''',
      ));
  static String? provincenameCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.province_name_CURRENT''',
      ));
  static String? zipcodeCURRENT(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.zip_code_CURRENT''',
      ));
  static String? suminsured(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.sum_insured''',
      ));
  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
      );
  static String? insurerlogo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.insurer_logo''',
      ));
  static String? saverenewstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.save_renew_status''',
      ));
  static String? netpremiumtotal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.net_premium_total''',
      ));
  static String? acttotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.act_total''',
      ));
}

class CmiCheckAPICall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? chassisNbr = '',
    String? effDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "token": "${token}",
  "CHASSIS_NBR": "${chassisNbr}",
  "EFF_DATE": "${effDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cmiCheckAPI',
      apiUrl: '${insuranceUrl}/cmi/check',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? errorcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.ERROR_CODE''',
      ));
  static String? polid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.POL_ID''',
      ));
  static String? edate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.EDATE''',
      ));
  static String? xdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.XDATE''',
      ));
}

class CmiSaveLeadsCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? carBrandId = '',
    String? carBrandName = '',
    String? carModelId = '',
    String? carModelName = '',
    String? carRegistration = '',
    String? carRegistrationYear = '',
    String? firstName = '',
    String? phoneNumber = '',
    String? carType = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? bodyNumber = '',
    String? effectiveDateAct = '',
    String? lastName = '',
    String? ownerName = '',
    String? ownerPhone = '',
    String? ownerId = '',
    String? branchCode = '',
    String? branchName = '',
    String? customerType = '',
  }) async {
    final ffApiRequestBody = '''
{
"customer_type":"${customerType}",
"owner_name":"${ownerName}",
"owner_phone":"${ownerPhone}",
"owner_id":"${ownerId}",
"branch_code":"${branchCode}",
"branch_name":"${branchName}",
  "insurance_url": "${insuranceUrl}",
  "token": "${token}",
  "car_brand_id": "${carBrandId}",
  "car_brand_name": "${carBrandName}",
  "car_model_id": "${carModelId}",
  "car_model_name": "${carModelName}",
  "car_registration": "${carRegistration}",
  "car_registration_year": "${carRegistrationYear}",
  "first_name": "${firstName}",
  "phone_number": "${phoneNumber}",
  "car_type": "${carType}",
  "vehicle_id": "${vehicleId}",
  "vehicle_code": "${vehicleCode}",
  "vehicle_name": "${vehicleName}",
  "body_number": "${bodyNumber}",
  "effective_date_act": "${effectiveDateAct}",
  "last_name": "${lastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cmiSaveLeads',
      apiUrl: '${insuranceUrl}/api/cmi/save-leads',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation.quotation_id''',
      ));
  static int? leaddtlid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_detail[:].lead_dtl_id''',
      ));
}

class ApiLicenseGetLicenseCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? employeeCodeLicense = '',
  }) async {
    final ffApiRequestBody = '''
{
  "employee_code_license":"${employeeCodeLicense}" 
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiLicenseGetLicense',
      apiUrl: '${insuranceUrl}/api/license/get-license',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data[:].title''',
      ));
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data[:].firstname''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data[:].lastName''',
      ));
  static String? licenseid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data[:].license_id''',
      ));
  static String? check(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.check''',
      ));
}

class ApiLicenseSaveLicenseCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? employeeCodeLicense = '',
    String? quotationId = '',
    String? leadId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "employee_code_license": "${employeeCodeLicense}",
  "quotation_id": "${quotationId}",
  "lead_id": "${leadId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiLicenseSaveLicense',
      apiUrl: '${insuranceUrl}/api/license/save-license',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ApiLicenseCancelLicenseCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? token = '',
    String? employeeCodeLicense = '',
    String? quotationId = '',
    String? leadId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "employee_code_license": "${employeeCodeLicense}",
  "quotation_id": "${quotationId}",
  "lead_id": "${leadId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiLicenseCancelLicense',
      apiUrl: '${insuranceUrl}/api/license/cancel-license',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? occupationsubname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].occupation_subname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? occupationsubcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].occupation_subcode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? occupationname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].occupation_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? occupationcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].occupation_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.results.data.access_token''',
      );
  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? leadsid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_id''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.results.data.access_token''',
      );
  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? leadsid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_id''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.access_token''',
      ));
  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
}

class RenewMasterGetCallStatusCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renewMasterGetCallStatus',
      apiUrl: '${insuranceUrl}/api/insurance/master/get-call-status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? callstatusid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callstatus(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? channel(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callstatuscode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].call_status_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VloanBarcodeGenCall {
  static Future<ApiCallResponse> call({
    String? dbname = '',
    String? keySearch = '',
  }) async {
    final ffApiRequestBody = '''
{
  "db_name": "${dbname}",
  "key_search": "${keySearch}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'vloanBarcodeGen',
      apiUrl: 'http://34.142.213.42:8080/barcode',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statuslayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.code''',
      ));
  static String? messagelayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
  static String? prefix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.prefix''',
      ));
  static String? suffix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.suffix''',
      ));
  static String? taxid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.tax_id''',
      ));
  static String? ref1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.ref1''',
      ));
  static String? ref2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.ref2''',
      ));
  static int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.amount''',
      ));
}

class ApiCmiSaveContractCall {
  static Future<ApiCallResponse> call({
    String? insuranceUrl = '',
    String? quotationId = '',
    String? contractNo = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insurance_url": "${insuranceUrl}",
  "quotation_id": "${quotationId}",
  "contract_no": "${contractNo}",
  "access_token": "${accessToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiCmiSaveContract',
      apiUrl: '${insuranceUrl}/api/cmi/save-contract',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? applicationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.application_id''',
      ));
  static int? quotationid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.quotation_id''',
      ));
  static String? quotationstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.quotation_status''',
      ));
  static String? vloanbookflag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_book_flag''',
      ));
  static String? vloanbookdate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_book_date''',
      ));
  static String? vloanbookstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.vloan_book_status''',
      ));
}

class DownloadVmiThanachatCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadVmiThanachat',
      apiUrl:
          'https://tniservice-uat.thanachartinsurance.co.th/ExBrokerLandingPage/download/epolicy?m9ZDB3yt9vkBAJv7DeoavqBAqho4EN8LysE8ycsUtdCkdvFTQUsTQIGUUqxioIU83L1jvlwATOH92qv31b/etWt2KPfTnrkbTCgH92CoDUOipf+E1gUyfC7UX3weudY5',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TimerApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'timerApi',
      apiUrl: 'https://2dfd-49-231-1-82.ngrok-free.app/time',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.time''',
      ));
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
