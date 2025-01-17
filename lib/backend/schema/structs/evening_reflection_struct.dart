// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EveningReflectionStruct extends FFFirebaseStruct {
  EveningReflectionStruct({
    String? scriptureReading,
    String? prayerPrompt,
    String? reflectionQuestion,
    String? actionableStep,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _scriptureReading = scriptureReading,
        _prayerPrompt = prayerPrompt,
        _reflectionQuestion = reflectionQuestion,
        _actionableStep = actionableStep,
        super(firestoreUtilData);

  // "scriptureReading" field.
  String? _scriptureReading;
  String get scriptureReading => _scriptureReading ?? '';
  set scriptureReading(String? val) => _scriptureReading = val;

  bool hasScriptureReading() => _scriptureReading != null;

  // "prayerPrompt" field.
  String? _prayerPrompt;
  String get prayerPrompt => _prayerPrompt ?? '';
  set prayerPrompt(String? val) => _prayerPrompt = val;

  bool hasPrayerPrompt() => _prayerPrompt != null;

  // "reflectionQuestion" field.
  String? _reflectionQuestion;
  String get reflectionQuestion => _reflectionQuestion ?? '';
  set reflectionQuestion(String? val) => _reflectionQuestion = val;

  bool hasReflectionQuestion() => _reflectionQuestion != null;

  // "actionableStep" field.
  String? _actionableStep;
  String get actionableStep => _actionableStep ?? '';
  set actionableStep(String? val) => _actionableStep = val;

  bool hasActionableStep() => _actionableStep != null;

  static EveningReflectionStruct fromMap(Map<String, dynamic> data) =>
      EveningReflectionStruct(
        scriptureReading: data['scriptureReading'] as String?,
        prayerPrompt: data['prayerPrompt'] as String?,
        reflectionQuestion: data['reflectionQuestion'] as String?,
        actionableStep: data['actionableStep'] as String?,
      );

  static EveningReflectionStruct? maybeFromMap(dynamic data) => data is Map
      ? EveningReflectionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'scriptureReading': _scriptureReading,
        'prayerPrompt': _prayerPrompt,
        'reflectionQuestion': _reflectionQuestion,
        'actionableStep': _actionableStep,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'scriptureReading': serializeParam(
          _scriptureReading,
          ParamType.String,
        ),
        'prayerPrompt': serializeParam(
          _prayerPrompt,
          ParamType.String,
        ),
        'reflectionQuestion': serializeParam(
          _reflectionQuestion,
          ParamType.String,
        ),
        'actionableStep': serializeParam(
          _actionableStep,
          ParamType.String,
        ),
      }.withoutNulls;

  static EveningReflectionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EveningReflectionStruct(
        scriptureReading: deserializeParam(
          data['scriptureReading'],
          ParamType.String,
          false,
        ),
        prayerPrompt: deserializeParam(
          data['prayerPrompt'],
          ParamType.String,
          false,
        ),
        reflectionQuestion: deserializeParam(
          data['reflectionQuestion'],
          ParamType.String,
          false,
        ),
        actionableStep: deserializeParam(
          data['actionableStep'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EveningReflectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EveningReflectionStruct &&
        scriptureReading == other.scriptureReading &&
        prayerPrompt == other.prayerPrompt &&
        reflectionQuestion == other.reflectionQuestion &&
        actionableStep == other.actionableStep;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [scriptureReading, prayerPrompt, reflectionQuestion, actionableStep]);
}

EveningReflectionStruct createEveningReflectionStruct({
  String? scriptureReading,
  String? prayerPrompt,
  String? reflectionQuestion,
  String? actionableStep,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EveningReflectionStruct(
      scriptureReading: scriptureReading,
      prayerPrompt: prayerPrompt,
      reflectionQuestion: reflectionQuestion,
      actionableStep: actionableStep,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EveningReflectionStruct? updateEveningReflectionStruct(
  EveningReflectionStruct? eveningReflection, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eveningReflection
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEveningReflectionStructData(
  Map<String, dynamic> firestoreData,
  EveningReflectionStruct? eveningReflection,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eveningReflection == null) {
    return;
  }
  if (eveningReflection.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eveningReflection.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eveningReflectionData =
      getEveningReflectionFirestoreData(eveningReflection, forFieldValue);
  final nestedData =
      eveningReflectionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eveningReflection.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEveningReflectionFirestoreData(
  EveningReflectionStruct? eveningReflection, [
  bool forFieldValue = false,
]) {
  if (eveningReflection == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eveningReflection.toMap());

  // Add any Firestore field values
  eveningReflection.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEveningReflectionListFirestoreData(
  List<EveningReflectionStruct>? eveningReflections,
) =>
    eveningReflections
        ?.map((e) => getEveningReflectionFirestoreData(e, true))
        .toList() ??
    [];
