// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HouseCalEstimatedModelStruct extends FFFirebaseStruct {
  HouseCalEstimatedModelStruct({
    String? houseTypeGroup,
    int? estimatedPrice,
    int? housePrice,
    int? usableArea,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _houseTypeGroup = houseTypeGroup,
        _estimatedPrice = estimatedPrice,
        _housePrice = housePrice,
        _usableArea = usableArea,
        super(firestoreUtilData);

  // "house_type_group" field.
  String? _houseTypeGroup;
  String get houseTypeGroup => _houseTypeGroup ?? '';
  set houseTypeGroup(String? val) => _houseTypeGroup = val;

  bool hasHouseTypeGroup() => _houseTypeGroup != null;

  // "estimated_price" field.
  int? _estimatedPrice;
  int get estimatedPrice => _estimatedPrice ?? 0;
  set estimatedPrice(int? val) => _estimatedPrice = val;

  void incrementEstimatedPrice(int amount) =>
      estimatedPrice = estimatedPrice + amount;

  bool hasEstimatedPrice() => _estimatedPrice != null;

  // "house_price" field.
  int? _housePrice;
  int get housePrice => _housePrice ?? 0;
  set housePrice(int? val) => _housePrice = val;

  void incrementHousePrice(int amount) => housePrice = housePrice + amount;

  bool hasHousePrice() => _housePrice != null;

  // "usable_area" field.
  int? _usableArea;
  int get usableArea => _usableArea ?? 0;
  set usableArea(int? val) => _usableArea = val;

  void incrementUsableArea(int amount) => usableArea = usableArea + amount;

  bool hasUsableArea() => _usableArea != null;

  static HouseCalEstimatedModelStruct fromMap(Map<String, dynamic> data) =>
      HouseCalEstimatedModelStruct(
        houseTypeGroup: data['house_type_group'] as String?,
        estimatedPrice: castToType<int>(data['estimated_price']),
        housePrice: castToType<int>(data['house_price']),
        usableArea: castToType<int>(data['usable_area']),
      );

  static HouseCalEstimatedModelStruct? maybeFromMap(dynamic data) => data is Map
      ? HouseCalEstimatedModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'house_type_group': _houseTypeGroup,
        'estimated_price': _estimatedPrice,
        'house_price': _housePrice,
        'usable_area': _usableArea,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'house_type_group': serializeParam(
          _houseTypeGroup,
          ParamType.String,
        ),
        'estimated_price': serializeParam(
          _estimatedPrice,
          ParamType.int,
        ),
        'house_price': serializeParam(
          _housePrice,
          ParamType.int,
        ),
        'usable_area': serializeParam(
          _usableArea,
          ParamType.int,
        ),
      }.withoutNulls;

  static HouseCalEstimatedModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HouseCalEstimatedModelStruct(
        houseTypeGroup: deserializeParam(
          data['house_type_group'],
          ParamType.String,
          false,
        ),
        estimatedPrice: deserializeParam(
          data['estimated_price'],
          ParamType.int,
          false,
        ),
        housePrice: deserializeParam(
          data['house_price'],
          ParamType.int,
          false,
        ),
        usableArea: deserializeParam(
          data['usable_area'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HouseCalEstimatedModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HouseCalEstimatedModelStruct &&
        houseTypeGroup == other.houseTypeGroup &&
        estimatedPrice == other.estimatedPrice &&
        housePrice == other.housePrice &&
        usableArea == other.usableArea;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([houseTypeGroup, estimatedPrice, housePrice, usableArea]);
}

HouseCalEstimatedModelStruct createHouseCalEstimatedModelStruct({
  String? houseTypeGroup,
  int? estimatedPrice,
  int? housePrice,
  int? usableArea,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HouseCalEstimatedModelStruct(
      houseTypeGroup: houseTypeGroup,
      estimatedPrice: estimatedPrice,
      housePrice: housePrice,
      usableArea: usableArea,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HouseCalEstimatedModelStruct? updateHouseCalEstimatedModelStruct(
  HouseCalEstimatedModelStruct? houseCalEstimatedModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    houseCalEstimatedModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHouseCalEstimatedModelStructData(
  Map<String, dynamic> firestoreData,
  HouseCalEstimatedModelStruct? houseCalEstimatedModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (houseCalEstimatedModel == null) {
    return;
  }
  if (houseCalEstimatedModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      houseCalEstimatedModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final houseCalEstimatedModelData = getHouseCalEstimatedModelFirestoreData(
      houseCalEstimatedModel, forFieldValue);
  final nestedData =
      houseCalEstimatedModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      houseCalEstimatedModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHouseCalEstimatedModelFirestoreData(
  HouseCalEstimatedModelStruct? houseCalEstimatedModel, [
  bool forFieldValue = false,
]) {
  if (houseCalEstimatedModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(houseCalEstimatedModel.toMap());

  // Add any Firestore field values
  houseCalEstimatedModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHouseCalEstimatedModelListFirestoreData(
  List<HouseCalEstimatedModelStruct>? houseCalEstimatedModels,
) =>
    houseCalEstimatedModels
        ?.map((e) => getHouseCalEstimatedModelFirestoreData(e, true))
        .toList() ??
    [];
