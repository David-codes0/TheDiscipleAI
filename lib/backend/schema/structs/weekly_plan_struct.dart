// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyPlanStruct extends FFFirebaseStruct {
  WeeklyPlanStruct({
    String? weeklyGoal,
    String? objectiveSummary,
    KeyScriptureStruct? keyScripture,
    String? reflectionQuestion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weeklyGoal = weeklyGoal,
        _objectiveSummary = objectiveSummary,
        _keyScripture = keyScripture,
        _reflectionQuestion = reflectionQuestion,
        super(firestoreUtilData);

  // "weeklyGoal" field.
  String? _weeklyGoal;
  String get weeklyGoal => _weeklyGoal ?? '';
  set weeklyGoal(String? val) => _weeklyGoal = val;

  bool hasWeeklyGoal() => _weeklyGoal != null;

  // "objectiveSummary" field.
  String? _objectiveSummary;
  String get objectiveSummary => _objectiveSummary ?? '';
  set objectiveSummary(String? val) => _objectiveSummary = val;

  bool hasObjectiveSummary() => _objectiveSummary != null;

  // "keyScripture" field.
  KeyScriptureStruct? _keyScripture;
  KeyScriptureStruct get keyScripture => _keyScripture ?? KeyScriptureStruct();
  set keyScripture(KeyScriptureStruct? val) => _keyScripture = val;

  void updateKeyScripture(Function(KeyScriptureStruct) updateFn) {
    updateFn(_keyScripture ??= KeyScriptureStruct());
  }

  bool hasKeyScripture() => _keyScripture != null;

  // "reflectionQuestion" field.
  String? _reflectionQuestion;
  String get reflectionQuestion => _reflectionQuestion ?? '';
  set reflectionQuestion(String? val) => _reflectionQuestion = val;

  bool hasReflectionQuestion() => _reflectionQuestion != null;

  static WeeklyPlanStruct fromMap(Map<String, dynamic> data) =>
      WeeklyPlanStruct(
        weeklyGoal: data['weeklyGoal'] as String?,
        objectiveSummary: data['objectiveSummary'] as String?,
        keyScripture: data['keyScripture'] is KeyScriptureStruct
            ? data['keyScripture']
            : KeyScriptureStruct.maybeFromMap(data['keyScripture']),
        reflectionQuestion: data['reflectionQuestion'] as String?,
      );

  static WeeklyPlanStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyPlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weeklyGoal': _weeklyGoal,
        'objectiveSummary': _objectiveSummary,
        'keyScripture': _keyScripture?.toMap(),
        'reflectionQuestion': _reflectionQuestion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weeklyGoal': serializeParam(
          _weeklyGoal,
          ParamType.String,
        ),
        'objectiveSummary': serializeParam(
          _objectiveSummary,
          ParamType.String,
        ),
        'keyScripture': serializeParam(
          _keyScripture,
          ParamType.DataStruct,
        ),
        'reflectionQuestion': serializeParam(
          _reflectionQuestion,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeeklyPlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyPlanStruct(
        weeklyGoal: deserializeParam(
          data['weeklyGoal'],
          ParamType.String,
          false,
        ),
        objectiveSummary: deserializeParam(
          data['objectiveSummary'],
          ParamType.String,
          false,
        ),
        keyScripture: deserializeStructParam(
          data['keyScripture'],
          ParamType.DataStruct,
          false,
          structBuilder: KeyScriptureStruct.fromSerializableMap,
        ),
        reflectionQuestion: deserializeParam(
          data['reflectionQuestion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeeklyPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeeklyPlanStruct &&
        weeklyGoal == other.weeklyGoal &&
        objectiveSummary == other.objectiveSummary &&
        keyScripture == other.keyScripture &&
        reflectionQuestion == other.reflectionQuestion;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([weeklyGoal, objectiveSummary, keyScripture, reflectionQuestion]);
}

WeeklyPlanStruct createWeeklyPlanStruct({
  String? weeklyGoal,
  String? objectiveSummary,
  KeyScriptureStruct? keyScripture,
  String? reflectionQuestion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyPlanStruct(
      weeklyGoal: weeklyGoal,
      objectiveSummary: objectiveSummary,
      keyScripture:
          keyScripture ?? (clearUnsetFields ? KeyScriptureStruct() : null),
      reflectionQuestion: reflectionQuestion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyPlanStruct? updateWeeklyPlanStruct(
  WeeklyPlanStruct? weeklyPlan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyPlan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyPlanStructData(
  Map<String, dynamic> firestoreData,
  WeeklyPlanStruct? weeklyPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyPlan == null) {
    return;
  }
  if (weeklyPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyPlan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyPlanData = getWeeklyPlanFirestoreData(weeklyPlan, forFieldValue);
  final nestedData = weeklyPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyPlan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyPlanFirestoreData(
  WeeklyPlanStruct? weeklyPlan, [
  bool forFieldValue = false,
]) {
  if (weeklyPlan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyPlan.toMap());

  // Handle nested data for "keyScripture" field.
  addKeyScriptureStructData(
    firestoreData,
    weeklyPlan.hasKeyScripture() ? weeklyPlan.keyScripture : null,
    'keyScripture',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyPlan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyPlanListFirestoreData(
  List<WeeklyPlanStruct>? weeklyPlans,
) =>
    weeklyPlans?.map((e) => getWeeklyPlanFirestoreData(e, true)).toList() ?? [];
