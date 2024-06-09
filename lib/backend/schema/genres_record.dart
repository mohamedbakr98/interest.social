import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GenresRecord extends FirestoreRecord {
  GenresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gname" field.
  String? _gname;
  String get gname => _gname ?? '';
  bool hasGname() => _gname != null;

  // "gelements" field.
  List<String>? _gelements;
  List<String> get gelements => _gelements ?? const [];
  bool hasGelements() => _gelements != null;

  void _initializeFields() {
    _gname = snapshotData['gname'] as String?;
    _gelements = getDataList(snapshotData['gelements']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('genres');

  static Stream<GenresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GenresRecord.fromSnapshot(s));

  static Future<GenresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GenresRecord.fromSnapshot(s));

  static GenresRecord fromSnapshot(DocumentSnapshot snapshot) => GenresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GenresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GenresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GenresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GenresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGenresRecordData({
  String? gname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gname': gname,
    }.withoutNulls,
  );

  return firestoreData;
}

class GenresRecordDocumentEquality implements Equality<GenresRecord> {
  const GenresRecordDocumentEquality();

  @override
  bool equals(GenresRecord? e1, GenresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.gname == e2?.gname &&
        listEquality.equals(e1?.gelements, e2?.gelements);
  }

  @override
  int hash(GenresRecord? e) =>
      const ListEquality().hash([e?.gname, e?.gelements]);

  @override
  bool isValidKey(Object? o) => o is GenresRecord;
}
