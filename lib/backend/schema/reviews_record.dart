import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "ratingDescription" field.
  String? _ratingDescription;
  String get ratingDescription => _ratingDescription ?? '';
  bool hasRatingDescription() => _ratingDescription != null;

  // "ratingCreated" field.
  DateTime? _ratingCreated;
  DateTime? get ratingCreated => _ratingCreated;
  bool hasRatingCreated() => _ratingCreated != null;

  // "user_gender_id" field.
  String? _userGenderId;
  String get userGenderId => _userGenderId ?? '';
  bool hasUserGenderId() => _userGenderId != null;

  // "user_nickname" field.
  String? _userNickname;
  String get userNickname => _userNickname ?? '';
  bool hasUserNickname() => _userNickname != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "PropRef" field.
  DocumentReference? _propRef;
  DocumentReference? get propRef => _propRef;
  bool hasPropRef() => _propRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _ratingDescription = snapshotData['ratingDescription'] as String?;
    _ratingCreated = snapshotData['ratingCreated'] as DateTime?;
    _userGenderId = snapshotData['user_gender_id'] as String?;
    _userNickname = snapshotData['user_nickname'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _userId = castToType<int>(snapshotData['user_id']);
    _propRef = snapshotData['PropRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? userRef,
  double? rating,
  String? ratingDescription,
  DateTime? ratingCreated,
  String? userGenderId,
  String? userNickname,
  int? id,
  int? userId,
  DocumentReference? propRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'rating': rating,
      'ratingDescription': ratingDescription,
      'ratingCreated': ratingCreated,
      'user_gender_id': userGenderId,
      'user_nickname': userNickname,
      'id': id,
      'user_id': userId,
      'PropRef': propRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.rating == e2?.rating &&
        e1?.ratingDescription == e2?.ratingDescription &&
        e1?.ratingCreated == e2?.ratingCreated &&
        e1?.userGenderId == e2?.userGenderId &&
        e1?.userNickname == e2?.userNickname &&
        e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.propRef == e2?.propRef;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.rating,
        e?.ratingDescription,
        e?.ratingCreated,
        e?.userGenderId,
        e?.userNickname,
        e?.id,
        e?.userId,
        e?.propRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
