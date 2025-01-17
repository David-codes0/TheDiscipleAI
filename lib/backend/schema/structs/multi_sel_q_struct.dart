// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultiSelQStruct extends FFFirebaseStruct {
  MultiSelQStruct({
    String? question,
    List<String>? listOFOption,
    bool? hasResponse,
    List<String>? listOfResponse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _listOFOption = listOFOption,
        _hasResponse = hasResponse,
        _listOfResponse = listOfResponse,
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

  // "hasResponse" field.
  bool? _hasResponse;
  bool get hasResponse => _hasResponse ?? false;
  set hasResponse(bool? val) => _hasResponse = val;

  bool hasHasResponse() => _hasResponse != null;

  // "listOfResponse" field.
  List<String>? _listOfResponse;
  List<String> get listOfResponse => _listOfResponse ?? const [];
  set listOfResponse(List<String>? val) => _listOfResponse = val;

  void updateListOfResponse(Function(List<String>) updateFn) {
    updateFn(_listOfResponse ??= []);
  }

  bool hasListOfResponse() => _listOfResponse != null;

  static MultiSelQStruct fromMap(Map<String, dynamic> data) => MultiSelQStruct(
        question: data['question'] as String?,
        listOFOption: getDataList(data['listOFOption']),
        hasResponse: data['hasResponse'] as bool?,
        listOfResponse: getDataList(data['listOfResponse']),
      );

  static MultiSelQStruct? maybeFromMap(dynamic data) => data is Map
      ? MultiSelQStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'listOFOption': _listOFOption,
        'hasResponse': _hasResponse,
        'listOfResponse': _listOfResponse,
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
        'hasResponse': serializeParam(
          _hasResponse,
          ParamType.bool,
        ),
        'listOfResponse': serializeParam(
          _listOfResponse,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static MultiSelQStruct fromSerializableMap(Map<String, dynamic> data) =>
      MultiSelQStruct(
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
        hasResponse: deserializeParam(
          data['hasResponse'],
          ParamType.bool,
          false,
        ),
        listOfResponse: deserializeParam<String>(
          data['listOfResponse'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'MultiSelQStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MultiSelQStruct &&
        question == other.question &&
        listEquality.equals(listOFOption, other.listOFOption) &&
        hasResponse == other.hasResponse &&
        listEquality.equals(listOfResponse, other.listOfResponse);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([question, listOFOption, hasResponse, listOfResponse]);
}

MultiSelQStruct createMultiSelQStruct({
  String? question,
  bool? hasResponse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MultiSelQStruct(
      question: question,
      hasResponse: hasResponse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MultiSelQStruct? updateMultiSelQStruct(
  MultiSelQStruct? multiSelQ, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    multiSelQ
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMultiSelQStructData(
  Map<String, dynamic> firestoreData,
  MultiSelQStruct? multiSelQ,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (multiSelQ == null) {
    return;
  }
  if (multiSelQ.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && multiSelQ.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final multiSelQData = getMultiSelQFirestoreData(multiSelQ, forFieldValue);
  final nestedData = multiSelQData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = multiSelQ.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMultiSelQFirestoreData(
  MultiSelQStruct? multiSelQ, [
  bool forFieldValue = false,
]) {
  if (multiSelQ == null) {
    return {};
  }
  final firestoreData = mapToFirestore(multiSelQ.toMap());

  // Add any Firestore field values
  multiSelQ.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMultiSelQListFirestoreData(
  List<MultiSelQStruct>? multiSelQs,
) =>
    multiSelQs?.map((e) => getMultiSelQFirestoreData(e, true)).toList() ?? [];
