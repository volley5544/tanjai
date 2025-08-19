// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverBehaviorDataModelStruct extends FFFirebaseStruct {
  DriverBehaviorDataModelStruct({
    List<String>? driverBehavior,
    List<String>? driverBehaviorName,
    List<bool>? driverBehaviorFlag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _driverBehavior = driverBehavior,
        _driverBehaviorName = driverBehaviorName,
        _driverBehaviorFlag = driverBehaviorFlag,
        super(firestoreUtilData);

  // "driver_behavior" field.
  List<String>? _driverBehavior;
  List<String> get driverBehavior => _driverBehavior ?? const [];
  set driverBehavior(List<String>? val) => _driverBehavior = val;

  void updateDriverBehavior(Function(List<String>) updateFn) {
    updateFn(_driverBehavior ??= []);
  }

  bool hasDriverBehavior() => _driverBehavior != null;

  // "driver_behavior_name" field.
  List<String>? _driverBehaviorName;
  List<String> get driverBehaviorName => _driverBehaviorName ?? const [];
  set driverBehaviorName(List<String>? val) => _driverBehaviorName = val;

  void updateDriverBehaviorName(Function(List<String>) updateFn) {
    updateFn(_driverBehaviorName ??= []);
  }

  bool hasDriverBehaviorName() => _driverBehaviorName != null;

  // "driver_behavior_flag" field.
  List<bool>? _driverBehaviorFlag;
  List<bool> get driverBehaviorFlag => _driverBehaviorFlag ?? const [];
  set driverBehaviorFlag(List<bool>? val) => _driverBehaviorFlag = val;

  void updateDriverBehaviorFlag(Function(List<bool>) updateFn) {
    updateFn(_driverBehaviorFlag ??= []);
  }

  bool hasDriverBehaviorFlag() => _driverBehaviorFlag != null;

  static DriverBehaviorDataModelStruct fromMap(Map<String, dynamic> data) =>
      DriverBehaviorDataModelStruct(
        driverBehavior: getDataList(data['driver_behavior']),
        driverBehaviorName: getDataList(data['driver_behavior_name']),
        driverBehaviorFlag: getDataList(data['driver_behavior_flag']),
      );

  static DriverBehaviorDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? DriverBehaviorDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'driver_behavior': _driverBehavior,
        'driver_behavior_name': _driverBehaviorName,
        'driver_behavior_flag': _driverBehaviorFlag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'driver_behavior': serializeParam(
          _driverBehavior,
          ParamType.String,
          isList: true,
        ),
        'driver_behavior_name': serializeParam(
          _driverBehaviorName,
          ParamType.String,
          isList: true,
        ),
        'driver_behavior_flag': serializeParam(
          _driverBehaviorFlag,
          ParamType.bool,
          isList: true,
        ),
      }.withoutNulls;

  static DriverBehaviorDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DriverBehaviorDataModelStruct(
        driverBehavior: deserializeParam<String>(
          data['driver_behavior'],
          ParamType.String,
          true,
        ),
        driverBehaviorName: deserializeParam<String>(
          data['driver_behavior_name'],
          ParamType.String,
          true,
        ),
        driverBehaviorFlag: deserializeParam<bool>(
          data['driver_behavior_flag'],
          ParamType.bool,
          true,
        ),
      );

  @override
  String toString() => 'DriverBehaviorDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DriverBehaviorDataModelStruct &&
        listEquality.equals(driverBehavior, other.driverBehavior) &&
        listEquality.equals(driverBehaviorName, other.driverBehaviorName) &&
        listEquality.equals(driverBehaviorFlag, other.driverBehaviorFlag);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([driverBehavior, driverBehaviorName, driverBehaviorFlag]);
}

DriverBehaviorDataModelStruct createDriverBehaviorDataModelStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DriverBehaviorDataModelStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DriverBehaviorDataModelStruct? updateDriverBehaviorDataModelStruct(
  DriverBehaviorDataModelStruct? driverBehaviorDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    driverBehaviorDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDriverBehaviorDataModelStructData(
  Map<String, dynamic> firestoreData,
  DriverBehaviorDataModelStruct? driverBehaviorDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (driverBehaviorDataModel == null) {
    return;
  }
  if (driverBehaviorDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      driverBehaviorDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final driverBehaviorDataModelData = getDriverBehaviorDataModelFirestoreData(
      driverBehaviorDataModel, forFieldValue);
  final nestedData =
      driverBehaviorDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      driverBehaviorDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDriverBehaviorDataModelFirestoreData(
  DriverBehaviorDataModelStruct? driverBehaviorDataModel, [
  bool forFieldValue = false,
]) {
  if (driverBehaviorDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(driverBehaviorDataModel.toMap());

  // Add any Firestore field values
  driverBehaviorDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDriverBehaviorDataModelListFirestoreData(
  List<DriverBehaviorDataModelStruct>? driverBehaviorDataModels,
) =>
    driverBehaviorDataModels
        ?.map((e) => getDriverBehaviorDataModelFirestoreData(e, true))
        .toList() ??
    [];
