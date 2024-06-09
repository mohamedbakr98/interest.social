import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsRecord extends FirestoreRecord {
  CardsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "radius" field.
  String? _radius;
  String get radius => _radius ?? '';
  bool hasRadius() => _radius != null;

  // "start_at" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  // "number_people" field.
  int? _numberPeople;
  int get numberPeople => _numberPeople ?? 0;
  bool hasNumberPeople() => _numberPeople != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "expiry_time" field.
  int? _expiryTime;
  int get expiryTime => _expiryTime ?? 0;
  bool hasExpiryTime() => _expiryTime != null;

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "peopleJoined" field.
  List<DocumentReference>? _peopleJoined;
  List<DocumentReference> get peopleJoined => _peopleJoined ?? const [];
  bool hasPeopleJoined() => _peopleJoined != null;

  // "cardcover" field.
  String? _cardcover;
  String get cardcover => _cardcover ?? '';
  bool hasCardcover() => _cardcover != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "hasImage" field.
  bool? _hasImage;
  bool get hasImage => _hasImage ?? false;
  bool hasHasImage() => _hasImage != null;

  // "IsShared" field.
  bool? _isShared;
  bool get isShared => _isShared ?? false;
  bool hasIsShared() => _isShared != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _genre = snapshotData['genre'] as String?;
    _language = snapshotData['language'] as String?;
    _online = snapshotData['online'] as bool?;
    _radius = snapshotData['radius'] as String?;
    _startAt = snapshotData['start_at'] as DateTime?;
    _numberPeople = castToType<int>(snapshotData['number_people']);
    _location = snapshotData['location'] as LatLng?;
    _expiryTime = castToType<int>(snapshotData['expiry_time']);
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _peopleJoined = getDataList(snapshotData['peopleJoined']);
    _cardcover = snapshotData['cardcover'] as String?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _hasImage = snapshotData['hasImage'] as bool?;
    _isShared = snapshotData['IsShared'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardsRecord.fromSnapshot(s));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardsRecord.fromSnapshot(s));

  static CardsRecord fromSnapshot(DocumentSnapshot snapshot) => CardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsRecordData({
  String? name,
  String? genre,
  String? language,
  bool? online,
  String? radius,
  DateTime? startAt,
  int? numberPeople,
  LatLng? location,
  int? expiryTime,
  DateTime? creationTime,
  String? cardcover,
  String? lastMessage,
  DateTime? lastMessageTime,
  bool? hasImage,
  bool? isShared,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'genre': genre,
      'language': language,
      'online': online,
      'radius': radius,
      'start_at': startAt,
      'number_people': numberPeople,
      'location': location,
      'expiry_time': expiryTime,
      'creation_time': creationTime,
      'cardcover': cardcover,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'hasImage': hasImage,
      'IsShared': isShared,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardsRecordDocumentEquality implements Equality<CardsRecord> {
  const CardsRecordDocumentEquality();

  @override
  bool equals(CardsRecord? e1, CardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.genre == e2?.genre &&
        e1?.language == e2?.language &&
        e1?.online == e2?.online &&
        e1?.radius == e2?.radius &&
        e1?.startAt == e2?.startAt &&
        e1?.numberPeople == e2?.numberPeople &&
        e1?.location == e2?.location &&
        e1?.expiryTime == e2?.expiryTime &&
        e1?.creationTime == e2?.creationTime &&
        listEquality.equals(e1?.peopleJoined, e2?.peopleJoined) &&
        e1?.cardcover == e2?.cardcover &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.hasImage == e2?.hasImage &&
        e1?.isShared == e2?.isShared;
  }

  @override
  int hash(CardsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.genre,
        e?.language,
        e?.online,
        e?.radius,
        e?.startAt,
        e?.numberPeople,
        e?.location,
        e?.expiryTime,
        e?.creationTime,
        e?.peopleJoined,
        e?.cardcover,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.hasImage,
        e?.isShared
      ]);

  @override
  bool isValidKey(Object? o) => o is CardsRecord;
}
