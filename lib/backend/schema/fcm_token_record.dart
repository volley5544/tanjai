import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FcmTokenRecord extends FirestoreRecord {
  FcmTokenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "device_type" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  bool hasDeviceType() => _deviceType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _deviceType = snapshotData['device_type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fcm_token')
          : FirebaseFirestore.instance.collectionGroup('fcm_token');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fcm_token').doc();

  static Stream<FcmTokenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FcmTokenRecord.fromSnapshot(s));

  static Future<FcmTokenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FcmTokenRecord.fromSnapshot(s));

  static FcmTokenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FcmTokenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FcmTokenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FcmTokenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FcmTokenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FcmTokenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFcmTokenRecordData({
  String? employeeId,
  String? fcmToken,
  DateTime? createDate,
  String? uid,
  String? deviceType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
      'fcm_token': fcmToken,
      'create_date': createDate,
      'uid': uid,
      'device_type': deviceType,
    }.withoutNulls,
  );

  return firestoreData;
}

class FcmTokenRecordDocumentEquality implements Equality<FcmTokenRecord> {
  const FcmTokenRecordDocumentEquality();

  @override
  bool equals(FcmTokenRecord? e1, FcmTokenRecord? e2) {
    return e1?.employeeId == e2?.employeeId &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.createDate == e2?.createDate &&
        e1?.uid == e2?.uid &&
        e1?.deviceType == e2?.deviceType;
  }

  @override
  int hash(FcmTokenRecord? e) => const ListEquality()
      .hash([e?.employeeId, e?.fcmToken, e?.createDate, e?.uid, e?.deviceType]);

  @override
  bool isValidKey(Object? o) => o is FcmTokenRecord;
}
