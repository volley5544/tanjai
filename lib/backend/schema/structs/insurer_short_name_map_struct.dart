// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsurerShortNameMapStruct extends FFFirebaseStruct {
  InsurerShortNameMapStruct({
    List<String>? vmi1,
    List<String>? vmi2,
    List<String>? vmi25,
    List<String>? vmi3,
    List<String>? vmi35,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vmi1 = vmi1,
        _vmi2 = vmi2,
        _vmi25 = vmi25,
        _vmi3 = vmi3,
        _vmi35 = vmi35,
        super(firestoreUtilData);

  // "VMI1" field.
  List<String>? _vmi1;
  List<String> get vmi1 => _vmi1 ?? const [];
  set vmi1(List<String>? val) => _vmi1 = val;

  void updateVmi1(Function(List<String>) updateFn) {
    updateFn(vmi1 ??= []);
  }

  bool hasVmi1() => _vmi1 != null;

  // "VMI2" field.
  List<String>? _vmi2;
  List<String> get vmi2 => _vmi2 ?? const [];
  set vmi2(List<String>? val) => _vmi2 = val;

  void updateVmi2(Function(List<String>) updateFn) {
    updateFn(vmi2 ??= []);
  }

  bool hasVmi2() => _vmi2 != null;

  // "VMI25" field.
  List<String>? _vmi25;
  List<String> get vmi25 => _vmi25 ?? const [];
  set vmi25(List<String>? val) => _vmi25 = val;

  void updateVmi25(Function(List<String>) updateFn) {
    updateFn(vmi25 ??= []);
  }

  bool hasVmi25() => _vmi25 != null;

  // "VMI3" field.
  List<String>? _vmi3;
  List<String> get vmi3 => _vmi3 ?? const [];
  set vmi3(List<String>? val) => _vmi3 = val;

  void updateVmi3(Function(List<String>) updateFn) {
    updateFn(vmi3 ??= []);
  }

  bool hasVmi3() => _vmi3 != null;

  // "VMI35" field.
  List<String>? _vmi35;
  List<String> get vmi35 => _vmi35 ?? const [];
  set vmi35(List<String>? val) => _vmi35 = val;

  void updateVmi35(Function(List<String>) updateFn) {
    updateFn(vmi35 ??= []);
  }

  bool hasVmi35() => _vmi35 != null;

  static InsurerShortNameMapStruct fromMap(Map<String, dynamic> data) =>
      InsurerShortNameMapStruct(
        vmi1: getDataList(data['VMI1']),
        vmi2: getDataList(data['VMI2']),
        vmi25: getDataList(data['VMI25']),
        vmi3: getDataList(data['VMI3']),
        vmi35: getDataList(data['VMI35']),
      );

  static InsurerShortNameMapStruct? maybeFromMap(dynamic data) => data is Map
      ? InsurerShortNameMapStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'VMI1': _vmi1,
        'VMI2': _vmi2,
        'VMI25': _vmi25,
        'VMI3': _vmi3,
        'VMI35': _vmi35,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'VMI1': serializeParam(
          _vmi1,
          ParamType.String,
          isList: true,
        ),
        'VMI2': serializeParam(
          _vmi2,
          ParamType.String,
          isList: true,
        ),
        'VMI25': serializeParam(
          _vmi25,
          ParamType.String,
          isList: true,
        ),
        'VMI3': serializeParam(
          _vmi3,
          ParamType.String,
          isList: true,
        ),
        'VMI35': serializeParam(
          _vmi35,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static InsurerShortNameMapStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InsurerShortNameMapStruct(
        vmi1: deserializeParam<String>(
          data['VMI1'],
          ParamType.String,
          true,
        ),
        vmi2: deserializeParam<String>(
          data['VMI2'],
          ParamType.String,
          true,
        ),
        vmi25: deserializeParam<String>(
          data['VMI25'],
          ParamType.String,
          true,
        ),
        vmi3: deserializeParam<String>(
          data['VMI3'],
          ParamType.String,
          true,
        ),
        vmi35: deserializeParam<String>(
          data['VMI35'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'InsurerShortNameMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InsurerShortNameMapStruct &&
        listEquality.equals(vmi1, other.vmi1) &&
        listEquality.equals(vmi2, other.vmi2) &&
        listEquality.equals(vmi25, other.vmi25) &&
        listEquality.equals(vmi3, other.vmi3) &&
        listEquality.equals(vmi35, other.vmi35);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([vmi1, vmi2, vmi25, vmi3, vmi35]);
}

InsurerShortNameMapStruct createInsurerShortNameMapStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsurerShortNameMapStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsurerShortNameMapStruct? updateInsurerShortNameMapStruct(
  InsurerShortNameMapStruct? insurerShortNameMap, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insurerShortNameMap
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsurerShortNameMapStructData(
  Map<String, dynamic> firestoreData,
  InsurerShortNameMapStruct? insurerShortNameMap,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insurerShortNameMap == null) {
    return;
  }
  if (insurerShortNameMap.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insurerShortNameMap.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insurerShortNameMapData =
      getInsurerShortNameMapFirestoreData(insurerShortNameMap, forFieldValue);
  final nestedData =
      insurerShortNameMapData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      insurerShortNameMap.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsurerShortNameMapFirestoreData(
  InsurerShortNameMapStruct? insurerShortNameMap, [
  bool forFieldValue = false,
]) {
  if (insurerShortNameMap == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insurerShortNameMap.toMap());

  // Add any Firestore field values
  insurerShortNameMap.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsurerShortNameMapListFirestoreData(
  List<InsurerShortNameMapStruct>? insurerShortNameMaps,
) =>
    insurerShortNameMaps
        ?.map((e) => getInsurerShortNameMapFirestoreData(e, true))
        .toList() ??
    [];
