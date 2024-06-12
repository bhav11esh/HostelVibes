import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VersionRecord extends FirestoreRecord {
  VersionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "AppVersionLatest" field.
  String? _appVersionLatest;
  String get appVersionLatest => _appVersionLatest ?? '';
  bool hasAppVersionLatest() => _appVersionLatest != null;

  void _initializeFields() {
    _appVersionLatest = snapshotData['AppVersionLatest'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Version');

  static Stream<VersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionRecord.fromSnapshot(s));

  static Future<VersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionRecord.fromSnapshot(s));

  static VersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionRecordData({
  String? appVersionLatest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AppVersionLatest': appVersionLatest,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionRecordDocumentEquality implements Equality<VersionRecord> {
  const VersionRecordDocumentEquality();

  @override
  bool equals(VersionRecord? e1, VersionRecord? e2) {
    return e1?.appVersionLatest == e2?.appVersionLatest;
  }

  @override
  int hash(VersionRecord? e) =>
      const ListEquality().hash([e?.appVersionLatest]);

  @override
  bool isValidKey(Object? o) => o is VersionRecord;
}
