import '/backend/schema/structs/index.dart';

class GetServerTimestampCloudFunctionCallResponse {
  GetServerTimestampCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  String? data;
}
