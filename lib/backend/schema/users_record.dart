import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userCity" field.
  String? _userCity;
  String get userCity => _userCity ?? '';
  bool hasUserCity() => _userCity != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "isHost" field.
  bool? _isHost;
  bool get isHost => _isHost ?? false;
  bool hasIsHost() => _isHost != null;

  // "numberProperties" field.
  int? _numberProperties;
  int get numberProperties => _numberProperties ?? 0;
  bool hasNumberProperties() => _numberProperties != null;

  // "numberActiveBookings" field.
  int? _numberActiveBookings;
  int get numberActiveBookings => _numberActiveBookings ?? 0;
  bool hasNumberActiveBookings() => _numberActiveBookings != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Social_url" field.
  String? _socialUrl;
  String get socialUrl => _socialUrl ?? '';
  bool hasSocialUrl() => _socialUrl != null;

  // "Karma" field.
  int? _karma;
  int get karma => _karma ?? 0;
  bool hasKarma() => _karma != null;

  // "wallet_points" field.
  double? _walletPoints;
  double get walletPoints => _walletPoints ?? 0.0;
  bool hasWalletPoints() => _walletPoints != null;

  // "Desire_type" field.
  String? _desireType;
  String get desireType => _desireType ?? '';
  bool hasDesireType() => _desireType != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "private" field.
  String? _private;
  String get private => _private ?? '';
  bool hasPrivate() => _private != null;

  // "replied_thread" field.
  DocumentReference? _repliedThread;
  DocumentReference? get repliedThread => _repliedThread;
  bool hasRepliedThread() => _repliedThread != null;

  // "liked_thread" field.
  DocumentReference? _likedThread;
  DocumentReference? get likedThread => _likedThread;
  bool hasLikedThread() => _likedThread != null;

  // "uploadpath" field.
  String? _uploadpath;
  String get uploadpath => _uploadpath ?? '';
  bool hasUploadpath() => _uploadpath != null;

  // "isverified" field.
  bool? _isverified;
  bool get isverified => _isverified ?? false;
  bool hasIsverified() => _isverified != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "bio1" field.
  List<String>? _bio1;
  List<String> get bio1 => _bio1 ?? const [];
  bool hasBio1() => _bio1 != null;

  void _initializeFields() {
    _userCity = snapshotData['userCity'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _isHost = snapshotData['isHost'] as bool?;
    _numberProperties = castToType<int>(snapshotData['numberProperties']);
    _numberActiveBookings =
        castToType<int>(snapshotData['numberActiveBookings']);
    _location = snapshotData['location'] as LatLng?;
    _socialUrl = snapshotData['Social_url'] as String?;
    _karma = castToType<int>(snapshotData['Karma']);
    _walletPoints = castToType<double>(snapshotData['wallet_points']);
    _desireType = snapshotData['Desire_type'] as String?;
    _lastActive = snapshotData['last_active'] as DateTime?;
    _private = snapshotData['private'] as String?;
    _repliedThread = snapshotData['replied_thread'] as DocumentReference?;
    _likedThread = snapshotData['liked_thread'] as DocumentReference?;
    _uploadpath = snapshotData['uploadpath'] as String?;
    _isverified = snapshotData['isverified'] as bool?;
    _age = castToType<int>(snapshotData['Age']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _bio1 = getDataList(snapshotData['bio1']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? userCity,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  bool? isHost,
  int? numberProperties,
  int? numberActiveBookings,
  LatLng? location,
  String? socialUrl,
  int? karma,
  double? walletPoints,
  String? desireType,
  DateTime? lastActive,
  String? private,
  DocumentReference? repliedThread,
  DocumentReference? likedThread,
  String? uploadpath,
  bool? isverified,
  int? age,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userCity': userCity,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'bio': bio,
      'isHost': isHost,
      'numberProperties': numberProperties,
      'numberActiveBookings': numberActiveBookings,
      'location': location,
      'Social_url': socialUrl,
      'Karma': karma,
      'wallet_points': walletPoints,
      'Desire_type': desireType,
      'last_active': lastActive,
      'private': private,
      'replied_thread': repliedThread,
      'liked_thread': likedThread,
      'uploadpath': uploadpath,
      'isverified': isverified,
      'Age': age,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userCity == e2?.userCity &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.isHost == e2?.isHost &&
        e1?.numberProperties == e2?.numberProperties &&
        e1?.numberActiveBookings == e2?.numberActiveBookings &&
        e1?.location == e2?.location &&
        e1?.socialUrl == e2?.socialUrl &&
        e1?.karma == e2?.karma &&
        e1?.walletPoints == e2?.walletPoints &&
        e1?.desireType == e2?.desireType &&
        e1?.lastActive == e2?.lastActive &&
        e1?.private == e2?.private &&
        e1?.repliedThread == e2?.repliedThread &&
        e1?.likedThread == e2?.likedThread &&
        e1?.uploadpath == e2?.uploadpath &&
        e1?.isverified == e2?.isverified &&
        e1?.age == e2?.age &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.bio1, e2?.bio1);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.userCity,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.bio,
        e?.isHost,
        e?.numberProperties,
        e?.numberActiveBookings,
        e?.location,
        e?.socialUrl,
        e?.karma,
        e?.walletPoints,
        e?.desireType,
        e?.lastActive,
        e?.private,
        e?.repliedThread,
        e?.likedThread,
        e?.uploadpath,
        e?.isverified,
        e?.age,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.bio1
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
