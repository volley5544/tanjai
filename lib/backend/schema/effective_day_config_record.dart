import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EffectiveDayConfigRecord extends FirestoreRecord {
  EffectiveDayConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "effective_days_insure" field.
  int? _effectiveDaysInsure;
  int get effectiveDaysInsure => _effectiveDaysInsure ?? 0;
  bool hasEffectiveDaysInsure() => _effectiveDaysInsure != null;

  // "effective_days_act" field.
  int? _effectiveDaysAct;
  int get effectiveDaysAct => _effectiveDaysAct ?? 0;
  bool hasEffectiveDaysAct() => _effectiveDaysAct != null;

  void _initializeFields() {
    _effectiveDaysInsure =
        castToType<int>(snapshotData['effective_days_insure']);
    _effectiveDaysAct = castToType<int>(snapshotData['effective_days_act']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('effectiveDayConfig');

  static Stream<EffectiveDayConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EffectiveDayConfigRecord.fromSnapshot(s));

  static Future<EffectiveDayConfigRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EffectiveDayConfigRecord.fromSnapshot(s));

  static EffectiveDayConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EffectiveDayConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EffectiveDayConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EffectiveDayConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EffectiveDayConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EffectiveDayConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEffectiveDayConfigRecordData({
  int? effectiveDaysInsure,
  int? effectiveDaysAct,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'effective_days_insure': effectiveDaysInsure,
      'effective_days_act': effectiveDaysAct,
    }.withoutNulls,
  );

  return firestoreData;
}

class EffectiveDayConfigRecordDocumentEquality
    implements Equality<EffectiveDayConfigRecord> {
  const EffectiveDayConfigRecordDocumentEquality();

  @override
  bool equals(EffectiveDayConfigRecord? e1, EffectiveDayConfigRecord? e2) {
    return e1?.effectiveDaysInsure == e2?.effectiveDaysInsure &&
        e1?.effectiveDaysAct == e2?.effectiveDaysAct;
  }

  @override
  int hash(EffectiveDayConfigRecord? e) =>
      const ListEquality().hash([e?.effectiveDaysInsure, e?.effectiveDaysAct]);

  @override
  bool isValidKey(Object? o) => o is EffectiveDayConfigRecord;
}
