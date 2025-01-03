// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadsHouseStruct extends FFFirebaseStruct {
  LeadsHouseStruct({
    int? id,
    int? leadId,
    String? sumInsureHouse,
    String? sumInsureBuildin,
    String? sumInsureOther,
    String? sumInsureTotal,
    String? wall,
    String? floorGround,
    String? floorUpper,
    String? roofFrame,
    String? roof,
    String? amoutHouse,
    String? floor,
    String? width,
    String? length,
    String? assured,
    String? deleted,
    String? createdUserid,
    String? createdAt,
    String? updatedUserid,
    String? updatedAt,
    String? houseTypeCode,
    String? houseTypeName,
    String? usableArea,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _leadId = leadId,
        _sumInsureHouse = sumInsureHouse,
        _sumInsureBuildin = sumInsureBuildin,
        _sumInsureOther = sumInsureOther,
        _sumInsureTotal = sumInsureTotal,
        _wall = wall,
        _floorGround = floorGround,
        _floorUpper = floorUpper,
        _roofFrame = roofFrame,
        _roof = roof,
        _amoutHouse = amoutHouse,
        _floor = floor,
        _width = width,
        _length = length,
        _assured = assured,
        _deleted = deleted,
        _createdUserid = createdUserid,
        _createdAt = createdAt,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
        _houseTypeCode = houseTypeCode,
        _houseTypeName = houseTypeName,
        _usableArea = usableArea,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "lead_id" field.
  int? _leadId;
  int get leadId => _leadId ?? 0;
  set leadId(int? val) => _leadId = val;

  void incrementLeadId(int amount) => leadId = leadId + amount;

  bool hasLeadId() => _leadId != null;

  // "sum_insure_house" field.
  String? _sumInsureHouse;
  String get sumInsureHouse => _sumInsureHouse ?? '';
  set sumInsureHouse(String? val) => _sumInsureHouse = val;

  bool hasSumInsureHouse() => _sumInsureHouse != null;

  // "sum_insure_buildin" field.
  String? _sumInsureBuildin;
  String get sumInsureBuildin => _sumInsureBuildin ?? '';
  set sumInsureBuildin(String? val) => _sumInsureBuildin = val;

  bool hasSumInsureBuildin() => _sumInsureBuildin != null;

  // "sum_insure_other" field.
  String? _sumInsureOther;
  String get sumInsureOther => _sumInsureOther ?? '';
  set sumInsureOther(String? val) => _sumInsureOther = val;

  bool hasSumInsureOther() => _sumInsureOther != null;

  // "sum_insure_total" field.
  String? _sumInsureTotal;
  String get sumInsureTotal => _sumInsureTotal ?? '';
  set sumInsureTotal(String? val) => _sumInsureTotal = val;

  bool hasSumInsureTotal() => _sumInsureTotal != null;

  // "wall" field.
  String? _wall;
  String get wall => _wall ?? '';
  set wall(String? val) => _wall = val;

  bool hasWall() => _wall != null;

  // "floor_ground" field.
  String? _floorGround;
  String get floorGround => _floorGround ?? '';
  set floorGround(String? val) => _floorGround = val;

  bool hasFloorGround() => _floorGround != null;

  // "floor_upper" field.
  String? _floorUpper;
  String get floorUpper => _floorUpper ?? '';
  set floorUpper(String? val) => _floorUpper = val;

  bool hasFloorUpper() => _floorUpper != null;

  // "roof_frame" field.
  String? _roofFrame;
  String get roofFrame => _roofFrame ?? '';
  set roofFrame(String? val) => _roofFrame = val;

  bool hasRoofFrame() => _roofFrame != null;

  // "roof" field.
  String? _roof;
  String get roof => _roof ?? '';
  set roof(String? val) => _roof = val;

  bool hasRoof() => _roof != null;

  // "amout_house" field.
  String? _amoutHouse;
  String get amoutHouse => _amoutHouse ?? '';
  set amoutHouse(String? val) => _amoutHouse = val;

  bool hasAmoutHouse() => _amoutHouse != null;

  // "floor" field.
  String? _floor;
  String get floor => _floor ?? '';
  set floor(String? val) => _floor = val;

  bool hasFloor() => _floor != null;

  // "width" field.
  String? _width;
  String get width => _width ?? '';
  set width(String? val) => _width = val;

  bool hasWidth() => _width != null;

  // "length" field.
  String? _length;
  String get length => _length ?? '';
  set length(String? val) => _length = val;

  bool hasLength() => _length != null;

  // "assured" field.
  String? _assured;
  String get assured => _assured ?? '';
  set assured(String? val) => _assured = val;

  bool hasAssured() => _assured != null;

  // "deleted" field.
  String? _deleted;
  String get deleted => _deleted ?? '';
  set deleted(String? val) => _deleted = val;

  bool hasDeleted() => _deleted != null;

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_userid" field.
  String? _updatedUserid;
  String get updatedUserid => _updatedUserid ?? '';
  set updatedUserid(String? val) => _updatedUserid = val;

  bool hasUpdatedUserid() => _updatedUserid != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "house_type_code" field.
  String? _houseTypeCode;
  String get houseTypeCode => _houseTypeCode ?? '';
  set houseTypeCode(String? val) => _houseTypeCode = val;

  bool hasHouseTypeCode() => _houseTypeCode != null;

  // "house_type_name" field.
  String? _houseTypeName;
  String get houseTypeName => _houseTypeName ?? '';
  set houseTypeName(String? val) => _houseTypeName = val;

  bool hasHouseTypeName() => _houseTypeName != null;

  // "usable_area" field.
  String? _usableArea;
  String get usableArea => _usableArea ?? '';
  set usableArea(String? val) => _usableArea = val;

  bool hasUsableArea() => _usableArea != null;

  static LeadsHouseStruct fromMap(Map<String, dynamic> data) =>
      LeadsHouseStruct(
        id: castToType<int>(data['id']),
        leadId: castToType<int>(data['lead_id']),
        sumInsureHouse: data['sum_insure_house'] as String?,
        sumInsureBuildin: data['sum_insure_buildin'] as String?,
        sumInsureOther: data['sum_insure_other'] as String?,
        sumInsureTotal: data['sum_insure_total'] as String?,
        wall: data['wall'] as String?,
        floorGround: data['floor_ground'] as String?,
        floorUpper: data['floor_upper'] as String?,
        roofFrame: data['roof_frame'] as String?,
        roof: data['roof'] as String?,
        amoutHouse: data['amout_house'] as String?,
        floor: data['floor'] as String?,
        width: data['width'] as String?,
        length: data['length'] as String?,
        assured: data['assured'] as String?,
        deleted: data['deleted'] as String?,
        createdUserid: data['created_userid'] as String?,
        createdAt: data['created_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        houseTypeCode: data['house_type_code'] as String?,
        houseTypeName: data['house_type_name'] as String?,
        usableArea: data['usable_area'] as String?,
      );

  static LeadsHouseStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadsHouseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'lead_id': _leadId,
        'sum_insure_house': _sumInsureHouse,
        'sum_insure_buildin': _sumInsureBuildin,
        'sum_insure_other': _sumInsureOther,
        'sum_insure_total': _sumInsureTotal,
        'wall': _wall,
        'floor_ground': _floorGround,
        'floor_upper': _floorUpper,
        'roof_frame': _roofFrame,
        'roof': _roof,
        'amout_house': _amoutHouse,
        'floor': _floor,
        'width': _width,
        'length': _length,
        'assured': _assured,
        'deleted': _deleted,
        'created_userid': _createdUserid,
        'created_at': _createdAt,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
        'house_type_code': _houseTypeCode,
        'house_type_name': _houseTypeName,
        'usable_area': _usableArea,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'lead_id': serializeParam(
          _leadId,
          ParamType.int,
        ),
        'sum_insure_house': serializeParam(
          _sumInsureHouse,
          ParamType.String,
        ),
        'sum_insure_buildin': serializeParam(
          _sumInsureBuildin,
          ParamType.String,
        ),
        'sum_insure_other': serializeParam(
          _sumInsureOther,
          ParamType.String,
        ),
        'sum_insure_total': serializeParam(
          _sumInsureTotal,
          ParamType.String,
        ),
        'wall': serializeParam(
          _wall,
          ParamType.String,
        ),
        'floor_ground': serializeParam(
          _floorGround,
          ParamType.String,
        ),
        'floor_upper': serializeParam(
          _floorUpper,
          ParamType.String,
        ),
        'roof_frame': serializeParam(
          _roofFrame,
          ParamType.String,
        ),
        'roof': serializeParam(
          _roof,
          ParamType.String,
        ),
        'amout_house': serializeParam(
          _amoutHouse,
          ParamType.String,
        ),
        'floor': serializeParam(
          _floor,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.String,
        ),
        'length': serializeParam(
          _length,
          ParamType.String,
        ),
        'assured': serializeParam(
          _assured,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_userid': serializeParam(
          _updatedUserid,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'house_type_code': serializeParam(
          _houseTypeCode,
          ParamType.String,
        ),
        'house_type_name': serializeParam(
          _houseTypeName,
          ParamType.String,
        ),
        'usable_area': serializeParam(
          _usableArea,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadsHouseStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadsHouseStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.int,
          false,
        ),
        sumInsureHouse: deserializeParam(
          data['sum_insure_house'],
          ParamType.String,
          false,
        ),
        sumInsureBuildin: deserializeParam(
          data['sum_insure_buildin'],
          ParamType.String,
          false,
        ),
        sumInsureOther: deserializeParam(
          data['sum_insure_other'],
          ParamType.String,
          false,
        ),
        sumInsureTotal: deserializeParam(
          data['sum_insure_total'],
          ParamType.String,
          false,
        ),
        wall: deserializeParam(
          data['wall'],
          ParamType.String,
          false,
        ),
        floorGround: deserializeParam(
          data['floor_ground'],
          ParamType.String,
          false,
        ),
        floorUpper: deserializeParam(
          data['floor_upper'],
          ParamType.String,
          false,
        ),
        roofFrame: deserializeParam(
          data['roof_frame'],
          ParamType.String,
          false,
        ),
        roof: deserializeParam(
          data['roof'],
          ParamType.String,
          false,
        ),
        amoutHouse: deserializeParam(
          data['amout_house'],
          ParamType.String,
          false,
        ),
        floor: deserializeParam(
          data['floor'],
          ParamType.String,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.String,
          false,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.String,
          false,
        ),
        assured: deserializeParam(
          data['assured'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
          ParamType.String,
          false,
        ),
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedUserid: deserializeParam(
          data['updated_userid'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        houseTypeCode: deserializeParam(
          data['house_type_code'],
          ParamType.String,
          false,
        ),
        houseTypeName: deserializeParam(
          data['house_type_name'],
          ParamType.String,
          false,
        ),
        usableArea: deserializeParam(
          data['usable_area'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadsHouseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadsHouseStruct &&
        id == other.id &&
        leadId == other.leadId &&
        sumInsureHouse == other.sumInsureHouse &&
        sumInsureBuildin == other.sumInsureBuildin &&
        sumInsureOther == other.sumInsureOther &&
        sumInsureTotal == other.sumInsureTotal &&
        wall == other.wall &&
        floorGround == other.floorGround &&
        floorUpper == other.floorUpper &&
        roofFrame == other.roofFrame &&
        roof == other.roof &&
        amoutHouse == other.amoutHouse &&
        floor == other.floor &&
        width == other.width &&
        length == other.length &&
        assured == other.assured &&
        deleted == other.deleted &&
        createdUserid == other.createdUserid &&
        createdAt == other.createdAt &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
        houseTypeCode == other.houseTypeCode &&
        houseTypeName == other.houseTypeName &&
        usableArea == other.usableArea;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        leadId,
        sumInsureHouse,
        sumInsureBuildin,
        sumInsureOther,
        sumInsureTotal,
        wall,
        floorGround,
        floorUpper,
        roofFrame,
        roof,
        amoutHouse,
        floor,
        width,
        length,
        assured,
        deleted,
        createdUserid,
        createdAt,
        updatedUserid,
        updatedAt,
        houseTypeCode,
        houseTypeName,
        usableArea
      ]);
}

LeadsHouseStruct createLeadsHouseStruct({
  int? id,
  int? leadId,
  String? sumInsureHouse,
  String? sumInsureBuildin,
  String? sumInsureOther,
  String? sumInsureTotal,
  String? wall,
  String? floorGround,
  String? floorUpper,
  String? roofFrame,
  String? roof,
  String? amoutHouse,
  String? floor,
  String? width,
  String? length,
  String? assured,
  String? deleted,
  String? createdUserid,
  String? createdAt,
  String? updatedUserid,
  String? updatedAt,
  String? houseTypeCode,
  String? houseTypeName,
  String? usableArea,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadsHouseStruct(
      id: id,
      leadId: leadId,
      sumInsureHouse: sumInsureHouse,
      sumInsureBuildin: sumInsureBuildin,
      sumInsureOther: sumInsureOther,
      sumInsureTotal: sumInsureTotal,
      wall: wall,
      floorGround: floorGround,
      floorUpper: floorUpper,
      roofFrame: roofFrame,
      roof: roof,
      amoutHouse: amoutHouse,
      floor: floor,
      width: width,
      length: length,
      assured: assured,
      deleted: deleted,
      createdUserid: createdUserid,
      createdAt: createdAt,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
      houseTypeCode: houseTypeCode,
      houseTypeName: houseTypeName,
      usableArea: usableArea,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadsHouseStruct? updateLeadsHouseStruct(
  LeadsHouseStruct? leadsHouse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadsHouse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadsHouseStructData(
  Map<String, dynamic> firestoreData,
  LeadsHouseStruct? leadsHouse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadsHouse == null) {
    return;
  }
  if (leadsHouse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadsHouse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadsHouseData = getLeadsHouseFirestoreData(leadsHouse, forFieldValue);
  final nestedData = leadsHouseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadsHouse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadsHouseFirestoreData(
  LeadsHouseStruct? leadsHouse, [
  bool forFieldValue = false,
]) {
  if (leadsHouse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadsHouse.toMap());

  // Add any Firestore field values
  leadsHouse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadsHouseListFirestoreData(
  List<LeadsHouseStruct>? leadsHouses,
) =>
    leadsHouses?.map((e) => getLeadsHouseFirestoreData(e, true)).toList() ?? [];
