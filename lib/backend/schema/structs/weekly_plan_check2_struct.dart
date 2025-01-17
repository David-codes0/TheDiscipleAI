// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyPlanCheck2Struct extends FFFirebaseStruct {
  WeeklyPlanCheck2Struct({
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

  static WeeklyPlanCheck2Struct fromMap(Map<String, dynamic> data) =>
      WeeklyPlanCheck2Struct(
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

  static WeeklyPlanCheck2Struct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyPlanCheck2Struct.fromMap(data.cast<String, dynamic>())
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

  static WeeklyPlanCheck2Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      WeeklyPlanCheck2Struct(
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
  String toString() => 'WeeklyPlanCheck2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeklyPlanCheck2Struct &&
        weeklyPlan == other.weeklyPlan &&
        listEquality.equals(dailyTasks, other.dailyTasks) &&
        weeklyReview == other.weeklyReview;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([weeklyPlan, dailyTasks, weeklyReview]);
}

WeeklyPlanCheck2Struct createWeeklyPlanCheck2Struct({
  WeeklyPlanStruct? weeklyPlan,
  WeeklyReviewStruct? weeklyReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyPlanCheck2Struct(
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

WeeklyPlanCheck2Struct? updateWeeklyPlanCheck2Struct(
  WeeklyPlanCheck2Struct? weeklyPlanCheck2, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyPlanCheck2
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyPlanCheck2StructData(
  Map<String, dynamic> firestoreData,
  WeeklyPlanCheck2Struct? weeklyPlanCheck2,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyPlanCheck2 == null) {
    return;
  }
  if (weeklyPlanCheck2.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyPlanCheck2.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyPlanCheck2Data =
      getWeeklyPlanCheck2FirestoreData(weeklyPlanCheck2, forFieldValue);
  final nestedData =
      weeklyPlanCheck2Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyPlanCheck2.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyPlanCheck2FirestoreData(
  WeeklyPlanCheck2Struct? weeklyPlanCheck2, [
  bool forFieldValue = false,
]) {
  if (weeklyPlanCheck2 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyPlanCheck2.toMap());

  // Handle nested data for "weeklyPlan" field.
  addWeeklyPlanStructData(
    firestoreData,
    weeklyPlanCheck2.hasWeeklyPlan() ? weeklyPlanCheck2.weeklyPlan : null,
    'weeklyPlan',
    forFieldValue,
  );

  // Handle nested data for "weeklyReview" field.
  addWeeklyReviewStructData(
    firestoreData,
    weeklyPlanCheck2.hasWeeklyReview() ? weeklyPlanCheck2.weeklyReview : null,
    'weeklyReview',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyPlanCheck2.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyPlanCheck2ListFirestoreData(
  List<WeeklyPlanCheck2Struct>? weeklyPlanCheck2s,
) =>
    weeklyPlanCheck2s
        ?.map((e) => getWeeklyPlanCheck2FirestoreData(e, true))
        .toList() ??
    [];
