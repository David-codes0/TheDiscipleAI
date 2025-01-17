// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MorningRoutineStruct extends FFFirebaseStruct {
  MorningRoutineStruct({
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

  static MorningRoutineStruct fromMap(Map<String, dynamic> data) =>
      MorningRoutineStruct(
        scriptureReading: data['scriptureReading'] as String?,
        prayerPrompt: data['prayerPrompt'] as String?,
        reflectionQuestion: data['reflectionQuestion'] as String?,
        actionableStep: data['actionableStep'] as String?,
      );

  static MorningRoutineStruct? maybeFromMap(dynamic data) => data is Map
      ? MorningRoutineStruct.fromMap(data.cast<String, dynamic>())
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

  static MorningRoutineStruct fromSerializableMap(Map<String, dynamic> data) =>
      MorningRoutineStruct(
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
  String toString() => 'MorningRoutineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MorningRoutineStruct &&
        scriptureReading == other.scriptureReading &&
        prayerPrompt == other.prayerPrompt &&
        reflectionQuestion == other.reflectionQuestion &&
        actionableStep == other.actionableStep;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [scriptureReading, prayerPrompt, reflectionQuestion, actionableStep]);
}

MorningRoutineStruct createMorningRoutineStruct({
  String? scriptureReading,
  String? prayerPrompt,
  String? reflectionQuestion,
  String? actionableStep,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MorningRoutineStruct(
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

MorningRoutineStruct? updateMorningRoutineStruct(
  MorningRoutineStruct? morningRoutine, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    morningRoutine
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMorningRoutineStructData(
  Map<String, dynamic> firestoreData,
  MorningRoutineStruct? morningRoutine,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (morningRoutine == null) {
    return;
  }
  if (morningRoutine.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && morningRoutine.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final morningRoutineData =
      getMorningRoutineFirestoreData(morningRoutine, forFieldValue);
  final nestedData =
      morningRoutineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = morningRoutine.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMorningRoutineFirestoreData(
  MorningRoutineStruct? morningRoutine, [
  bool forFieldValue = false,
]) {
  if (morningRoutine == null) {
    return {};
  }
  final firestoreData = mapToFirestore(morningRoutine.toMap());

  // Add any Firestore field values
  morningRoutine.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMorningRoutineListFirestoreData(
  List<MorningRoutineStruct>? morningRoutines,
) =>
    morningRoutines
        ?.map((e) => getMorningRoutineFirestoreData(e, true))
        .toList() ??
    [];
