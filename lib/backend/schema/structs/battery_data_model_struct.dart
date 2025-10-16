// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BatteryDataModelStruct extends FFFirebaseStruct {
  BatteryDataModelStruct({
    String? batteryId,
    String? applicationId,
    String? batteryNo,
    String? batteryNumber,
    String? batteryYear,
    String? batteryPurchaseDate,
    String? batteryPrice,
    String? batteryRepSumInsured,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _batteryId = batteryId,
        _applicationId = applicationId,
        _batteryNo = batteryNo,
        _batteryNumber = batteryNumber,
        _batteryYear = batteryYear,
        _batteryPurchaseDate = batteryPurchaseDate,
        _batteryPrice = batteryPrice,
        _batteryRepSumInsured = batteryRepSumInsured,
        super(firestoreUtilData);

  // "battery_id" field.
  String? _batteryId;
  String get batteryId => _batteryId ?? '';
  set batteryId(String? val) => _batteryId = val;

  bool hasBatteryId() => _batteryId != null;

  // "application_id" field.
  String? _applicationId;
  String get applicationId => _applicationId ?? '';
  set applicationId(String? val) => _applicationId = val;

  bool hasApplicationId() => _applicationId != null;

  // "battery_no" field.
  String? _batteryNo;
  String get batteryNo => _batteryNo ?? '';
  set batteryNo(String? val) => _batteryNo = val;

  bool hasBatteryNo() => _batteryNo != null;

  // "battery_number" field.
  String? _batteryNumber;
  String get batteryNumber => _batteryNumber ?? '';
  set batteryNumber(String? val) => _batteryNumber = val;

  bool hasBatteryNumber() => _batteryNumber != null;

  // "battery_year" field.
  String? _batteryYear;
  String get batteryYear => _batteryYear ?? '';
  set batteryYear(String? val) => _batteryYear = val;

  bool hasBatteryYear() => _batteryYear != null;

  // "battery_purchase_date" field.
  String? _batteryPurchaseDate;
  String get batteryPurchaseDate => _batteryPurchaseDate ?? '';
  set batteryPurchaseDate(String? val) => _batteryPurchaseDate = val;

  bool hasBatteryPurchaseDate() => _batteryPurchaseDate != null;

  // "battery_price" field.
  String? _batteryPrice;
  String get batteryPrice => _batteryPrice ?? '';
  set batteryPrice(String? val) => _batteryPrice = val;

  bool hasBatteryPrice() => _batteryPrice != null;

  // "battery_rep_sum_insured" field.
  String? _batteryRepSumInsured;
  String get batteryRepSumInsured => _batteryRepSumInsured ?? '';
  set batteryRepSumInsured(String? val) => _batteryRepSumInsured = val;

  bool hasBatteryRepSumInsured() => _batteryRepSumInsured != null;

  static BatteryDataModelStruct fromMap(Map<String, dynamic> data) =>
      BatteryDataModelStruct(
        batteryId: data['battery_id'] as String?,
        applicationId: data['application_id'] as String?,
        batteryNo: data['battery_no'] as String?,
        batteryNumber: data['battery_number'] as String?,
        batteryYear: data['battery_year'] as String?,
        batteryPurchaseDate: data['battery_purchase_date'] as String?,
        batteryPrice: data['battery_price'] as String?,
        batteryRepSumInsured: data['battery_rep_sum_insured'] as String?,
      );

  static BatteryDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BatteryDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'battery_id': _batteryId,
        'application_id': _applicationId,
        'battery_no': _batteryNo,
        'battery_number': _batteryNumber,
        'battery_year': _batteryYear,
        'battery_purchase_date': _batteryPurchaseDate,
        'battery_price': _batteryPrice,
        'battery_rep_sum_insured': _batteryRepSumInsured,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'battery_id': serializeParam(
          _batteryId,
          ParamType.String,
        ),
        'application_id': serializeParam(
          _applicationId,
          ParamType.String,
        ),
        'battery_no': serializeParam(
          _batteryNo,
          ParamType.String,
        ),
        'battery_number': serializeParam(
          _batteryNumber,
          ParamType.String,
        ),
        'battery_year': serializeParam(
          _batteryYear,
          ParamType.String,
        ),
        'battery_purchase_date': serializeParam(
          _batteryPurchaseDate,
          ParamType.String,
        ),
        'battery_price': serializeParam(
          _batteryPrice,
          ParamType.String,
        ),
        'battery_rep_sum_insured': serializeParam(
          _batteryRepSumInsured,
          ParamType.String,
        ),
      }.withoutNulls;

  static BatteryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BatteryDataModelStruct(
        batteryId: deserializeParam(
          data['battery_id'],
          ParamType.String,
          false,
        ),
        applicationId: deserializeParam(
          data['application_id'],
          ParamType.String,
          false,
        ),
        batteryNo: deserializeParam(
          data['battery_no'],
          ParamType.String,
          false,
        ),
        batteryNumber: deserializeParam(
          data['battery_number'],
          ParamType.String,
          false,
        ),
        batteryYear: deserializeParam(
          data['battery_year'],
          ParamType.String,
          false,
        ),
        batteryPurchaseDate: deserializeParam(
          data['battery_purchase_date'],
          ParamType.String,
          false,
        ),
        batteryPrice: deserializeParam(
          data['battery_price'],
          ParamType.String,
          false,
        ),
        batteryRepSumInsured: deserializeParam(
          data['battery_rep_sum_insured'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BatteryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BatteryDataModelStruct &&
        batteryId == other.batteryId &&
        applicationId == other.applicationId &&
        batteryNo == other.batteryNo &&
        batteryNumber == other.batteryNumber &&
        batteryYear == other.batteryYear &&
        batteryPurchaseDate == other.batteryPurchaseDate &&
        batteryPrice == other.batteryPrice &&
        batteryRepSumInsured == other.batteryRepSumInsured;
  }

  @override
  int get hashCode => const ListEquality().hash([
        batteryId,
        applicationId,
        batteryNo,
        batteryNumber,
        batteryYear,
        batteryPurchaseDate,
        batteryPrice,
        batteryRepSumInsured
      ]);
}

BatteryDataModelStruct createBatteryDataModelStruct({
  String? batteryId,
  String? applicationId,
  String? batteryNo,
  String? batteryNumber,
  String? batteryYear,
  String? batteryPurchaseDate,
  String? batteryPrice,
  String? batteryRepSumInsured,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BatteryDataModelStruct(
      batteryId: batteryId,
      applicationId: applicationId,
      batteryNo: batteryNo,
      batteryNumber: batteryNumber,
      batteryYear: batteryYear,
      batteryPurchaseDate: batteryPurchaseDate,
      batteryPrice: batteryPrice,
      batteryRepSumInsured: batteryRepSumInsured,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BatteryDataModelStruct? updateBatteryDataModelStruct(
  BatteryDataModelStruct? batteryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    batteryDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBatteryDataModelStructData(
  Map<String, dynamic> firestoreData,
  BatteryDataModelStruct? batteryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (batteryDataModel == null) {
    return;
  }
  if (batteryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && batteryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final batteryDataModelData =
      getBatteryDataModelFirestoreData(batteryDataModel, forFieldValue);
  final nestedData =
      batteryDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = batteryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBatteryDataModelFirestoreData(
  BatteryDataModelStruct? batteryDataModel, [
  bool forFieldValue = false,
]) {
  if (batteryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(batteryDataModel.toMap());

  // Add any Firestore field values
  batteryDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBatteryDataModelListFirestoreData(
  List<BatteryDataModelStruct>? batteryDataModels,
) =>
    batteryDataModels
        ?.map((e) => getBatteryDataModelFirestoreData(e, true))
        .toList() ??
    [];
