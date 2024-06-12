import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadsRecord extends FirestoreRecord {
  ThreadsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "thread_content" field.
  String? _threadContent;
  String get threadContent => _threadContent ?? '';
  bool hasThreadContent() => _threadContent != null;

  // "thread_photo" field.
  String? _threadPhoto;
  String get threadPhoto => _threadPhoto ?? '';
  bool hasThreadPhoto() => _threadPhoto != null;

  // "thread_user" field.
  DocumentReference? _threadUser;
  DocumentReference? get threadUser => _threadUser;
  bool hasThreadUser() => _threadUser != null;

  // "thread_replies" field.
  List<DocumentReference>? _threadReplies;
  List<DocumentReference> get threadReplies => _threadReplies ?? const [];
  bool hasThreadReplies() => _threadReplies != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "replied_by" field.
  List<DocumentReference>? _repliedBy;
  List<DocumentReference> get repliedBy => _repliedBy ?? const [];
  bool hasRepliedBy() => _repliedBy != null;

  // "num_reply" field.
  int? _numReply;
  int get numReply => _numReply ?? 0;
  bool hasNumReply() => _numReply != null;

  // "num_like" field.
  int? _numLike;
  int get numLike => _numLike ?? 0;
  bool hasNumLike() => _numLike != null;

  // "replied_avatar" field.
  List<String>? _repliedAvatar;
  List<String> get repliedAvatar => _repliedAvatar ?? const [];
  bool hasRepliedAvatar() => _repliedAvatar != null;

  void _initializeFields() {
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _threadContent = snapshotData['thread_content'] as String?;
    _threadPhoto = snapshotData['thread_photo'] as String?;
    _threadUser = snapshotData['thread_user'] as DocumentReference?;
    _threadReplies = getDataList(snapshotData['thread_replies']);
    _likedBy = getDataList(snapshotData['liked_by']);
    _repliedBy = getDataList(snapshotData['replied_by']);
    _numReply = castToType<int>(snapshotData['num_reply']);
    _numLike = castToType<int>(snapshotData['num_like']);
    _repliedAvatar = getDataList(snapshotData['replied_avatar']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('threads');

  static Stream<ThreadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThreadsRecord.fromSnapshot(s));

  static Future<ThreadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThreadsRecord.fromSnapshot(s));

  static ThreadsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ThreadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThreadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThreadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThreadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThreadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThreadsRecordData({
  DateTime? timePosted,
  String? threadContent,
  String? threadPhoto,
  DocumentReference? threadUser,
  int? numReply,
  int? numLike,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_posted': timePosted,
      'thread_content': threadContent,
      'thread_photo': threadPhoto,
      'thread_user': threadUser,
      'num_reply': numReply,
      'num_like': numLike,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThreadsRecordDocumentEquality implements Equality<ThreadsRecord> {
  const ThreadsRecordDocumentEquality();

  @override
  bool equals(ThreadsRecord? e1, ThreadsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.threadContent == e2?.threadContent &&
        e1?.threadPhoto == e2?.threadPhoto &&
        e1?.threadUser == e2?.threadUser &&
        listEquality.equals(e1?.threadReplies, e2?.threadReplies) &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.repliedBy, e2?.repliedBy) &&
        e1?.numReply == e2?.numReply &&
        e1?.numLike == e2?.numLike &&
        listEquality.equals(e1?.repliedAvatar, e2?.repliedAvatar);
  }

  @override
  int hash(ThreadsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.threadContent,
        e?.threadPhoto,
        e?.threadUser,
        e?.threadReplies,
        e?.likedBy,
        e?.repliedBy,
        e?.numReply,
        e?.numLike,
        e?.repliedAvatar
      ]);

  @override
  bool isValidKey(Object? o) => o is ThreadsRecord;
}
