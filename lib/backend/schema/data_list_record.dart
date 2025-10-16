import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataListRecord extends FirestoreRecord {
  DataListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CardType" field.
  List<String>? _cardType;
  List<String> get cardType => _cardType ?? const [];
  bool hasCardType() => _cardType != null;

  // "Gender" field.
  List<String>? _gender;
  List<String> get gender => _gender ?? const [];
  bool hasGender() => _gender != null;

  // "Title" field.
  List<String>? _title;
  List<String> get title => _title ?? const [];
  bool hasTitle() => _title != null;

  // "OccupationGroup" field.
  List<String>? _occupationGroup;
  List<String> get occupationGroup => _occupationGroup ?? const [];
  bool hasOccupationGroup() => _occupationGroup != null;

  // "Accessories" field.
  List<String>? _accessories;
  List<String> get accessories => _accessories ?? const [];
  bool hasAccessories() => _accessories != null;

  // "actOfLegislation" field.
  List<String>? _actOfLegislation;
  List<String> get actOfLegislation => _actOfLegislation ?? const [];
  bool hasActOfLegislation() => _actOfLegislation != null;

  // "beneficiary" field.
  List<String>? _beneficiary;
  List<String> get beneficiary => _beneficiary ?? const [];
  bool hasBeneficiary() => _beneficiary != null;

  // "beneficiaryOther" field.
  List<String>? _beneficiaryOther;
  List<String> get beneficiaryOther => _beneficiaryOther ?? const [];
  bool hasBeneficiaryOther() => _beneficiaryOther != null;

  // "Title2" field.
  List<String>? _title2;
  List<String> get title2 => _title2 ?? const [];
  bool hasTitle2() => _title2 != null;

  // "wall" field.
  List<String>? _wall;
  List<String> get wall => _wall ?? const [];
  bool hasWall() => _wall != null;

  // "roof_frame" field.
  List<String>? _roofFrame;
  List<String> get roofFrame => _roofFrame ?? const [];
  bool hasRoofFrame() => _roofFrame != null;

  // "roof" field.
  List<String>? _roof;
  List<String> get roof => _roof ?? const [];
  bool hasRoof() => _roof != null;

  // "floor" field.
  List<String>? _floor;
  List<String> get floor => _floor ?? const [];
  bool hasFloor() => _floor != null;

  // "assured" field.
  List<String>? _assured;
  List<String> get assured => _assured ?? const [];
  bool hasAssured() => _assured != null;

  // "driver_behavior" field.
  List<String>? _driverBehavior;
  List<String> get driverBehavior => _driverBehavior ?? const [];
  bool hasDriverBehavior() => _driverBehavior != null;

  // "driver_behavior_uat" field.
  List<String>? _driverBehaviorUat;
  List<String> get driverBehaviorUat => _driverBehaviorUat ?? const [];
  bool hasDriverBehaviorUat() => _driverBehaviorUat != null;

  // "driver_behavior_flag" field.
  List<bool>? _driverBehaviorFlag;
  List<bool> get driverBehaviorFlag => _driverBehaviorFlag ?? const [];
  bool hasDriverBehaviorFlag() => _driverBehaviorFlag != null;

  // "driver_behavior_flag_uat" field.
  List<bool>? _driverBehaviorFlagUat;
  List<bool> get driverBehaviorFlagUat => _driverBehaviorFlagUat ?? const [];
  bool hasDriverBehaviorFlagUat() => _driverBehaviorFlagUat != null;

  // "driver_behavior_name" field.
  List<String>? _driverBehaviorName;
  List<String> get driverBehaviorName => _driverBehaviorName ?? const [];
  bool hasDriverBehaviorName() => _driverBehaviorName != null;

  // "driver_behavior_name_uat" field.
  List<String>? _driverBehaviorNameUat;
  List<String> get driverBehaviorNameUat => _driverBehaviorNameUat ?? const [];
  bool hasDriverBehaviorNameUat() => _driverBehaviorNameUat != null;

  // "battery_start_year" field.
  String? _batteryStartYear;
  String get batteryStartYear => _batteryStartYear ?? '';
  bool hasBatteryStartYear() => _batteryStartYear != null;

  // "battery_end_year" field.
  String? _batteryEndYear;
  String get batteryEndYear => _batteryEndYear ?? '';
  bool hasBatteryEndYear() => _batteryEndYear != null;

  // "battery_max_year" field.
  String? _batteryMaxYear;
  String get batteryMaxYear => _batteryMaxYear ?? '';
  bool hasBatteryMaxYear() => _batteryMaxYear != null;

  void _initializeFields() {
    _cardType = getDataList(snapshotData['CardType']);
    _gender = getDataList(snapshotData['Gender']);
    _title = getDataList(snapshotData['Title']);
    _occupationGroup = getDataList(snapshotData['OccupationGroup']);
    _accessories = getDataList(snapshotData['Accessories']);
    _actOfLegislation = getDataList(snapshotData['actOfLegislation']);
    _beneficiary = getDataList(snapshotData['beneficiary']);
    _beneficiaryOther = getDataList(snapshotData['beneficiaryOther']);
    _title2 = getDataList(snapshotData['Title2']);
    _wall = getDataList(snapshotData['wall']);
    _roofFrame = getDataList(snapshotData['roof_frame']);
    _roof = getDataList(snapshotData['roof']);
    _floor = getDataList(snapshotData['floor']);
    _assured = getDataList(snapshotData['assured']);
    _driverBehavior = getDataList(snapshotData['driver_behavior']);
    _driverBehaviorUat = getDataList(snapshotData['driver_behavior_uat']);
    _driverBehaviorFlag = getDataList(snapshotData['driver_behavior_flag']);
    _driverBehaviorFlagUat =
        getDataList(snapshotData['driver_behavior_flag_uat']);
    _driverBehaviorName = getDataList(snapshotData['driver_behavior_name']);
    _driverBehaviorNameUat =
        getDataList(snapshotData['driver_behavior_name_uat']);
    _batteryStartYear = snapshotData['battery_start_year'] as String?;
    _batteryEndYear = snapshotData['battery_end_year'] as String?;
    _batteryMaxYear = snapshotData['battery_max_year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dataList');

  static Stream<DataListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DataListRecord.fromSnapshot(s));

  static Future<DataListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DataListRecord.fromSnapshot(s));

  static DataListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DataListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DataListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DataListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DataListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DataListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDataListRecordData({
  String? batteryStartYear,
  String? batteryEndYear,
  String? batteryMaxYear,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'battery_start_year': batteryStartYear,
      'battery_end_year': batteryEndYear,
      'battery_max_year': batteryMaxYear,
    }.withoutNulls,
  );

  return firestoreData;
}

