import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardMessagesRecord extends FirestoreRecord {
  CardMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _audio = snapshotData['audio'] as String?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('card_messages')
          : FirebaseFirestore.instance.collectionGroup('card_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('card_messages').doc(id);

  static Stream<CardMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardMessagesRecord.fromSnapshot(s));

  static Future<CardMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardMessagesRecord.fromSnapshot(s));

  static CardMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardMessagesRecordData({
  String? text,
  DateTime? timestamp,
  String? image,
  String? video,
  String? audio,
  DocumentReference? senderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'timestamp': timestamp,
      'image': image,
      'video': video,
      'audio': audio,
      'senderRef': senderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardMessagesRecordDocumentEquality
    implements Equality<CardMessagesRecord> {
  const CardMessagesRecordDocumentEquality();

  @override
  bool equals(CardMessagesRecord? e1, CardMessagesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio &&
        e1?.senderRef == e2?.senderRef;
  }

  @override
  int hash(CardMessagesRecord? e) => const ListEquality().hash(
      [e?.text, e?.timestamp, e?.image, e?.video, e?.audio, e?.senderRef]);

  @override
  bool isValidKey(Object? o) => o is CardMessagesRecord;
}
