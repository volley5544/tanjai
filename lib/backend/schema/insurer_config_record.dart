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

  // "InsurerInstallment" field.
  List<String>? _insurerInstallment;
  List<String> get insurerInstallment => _insurerInstallment ?? const [];
  bool hasInsurerInstallment() => _insurerInstallment != null;

  // "canInstallmentList" field.
  List<String>? _canInstallmentList;
  List<String> get canInstallmentList => _canInstallmentList ?? const [];
  bool hasCanInstallmentList() => _canInstallmentList != null;

  // "canInstallmentListEmployee" field.
  List<String>? _canInstallmentListEmployee;
  List<String> get canInstallmentListEmployee =>
      _canInstallmentListEmployee ?? const [];
  bool hasCanInstallmentListEmployee() => _canInstallmentListEmployee != null;

  // "canInstallmentListLevel" field.
  List<String>? _canInstallmentListLevel;
  List<String> get canInstallmentListLevel =>
      _canInstallmentListLevel ?? const [];
  bool hasCanInstallmentListLevel() => _canInstallmentListLevel != null;

  // "renewInstallment" field.
  List<String>? _renewInstallment;
  List<String> get renewInstallment => _renewInstallment ?? const [];
  bool hasRenewInstallment() => _renewInstallment != null;

  // "checkInstallmentVmi1" field.
  List<String>? _checkInstallmentVmi1;
  List<String> get checkInstallmentVmi1 => _checkInstallmentVmi1 ?? const [];
  bool hasCheckInstallmentVmi1() => _checkInstallmentVmi1 != null;

  // "checkInstallmentVmi2" field.
  List<String>? _checkInstallmentVmi2;
  List<String> get checkInstallmentVmi2 => _checkInstallmentVmi2 ?? const [];
  bool hasCheckInstallmentVmi2() => _checkInstallmentVmi2 != null;

  // "checkInstallmentVmi2plus" field.
  List<String>? _checkInstallmentVmi2plus;
  List<String> get checkInstallmentVmi2plus =>
      _checkInstallmentVmi2plus ?? const [];
  bool hasCheckInstallmentVmi2plus() => _checkInstallmentVmi2plus != null;

  // "checkInstallmentVmi3" field.
  List<String>? _checkInstallmentVmi3;
  List<String> get checkInstallmentVmi3 => _checkInstallmentVmi3 ?? const [];
  bool hasCheckInstallmentVmi3() => _checkInstallmentVmi3 != null;

  // "checkInstallmentVmi3plus" field.
  List<String>? _checkInstallmentVmi3plus;
  List<String> get checkInstallmentVmi3plus =>
      _checkInstallmentVmi3plus ?? const [];
  bool hasCheckInstallmentVmi3plus() => _checkInstallmentVmi3plus != null;

  void _initializeFields() {
    _configName = snapshotData['config_name'] as String?;
    _insurerShortNameList =
        getDataList(snapshotData['insurer_short_name_list']);
    _insurerInstallment = getDataList(snapshotData['InsurerInstallment']);
    _canInstallmentList = getDataList(snapshotData['canInstallmentList']);
    _canInstallmentListEmployee =
        getDataList(snapshotData['canInstallmentListEmployee']);
    _canInstallmentListLevel =
        getDataList(snapshotData['canInstallmentListLevel']);
    _renewInstallment = getDataList(snapshotData['renewInstallment']);
    _checkInstallmentVmi1 = getDataList(snapshotData['checkInstallmentVmi1']);
    _checkInstallmentVmi2 = getDataList(snapshotData['checkInstallmentVmi2']);
    _checkInstallmentVmi2plus =
        getDataList(snapshotData['checkInstallmentVmi2plus']);
    _checkInstallmentVmi3 = getDataList(snapshotData['checkInstallmentVmi3']);
    _checkInstallmentVmi3plus =
        getDataList(snapshotData['checkInstallmentVmi3plus']);
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
        listEquality.equals(
            e1?.insurerShortNameList, e2?.insurerShortNameList) &&
        listEquality.equals(e1?.insurerInstallment, e2?.insurerInstallment) &&
        listEquality.equals(e1?.canInstallmentList, e2?.canInstallmentList) &&
        listEquality.equals(
            e1?.canInstallmentListEmployee, e2?.canInstallmentListEmployee) &&
        listEquality.equals(
            e1?.canInstallmentListLevel, e2?.canInstallmentListLevel) &&
        listEquality.equals(e1?.renewInstallment, e2?.renewInstallment) &&
        listEquality.equals(
            e1?.checkInstallmentVmi1, e2?.checkInstallmentVmi1) &&
        listEquality.equals(
            e1?.checkInstallmentVmi2, e2?.checkInstallmentVmi2) &&
        listEquality.equals(
            e1?.checkInstallmentVmi2plus, e2?.checkInstallmentVmi2plus) &&
        listEquality.equals(
            e1?.checkInstallmentVmi3, e2?.checkInstallmentVmi3) &&
        listEquality.equals(
            e1?.checkInstallmentVmi3plus, e2?.checkInstallmentVmi3plus);
  }

  @override
  int hash(InsurerConfigRecord? e) => const ListEquality().hash([
        e?.configName,
        e?.insurerShortNameList,
        e?.insurerInstallment,
        e?.canInstallmentList,
        e?.canInstallmentListEmployee,
        e?.canInstallmentListLevel,
        e?.renewInstallment,
        e?.checkInstallmentVmi1,
        e?.checkInstallmentVmi2,
        e?.checkInstallmentVmi2plus,
        e?.checkInstallmentVmi3,
        e?.checkInstallmentVmi3plus
      ]);

  @override
  bool isValidKey(Object? o) => o is InsurerConfigRecord;
}
