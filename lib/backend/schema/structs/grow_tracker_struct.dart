// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowTrackerStruct extends FFFirebaseStruct {
  GrowTrackerStruct({
    bool? scriptureReadingBool,
    bool? prayerPromptBool,
    bool? reflectionQuestionBool,
    DailyTasksStruct? dailyTask,
    bool? eveningReflection,
    bool? eveningAction,
    int? weekNo,
    bool? morningAction,
    bool? eveningScripture,
    bool? eveningprayer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _scriptureReadingBool = scriptureReadingBool,
        _prayerPromptBool = prayerPromptBool,
        _reflectionQuestionBool = reflectionQuestionBool,
        _dailyTask = dailyTask,
        _eveningReflection = eveningReflection,
        _eveningAction = eveningAction,
        _weekNo = weekNo,
        _morningAction = morningAction,
        _eveningScripture = eveningScripture,
        _eveningprayer = eveningprayer,
        super(firestoreUtilData);

  // "scriptureReadingBool" field.
  bool? _scriptureReadingBool;
  bool get scriptureReadingBool => _scriptureReadingBool ?? false;
  set scriptureReadingBool(bool? val) => _scriptureReadingBool = val;

  bool hasScriptureReadingBool() => _scriptureReadingBool != null;

  // "prayerPromptBool" field.
  bool? _prayerPromptBool;
  bool get prayerPromptBool => _prayerPromptBool ?? false;
  set prayerPromptBool(bool? val) => _prayerPromptBool = val;

  bool hasPrayerPromptBool() => _prayerPromptBool != null;

  // "reflectionQuestionBool" field.
  bool? _reflectionQuestionBool;
  bool get reflectionQuestionBool => _reflectionQuestionBool ?? false;
  set reflectionQuestionBool(bool? val) => _reflectionQuestionBool = val;

  bool hasReflectionQuestionBool() => _reflectionQuestionBool != null;

  // "dailyTask" field.
  DailyTasksStruct? _dailyTask;
  DailyTasksStruct get dailyTask => _dailyTask ?? DailyTasksStruct();
  set dailyTask(DailyTasksStruct? val) => _dailyTask = val;

  void updateDailyTask(Function(DailyTasksStruct) updateFn) {
    updateFn(_dailyTask ??= DailyTasksStruct());
  }

  bool hasDailyTask() => _dailyTask != null;

  // "eveningReflection" field.
  bool? _eveningReflection;
  bool get eveningReflection => _eveningReflection ?? false;
  set eveningReflection(bool? val) => _eveningReflection = val;

  bool hasEveningReflection() => _eveningReflection != null;

  // "eveningAction" field.
  bool? _eveningAction;
  bool get eveningAction => _eveningAction ?? false;
  set eveningAction(bool? val) => _eveningAction = val;

  bool hasEveningAction() => _eveningAction != null;

  // "weekNo" field.
  int? _weekNo;
  int get weekNo => _weekNo ?? 0;
  set weekNo(int? val) => _weekNo = val;

  void incrementWeekNo(int amount) => weekNo = weekNo + amount;

  bool hasWeekNo() => _weekNo != null;

  // "morningAction" field.
  bool? _morningAction;
  bool get morningAction => _morningAction ?? false;
  set morningAction(bool? val) => _morningAction = val;

  bool hasMorningAction() => _morningAction != null;

  // "eveningScripture" field.
  bool? _eveningScripture;
  bool get eveningScripture => _eveningScripture ?? false;
  set eveningScripture(bool? val) => _eveningScripture = val;

  bool hasEveningScripture() => _eveningScripture != null;

  // "eveningprayer" field.
  bool? _eveningprayer;
  bool get eveningprayer => _eveningprayer ?? false;
  set eveningprayer(bool? val) => _eveningprayer = val;

  bool hasEveningprayer() => _eveningprayer != null;

  static GrowTrackerStruct fromMap(Map<String, dynamic> data) =>
      GrowTrackerStruct(
        scriptureReadingBool: data['scriptureReadingBool'] as bool?,
        prayerPromptBool: data['prayerPromptBool'] as bool?,
        reflectionQuestionBool: data['reflectionQuestionBool'] as bool?,
        dailyTask: data['dailyTask'] is DailyTasksStruct
            ? data['dailyTask']
            : DailyTasksStruct.maybeFromMap(data['dailyTask']),
        eveningReflection: data['eveningReflection'] as bool?,
        eveningAction: data['eveningAction'] as bool?,
        weekNo: castToType<int>(data['weekNo']),
        morningAction: data['morningAction'] as bool?,
        eveningScripture: data['eveningScripture'] as bool?,
        eveningprayer: data['eveningprayer'] as bool?,
      );

  static GrowTrackerStruct? maybeFromMap(dynamic data) => data is Map
      ? GrowTrackerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'scriptureReadingBool': _scriptureReadingBool,
        'prayerPromptBool': _prayerPromptBool,
        'reflectionQuestionBool': _reflectionQuestionBool,
        'dailyTask': _dailyTask?.toMap(),
        'eveningReflection': _eveningReflection,
        'eveningAction': _eveningAction,
        'weekNo': _weekNo,
        'morningAction': _morningAction,
        'eveningScripture': _eveningScripture,
        'eveningprayer': _eveningprayer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'scriptureReadingBool': serializeParam(
          _scriptureReadingBool,
          ParamType.bool,
        ),
        'prayerPromptBool': serializeParam(
          _prayerPromptBool,
          ParamType.bool,
        ),
        'reflectionQuestionBool': serializeParam(
          _reflectionQuestionBool,
          ParamType.bool,
        ),
        'dailyTask': serializeParam(
          _dailyTask,
          ParamType.DataStruct,
        ),
        'eveningReflection': serializeParam(
          _eveningReflection,
          ParamType.bool,
        ),
        'eveningAction': serializeParam(
          _eveningAction,
          ParamType.bool,
        ),
        'weekNo': serializeParam(
          _weekNo,
          ParamType.int,
        ),
        'morningAction': serializeParam(
          _morningAction,
          ParamType.bool,
        ),
        'eveningScripture': serializeParam(
          _eveningScripture,
          ParamType.bool,
        ),
        'eveningprayer': serializeParam(
          _eveningprayer,
          ParamType.bool,
        ),
      }.withoutNulls;

  static GrowTrackerStruct fromSerializableMap(Map<String, dynamic> data) =>
      GrowTrackerStruct(
        scriptureReadingBool: deserializeParam(
          data['scriptureReadingBool'],
          ParamType.bool,
          false,
        ),
        prayerPromptBool: deserializeParam(
          data['prayerPromptBool'],
          ParamType.bool,
          false,
        ),
        reflectionQuestionBool: deserializeParam(
          data['reflectionQuestionBool'],
          ParamType.bool,
          false,
        ),
        dailyTask: deserializeStructParam(
          data['dailyTask'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTasksStruct.fromSerializableMap,
        ),
        eveningReflection: deserializeParam(
          data['eveningReflection'],
          ParamType.bool,
          false,
        ),
        eveningAction: deserializeParam(
          data['eveningAction'],
          ParamType.bool,
          false,
        ),
        weekNo: deserializeParam(
          data['weekNo'],
          ParamType.int,
          false,
        ),
        morningAction: deserializeParam(
          data['morningAction'],
          ParamType.bool,
          false,
        ),
        eveningScripture: deserializeParam(
          data['eveningScripture'],
          ParamType.bool,
          false,
        ),
        eveningprayer: deserializeParam(
          data['eveningprayer'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'GrowTrackerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrowTrackerStruct &&
        scriptureReadingBool == other.scriptureReadingBool &&
        prayerPromptBool == other.prayerPromptBool &&
        reflectionQuestionBool == other.reflectionQuestionBool &&
        dailyTask == other.dailyTask &&
        eveningReflection == other.eveningReflection &&
        eveningAction == other.eveningAction &&
        weekNo == other.weekNo &&
        morningAction == other.morningAction &&
        eveningScripture == other.eveningScripture &&
        eveningprayer == other.eveningprayer;
  }

  @override
  int get hashCode => const ListEquality().hash([
        scriptureReadingBool,
        prayerPromptBool,
        reflectionQuestionBool,
        dailyTask,
        eveningReflection,
        eveningAction,
        weekNo,
        morningAction,
        eveningScripture,
        eveningprayer
      ]);
}

GrowTrackerStruct createGrowTrackerStruct({
  bool? scriptureReadingBool,
  bool? prayerPromptBool,
  bool? reflectionQuestionBool,
  DailyTasksStruct? dailyTask,
  bool? eveningReflection,
  bool? eveningAction,
  int? weekNo,
  bool? morningAction,
  bool? eveningScripture,
  bool? eveningprayer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GrowTrackerStruct(
      scriptureReadingBool: scriptureReadingBool,
      prayerPromptBool: prayerPromptBool,
      reflectionQuestionBool: reflectionQuestionBool,
      dailyTask: dailyTask ?? (clearUnsetFields ? DailyTasksStruct() : null),
      eveningReflection: eveningReflection,
      eveningAction: eveningAction,
      weekNo: weekNo,
      morningAction: morningAction,
      eveningScripture: eveningScripture,
      eveningprayer: eveningprayer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GrowTrackerStruct? updateGrowTrackerStruct(
  GrowTrackerStruct? growTracker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    growTracker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGrowTrackerStructData(
  Map<String, dynamic> firestoreData,
  GrowTrackerStruct? growTracker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (growTracker == null) {
    return;
  }
  if (growTracker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && growTracker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final growTrackerData =
      getGrowTrackerFirestoreData(growTracker, forFieldValue);
  final nestedData =
      growTrackerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = growTracker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGrowTrackerFirestoreData(
  GrowTrackerStruct? growTracker, [
  bool forFieldValue = false,
]) {
  if (growTracker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(growTracker.toMap());

  // Handle nested data for "dailyTask" field.
  addDailyTasksStructData(
    firestoreData,
    growTracker.hasDailyTask() ? growTracker.dailyTask : null,
    'dailyTask',
    forFieldValue,
  );

  // Add any Firestore field values
  growTracker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGrowTrackerListFirestoreData(
  List<GrowTrackerStruct>? growTrackers,
) =>
    growTrackers?.map((e) => getGrowTrackerFirestoreData(e, true)).toList() ??
    [];
