import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersMemoirRecord extends FirestoreRecord {
  UsersMemoirRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userName" field.
  DocumentReference? _userName;
  DocumentReference? get userName => _userName;
  bool hasUserName() => _userName != null;

  // "Datecreated" field.
  DateTime? _datecreated;
  DateTime? get datecreated => _datecreated;
  bool hasDatecreated() => _datecreated != null;

  // "memior" field.
  String? _memior;
  String get memior => _memior ?? '';
  bool hasMemior() => _memior != null;

  // "memior_image" field.
  String? _memiorImage;
  String get memiorImage => _memiorImage ?? '';
  bool hasMemiorImage() => _memiorImage != null;

  // "memior_video" field.
  String? _memiorVideo;
  String get memiorVideo => _memiorVideo ?? '';
  bool hasMemiorVideo() => _memiorVideo != null;

  // "memior_audio" field.
  String? _memiorAudio;
  String get memiorAudio => _memiorAudio ?? '';
  bool hasMemiorAudio() => _memiorAudio != null;

  // "userDisplayName" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  bool hasUserDisplayName() => _userDisplayName != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as DocumentReference?;
    _datecreated = snapshotData['Datecreated'] as DateTime?;
    _memior = snapshotData['memior'] as String?;
    _memiorImage = snapshotData['memior_image'] as String?;
    _memiorVideo = snapshotData['memior_video'] as String?;
    _memiorAudio = snapshotData['memior_audio'] as String?;
    _userDisplayName = snapshotData['userDisplayName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_memoir');

  static Stream<UsersMemoirRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersMemoirRecord.fromSnapshot(s));

  static Future<UsersMemoirRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersMemoirRecord.fromSnapshot(s));

  static UsersMemoirRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersMemoirRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersMemoirRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersMemoirRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersMemoirRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersMemoirRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersMemoirRecordData({
  DocumentReference? userName,
  DateTime? datecreated,
  String? memior,
  String? memiorImage,
  String? memiorVideo,
  String? memiorAudio,
  String? userDisplayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'Datecreated': datecreated,
      'memior': memior,
      'memior_image': memiorImage,
      'memior_video': memiorVideo,
      'memior_audio': memiorAudio,
      'userDisplayName': userDisplayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersMemoirRecordDocumentEquality implements Equality<UsersMemoirRecord> {
  const UsersMemoirRecordDocumentEquality();

  @override
  bool equals(UsersMemoirRecord? e1, UsersMemoirRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.datecreated == e2?.datecreated &&
        e1?.memior == e2?.memior &&
        e1?.memiorImage == e2?.memiorImage &&
        e1?.memiorVideo == e2?.memiorVideo &&
        e1?.memiorAudio == e2?.memiorAudio &&
        e1?.userDisplayName == e2?.userDisplayName;
  }

  @override
  int hash(UsersMemoirRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.datecreated,
        e?.memior,
        e?.memiorImage,
        e?.memiorVideo,
        e?.memiorAudio,
        e?.userDisplayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersMemoirRecord;
}
