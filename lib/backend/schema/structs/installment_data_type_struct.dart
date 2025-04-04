// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstallmentDataTypeStruct extends FFFirebaseStruct {
  InstallmentDataTypeStruct({
    String? tenor,
    String? installmentFirstDue,
    String? installmentLastDue,
    String? paymentFirst,
    List<String>? tenorFirstDue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenor = tenor,
        _installmentFirstDue = installmentFirstDue,
        _installmentLastDue = installmentLastDue,
        _paymentFirst = paymentFirst,
        _tenorFirstDue = tenorFirstDue,
        super(firestoreUtilData);

  // "tenor" field.
  String? _tenor;
  String get tenor => _tenor ?? '';
  set tenor(String? val) => _tenor = val;

  bool hasTenor() => _tenor != null;

  // "installment_first_due" field.
  String? _installmentFirstDue;
  String get installmentFirstDue => _installmentFirstDue ?? '';
  set installmentFirstDue(String? val) => _installmentFirstDue = val;

  bool hasInstallmentFirstDue() => _installmentFirstDue != null;

  // "installment_last_due" field.
  String? _installmentLastDue;
  String get installmentLastDue => _installmentLastDue ?? '';
  set installmentLastDue(String? val) => _installmentLastDue = val;

  bool hasInstallmentLastDue() => _installmentLastDue != null;

  // "payment_first" field.
  String? _paymentFirst;
  String get paymentFirst => _paymentFirst ?? '';
  set paymentFirst(String? val) => _paymentFirst = val;

  bool hasPaymentFirst() => _paymentFirst != null;

  // "tenor_first_due" field.
  List<String>? _tenorFirstDue;
  List<String> get tenorFirstDue => _tenorFirstDue ?? const [];
  set tenorFirstDue(List<String>? val) => _tenorFirstDue = val;

  void updateTenorFirstDue(Function(List<String>) updateFn) {
    updateFn(_tenorFirstDue ??= []);
  }

  bool hasTenorFirstDue() => _tenorFirstDue != null;

  static InstallmentDataTypeStruct fromMap(Map<String, dynamic> data) =>
      InstallmentDataTypeStruct(
        tenor: data['tenor'] as String?,
        installmentFirstDue: data['installment_first_due'] as String?,
        installmentLastDue: data['installment_last_due'] as String?,
        paymentFirst: data['payment_first'] as String?,
        tenorFirstDue: getDataList(data['tenor_first_due']),
      );

  static InstallmentDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? InstallmentDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenor': _tenor,
        'installment_first_due': _installmentFirstDue,
        'installment_last_due': _installmentLastDue,
        'payment_first': _paymentFirst,
        'tenor_first_due': _tenorFirstDue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenor': serializeParam(
          _tenor,
          ParamType.String,
        ),
        'installment_first_due': serializeParam(
          _installmentFirstDue,
          ParamType.String,
        ),
        'installment_last_due': serializeParam(
          _installmentLastDue,
          ParamType.String,
        ),
        'payment_first': serializeParam(
          _paymentFirst,
          ParamType.String,
        ),
        'tenor_first_due': serializeParam(
          _tenorFirstDue,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static InstallmentDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstallmentDataTypeStruct(
        tenor: deserializeParam(
          data['tenor'],
          ParamType.String,
          false,
        ),
        installmentFirstDue: deserializeParam(
          data['installment_first_due'],
          ParamType.String,
          false,
        ),
        installmentLastDue: deserializeParam(
          data['installment_last_due'],
          ParamType.String,
          false,
        ),
        paymentFirst: deserializeParam(
          data['payment_first'],
          ParamType.String,
          false,
        ),
        tenorFirstDue: deserializeParam<String>(
          data['tenor_first_due'],
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
        tenor == other.tenor &&
        installmentFirstDue == other.installmentFirstDue &&
        installmentLastDue == other.installmentLastDue &&
        paymentFirst == other.paymentFirst &&
        listEquality.equals(tenorFirstDue, other.tenorFirstDue);
  }

  @override
  int get hashCode => const ListEquality().hash([
        tenor,
        installmentFirstDue,
        installmentLastDue,
        paymentFirst,
        tenorFirstDue
      ]);
}

InstallmentDataTypeStruct createInstallmentDataTypeStruct({
  String? tenor,
  String? installmentFirstDue,
  String? installmentLastDue,
  String? paymentFirst,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstallmentDataTypeStruct(
      tenor: tenor,
      installmentFirstDue: installmentFirstDue,
      installmentLastDue: installmentLastDue,
      paymentFirst: paymentFirst,
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
