import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsurerConfig2Record extends FirestoreRecord {
  InsurerConfig2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "config_name" field.
  String? _configName;
  String get configName => _configName ?? '';
  bool hasConfigName() => _configName != null;

  // "insurer_short_name_map" field.
  InsurerShortNameMapStruct? _insurerShortNameMap;
  InsurerShortNameMapStruct get insurerShortNameMap =>
      _insurerShortNameMap ?? InsurerShortNameMapStruct();
  bool hasInsurerShortNameMap() => _insurerShortNameMap != null;

  // "InsurerFullPayment" field.
  List<String>? _insurerFullPayment;
  List<String> get insurerFullPayment => _insurerFullPayment ?? const [];
  bool hasInsurerFullPayment() => _insurerFullPayment != null;

  // "InsurerInstallment" field.
  List<String>? _insurerInstallment;
  List<String> get insurerInstallment => _insurerInstallment ?? const [];
  bool hasInsurerInstallment() => _insurerInstallment != null;

  void _initializeFields() {
    _configName = snapshotData['config_name'] as String?;
    _insurerShortNameMap = InsurerShortNameMapStruct.maybeFromMap(
        snapshotData['insurer_short_name_map']);
    _insurerFullPayment = getDataList(snapshotData['InsurerFullPayment']);
    _insurerInstallment = getDataList(snapshotData['InsurerInstallment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InsurerConfig2');

  static Stream<InsurerConfig2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsurerConfig2Record.fromSnapshot(s));

  static Future<InsurerConfig2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsurerConfig2Record.fromSnapshot(s));

  static InsurerConfig2Record fromSnapshot(DocumentSnapshot snapshot) =>
      InsurerConfig2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsurerConfig2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsurerConfig2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsurerConfig2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsurerConfig2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsurerConfig2RecordData({
  String? configName,
  InsurerShortNameMapStruct? insurerShortNameMap,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'config_name': configName,
      'insurer_short_name_map': InsurerShortNameMapStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "insurer_short_name_map" field.
  addInsurerShortNameMapStructData(
      firestoreData, insurerShortNameMap, 'insurer_short_name_map');

  return firestoreData;
}

class InsurerConfig2RecordDocumentEquality
    implements Equality<InsurerConfig2Record> {
  const InsurerConfig2RecordDocumentEquality();

  @override
  bool equals(InsurerConfig2Record? e1, InsurerConfig2Record? e2) {
    const listEquality = ListEquality();
    return e1?.configName == e2?.configName &&
        e1?.insurerShortNameMap == e2?.insurerShortNameMap &&
        listEquality.equals(e1?.insurerFullPayment, e2?.insurerFullPayment) &&
        listEquality.equals(e1?.insurerInstallment, e2?.insurerInstallment);
  }

  @override
  int hash(InsurerConfig2Record? e) => const ListEquality().hash([
        e?.configName,
        e?.insurerShortNameMap,
        e?.insurerFullPayment,
        e?.insurerInstallment
      ]);

  @override
  bool isValidKey(Object? o) => o is InsurerConfig2Record;
}
