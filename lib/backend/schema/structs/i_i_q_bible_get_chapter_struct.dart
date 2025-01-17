// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IIQBibleGetChapterStruct extends FFFirebaseStruct {
  IIQBibleGetChapterStruct({
    String? bookID,
    String? chapterId,
    String? versionId,
    List<String>? verseResult,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bookID = bookID,
        _chapterId = chapterId,
        _versionId = versionId,
        _verseResult = verseResult,
        _index = index,
        super(firestoreUtilData);

  // "bookID" field.
  String? _bookID;
  String get bookID => _bookID ?? '';
  set bookID(String? val) => _bookID = val;

  bool hasBookID() => _bookID != null;

  // "chapterId" field.
  String? _chapterId;
  String get chapterId => _chapterId ?? '';
  set chapterId(String? val) => _chapterId = val;

  bool hasChapterId() => _chapterId != null;

  // "versionId" field.
  String? _versionId;
  String get versionId => _versionId ?? '';
  set versionId(String? val) => _versionId = val;

  bool hasVersionId() => _versionId != null;

  // "verseResult" field.
  List<String>? _verseResult;
  List<String> get verseResult => _verseResult ?? const [];
  set verseResult(List<String>? val) => _verseResult = val;

  void updateVerseResult(Function(List<String>) updateFn) {
    updateFn(_verseResult ??= []);
  }

  bool hasVerseResult() => _verseResult != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  static IIQBibleGetChapterStruct fromMap(Map<String, dynamic> data) =>
      IIQBibleGetChapterStruct(
        bookID: data['bookID'] as String?,
        chapterId: data['chapterId'] as String?,
        versionId: data['versionId'] as String?,
        verseResult: getDataList(data['verseResult']),
        index: castToType<int>(data['index']),
      );

  static IIQBibleGetChapterStruct? maybeFromMap(dynamic data) => data is Map
      ? IIQBibleGetChapterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bookID': _bookID,
        'chapterId': _chapterId,
        'versionId': _versionId,
        'verseResult': _verseResult,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bookID': serializeParam(
          _bookID,
          ParamType.String,
        ),
        'chapterId': serializeParam(
          _chapterId,
          ParamType.String,
        ),
        'versionId': serializeParam(
          _versionId,
          ParamType.String,
        ),
        'verseResult': serializeParam(
          _verseResult,
          ParamType.String,
          isList: true,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static IIQBibleGetChapterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      IIQBibleGetChapterStruct(
        bookID: deserializeParam(
          data['bookID'],
          ParamType.String,
          false,
        ),
        chapterId: deserializeParam(
          data['chapterId'],
          ParamType.String,
          false,
        ),
        versionId: deserializeParam(
          data['versionId'],
          ParamType.String,
          false,
        ),
        verseResult: deserializeParam<String>(
          data['verseResult'],
          ParamType.String,
          true,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IIQBibleGetChapterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is IIQBibleGetChapterStruct &&
        bookID == other.bookID &&
        chapterId == other.chapterId &&
        versionId == other.versionId &&
        listEquality.equals(verseResult, other.verseResult) &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([bookID, chapterId, versionId, verseResult, index]);
}

IIQBibleGetChapterStruct createIIQBibleGetChapterStruct({
  String? bookID,
  String? chapterId,
  String? versionId,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IIQBibleGetChapterStruct(
      bookID: bookID,
      chapterId: chapterId,
      versionId: versionId,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IIQBibleGetChapterStruct? updateIIQBibleGetChapterStruct(
  IIQBibleGetChapterStruct? iIQBibleGetChapter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    iIQBibleGetChapter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIIQBibleGetChapterStructData(
  Map<String, dynamic> firestoreData,
  IIQBibleGetChapterStruct? iIQBibleGetChapter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (iIQBibleGetChapter == null) {
    return;
  }
  if (iIQBibleGetChapter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && iIQBibleGetChapter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iIQBibleGetChapterData =
      getIIQBibleGetChapterFirestoreData(iIQBibleGetChapter, forFieldValue);
  final nestedData =
      iIQBibleGetChapterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      iIQBibleGetChapter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIIQBibleGetChapterFirestoreData(
  IIQBibleGetChapterStruct? iIQBibleGetChapter, [
  bool forFieldValue = false,
]) {
  if (iIQBibleGetChapter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(iIQBibleGetChapter.toMap());

  // Add any Firestore field values
  iIQBibleGetChapter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIIQBibleGetChapterListFirestoreData(
  List<IIQBibleGetChapterStruct>? iIQBibleGetChapters,
) =>
    iIQBibleGetChapters
        ?.map((e) => getIIQBibleGetChapterFirestoreData(e, true))
        .toList() ??
    [];
