import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChoicechipsbiouserRecord extends FirestoreRecord {
  ChoicechipsbiouserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  void _initializeFields() {
    _interests = getDataList(snapshotData['Interests']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('choicechipsbiouser');

  static Stream<ChoicechipsbiouserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChoicechipsbiouserRecord.fromSnapshot(s));

  static Future<ChoicechipsbiouserRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChoicechipsbiouserRecord.fromSnapshot(s));

  static ChoicechipsbiouserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChoicechipsbiouserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChoicechipsbiouserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChoicechipsbiouserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChoicechipsbiouserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChoicechipsbiouserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChoicechipsbiouserRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ChoicechipsbiouserRecordDocumentEquality
    implements Equality<ChoicechipsbiouserRecord> {
  const ChoicechipsbiouserRecordDocumentEquality();

  @override
  bool equals(ChoicechipsbiouserRecord? e1, ChoicechipsbiouserRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.interests, e2?.interests);
  }

  @override
  int hash(ChoicechipsbiouserRecord? e) =>
      const ListEquality().hash([e?.interests]);

  @override
  bool isValidKey(Object? o) => o is ChoicechipsbiouserRecord;
}
