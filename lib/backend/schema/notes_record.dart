import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listOfVerses" field.
  List<String>? _listOfVerses;
  List<String> get listOfVerses => _listOfVerses ?? const [];
  bool hasListOfVerses() => _listOfVerses != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _listOfVerses = getDataList(snapshotData['listOfVerses']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notes')
          : FirebaseFirestore.instance.collectionGroup('notes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notes').doc(id);

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listOfVerses, e2?.listOfVerses);
  }

  @override
  int hash(NotesRecord? e) => const ListEquality().hash([e?.listOfVerses]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
