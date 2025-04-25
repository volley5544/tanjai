// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstallmentDataTypeStruct extends FFFirebaseStruct {
  InstallmentDataTypeStruct({
    List<String>? tenorFirstDue,
    List<String>? tenorFirstDueDefault,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenorFirstDue = tenorFirstDue,
        _tenorFirstDueDefault = tenorFirstDueDefault,
        super(firestoreUtilData);

  // "tenor_first_due" field.
  List<String>? _tenorFirstDue;
  List<String> get tenorFirstDue => _tenorFirstDue ?? const [];
  set tenorFirstDue(List<String>? val) => _tenorFirstDue = val;

  void updateTenorFirstDue(Function(List<String>) updateFn) {
    updateFn(_tenorFirstDue ??= []);
  }

  bool hasTenorFirstDue() => _tenorFirstDue != null;

  // "tenor_first_due_default" field.
  List<String>? _tenorFirstDueDefault;
  List<String> get tenorFirstDueDefault => _tenorFirstDueDefault ?? const [];
  set tenorFirstDueDefault(List<String>? val) => _tenorFirstDueDefault = val;

  void updateTenorFirstDueDefault(Function(List<String>) updateFn) {
    updateFn(_tenorFirstDueDefault ??= []);
  }

  bool hasTenorFirstDueDefault() => _tenorFirstDueDefault != null;

  static InstallmentDataTypeStruct fromMap(Map<String, dynamic> data) =>
      InstallmentDataTypeStruct(
        tenorFirstDue: getDataList(data['tenor_first_due']),
        tenorFirstDueDefault: getDataList(data['tenor_first_due_default']),
      );

  static InstallmentDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? InstallmentDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenor_first_due': _tenorFirstDue,
        'tenor_first_due_default': _tenorFirstDueDefault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenor_first_due': serializeParam(
          _tenorFirstDue,
          ParamType.String,
          isList: true,
        ),
        'tenor_first_due_default': serializeParam(
          _tenorFirstDueDefault,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static InstallmentDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstallmentDataTypeStruct(
        tenorFirstDue: deserializeParam<String>(
          data['tenor_first_due'],
          ParamType.String,
          true,
        ),
        tenorFirstDueDefault: deserializeParam<String>(
          data['tenor_first_due_default'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'InstallmentDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InstallmentDataTypeStruct &&
        listEquality.equals(tenorFirstDue, other.tenorFirstDue) &&
        listEquality.equals(tenorFirstDueDefault, other.tenorFirstDueDefault);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tenorFirstDue, tenorFirstDueDefault]);
}

InstallmentDataTypeStruct createInstallmentDataTypeStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstallmentDataTypeStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstallmentDataTypeStruct? updateInstallmentDataTypeStruct(
  InstallmentDataTypeStruct? installmentDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    installmentDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstallmentDataTypeStructData(
  Map<String, dynamic> firestoreData,
  InstallmentDataTypeStruct? installmentDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (installmentDataType == null) {
    return;
  }
  if (installmentDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && installmentDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final installmentDataTypeData =
      getInstallmentDataTypeFirestoreData(installmentDataType, forFieldValue);
  final nestedData =
      installmentDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      installmentDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstallmentDataTypeFirestoreData(
  InstallmentDataTypeStruct? installmentDataType, [
  bool forFieldValue = false,
]) {
  if (installmentDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(installmentDataType.toMap());

  // Add any Firestore field values
  installmentDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstallmentDataTypeListFirestoreData(
  List<InstallmentDataTypeStruct>? installmentDataTypes,
) =>
    installmentDataTypes
        ?.map((e) => getInstallmentDataTypeFirestoreData(e, true))
        .toList() ??
    [];
