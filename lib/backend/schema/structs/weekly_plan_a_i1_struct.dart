// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyPlanAI1Struct extends FFFirebaseStruct {
  WeeklyPlanAI1Struct({
    WeeklyPlanStruct? weeklyPlan,
    List<DailyTasksStruct>? dailyTasks,
    WeeklyReviewStruct? weeklyReview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weeklyPlan = weeklyPlan,
        _dailyTasks = dailyTasks,
        _weeklyReview = weeklyReview,
        super(firestoreUtilData);

  // "weeklyPlan" field.
  WeeklyPlanStruct? _weeklyPlan;
  WeeklyPlanStruct get weeklyPlan => _weeklyPlan ?? WeeklyPlanStruct();
  set weeklyPlan(WeeklyPlanStruct? val) => _weeklyPlan = val;

  void updateWeeklyPlan(Function(WeeklyPlanStruct) updateFn) {
    updateFn(_weeklyPlan ??= WeeklyPlanStruct());
  }

  bool hasWeeklyPlan() => _weeklyPlan != null;

  // "dailyTasks" field.
  List<DailyTasksStruct>? _dailyTasks;
  List<DailyTasksStruct> get dailyTasks => _dailyTasks ?? const [];
  set dailyTasks(List<DailyTasksStruct>? val) => _dailyTasks = val;

  void updateDailyTasks(Function(List<DailyTasksStruct>) updateFn) {
    updateFn(_dailyTasks ??= []);
  }

  bool hasDailyTasks() => _dailyTasks != null;

  // "weeklyReview" field.
  WeeklyReviewStruct? _weeklyReview;
  WeeklyReviewStruct get weeklyReview => _weeklyReview ?? WeeklyReviewStruct();
  set weeklyReview(WeeklyReviewStruct? val) => _weeklyReview = val;

  void updateWeeklyReview(Function(WeeklyReviewStruct) updateFn) {
    updateFn(_weeklyReview ??= WeeklyReviewStruct());
  }

  bool hasWeeklyReview() => _weeklyReview != null;

  static WeeklyPlanAI1Struct fromMap(Map<String, dynamic> data) =>
      WeeklyPlanAI1Struct(
        weeklyPlan: data['weeklyPlan'] is WeeklyPlanStruct
            ? data['weeklyPlan']
            : WeeklyPlanStruct.maybeFromMap(data['weeklyPlan']),
        dailyTasks: getStructList(
          data['dailyTasks'],
          DailyTasksStruct.fromMap,
        ),
        weeklyReview: data['weeklyReview'] is WeeklyReviewStruct
            ? data['weeklyReview']
            : WeeklyReviewStruct.maybeFromMap(data['weeklyReview']),
      );

  static WeeklyPlanAI1Struct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyPlanAI1Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weeklyPlan': _weeklyPlan?.toMap(),
        'dailyTasks': _dailyTasks?.map((e) => e.toMap()).toList(),
        'weeklyReview': _weeklyReview?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weeklyPlan': serializeParam(
          _weeklyPlan,
          ParamType.DataStruct,
        ),
        'dailyTasks': serializeParam(
          _dailyTasks,
          ParamType.DataStruct,
          isList: true,
        ),
        'weeklyReview': serializeParam(
          _weeklyReview,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WeeklyPlanAI1Struct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyPlanAI1Struct(
        weeklyPlan: deserializeStructParam(
          data['weeklyPlan'],
          ParamType.DataStruct,
          false,
          structBuilder: WeeklyPlanStruct.fromSerializableMap,
        ),
        dailyTasks: deserializeStructParam<DailyTasksStruct>(
          data['dailyTasks'],
          ParamType.DataStruct,
          true,
          structBuilder: DailyTasksStruct.fromSerializableMap,
        ),
        weeklyReview: deserializeStructParam(
          data['weeklyReview'],
          ParamType.DataStruct,
          false,
          structBuilder: WeeklyReviewStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WeeklyPlanAI1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeklyPlanAI1Struct &&
        weeklyPlan == other.weeklyPlan &&
        listEquality.equals(dailyTasks, other.dailyTasks) &&
        weeklyReview == other.weeklyReview;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([weeklyPlan, dailyTasks, weeklyReview]);
}

WeeklyPlanAI1Struct createWeeklyPlanAI1Struct({
  WeeklyPlanStruct? weeklyPlan,
  WeeklyReviewStruct? weeklyReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyPlanAI1Struct(
      weeklyPlan: weeklyPlan ?? (clearUnsetFields ? WeeklyPlanStruct() : null),
      weeklyReview:
          weeklyReview ?? (clearUnsetFields ? WeeklyReviewStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyPlanAI1Struct? updateWeeklyPlanAI1Struct(
  WeeklyPlanAI1Struct? weeklyPlanAI1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyPlanAI1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyPlanAI1StructData(
  Map<String, dynamic> firestoreData,
  WeeklyPlanAI1Struct? weeklyPlanAI1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyPlanAI1 == null) {
    return;
  }
  if (weeklyPlanAI1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyPlanAI1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyPlanAI1Data =
      getWeeklyPlanAI1FirestoreData(weeklyPlanAI1, forFieldValue);
  final nestedData =
      weeklyPlanAI1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyPlanAI1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyPlanAI1FirestoreData(
  WeeklyPlanAI1Struct? weeklyPlanAI1, [
  bool forFieldValue = false,
]) {
  if (weeklyPlanAI1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyPlanAI1.toMap());

  // Handle nested data for "weeklyPlan" field.
  addWeeklyPlanStructData(
    firestoreData,
    weeklyPlanAI1.hasWeeklyPlan() ? weeklyPlanAI1.weeklyPlan : null,
    'weeklyPlan',
    forFieldValue,
  );

  // Handle nested data for "weeklyReview" field.
  addWeeklyReviewStructData(
    firestoreData,
    weeklyPlanAI1.hasWeeklyReview() ? weeklyPlanAI1.weeklyReview : null,
    'weeklyReview',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyPlanAI1.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyPlanAI1ListFirestoreData(
  List<WeeklyPlanAI1Struct>? weeklyPlanAI1s,
) =>
    weeklyPlanAI1s
        ?.map((e) => getWeeklyPlanAI1FirestoreData(e, true))
        .toList() ??
    [];
