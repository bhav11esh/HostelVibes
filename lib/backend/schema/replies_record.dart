import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepliesRecord extends FirestoreRecord {
  RepliesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reply_content" field.
  String? _replyContent;
  String get replyContent => _replyContent ?? '';
  bool hasReplyContent() => _replyContent != null;

  // "reply_thread" field.
  DocumentReference? _replyThread;
  DocumentReference? get replyThread => _replyThread;
  bool hasReplyThread() => _replyThread != null;

  // "reply_user" field.
  DocumentReference? _replyUser;
  DocumentReference? get replyUser => _replyUser;
  bool hasReplyUser() => _replyUser != null;

  // "reply_photo" field.
  String? _replyPhoto;
  String get replyPhoto => _replyPhoto ?? '';
  bool hasReplyPhoto() => _replyPhoto != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "reply_to" field.
  DocumentReference? _replyTo;
  DocumentReference? get replyTo => _replyTo;
  bool hasReplyTo() => _replyTo != null;

  // "num_reply" field.
  int? _numReply;
  int get numReply => _numReply ?? 0;
  bool hasNumReply() => _numReply != null;

  // "num_like" field.
  int? _numLike;
  int get numLike => _numLike ?? 0;
  bool hasNumLike() => _numLike != null;

  // "time_replied" field.
  DateTime? _timeReplied;
  DateTime? get timeReplied => _timeReplied;
  bool hasTimeReplied() => _timeReplied != null;

  // "reply_replies" field.
  List<DocumentReference>? _replyReplies;
  List<DocumentReference> get replyReplies => _replyReplies ?? const [];
  bool hasReplyReplies() => _replyReplies != null;

  // "replied_by" field.
  List<DocumentReference>? _repliedBy;
  List<DocumentReference> get repliedBy => _repliedBy ?? const [];
  bool hasRepliedBy() => _repliedBy != null;

  // "parent_reply" field.
  DocumentReference? _parentReply;
  DocumentReference? get parentReply => _parentReply;
  bool hasParentReply() => _parentReply != null;

  void _initializeFields() {
    _replyContent = snapshotData['reply_content'] as String?;
    _replyThread = snapshotData['reply_thread'] as DocumentReference?;
    _replyUser = snapshotData['reply_user'] as DocumentReference?;
    _replyPhoto = snapshotData['reply_photo'] as String?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _replyTo = snapshotData['reply_to'] as DocumentReference?;
    _numReply = castToType<int>(snapshotData['num_reply']);
    _numLike = castToType<int>(snapshotData['num_like']);
    _timeReplied = snapshotData['time_replied'] as DateTime?;
    _replyReplies = getDataList(snapshotData['reply_replies']);
    _repliedBy = getDataList(snapshotData['replied_by']);
    _parentReply = snapshotData['parent_reply'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('replies');

  static Stream<RepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepliesRecord.fromSnapshot(s));

  static Future<RepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepliesRecord.fromSnapshot(s));

  static RepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepliesRecordData({
  String? replyContent,
  DocumentReference? replyThread,
  DocumentReference? replyUser,
  String? replyPhoto,
  DocumentReference? replyTo,
  int? numReply,
  int? numLike,
  DateTime? timeReplied,
  DocumentReference? parentReply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reply_content': replyContent,
      'reply_thread': replyThread,
      'reply_user': replyUser,
      'reply_photo': replyPhoto,
      'reply_to': replyTo,
      'num_reply': numReply,
      'num_like': numLike,
      'time_replied': timeReplied,
      'parent_reply': parentReply,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepliesRecordDocumentEquality implements Equality<RepliesRecord> {
  const RepliesRecordDocumentEquality();

  @override
  bool equals(RepliesRecord? e1, RepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.replyContent == e2?.replyContent &&
        e1?.replyThread == e2?.replyThread &&
        e1?.replyUser == e2?.replyUser &&
        e1?.replyPhoto == e2?.replyPhoto &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.replyTo == e2?.replyTo &&
        e1?.numReply == e2?.numReply &&
        e1?.numLike == e2?.numLike &&
        e1?.timeReplied == e2?.timeReplied &&
        listEquality.equals(e1?.replyReplies, e2?.replyReplies) &&
        listEquality.equals(e1?.repliedBy, e2?.repliedBy) &&
        e1?.parentReply == e2?.parentReply;
  }

  @override
  int hash(RepliesRecord? e) => const ListEquality().hash([
        e?.replyContent,
        e?.replyThread,
        e?.replyUser,
        e?.replyPhoto,
        e?.likedBy,
        e?.replyTo,
        e?.numReply,
        e?.numLike,
        e?.timeReplied,
        e?.replyReplies,
        e?.repliedBy,
        e?.parentReply
      ]);

  @override
  bool isValidKey(Object? o) => o is RepliesRecord;
}
