// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardQuestionStruct extends FFFirebaseStruct {
  OnboardQuestionStruct({
    String? question,
    List<String>? listOFOption,
    String? response,
    bool? hasResponse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _listOFOption = listOFOption,
        _response = response,
        _hasResponse = hasResponse,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "listOFOption" field.
  List<String>? _listOFOption;
  List<String> get listOFOption => _listOFOption ?? const [];
  set listOFOption(List<String>? val) => _listOFOption = val;

  void updateListOFOption(Function(List<String>) updateFn) {
    updateFn(_listOFOption ??= []);
  }

  bool hasListOFOption() => _listOFOption != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;

  bool hasResponseField() => _response != null;

  // "hasResponse" field.
  bool? _hasResponse;
  bool get hasResponse => _hasResponse ?? false;
  set hasResponse(bool? val) => _hasResponse = val;

  bool hasHasResponse() => _hasResponse != null;

  static OnboardQuestionStruct fromMap(Map<String, dynamic> data) =>
      OnboardQuestionStruct(
        question: data['question'] as String?,
        listOFOption: getDataList(data['listOFOption']),
        response: data['response'] as String?,
        hasResponse: data['hasResponse'] as bool?,
      );

  static OnboardQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? OnboardQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'listOFOption': _listOFOption,
        'response': _response,
        'hasResponse': _hasResponse,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'listOFOption': serializeParam(
          _listOFOption,
          ParamType.String,
          isList: true,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
        'hasResponse': serializeParam(
          _hasResponse,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OnboardQuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnboardQuestionStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        listOFOption: deserializeParam<String>(
          data['listOFOption'],
          ParamType.String,
          true,
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
        hasResponse: deserializeParam(
          data['hasResponse'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OnboardQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OnboardQuestionStruct &&
        question == other.question &&
        listEquality.equals(listOFOption, other.listOFOption) &&
        response == other.response &&
        hasResponse == other.hasResponse;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([question, listOFOption, response, hasResponse]);
}

OnboardQuestionStruct createOnboardQuestionStruct({
  String? question,
  String? response,
  bool? hasResponse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OnboardQuestionStruct(
      question: question,
      response: response,
      hasResponse: hasResponse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OnboardQuestionStruct? updateOnboardQuestionStruct(
  OnboardQuestionStruct? onboardQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    onboardQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOnboardQuestionStructData(
  Map<String, dynamic> firestoreData,
  OnboardQuestionStruct? onboardQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (onboardQuestion == null) {
    return;
  }
  if (onboardQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && onboardQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final onboardQuestionData =
      getOnboardQuestionFirestoreData(onboardQuestion, forFieldValue);
  final nestedData =
      onboardQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = onboardQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOnboardQuestionFirestoreData(
  OnboardQuestionStruct? onboardQuestion, [
  bool forFieldValue = false,
]) {
  if (onboardQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(onboardQuestion.toMap());

  // Add any Firestore field values
  onboardQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOnboardQuestionListFirestoreData(
  List<OnboardQuestionStruct>? onboardQuestions,
) =>
    onboardQuestions
        ?.map((e) => getOnboardQuestionFirestoreData(e, true))
        .toList() ??
    [];
