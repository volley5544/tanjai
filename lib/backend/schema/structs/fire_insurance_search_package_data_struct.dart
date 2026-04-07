// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FireInsuranceSearchPackageDataStruct extends FFFirebaseStruct {
  FireInsuranceSearchPackageDataStruct({
    String? houseTypeCode,
    String? houseTypeName,
    String? houseAreaType,
    String? usableArea,
    String? houseFloor,
    String? sumInsureHouse,
    String? sumInsureBuildin,
    String? houseWidth,
    String? houseLong,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _houseTypeCode = houseTypeCode,
        _houseTypeName = houseTypeName,
        _houseAreaType = houseAreaType,
        _usableArea = usableArea,
        _houseFloor = houseFloor,
        _sumInsureHouse = sumInsureHouse,
        _sumInsureBuildin = sumInsureBuildin,
        _houseWidth = houseWidth,
        _houseLong = houseLong,
        super(firestoreUtilData);

  // "houseTypeCode" field.
  String? _houseTypeCode;
  String get houseTypeCode => _houseTypeCode ?? '';
  set houseTypeCode(String? val) => _houseTypeCode = val;

  bool hasHouseTypeCode() => _houseTypeCode != null;

  // "houseTypeName" field.
  String? _houseTypeName;
  String get houseTypeName => _houseTypeName ?? '';
  set houseTypeName(String? val) => _houseTypeName = val;

  bool hasHouseTypeName() => _houseTypeName != null;

  // "houseAreaType" field.
  String? _houseAreaType;
  String get houseAreaType => _houseAreaType ?? '';
  set houseAreaType(String? val) => _houseAreaType = val;

  bool hasHouseAreaType() => _houseAreaType != null;

  // "usableArea" field.
  String? _usableArea;
  String get usableArea => _usableArea ?? '';
  set usableArea(String? val) => _usableArea = val;

  bool hasUsableArea() => _usableArea != null;

  // "houseFloor" field.
  String? _houseFloor;
  String get houseFloor => _houseFloor ?? '';
  set houseFloor(String? val) => _houseFloor = val;

  bool hasHouseFloor() => _houseFloor != null;

  // "sumInsureHouse" field.
  String? _sumInsureHouse;
  String get sumInsureHouse => _sumInsureHouse ?? '';
  set sumInsureHouse(String? val) => _sumInsureHouse = val;

  bool hasSumInsureHouse() => _sumInsureHouse != null;

  // "sumInsureBuildin" field.
  String? _sumInsureBuildin;
  String get sumInsureBuildin => _sumInsureBuildin ?? '';
  set sumInsureBuildin(String? val) => _sumInsureBuildin = val;

  bool hasSumInsureBuildin() => _sumInsureBuildin != null;

  // "houseWidth" field.
  String? _houseWidth;
  String get houseWidth => _houseWidth ?? '';
  set houseWidth(String? val) => _houseWidth = val;

  bool hasHouseWidth() => _houseWidth != null;

  // "houseLong" field.
  String? _houseLong;
  String get houseLong => _houseLong ?? '';
  set houseLong(String? val) => _houseLong = val;

  bool hasHouseLong() => _houseLong != null;

  static FireInsuranceSearchPackageDataStruct fromMap(
          Map<String, dynamic> data) =>
      FireInsuranceSearchPackageDataStruct(
        houseTypeCode: data['houseTypeCode'] as String?,
        houseTypeName: data['houseTypeName'] as String?,
        houseAreaType: data['houseAreaType'] as String?,
        usableArea: data['usableArea'] as String?,
        houseFloor: data['houseFloor'] as String?,
        sumInsureHouse: data['sumInsureHouse'] as String?,
        sumInsureBuildin: data['sumInsureBuildin'] as String?,
        houseWidth: data['houseWidth'] as String?,
        houseLong: data['houseLong'] as String?,
      );

  static FireInsuranceSearchPackageDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FireInsuranceSearchPackageDataStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'houseTypeCode': _houseTypeCode,
        'houseTypeName': _houseTypeName,
        'houseAreaType': _houseAreaType,
        'usableArea': _usableArea,
        'houseFloor': _houseFloor,
        'sumInsureHouse': _sumInsureHouse,
        'sumInsureBuildin': _sumInsureBuildin,
        'houseWidth': _houseWidth,
        'houseLong': _houseLong,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'houseTypeCode': serializeParam(
          _houseTypeCode,
          ParamType.String,
        ),
        'houseTypeName': serializeParam(
          _houseTypeName,
          ParamType.String,
        ),
        'houseAreaType': serializeParam(
          _houseAreaType,
          ParamType.String,
        ),
        'usableArea': serializeParam(
          _usableArea,
          ParamType.String,
        ),
        'houseFloor': serializeParam(
          _houseFloor,
          ParamType.String,
        ),
        'sumInsureHouse': serializeParam(
          _sumInsureHouse,
          ParamType.String,
        ),
        'sumInsureBuildin': serializeParam(
          _sumInsureBuildin,
          ParamType.String,
        ),
        'houseWidth': serializeParam(
          _houseWidth,
          ParamType.String,
        ),
        'houseLong': serializeParam(
          _houseLong,
          ParamType.String,
        ),
      }.withoutNulls;

  static FireInsuranceSearchPackageDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FireInsuranceSearchPackageDataStruct(
        houseTypeCode: deserializeParam(
          data['houseTypeCode'],
          ParamType.String,
          false,
        ),
        houseTypeName: deserializeParam(
          data['houseTypeName'],
          ParamType.String,
          false,
        ),
        houseAreaType: deserializeParam(
          data['houseAreaType'],
          ParamType.String,
          false,
        ),
        usableArea: deserializeParam(
          data['usableArea'],
          ParamType.String,
          false,
        ),
        houseFloor: deserializeParam(
          data['houseFloor'],
          ParamType.String,
          false,
        ),
        sumInsureHouse: deserializeParam(
          data['sumInsureHouse'],
          ParamType.String,
          false,
        ),
        sumInsureBuildin: deserializeParam(
          data['sumInsureBuildin'],
          ParamType.String,
          false,
        ),
        houseWidth: deserializeParam(
          data['houseWidth'],
          ParamType.String,
          false,
        ),
        houseLong: deserializeParam(
          data['houseLong'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FireInsuranceSearchPackageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FireInsuranceSearchPackageDataStruct &&
        houseTypeCode == other.houseTypeCode &&
        houseTypeName == other.houseTypeName &&
        houseAreaType == other.houseAreaType &&
        usableArea == other.usableArea &&
        houseFloor == other.houseFloor &&
        sumInsureHouse == other.sumInsureHouse &&
        sumInsureBuildin == other.sumInsureBuildin &&
        houseWidth == other.houseWidth &&
        houseLong == other.houseLong;
  }

  @override
  int get hashCode => const ListEquality().hash([
        houseTypeCode,
        houseTypeName,
        houseAreaType,
        usableArea,
        houseFloor,
        sumInsureHouse,
        sumInsureBuildin,
        houseWidth,
        houseLong
      ]);
}

FireInsuranceSearchPackageDataStruct
    createFireInsuranceSearchPackageDataStruct({
  String? houseTypeCode,
  String? houseTypeName,
  String? houseAreaType,
  String? usableArea,
  String? houseFloor,
  String? sumInsureHouse,
  String? sumInsureBuildin,
  String? houseWidth,
  String? houseLong,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
        FireInsuranceSearchPackageDataStruct(
          houseTypeCode: houseTypeCode,
          houseTypeName: houseTypeName,
          houseAreaType: houseAreaType,
          usableArea: usableArea,
          houseFloor: houseFloor,
          sumInsureHouse: sumInsureHouse,
          sumInsureBuildin: sumInsureBuildin,
          houseWidth: houseWidth,
          houseLong: houseLong,
          firestoreUtilData: FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
            delete: delete,
            fieldValues: fieldValues,
          ),
        );

FireInsuranceSearchPackageDataStruct?
    updateFireInsuranceSearchPackageDataStruct(
  FireInsuranceSearchPackageDataStruct? fireInsuranceSearchPackageData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
        fireInsuranceSearchPackageData
          ?..firestoreUtilData = FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
          );

void addFireInsuranceSearchPackageDataStructData(
  Map<String, dynamic> firestoreData,
  FireInsuranceSearchPackageDataStruct? fireInsuranceSearchPackageData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fireInsuranceSearchPackageData == null) {
    return;
  }
  if (fireInsuranceSearchPackageData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      fireInsuranceSearchPackageData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fireInsuranceSearchPackageDataData =
      getFireInsuranceSearchPackageDataFirestoreData(
          fireInsuranceSearchPackageData, forFieldValue);
  final nestedData = fireInsuranceSearchPackageDataData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      fireInsuranceSearchPackageData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFireInsuranceSearchPackageDataFirestoreData(
  FireInsuranceSearchPackageDataStruct? fireInsuranceSearchPackageData, [
  bool forFieldValue = false,
]) {
  if (fireInsuranceSearchPackageData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fireInsuranceSearchPackageData.toMap());

  // Add any Firestore field values
  mapToFirestore(fireInsuranceSearchPackageData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFireInsuranceSearchPackageDataListFirestoreData(
  List<FireInsuranceSearchPackageDataStruct>? fireInsuranceSearchPackageDatas,
) =>
    fireInsuranceSearchPackageDatas
        ?.map((e) => getFireInsuranceSearchPackageDataFirestoreData(e, true))
        .toList() ??
    [];
