// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersStruct extends FFFirebaseStruct {
  ChaptersStruct({
    String? chapter,
    String? verses,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chapter = chapter,
        _verses = verses,
        super(firestoreUtilData);

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  set chapter(String? val) => _chapter = val;

  bool hasChapter() => _chapter != null;

  // "verses" field.
  String? _verses;
  String get verses => _verses ?? '';
  set verses(String? val) => _verses = val;

  bool hasVerses() => _verses != null;

  static ChaptersStruct fromMap(Map<String, dynamic> data) => ChaptersStruct(
        chapter: data['chapter'] as String?,
        verses: data['verses'] as String?,
      );

  static ChaptersStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChaptersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'chapter': _chapter,
        'verses': _verses,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chapter': serializeParam(
          _chapter,
          ParamType.String,
        ),
        'verses': serializeParam(
          _verses,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChaptersStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChaptersStruct(
        chapter: deserializeParam(
          data['chapter'],
          ParamType.String,
          false,
        ),
        verses: deserializeParam(
          data['verses'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChaptersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChaptersStruct &&
        chapter == other.chapter &&
        verses == other.verses;
  }

  @override
  int get hashCode => const ListEquality().hash([chapter, verses]);
}

ChaptersStruct createChaptersStruct({
  String? chapter,
  String? verses,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChaptersStruct(
      chapter: chapter,
      verses: verses,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChaptersStruct? updateChaptersStruct(
  ChaptersStruct? chapters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chapters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChaptersStructData(
  Map<String, dynamic> firestoreData,
  ChaptersStruct? chapters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chapters == null) {
    return;
  }
  if (chapters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chapters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chaptersData = getChaptersFirestoreData(chapters, forFieldValue);
  final nestedData = chaptersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chapters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChaptersFirestoreData(
  ChaptersStruct? chapters, [
  bool forFieldValue = false,
]) {
  if (chapters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chapters.toMap());

  // Add any Firestore field values
  chapters.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChaptersListFirestoreData(
  List<ChaptersStruct>? chapterss,
) =>
    chapterss?.map((e) => getChaptersFirestoreData(e, true)).toList() ?? [];
