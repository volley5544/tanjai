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

  // "insurerCoverType" field.
  List<String>? _insurerCoverType;
  List<String> get insurerCoverType => _insurerCoverType ?? const [];
  bool hasInsurerCoverType() => _insurerCoverType != null;

  // "insurerGarageType" field.
  List<String>? _insurerGarageType;
  List<String> get insurerGarageType => _insurerGarageType ?? const [];
  bool hasInsurerGarageType() => _insurerGarageType != null;

  // "canInstallmentList" field.
  List<String>? _canInstallmentList;
  List<String> get canInstallmentList => _canInstallmentList ?? const [];
  bool hasCanInstallmentList() => _canInstallmentList != null;

  // "canInstallmentListEmployee" field.
  List<String>? _canInstallmentListEmployee;
  List<String> get canInstallmentListEmployee =>
      _canInstallmentListEmployee ?? const [];
  bool hasCanInstallmentListEmployee() => _canInstallmentListEmployee != null;

  // "canInstallmentLevel" field.
  List<String>? _canInstallmentLevel;
  List<String> get canInstallmentLevel => _canInstallmentLevel ?? const [];
  bool hasCanInstallmentLevel() => _canInstallmentLevel != null;

  // "renewInstallment" field.
  bool? _renewInstallment;
  bool get renewInstallment => _renewInstallment ?? false;
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
    _insurerShortNameMap =
        snapshotData['insurer_short_name_map'] is InsurerShortNameMapStruct
            ? snapshotData['insurer_short_name_map']
            : InsurerShortNameMapStruct.maybeFromMap(
                snapshotData['insurer_short_name_map']);
    _insurerFullPayment = getDataList(snapshotData['InsurerFullPayment']);
    _insurerInstallment = getDataList(snapshotData['InsurerInstallment']);
    _insurerCoverType = getDataList(snapshotData['insurerCoverType']);
    _insurerGarageType = getDataList(snapshotData['insurerGarageType']);
    _canInstallmentList = getDataList(snapshotData['canInstallmentList']);
    _canInstallmentListEmployee =
        getDataList(snapshotData['canInstallmentListEmployee']);
    _canInstallmentLevel = getDataList(snapshotData['canInstallmentLevel']);
    _renewInstallment = snapshotData['renewInstallment'] as bool?;
    _checkInstallmentVmi1 = getDataList(snapshotData['checkInstallmentVmi1']);
    _checkInstallmentVmi2 = getDataList(snapshotData['checkInstallmentVmi2']);
    _checkInstallmentVmi2plus =
        getDataList(snapshotData['checkInstallmentVmi2plus']);
    _checkInstallmentVmi3 = getDataList(snapshotData['checkInstallmentVmi3']);
    _checkInstallmentVmi3plus =
        getDataList(snapshotData['checkInstallmentVmi3plus']);
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
  bool? renewInstallment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'config_name': configName,
      'insurer_short_name_map': InsurerShortNameMapStruct().toMap(),
      'renewInstallment': renewInstallment,
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
        listEquality.equals(e1?.insurerInstallment, e2?.insurerInstallment) &&
        listEquality.equals(e1?.insurerCoverType, e2?.insurerCoverType) &&
        listEquality.equals(e1?.insurerGarageType, e2?.insurerGarageType) &&
        listEquality.equals(e1?.canInstallmentList, e2?.canInstallmentList) &&
        listEquality.equals(
            e1?.canInstallmentListEmployee, e2?.canInstallmentListEmployee) &&
        listEquality.equals(e1?.canInstallmentLevel, e2?.canInstallmentLevel) &&
        e1?.renewInstallment == e2?.renewInstallment &&
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
  int hash(InsurerConfig2Record? e) => const ListEquality().hash([
        e?.configName,
        e?.insurerShortNameMap,
        e?.insurerFullPayment,
        e?.insurerInstallment,
        e?.insurerCoverType,
        e?.insurerGarageType,
        e?.canInstallmentList,
        e?.canInstallmentListEmployee,
        e?.canInstallmentLevel,
        e?.renewInstallment,
        e?.checkInstallmentVmi1,
        e?.checkInstallmentVmi2,
        e?.checkInstallmentVmi2plus,
        e?.checkInstallmentVmi3,
        e?.checkInstallmentVmi3plus
      ]);

  @override
  bool isValidKey(Object? o) => o is InsurerConfig2Record;
}
