// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevotionWeeklyAIplanStruct extends FFFirebaseStruct {
  DevotionWeeklyAIplanStruct({
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

  static DevotionWeeklyAIplanStruct fromMap(Map<String, dynamic> data) =>
      DevotionWeeklyAIplanStruct(
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

  static DevotionWeeklyAIplanStruct? maybeFromMap(dynamic data) => data is Map
      ? DevotionWeeklyAIplanStruct.fromMap(data.cast<String, dynamic>())
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

  static DevotionWeeklyAIplanStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DevotionWeeklyAIplanStruct(
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
  String toString() => 'DevotionWeeklyAIplanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DevotionWeeklyAIplanStruct &&
        weeklyPlan == other.weeklyPlan &&
        listEquality.equals(dailyTasks, other.dailyTasks) &&
        weeklyReview == other.weeklyReview;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([weeklyPlan, dailyTasks, weeklyReview]);
}

DevotionWeeklyAIplanStruct createDevotionWeeklyAIplanStruct({
  WeeklyPlanStruct? weeklyPlan,
  WeeklyReviewStruct? weeklyReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DevotionWeeklyAIplanStruct(
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

DevotionWeeklyAIplanStruct? updateDevotionWeeklyAIplanStruct(
  DevotionWeeklyAIplanStruct? devotionWeeklyAIplan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    devotionWeeklyAIplan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDevotionWeeklyAIplanStructData(
  Map<String, dynamic> firestoreData,
  DevotionWeeklyAIplanStruct? devotionWeeklyAIplan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (devotionWeeklyAIplan == null) {
    return;
  }
  if (devotionWeeklyAIplan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && devotionWeeklyAIplan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final devotionWeeklyAIplanData =
      getDevotionWeeklyAIplanFirestoreData(devotionWeeklyAIplan, forFieldValue);
  final nestedData =
      devotionWeeklyAIplanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      devotionWeeklyAIplan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDevotionWeeklyAIplanFirestoreData(
  DevotionWeeklyAIplanStruct? devotionWeeklyAIplan, [
  bool forFieldValue = false,
]) {
  if (devotionWeeklyAIplan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(devotionWeeklyAIplan.toMap());

  // Handle nested data for "weeklyPlan" field.
  addWeeklyPlanStructData(
    firestoreData,
    devotionWeeklyAIplan.hasWeeklyPlan()
        ? devotionWeeklyAIplan.weeklyPlan
        : null,
    'weeklyPlan',
    forFieldValue,
  );

  // Handle nested data for "weeklyReview" field.
  addWeeklyReviewStructData(
    firestoreData,
    devotionWeeklyAIplan.hasWeeklyReview()
        ? devotionWeeklyAIplan.weeklyReview
        : null,
    'weeklyReview',
    forFieldValue,
  );

  // Add any Firestore field values
  devotionWeeklyAIplan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDevotionWeeklyAIplanListFirestoreData(
  List<DevotionWeeklyAIplanStruct>? devotionWeeklyAIplans,
) =>
    devotionWeeklyAIplans
        ?.map((e) => getDevotionWeeklyAIplanFirestoreData(e, true))
        .toList() ??
    [];
