import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListInsurerCantInstallmentRecord extends FirestoreRecord {
  ListInsurerCantInstallmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "InsurerFullPayment" field.
  List<String>? _insurerFullPayment;
  List<String> get insurerFullPayment => _insurerFullPayment ?? const [];
  bool hasInsurerFullPayment() => _insurerFullPayment != null;

  // "InsurerInstallment" field.
  List<String>? _insurerInstallment;
  List<String> get insurerInstallment => _insurerInstallment ?? const [];
  bool hasInsurerInstallment() => _insurerInstallment != null;

  void _initializeFields() {
    _insurerFullPayment = getDataList(snapshotData['InsurerFullPayment']);
    _insurerInstallment = getDataList(snapshotData['InsurerInstallment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ListInsurerCantInstallment');

  static Stream<ListInsurerCantInstallmentRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ListInsurerCantInstallmentRecord.fromSnapshot(s));

  static Future<ListInsurerCantInstallmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ListInsurerCantInstallmentRecord.fromSnapshot(s));

  static ListInsurerCantInstallmentRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ListInsurerCantInstallmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListInsurerCantInstallmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListInsurerCantInstallmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListInsurerCantInstallmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListInsurerCantInstallmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListInsurerCantInstallmentRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ListInsurerCantInstallmentRecordDocumentEquality
    implements Equality<ListInsurerCantInstallmentRecord> {
  const ListInsurerCantInstallmentRecordDocumentEquality();

  @override
  bool equals(ListInsurerCantInstallmentRecord? e1,
      ListInsurerCantInstallmentRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.insurerFullPayment, e2?.insurerFullPayment) &&
        listEquality.equals(e1?.insurerInstallment, e2?.insurerInstallment);
  }

  @override
  int hash(ListInsurerCantInstallmentRecord? e) =>
      const ListEquality().hash([e?.insurerFullPayment, e?.insurerInstallment]);

  @override
  bool isValidKey(Object? o) => o is ListInsurerCantInstallmentRecord;
}
