import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "like" field.
  bool? _like;
  bool get like => _like ?? false;
  bool hasLike() => _like != null;

  // "linked_thread" field.
  DocumentReference? _linkedThread;
  DocumentReference? get linkedThread => _linkedThread;
  bool hasLinkedThread() => _linkedThread != null;

  // "linked_reply" field.
  DocumentReference? _linkedReply;
  DocumentReference? get linkedReply => _linkedReply;
  bool hasLinkedReply() => _linkedReply != null;

  // "time_engaged" field.
  DateTime? _timeEngaged;
  DateTime? get timeEngaged => _timeEngaged;
  bool hasTimeEngaged() => _timeEngaged != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "likereply_by" field.
  DocumentReference? _likereplyBy;
  DocumentReference? get likereplyBy => _likereplyBy;
  bool hasLikereplyBy() => _likereplyBy != null;

  // "reply_content" field.
  String? _replyContent;
  String get replyContent => _replyContent ?? '';
  bool hasReplyContent() => _replyContent != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _like = snapshotData['like'] as bool?;
    _linkedThread = snapshotData['linked_thread'] as DocumentReference?;
    _linkedReply = snapshotData['linked_reply'] as DocumentReference?;
    _timeEngaged = snapshotData['time_engaged'] as DateTime?;
    _seen = snapshotData['seen'] as bool?;
    _likereplyBy = snapshotData['likereply_by'] as DocumentReference?;
    _replyContent = snapshotData['reply_content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity');

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  DocumentReference? user,
  bool? like,
  DocumentReference? linkedThread,
  DocumentReference? linkedReply,
  DateTime? timeEngaged,
  bool? seen,
  DocumentReference? likereplyBy,
  String? replyContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'like': like,
      'linked_thread': linkedThread,
      'linked_reply': linkedReply,
      'time_engaged': timeEngaged,
      'seen': seen,
      'likereply_by': likereplyBy,
      'reply_content': replyContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.like == e2?.like &&
        e1?.linkedThread == e2?.linkedThread &&
        e1?.linkedReply == e2?.linkedReply &&
        e1?.timeEngaged == e2?.timeEngaged &&
        e1?.seen == e2?.seen &&
        e1?.likereplyBy == e2?.likereplyBy &&
        e1?.replyContent == e2?.replyContent;
  }

  @override
  int hash(ActivityRecord? e) => const ListEquality().hash([
        e?.user,
        e?.like,
        e?.linkedThread,
        e?.linkedReply,
        e?.timeEngaged,
        e?.seen,
        e?.likereplyBy,
        e?.replyContent
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
