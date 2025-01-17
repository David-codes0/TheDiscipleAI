import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReflectionsRecord extends FirestoreRecord {
  ReflectionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "reflectionContent" field.
  String? _reflectionContent;
  String get reflectionContent => _reflectionContent ?? '';
  bool hasReflectionContent() => _reflectionContent != null;

  // "reflectionTitle" field.
  String? _reflectionTitle;
  String get reflectionTitle => _reflectionTitle ?? '';
  bool hasReflectionTitle() => _reflectionTitle != null;

  // "epochTime" field.
  int? _epochTime;
  int get epochTime => _epochTime ?? 0;
  bool hasEpochTime() => _epochTime != null;

  // "reflectionQuestion" field.
  String? _reflectionQuestion;
  String get reflectionQuestion => _reflectionQuestion ?? '';
  bool hasReflectionQuestion() => _reflectionQuestion != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _reflectionContent = snapshotData['reflectionContent'] as String?;
    _reflectionTitle = snapshotData['reflectionTitle'] as String?;
    _epochTime = castToType<int>(snapshotData['epochTime']);
    _reflectionQuestion = snapshotData['reflectionQuestion'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reflections')
          : FirebaseFirestore.instance.collectionGroup('Reflections');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Reflections').doc(id);

  static Stream<ReflectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReflectionsRecord.fromSnapshot(s));

  static Future<ReflectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReflectionsRecord.fromSnapshot(s));

  static ReflectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReflectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReflectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReflectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReflectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReflectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReflectionsRecordData({
  String? date,
  String? reflectionContent,
  String? reflectionTitle,
  int? epochTime,
  String? reflectionQuestion,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'reflectionContent': reflectionContent,
      'reflectionTitle': reflectionTitle,
      'epochTime': epochTime,
      'reflectionQuestion': reflectionQuestion,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReflectionsRecordDocumentEquality implements Equality<ReflectionsRecord> {
  const ReflectionsRecordDocumentEquality();

  @override
  bool equals(ReflectionsRecord? e1, ReflectionsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.reflectionContent == e2?.reflectionContent &&
        e1?.reflectionTitle == e2?.reflectionTitle &&
        e1?.epochTime == e2?.epochTime &&
        e1?.reflectionQuestion == e2?.reflectionQuestion &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(ReflectionsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.reflectionContent,
        e?.reflectionTitle,
        e?.epochTime,
        e?.reflectionQuestion,
        e?.timeStamp
      ]);

  @override
  bool isValidKey(Object? o) => o is ReflectionsRecord;
}
