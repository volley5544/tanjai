import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsurerConfigRecord extends FirestoreRecord {
  InsurerConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "config_name" field.
  String? _configName;
  String get configName => _configName ?? '';
  bool hasConfigName() => _configName != null;

  // "insurer_short_name_list" field.
  List<String>? _insurerShortNameList;
  List<String> get insurerShortNameList => _insurerShortNameList ?? const [];
  bool hasInsurerShortNameList() => _insurerShortNameList != null;

  void _initializeFields() {
    _configName = snapshotData['config_name'] as String?;
    _insurerShortNameList =
        getDataList(snapshotData['insurer_short_name_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InsurerConfig');

  static Stream<InsurerConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsurerConfigRecord.fromSnapshot(s));

  static Future<InsurerConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsurerConfigRecord.fromSnapshot(s));

  static InsurerConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsurerConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsurerConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsurerConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsurerConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsurerConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsurerConfigRecordData({
  String? configName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'config_name': configName,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsurerConfigRecordDocumentEquality
    implements Equality<InsurerConfigRecord> {
  const InsurerConfigRecordDocumentEquality();

  @override
  bool equals(InsurerConfigRecord? e1, InsurerConfigRecord? e2) {
    const listEquality = ListEquality();
    return e1?.configName == e2?.configName &&
        listEquality.equals(e1?.insurerShortNameList, e2?.insurerShortNameList);
  }

  @override
  int hash(InsurerConfigRecord? e) =>
      const ListEquality().hash([e?.configName, e?.insurerShortNameList]);

  @override
  bool isValidKey(Object? o) => o is InsurerConfigRecord;
}
