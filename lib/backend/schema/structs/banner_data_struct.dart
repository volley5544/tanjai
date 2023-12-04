// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerDataStruct extends FFFirebaseStruct {
  BannerDataStruct({
    List<String>? pdfUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pdfUrl = pdfUrl,
        super(firestoreUtilData);

  // "pdf_url" field.
  List<String>? _pdfUrl;
  List<String> get pdfUrl => _pdfUrl ?? const [];
  set pdfUrl(List<String>? val) => _pdfUrl = val;
  void updatePdfUrl(Function(List<String>) updateFn) =>
      updateFn(_pdfUrl ??= []);
  bool hasPdfUrl() => _pdfUrl != null;

  static BannerDataStruct fromMap(Map<String, dynamic> data) =>
      BannerDataStruct(
        pdfUrl: getDataList(data['pdf_url']),
      );

  static BannerDataStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BannerDataStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'pdf_url': _pdfUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pdf_url': serializeParam(
          _pdfUrl,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static BannerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BannerDataStruct(
        pdfUrl: deserializeParam<String>(
          data['pdf_url'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'BannerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BannerDataStruct &&
        listEquality.equals(pdfUrl, other.pdfUrl);
  }

  @override
  int get hashCode => const ListEquality().hash([pdfUrl]);
}

BannerDataStruct createBannerDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BannerDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BannerDataStruct? updateBannerDataStruct(
  BannerDataStruct? bannerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bannerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBannerDataStructData(
  Map<String, dynamic> firestoreData,
  BannerDataStruct? bannerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bannerData == null) {
    return;
  }
  if (bannerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bannerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bannerDataData = getBannerDataFirestoreData(bannerData, forFieldValue);
  final nestedData = bannerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bannerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBannerDataFirestoreData(
  BannerDataStruct? bannerData, [
  bool forFieldValue = false,
]) {
  if (bannerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bannerData.toMap());

  // Add any Firestore field values
  bannerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBannerDataListFirestoreData(
  List<BannerDataStruct>? bannerDatas,
) =>
    bannerDatas?.map((e) => getBannerDataFirestoreData(e, true)).toList() ?? [];
