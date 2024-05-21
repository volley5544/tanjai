import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TanjaiBannerRecord extends FirestoreRecord {
  TanjaiBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image_url" field.
  List<String>? _imageUrl;
  List<String> get imageUrl => _imageUrl ?? const [];
  bool hasImageUrl() => _imageUrl != null;

  // "content_link" field.
  List<String>? _contentLink;
  List<String> get contentLink => _contentLink ?? const [];
  bool hasContentLink() => _contentLink != null;

  // "pdf_url" field.
  List<BannerDataStruct>? _pdfUrl;
  List<BannerDataStruct> get pdfUrl => _pdfUrl ?? const [];
  bool hasPdfUrl() => _pdfUrl != null;

  // "order" field.
  List<int>? _order;
  List<int> get order => _order ?? const [];
  bool hasOrder() => _order != null;

  // "is_have_pdf" field.
  List<bool>? _isHavePdf;
  List<bool> get isHavePdf => _isHavePdf ?? const [];
  bool hasIsHavePdf() => _isHavePdf != null;

  // "blur_hash" field.
  List<String>? _blurHash;
  List<String> get blurHash => _blurHash ?? const [];
  bool hasBlurHash() => _blurHash != null;

  void _initializeFields() {
    _imageUrl = getDataList(snapshotData['image_url']);
    _contentLink = getDataList(snapshotData['content_link']);
    _pdfUrl = getStructList(
      snapshotData['pdf_url'],
      BannerDataStruct.fromMap,
    );
    _order = getDataList(snapshotData['order']);
    _isHavePdf = getDataList(snapshotData['is_have_pdf']);
    _blurHash = getDataList(snapshotData['blur_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TanjaiBanner');

  static Stream<TanjaiBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TanjaiBannerRecord.fromSnapshot(s));

  static Future<TanjaiBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TanjaiBannerRecord.fromSnapshot(s));

  static TanjaiBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TanjaiBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TanjaiBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TanjaiBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TanjaiBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TanjaiBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTanjaiBannerRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TanjaiBannerRecordDocumentEquality
    implements Equality<TanjaiBannerRecord> {
  const TanjaiBannerRecordDocumentEquality();

  @override
  bool equals(TanjaiBannerRecord? e1, TanjaiBannerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imageUrl, e2?.imageUrl) &&
        listEquality.equals(e1?.contentLink, e2?.contentLink) &&
        listEquality.equals(e1?.pdfUrl, e2?.pdfUrl) &&
        listEquality.equals(e1?.order, e2?.order) &&
        listEquality.equals(e1?.isHavePdf, e2?.isHavePdf) &&
        listEquality.equals(e1?.blurHash, e2?.blurHash);
  }

  @override
  int hash(TanjaiBannerRecord? e) => const ListEquality().hash([
        e?.imageUrl,
        e?.contentLink,
        e?.pdfUrl,
        e?.order,
        e?.isHavePdf,
        e?.blurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is TanjaiBannerRecord;
}
