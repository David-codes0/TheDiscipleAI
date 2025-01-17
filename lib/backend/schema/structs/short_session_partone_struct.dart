// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortSessionPartoneStruct extends FFFirebaseStruct {
  ShortSessionPartoneStruct({
    String? introduction,
    InteractiveQuestionStruct? interactiveQuestion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _introduction = introduction,
        _interactiveQuestion = interactiveQuestion,
        super(firestoreUtilData);

  // "introduction" field.
  String? _introduction;
  String get introduction => _introduction ?? '';
  set introduction(String? val) => _introduction = val;

  bool hasIntroduction() => _introduction != null;

  // "interactiveQuestion" field.
  InteractiveQuestionStruct? _interactiveQuestion;
  InteractiveQuestionStruct get interactiveQuestion =>
      _interactiveQuestion ?? InteractiveQuestionStruct();
  set interactiveQuestion(InteractiveQuestionStruct? val) =>
      _interactiveQuestion = val;

  void updateInteractiveQuestion(Function(InteractiveQuestionStruct) updateFn) {
    updateFn(_interactiveQuestion ??= InteractiveQuestionStruct());
  }

  bool hasInteractiveQuestion() => _interactiveQuestion != null;

  static ShortSessionPartoneStruct fromMap(Map<String, dynamic> data) =>
      ShortSessionPartoneStruct(
        introduction: data['introduction'] as String?,
        interactiveQuestion:
            data['interactiveQuestion'] is InteractiveQuestionStruct
                ? data['interactiveQuestion']
                : InteractiveQuestionStruct.maybeFromMap(
                    data['interactiveQuestion']),
      );

  static ShortSessionPartoneStruct? maybeFromMap(dynamic data) => data is Map
      ? ShortSessionPartoneStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'introduction': _introduction,
        'interactiveQuestion': _interactiveQuestion?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'introduction': serializeParam(
          _introduction,
          ParamType.String,
        ),
        'interactiveQuestion': serializeParam(
          _interactiveQuestion,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShortSessionPartoneStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShortSessionPartoneStruct(
        introduction: deserializeParam(
          data['introduction'],
          ParamType.String,
          false,
        ),
        interactiveQuestion: deserializeStructParam(
          data['interactiveQuestion'],
          ParamType.DataStruct,
          false,
          structBuilder: InteractiveQuestionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShortSessionPartoneStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShortSessionPartoneStruct &&
        introduction == other.introduction &&
        interactiveQuestion == other.interactiveQuestion;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([introduction, interactiveQuestion]);
}

ShortSessionPartoneStruct createShortSessionPartoneStruct({
  String? introduction,
  InteractiveQuestionStruct? interactiveQuestion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShortSessionPartoneStruct(
      introduction: introduction,
      interactiveQuestion: interactiveQuestion ??
          (clearUnsetFields ? InteractiveQuestionStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShortSessionPartoneStruct? updateShortSessionPartoneStruct(
  ShortSessionPartoneStruct? shortSessionPartone, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shortSessionPartone
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShortSessionPartoneStructData(
  Map<String, dynamic> firestoreData,
  ShortSessionPartoneStruct? shortSessionPartone,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shortSessionPartone == null) {
    return;
  }
  if (shortSessionPartone.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shortSessionPartone.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shortSessionPartoneData =
      getShortSessionPartoneFirestoreData(shortSessionPartone, forFieldValue);
  final nestedData =
      shortSessionPartoneData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      shortSessionPartone.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShortSessionPartoneFirestoreData(
  ShortSessionPartoneStruct? shortSessionPartone, [
  bool forFieldValue = false,
]) {
  if (shortSessionPartone == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shortSessionPartone.toMap());

  // Handle nested data for "interactiveQuestion" field.
  addInteractiveQuestionStructData(
    firestoreData,
    shortSessionPartone.hasInteractiveQuestion()
        ? shortSessionPartone.interactiveQuestion
        : null,
    'interactiveQuestion',
    forFieldValue,
  );

  // Add any Firestore field values
  shortSessionPartone.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShortSessionPartoneListFirestoreData(
  List<ShortSessionPartoneStruct>? shortSessionPartones,
) =>
    shortSessionPartones
        ?.map((e) => getShortSessionPartoneFirestoreData(e, true))
        .toList() ??
    [];
