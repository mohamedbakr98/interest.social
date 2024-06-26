import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "cover_photo" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "cards" field.
  List<DocumentReference>? _cards;
  List<DocumentReference> get cards => _cards ?? const [];
  bool hasCards() => _cards != null;

  // "active_online_card" field.
  int? _activeOnlineCard;
  int get activeOnlineCard => _activeOnlineCard ?? 0;
  bool hasActiveOnlineCard() => _activeOnlineCard != null;

  // "active_offline_card" field.
  int? _activeOfflineCard;
  int get activeOfflineCard => _activeOfflineCard ?? 0;
  bool hasActiveOfflineCard() => _activeOfflineCard != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

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

  // "chats" field.
  List<DocumentReference>? _chats;
  List<DocumentReference> get chats => _chats ?? const [];
  bool hasChats() => _chats != null;

  // "uploaded_pic" field.
  String? _uploadedPic;
  String get uploadedPic => _uploadedPic ?? '';
  bool hasUploadedPic() => _uploadedPic != null;

  // "uploaded_vid" field.
  String? _uploadedVid;
  String get uploadedVid => _uploadedVid ?? '';
  bool hasUploadedVid() => _uploadedVid != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _interests = getDataList(snapshotData['interests']);
    _cards = getDataList(snapshotData['cards']);
    _activeOnlineCard = castToType<int>(snapshotData['active_online_card']);
    _activeOfflineCard = castToType<int>(snapshotData['active_offline_card']);
    _birthday = snapshotData['birthday'] as DateTime?;
    _friends = getDataList(snapshotData['friends']);
    _firstname = snapshotData['firstname'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _chats = getDataList(snapshotData['chats']);
    _uploadedPic = snapshotData['uploaded_pic'] as String?;
    _uploadedVid = snapshotData['uploaded_vid'] as String?;
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
  String? email,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
  String? bio,
  String? coverPhoto,
  DateTime? createdTime,
  int? activeOnlineCard,
  int? activeOfflineCard,
  DateTime? birthday,
  String? firstname,
  String? lastname,
  String? displayName,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? uploadedPic,
  String? uploadedVid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
      'bio': bio,
      'cover_photo': coverPhoto,
      'created_time': createdTime,
      'active_online_card': activeOnlineCard,
      'active_offline_card': activeOfflineCard,
      'birthday': birthday,
      'firstname': firstname,
      'lastname': lastname,
      'display_name': displayName,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'uploaded_pic': uploadedPic,
      'uploaded_vid': uploadedVid,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.coverPhoto == e2?.coverPhoto &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        listEquality.equals(e1?.cards, e2?.cards) &&
        e1?.activeOnlineCard == e2?.activeOnlineCard &&
        e1?.activeOfflineCard == e2?.activeOfflineCard &&
        e1?.birthday == e2?.birthday &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.firstname == e2?.firstname &&
        e1?.lastname == e2?.lastname &&
        e1?.displayName == e2?.displayName &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.chats, e2?.chats) &&
        e1?.uploadedPic == e2?.uploadedPic &&
        e1?.uploadedVid == e2?.uploadedVid;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber,
        e?.bio,
        e?.coverPhoto,
        e?.createdTime,
        e?.interests,
        e?.cards,
        e?.activeOnlineCard,
        e?.activeOfflineCard,
        e?.birthday,
        e?.friends,
        e?.firstname,
        e?.lastname,
        e?.displayName,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.chats,
        e?.uploadedPic,
        e?.uploadedVid
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
