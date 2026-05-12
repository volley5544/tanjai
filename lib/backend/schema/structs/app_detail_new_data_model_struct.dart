// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppDetailNewDataModelStruct extends FFFirebaseStruct {
  AppDetailNewDataModelStruct({
    String? discountOther,
    String? discountFlg,
    String? discountPercent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _discountOther = discountOther,
        _discountFlg = discountFlg,
        _discountPercent = discountPercent,
        super(firestoreUtilData);

  // "discount_other" field.
  String? _discountOther;
  String get discountOther => _discountOther ?? '';
  set discountOther(String? val) => _discountOther = val;

  bool hasDiscountOther() => _discountOther != null;

  // "discount_flg" field.
  String? _discountFlg;
  String get discountFlg => _discountFlg ?? '';
  set discountFlg(String? val) => _discountFlg = val;

  bool hasDiscountFlg() => _discountFlg != null;

  // "discount_percent" field.
  String? _discountPercent;
  String get discountPercent => _discountPercent ?? '';
  set discountPercent(String? val) => _discountPercent = val;

  bool hasDiscountPercent() => _discountPercent != null;

  static AppDetailNewDataModelStruct fromMap(Map<String, dynamic> data) =>
      AppDetailNewDataModelStruct(
        discountOther: data['discount_other'] as String?,
        discountFlg: data['discount_flg'] as String?,
        discountPercent: data['discount_percent'] as String?,
      );

  static AppDetailNewDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AppDetailNewDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'discount_other': _discountOther,
        'discount_flg': _discountFlg,
        'discount_percent': _discountPercent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'discount_other': serializeParam(
          _discountOther,
          ParamType.String,
        ),
        'discount_flg': serializeParam(
          _discountFlg,
          ParamType.String,
        ),
        'discount_percent': serializeParam(
          _discountPercent,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppDetailNewDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AppDetailNewDataModelStruct(
        discountOther: deserializeParam(
          data['discount_other'],
          ParamType.String,
          false,
        ),
        discountFlg: deserializeParam(
          data['discount_flg'],
          ParamType.String,
          false,
        ),
        discountPercent: deserializeParam(
          data['discount_percent'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppDetailNewDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppDetailNewDataModelStruct &&
        discountOther == other.discountOther &&
        discountFlg == other.discountFlg &&
        discountPercent == other.discountPercent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([discountOther, discountFlg, discountPercent]);
}

AppDetailNewDataModelStruct createAppDetailNewDataModelStruct({
  String? discountOther,
  String? discountFlg,
  String? discountPercent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppDetailNewDataModelStruct(
      discountOther: discountOther,
      discountFlg: discountFlg,
      discountPercent: discountPercent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppDetailNewDataModelStruct? updateAppDetailNewDataModelStruct(
  AppDetailNewDataModelStruct? appDetailNewDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appDetailNewDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppDetailNewDataModelStructData(
  Map<String, dynamic> firestoreData,
  AppDetailNewDataModelStruct? appDetailNewDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appDetailNewDataModel == null) {
    return;
  }
  if (appDetailNewDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      appDetailNewDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appDetailNewDataModelData = getAppDetailNewDataModelFirestoreData(
      appDetailNewDataModel, forFieldValue);
  final nestedData =
      appDetailNewDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      appDetailNewDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppDetailNewDataModelFirestoreData(
  AppDetailNewDataModelStruct? appDetailNewDataModel, [
  bool forFieldValue = false,
]) {
  if (appDetailNewDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appDetailNewDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(appDetailNewDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppDetailNewDataModelListFirestoreData(
  List<AppDetailNewDataModelStruct>? appDetailNewDataModels,
) =>
    appDetailNewDataModels
        ?.map((e) => getAppDetailNewDataModelFirestoreData(e, true))
        .toList() ??
    [];
