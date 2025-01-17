import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarksRecord extends FirestoreRecord {
  BookmarksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "verses" field.
  List<String>? _verses;
  List<String> get verses => _verses ?? const [];
  bool hasVerses() => _verses != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _verses = getDataList(snapshotData['verses']);
    _id = castToType<int>(snapshotData['id']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarks')
          : FirebaseFirestore.instance.collectionGroup('bookmarks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookmarks').doc(id);

  static Stream<BookmarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarksRecord.fromSnapshot(s));

  static Future<BookmarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarksRecord.fromSnapshot(s));

  static BookmarksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarksRecordData({
  String? date,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarksRecordDocumentEquality implements Equality<BookmarksRecord> {
  const BookmarksRecordDocumentEquality();

  @override
  bool equals(BookmarksRecord? e1, BookmarksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        listEquality.equals(e1?.verses, e2?.verses) &&
        e1?.id == e2?.id;
  }

  @override
  int hash(BookmarksRecord? e) =>
      const ListEquality().hash([e?.date, e?.verses, e?.id]);

  @override
  bool isValidKey(Object? o) => o is BookmarksRecord;
}
