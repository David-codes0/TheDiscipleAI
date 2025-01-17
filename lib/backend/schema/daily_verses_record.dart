import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyVersesRecord extends FirestoreRecord {
  DailyVersesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagesLink" field.
  List<String>? _imagesLink;
  List<String> get imagesLink => _imagesLink ?? const [];
  bool hasImagesLink() => _imagesLink != null;

  void _initializeFields() {
    _imagesLink = getDataList(snapshotData['imagesLink']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailyVerses');

  static Stream<DailyVersesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyVersesRecord.fromSnapshot(s));

  static Future<DailyVersesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyVersesRecord.fromSnapshot(s));

  static DailyVersesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyVersesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyVersesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyVersesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyVersesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyVersesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyVersesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class DailyVersesRecordDocumentEquality implements Equality<DailyVersesRecord> {
  const DailyVersesRecordDocumentEquality();

  @override
  bool equals(DailyVersesRecord? e1, DailyVersesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imagesLink, e2?.imagesLink);
  }

  @override
  int hash(DailyVersesRecord? e) => const ListEquality().hash([e?.imagesLink]);

  @override
  bool isValidKey(Object? o) => o is DailyVersesRecord;
}
