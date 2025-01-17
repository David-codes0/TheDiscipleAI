// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InteractiveQuestionStruct extends FFFirebaseStruct {
  InteractiveQuestionStruct({
    String? question,
    List<String>? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _options = options,
        super(firestoreUtilData);

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "Options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static InteractiveQuestionStruct fromMap(Map<String, dynamic> data) =>
      InteractiveQuestionStruct(
        question: data['Question'] as String?,
        options: getDataList(data['Options']),
      );

  static InteractiveQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? InteractiveQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Question': _question,
        'Options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Question': serializeParam(
          _question,
          ParamType.String,
        ),
        'Options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static InteractiveQuestionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InteractiveQuestionStruct(
        question: deserializeParam(
          data['Question'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['Options'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'InteractiveQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InteractiveQuestionStruct &&
        question == other.question &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode => const ListEquality().hash([question, options]);
}

InteractiveQuestionStruct createInteractiveQuestionStruct({
  String? question,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InteractiveQuestionStruct(
      question: question,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InteractiveQuestionStruct? updateInteractiveQuestionStruct(
  InteractiveQuestionStruct? interactiveQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interactiveQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInteractiveQuestionStructData(
  Map<String, dynamic> firestoreData,
  InteractiveQuestionStruct? interactiveQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interactiveQuestion == null) {
    return;
  }
  if (interactiveQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interactiveQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interactiveQuestionData =
      getInteractiveQuestionFirestoreData(interactiveQuestion, forFieldValue);
  final nestedData =
      interactiveQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      interactiveQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInteractiveQuestionFirestoreData(
  InteractiveQuestionStruct? interactiveQuestion, [
  bool forFieldValue = false,
]) {
  if (interactiveQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interactiveQuestion.toMap());

  // Add any Firestore field values
  interactiveQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInteractiveQuestionListFirestoreData(
  List<InteractiveQuestionStruct>? interactiveQuestions,
) =>
    interactiveQuestions
        ?.map((e) => getInteractiveQuestionFirestoreData(e, true))
        .toList() ??
    [];
