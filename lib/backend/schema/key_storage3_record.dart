import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyStorage3Record extends FirestoreRecord {
  KeyStorage3Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uat2_api_url" field.
  String? _uat2ApiUrl;
  String get uat2ApiUrl => _uat2ApiUrl ?? '';
  bool hasUat2ApiUrl() => _uat2ApiUrl != null;

  void _initializeFields() {
    _uat2ApiUrl = snapshotData['uat2_api_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Key_Storage3');

  static Stream<KeyStorage3Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeyStorage3Record.fromSnapshot(s));

  static Future<KeyStorage3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeyStorage3Record.fromSnapshot(s));

  static KeyStorage3Record fromSnapshot(DocumentSnapshot snapshot) =>
      KeyStorage3Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeyStorage3Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeyStorage3Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeyStorage3Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeyStorage3Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeyStorage3RecordData({
  String? uat2ApiUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uat2_api_url': uat2ApiUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeyStorage3RecordDocumentEquality implements Equality<KeyStorage3Record> {
  const KeyStorage3RecordDocumentEquality();

  @override
  bool equals(KeyStorage3Record? e1, KeyStorage3Record? e2) {
    return e1?.uat2ApiUrl == e2?.uat2ApiUrl;
  }

  @override
  int hash(KeyStorage3Record? e) => const ListEquality().hash([e?.uat2ApiUrl]);

  @override
  bool isValidKey(Object? o) => o is KeyStorage3Record;
}
