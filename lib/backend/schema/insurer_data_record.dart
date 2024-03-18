import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsurerDataRecord extends FirestoreRecord {
  InsurerDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Insurer_name" field.
  String? _insurerName;
  String get insurerName => _insurerName ?? '';
  bool hasInsurerName() => _insurerName != null;

  // "insurer_phone" field.
  String? _insurerPhone;
  String get insurerPhone => _insurerPhone ?? '';
  bool hasInsurerPhone() => _insurerPhone != null;

  // "insurer_logo" field.
  String? _insurerLogo;
  String get insurerLogo => _insurerLogo ?? '';
  bool hasInsurerLogo() => _insurerLogo != null;

  // "insurer_data_url" field.
  String? _insurerDataUrl;
  String get insurerDataUrl => _insurerDataUrl ?? '';
  bool hasInsurerDataUrl() => _insurerDataUrl != null;

  void _initializeFields() {
    _insurerName = snapshotData['Insurer_name'] as String?;
    _insurerPhone = snapshotData['insurer_phone'] as String?;
    _insurerLogo = snapshotData['insurer_logo'] as String?;
    _insurerDataUrl = snapshotData['insurer_data_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InsurerData');

  static Stream<InsurerDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsurerDataRecord.fromSnapshot(s));

  static Future<InsurerDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsurerDataRecord.fromSnapshot(s));

  static InsurerDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsurerDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsurerDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsurerDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsurerDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsurerDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsurerDataRecordData({
  String? insurerName,
  String? insurerPhone,
  String? insurerLogo,
  String? insurerDataUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Insurer_name': insurerName,
      'insurer_phone': insurerPhone,
      'insurer_logo': insurerLogo,
      'insurer_data_url': insurerDataUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsurerDataRecordDocumentEquality implements Equality<InsurerDataRecord> {
  const InsurerDataRecordDocumentEquality();

  @override
  bool equals(InsurerDataRecord? e1, InsurerDataRecord? e2) {
    return e1?.insurerName == e2?.insurerName &&
        e1?.insurerPhone == e2?.insurerPhone &&
        e1?.insurerLogo == e2?.insurerLogo &&
        e1?.insurerDataUrl == e2?.insurerDataUrl;
  }

  @override
  int hash(InsurerDataRecord? e) => const ListEquality().hash(
      [e?.insurerName, e?.insurerPhone, e?.insurerLogo, e?.insurerDataUrl]);

  @override
  bool isValidKey(Object? o) => o is InsurerDataRecord;
}
