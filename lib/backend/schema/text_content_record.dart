import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextContentRecord extends FirestoreRecord {
  TextContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "insurerCondition" field.
  List<String>? _insurerCondition;
  List<String> get insurerCondition => _insurerCondition ?? const [];
  bool hasInsurerCondition() => _insurerCondition != null;

  void _initializeFields() {
    _insurerCondition = getDataList(snapshotData['insurerCondition']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('textContent');

  static Stream<TextContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextContentRecord.fromSnapshot(s));

  static Future<TextContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextContentRecord.fromSnapshot(s));

  static TextContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TextContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTextContentRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TextContentRecordDocumentEquality implements Equality<TextContentRecord> {
  const TextContentRecordDocumentEquality();

  @override
  bool equals(TextContentRecord? e1, TextContentRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.insurerCondition, e2?.insurerCondition);
  }

  @override
  int hash(TextContentRecord? e) =>
      const ListEquality().hash([e?.insurerCondition]);

  @override
  bool isValidKey(Object? o) => o is TextContentRecord;
}