class DataListRecordDocumentEquality implements Equality<DataListRecord> {
  const DataListRecordDocumentEquality();

  @override
  bool equals(DataListRecord? e1, DataListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.cardType, e2?.cardType) &&
        listEquality.equals(e1?.gender, e2?.gender) &&
        listEquality.equals(e1?.title, e2?.title) &&
        listEquality.equals(e1?.occupationGroup, e2?.occupationGroup) &&
        listEquality.equals(e1?.accessories, e2?.accessories) &&
        listEquality.equals(e1?.actOfLegislation, e2?.actOfLegislation) &&
        listEquality.equals(e1?.beneficiary, e2?.beneficiary) &&
        listEquality.equals(e1?.beneficiaryOther, e2?.beneficiaryOther) &&
        listEquality.equals(e1?.title2, e2?.title2) &&
        listEquality.equals(e1?.wall, e2?.wall) &&
        listEquality.equals(e1?.roofFrame, e2?.roofFrame) &&
        listEquality.equals(e1?.roof, e2?.roof) &&
        listEquality.equals(e1?.floor, e2?.floor) &&
        listEquality.equals(e1?.assured, e2?.assured) &&
        listEquality.equals(e1?.driverBehavior, e2?.driverBehavior) &&
        listEquality.equals(e1?.driverBehaviorUat, e2?.driverBehaviorUat) &&
        listEquality.equals(e1?.driverBehaviorFlag, e2?.driverBehaviorFlag) &&
        listEquality.equals(
            e1?.driverBehaviorFlagUat, e2?.driverBehaviorFlagUat) &&
        listEquality.equals(e1?.driverBehaviorName, e2?.driverBehaviorName) &&
        listEquality.equals(
            e1?.driverBehaviorNameUat, e2?.driverBehaviorNameUat) &&
        e1?.batteryStartYear == e2?.batteryStartYear &&
        e1?.batteryEndYear == e2?.batteryEndYear &&
        e1?.batteryMaxYear == e2?.batteryMaxYear;
  }

  @override
  int hash(DataListRecord? e) => const ListEquality().hash([
        e?.cardType,
        e?.gender,
        e?.title,
        e?.occupationGroup,
        e?.accessories,
        e?.actOfLegislation,
        e?.beneficiary,
        e?.beneficiaryOther,
        e?.title2,
        e?.wall,
        e?.roofFrame,
        e?.roof,
        e?.floor,
        e?.assured,
        e?.driverBehavior,
        e?.driverBehaviorUat,
        e?.driverBehaviorFlag,
        e?.driverBehaviorFlagUat,
        e?.driverBehaviorName,
        e?.driverBehaviorNameUat,
        e?.batteryStartYear,
        e?.batteryEndYear,
        e?.batteryMaxYear
      ]);

  @override
  bool isValidKey(Object? o) => o is DataListRecord;
}
