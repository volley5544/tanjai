import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleTypeDropdownRecord extends FirestoreRecord {
  VehicleTypeDropdownRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PickUp2Doors" field.
  VehicleTypeInfoStruct? _pickUp2Doors;
  VehicleTypeInfoStruct get pickUp2Doors =>
      _pickUp2Doors ?? VehicleTypeInfoStruct();
  bool hasPickUp2Doors() => _pickUp2Doors != null;

  // "AllCarVehicle" field.
  VehicleTypeInfoStruct? _allCarVehicle;
  VehicleTypeInfoStruct get allCarVehicle =>
      _allCarVehicle ?? VehicleTypeInfoStruct();
  bool hasAllCarVehicle() => _allCarVehicle != null;

  void _initializeFields() {
    _pickUp2Doors = snapshotData['PickUp2Doors'] is VehicleTypeInfoStruct
        ? snapshotData['PickUp2Doors']
        : VehicleTypeInfoStruct.maybeFromMap(snapshotData['PickUp2Doors']);
    _allCarVehicle = snapshotData['AllCarVehicle'] is VehicleTypeInfoStruct
        ? snapshotData['AllCarVehicle']
        : VehicleTypeInfoStruct.maybeFromMap(snapshotData['AllCarVehicle']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vehicle_Type_Dropdown');

  static Stream<VehicleTypeDropdownRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleTypeDropdownRecord.fromSnapshot(s));

  static Future<VehicleTypeDropdownRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VehicleTypeDropdownRecord.fromSnapshot(s));

  static VehicleTypeDropdownRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleTypeDropdownRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleTypeDropdownRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleTypeDropdownRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleTypeDropdownRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleTypeDropdownRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleTypeDropdownRecordData({
  VehicleTypeInfoStruct? pickUp2Doors,
  VehicleTypeInfoStruct? allCarVehicle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PickUp2Doors': VehicleTypeInfoStruct().toMap(),
      'AllCarVehicle': VehicleTypeInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "PickUp2Doors" field.
  addVehicleTypeInfoStructData(firestoreData, pickUp2Doors, 'PickUp2Doors');

  // Handle nested data for "AllCarVehicle" field.
  addVehicleTypeInfoStructData(firestoreData, allCarVehicle, 'AllCarVehicle');

  return firestoreData;
}

class VehicleTypeDropdownRecordDocumentEquality
    implements Equality<VehicleTypeDropdownRecord> {
  const VehicleTypeDropdownRecordDocumentEquality();

  @override
  bool equals(VehicleTypeDropdownRecord? e1, VehicleTypeDropdownRecord? e2) {
    return e1?.pickUp2Doors == e2?.pickUp2Doors &&
        e1?.allCarVehicle == e2?.allCarVehicle;
  }

  @override
  int hash(VehicleTypeDropdownRecord? e) =>
      const ListEquality().hash([e?.pickUp2Doors, e?.allCarVehicle]);

  @override
  bool isValidKey(Object? o) => o is VehicleTypeDropdownRecord;
}
