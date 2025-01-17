// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowPlanBibleReadingStruct extends FFFirebaseStruct {
  GrowPlanBibleReadingStruct({
    String? book,
    String? verses,
    String? chapter,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _book = book,
        _verses = verses,
        _chapter = chapter,
        super(firestoreUtilData);

  // "book" field.
  String? _book;
  String get book => _book ?? '';
  set book(String? val) => _book = val;

  bool hasBook() => _book != null;

  // "verses" field.
  String? _verses;
  String get verses => _verses ?? '';
  set verses(String? val) => _verses = val;

  bool hasVerses() => _verses != null;

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  set chapter(String? val) => _chapter = val;

  bool hasChapter() => _chapter != null;

  static GrowPlanBibleReadingStruct fromMap(Map<String, dynamic> data) =>
      GrowPlanBibleReadingStruct(
        book: data['book'] as String?,
        verses: data['verses'] as String?,
        chapter: data['chapter'] as String?,
      );

  static GrowPlanBibleReadingStruct? maybeFromMap(dynamic data) => data is Map
      ? GrowPlanBibleReadingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'book': _book,
        'verses': _verses,
        'chapter': _chapter,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'book': serializeParam(
          _book,
          ParamType.String,
        ),
        'verses': serializeParam(
          _verses,
          ParamType.String,
        ),
        'chapter': serializeParam(
          _chapter,
          ParamType.String,
        ),
      }.withoutNulls;

  static GrowPlanBibleReadingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GrowPlanBibleReadingStruct(
        book: deserializeParam(
          data['book'],
          ParamType.String,
          false,
        ),
        verses: deserializeParam(
          data['verses'],
          ParamType.String,
          false,
        ),
        chapter: deserializeParam(
          data['chapter'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GrowPlanBibleReadingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrowPlanBibleReadingStruct &&
        book == other.book &&
        verses == other.verses &&
        chapter == other.chapter;
  }

  @override
  int get hashCode => const ListEquality().hash([book, verses, chapter]);
}

GrowPlanBibleReadingStruct createGrowPlanBibleReadingStruct({
  String? book,
  String? verses,
  String? chapter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GrowPlanBibleReadingStruct(
      book: book,
      verses: verses,
      chapter: chapter,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GrowPlanBibleReadingStruct? updateGrowPlanBibleReadingStruct(
  GrowPlanBibleReadingStruct? growPlanBibleReading, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    growPlanBibleReading
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGrowPlanBibleReadingStructData(
  Map<String, dynamic> firestoreData,
  GrowPlanBibleReadingStruct? growPlanBibleReading,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (growPlanBibleReading == null) {
    return;
  }
  if (growPlanBibleReading.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && growPlanBibleReading.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final growPlanBibleReadingData =
      getGrowPlanBibleReadingFirestoreData(growPlanBibleReading, forFieldValue);
  final nestedData =
      growPlanBibleReadingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      growPlanBibleReading.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGrowPlanBibleReadingFirestoreData(
  GrowPlanBibleReadingStruct? growPlanBibleReading, [
  bool forFieldValue = false,
]) {
  if (growPlanBibleReading == null) {
    return {};
  }
  final firestoreData = mapToFirestore(growPlanBibleReading.toMap());

  // Add any Firestore field values
  growPlanBibleReading.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGrowPlanBibleReadingListFirestoreData(
  List<GrowPlanBibleReadingStruct>? growPlanBibleReadings,
) =>
    growPlanBibleReadings
        ?.map((e) => getGrowPlanBibleReadingFirestoreData(e, true))
        .toList() ??
    [];
