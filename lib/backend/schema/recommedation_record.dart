import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommedationRecord extends FirestoreRecord {
  RecommedationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CityPicture" field.
  String? _cityPicture;
  String get cityPicture => _cityPicture ?? '';
  bool hasCityPicture() => _cityPicture != null;

  // "DisplayRank" field.
  int? _displayRank;
  int get displayRank => _displayRank ?? 0;
  bool hasDisplayRank() => _displayRank != null;

  // "CityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "Avg_dorm_price" field.
  int? _avgDormPrice;
  int get avgDormPrice => _avgDormPrice ?? 0;
  bool hasAvgDormPrice() => _avgDormPrice != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Recommendation_type" field.
  String? _recommendationType;
  String get recommendationType => _recommendationType ?? '';
  bool hasRecommendationType() => _recommendationType != null;

  // "InterestedPeopleCnt" field.
  int? _interestedPeopleCnt;
  int get interestedPeopleCnt => _interestedPeopleCnt ?? 0;
  bool hasInterestedPeopleCnt() => _interestedPeopleCnt != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _cityPicture = snapshotData['CityPicture'] as String?;
    _displayRank = castToType<int>(snapshotData['DisplayRank']);
    _cityName = snapshotData['CityName'] as String?;
    _avgDormPrice = castToType<int>(snapshotData['Avg_dorm_price']);
    _id = castToType<int>(snapshotData['id']);
    _recommendationType = snapshotData['Recommendation_type'] as String?;
    _interestedPeopleCnt = castToType<int>(snapshotData['InterestedPeopleCnt']);
    _type = snapshotData['Type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recommedation');

  static Stream<RecommedationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommedationRecord.fromSnapshot(s));

  static Future<RecommedationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecommedationRecord.fromSnapshot(s));

  static RecommedationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommedationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommedationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommedationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommedationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommedationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommedationRecordData({
  String? cityPicture,
  int? displayRank,
  String? cityName,
  int? avgDormPrice,
  int? id,
  String? recommendationType,
  int? interestedPeopleCnt,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CityPicture': cityPicture,
      'DisplayRank': displayRank,
      'CityName': cityName,
      'Avg_dorm_price': avgDormPrice,
      'id': id,
      'Recommendation_type': recommendationType,
      'InterestedPeopleCnt': interestedPeopleCnt,
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommedationRecordDocumentEquality
    implements Equality<RecommedationRecord> {
  const RecommedationRecordDocumentEquality();

  @override
  bool equals(RecommedationRecord? e1, RecommedationRecord? e2) {
    return e1?.cityPicture == e2?.cityPicture &&
        e1?.displayRank == e2?.displayRank &&
        e1?.cityName == e2?.cityName &&
        e1?.avgDormPrice == e2?.avgDormPrice &&
        e1?.id == e2?.id &&
        e1?.recommendationType == e2?.recommendationType &&
        e1?.interestedPeopleCnt == e2?.interestedPeopleCnt &&
        e1?.type == e2?.type;
  }

  @override
  int hash(RecommedationRecord? e) => const ListEquality().hash([
        e?.cityPicture,
        e?.displayRank,
        e?.cityName,
        e?.avgDormPrice,
        e?.id,
        e?.recommendationType,
        e?.interestedPeopleCnt,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is RecommedationRecord;
}
