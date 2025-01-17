// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibleVerseAndChspternumberStruct extends FFFirebaseStruct {
  BibleVerseAndChspternumberStruct({
    String? abbr,
    String? book,
    List<ChaptersStruct>? chapters,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _abbr = abbr,
        _book = book,
        _chapters = chapters,
        super(firestoreUtilData);

  // "abbr" field.
  String? _abbr;
  String get abbr => _abbr ?? '';
  set abbr(String? val) => _abbr = val;

  bool hasAbbr() => _abbr != null;

  // "book" field.
  String? _book;
  String get book => _book ?? '';
  set book(String? val) => _book = val;

  bool hasBook() => _book != null;

  // "chapters" field.
  List<ChaptersStruct>? _chapters;
  List<ChaptersStruct> get chapters => _chapters ?? const [];
  set chapters(List<ChaptersStruct>? val) => _chapters = val;

  void updateChapters(Function(List<ChaptersStruct>) updateFn) {
    updateFn(_chapters ??= []);
  }

  bool hasChapters() => _chapters != null;

  static BibleVerseAndChspternumberStruct fromMap(Map<String, dynamic> data) =>
      BibleVerseAndChspternumberStruct(
        abbr: data['abbr'] as String?,
        book: data['book'] as String?,
        chapters: getStructList(
          data['chapters'],
          ChaptersStruct.fromMap,
        ),
      );

  static BibleVerseAndChspternumberStruct? maybeFromMap(dynamic data) => data
          is Map
      ? BibleVerseAndChspternumberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'abbr': _abbr,
        'book': _book,
        'chapters': _chapters?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'abbr': serializeParam(
          _abbr,
          ParamType.String,
        ),
        'book': serializeParam(
          _book,
          ParamType.String,
        ),
        'chapters': serializeParam(
          _chapters,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static BibleVerseAndChspternumberStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BibleVerseAndChspternumberStruct(
        abbr: deserializeParam(
          data['abbr'],
          ParamType.String,
          false,
        ),
        book: deserializeParam(
          data['book'],
          ParamType.String,
          false,
        ),
        chapters: deserializeStructParam<ChaptersStruct>(
          data['chapters'],
          ParamType.DataStruct,
          true,
          structBuilder: ChaptersStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BibleVerseAndChspternumberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BibleVerseAndChspternumberStruct &&
        abbr == other.abbr &&
        book == other.book &&
        listEquality.equals(chapters, other.chapters);
  }

  @override
  int get hashCode => const ListEquality().hash([abbr, book, chapters]);
}

BibleVerseAndChspternumberStruct createBibleVerseAndChspternumberStruct({
  String? abbr,
  String? book,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BibleVerseAndChspternumberStruct(
      abbr: abbr,
      book: book,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BibleVerseAndChspternumberStruct? updateBibleVerseAndChspternumberStruct(
  BibleVerseAndChspternumberStruct? bibleVerseAndChspternumber, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bibleVerseAndChspternumber
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBibleVerseAndChspternumberStructData(
  Map<String, dynamic> firestoreData,
  BibleVerseAndChspternumberStruct? bibleVerseAndChspternumber,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bibleVerseAndChspternumber == null) {
    return;
  }
  if (bibleVerseAndChspternumber.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      bibleVerseAndChspternumber.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bibleVerseAndChspternumberData =
      getBibleVerseAndChspternumberFirestoreData(
          bibleVerseAndChspternumber, forFieldValue);
  final nestedData = bibleVerseAndChspternumberData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      bibleVerseAndChspternumber.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBibleVerseAndChspternumberFirestoreData(
  BibleVerseAndChspternumberStruct? bibleVerseAndChspternumber, [
  bool forFieldValue = false,
]) {
  if (bibleVerseAndChspternumber == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bibleVerseAndChspternumber.toMap());

  // Add any Firestore field values
  bibleVerseAndChspternumber.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBibleVerseAndChspternumberListFirestoreData(
  List<BibleVerseAndChspternumberStruct>? bibleVerseAndChspternumbers,
) =>
    bibleVerseAndChspternumbers
        ?.map((e) => getBibleVerseAndChspternumberFirestoreData(e, true))
        .toList() ??
    [];
