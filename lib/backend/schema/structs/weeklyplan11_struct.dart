// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Weeklyplan11Struct extends FFFirebaseStruct {
  Weeklyplan11Struct({
    WeeklyPlanStruct? weeklyPlan,
    WeeklyReviewStruct? weeklyReview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weeklyPlan = weeklyPlan,
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

  // "weeklyReview" field.
  WeeklyReviewStruct? _weeklyReview;
  WeeklyReviewStruct get weeklyReview => _weeklyReview ?? WeeklyReviewStruct();
  set weeklyReview(WeeklyReviewStruct? val) => _weeklyReview = val;

  void updateWeeklyReview(Function(WeeklyReviewStruct) updateFn) {
    updateFn(_weeklyReview ??= WeeklyReviewStruct());
  }

  bool hasWeeklyReview() => _weeklyReview != null;

  static Weeklyplan11Struct fromMap(Map<String, dynamic> data) =>
      Weeklyplan11Struct(
        weeklyPlan: data['weeklyPlan'] is WeeklyPlanStruct
            ? data['weeklyPlan']
            : WeeklyPlanStruct.maybeFromMap(data['weeklyPlan']),
        weeklyReview: data['weeklyReview'] is WeeklyReviewStruct
            ? data['weeklyReview']
            : WeeklyReviewStruct.maybeFromMap(data['weeklyReview']),
      );

  static Weeklyplan11Struct? maybeFromMap(dynamic data) => data is Map
      ? Weeklyplan11Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weeklyPlan': _weeklyPlan?.toMap(),
        'weeklyReview': _weeklyReview?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weeklyPlan': serializeParam(
          _weeklyPlan,
          ParamType.DataStruct,
        ),
        'weeklyReview': serializeParam(
          _weeklyReview,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static Weeklyplan11Struct fromSerializableMap(Map<String, dynamic> data) =>
      Weeklyplan11Struct(
        weeklyPlan: deserializeStructParam(
          data['weeklyPlan'],
          ParamType.DataStruct,
          false,
          structBuilder: WeeklyPlanStruct.fromSerializableMap,
        ),
        weeklyReview: deserializeStructParam(
          data['weeklyReview'],
          ParamType.DataStruct,
          false,
          structBuilder: WeeklyReviewStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'Weeklyplan11Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Weeklyplan11Struct &&
        weeklyPlan == other.weeklyPlan &&
        weeklyReview == other.weeklyReview;
  }

  @override
  int get hashCode => const ListEquality().hash([weeklyPlan, weeklyReview]);
}

Weeklyplan11Struct createWeeklyplan11Struct({
  WeeklyPlanStruct? weeklyPlan,
  WeeklyReviewStruct? weeklyReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Weeklyplan11Struct(
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

Weeklyplan11Struct? updateWeeklyplan11Struct(
  Weeklyplan11Struct? weeklyplan11, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyplan11
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyplan11StructData(
  Map<String, dynamic> firestoreData,
  Weeklyplan11Struct? weeklyplan11,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyplan11 == null) {
    return;
  }
  if (weeklyplan11.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyplan11.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyplan11Data =
      getWeeklyplan11FirestoreData(weeklyplan11, forFieldValue);
  final nestedData =
      weeklyplan11Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyplan11.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyplan11FirestoreData(
  Weeklyplan11Struct? weeklyplan11, [
  bool forFieldValue = false,
]) {
  if (weeklyplan11 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyplan11.toMap());

  // Handle nested data for "weeklyPlan" field.
  addWeeklyPlanStructData(
    firestoreData,
    weeklyplan11.hasWeeklyPlan() ? weeklyplan11.weeklyPlan : null,
    'weeklyPlan',
    forFieldValue,
  );

  // Handle nested data for "weeklyReview" field.
  addWeeklyReviewStructData(
    firestoreData,
    weeklyplan11.hasWeeklyReview() ? weeklyplan11.weeklyReview : null,
    'weeklyReview',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyplan11.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyplan11ListFirestoreData(
  List<Weeklyplan11Struct>? weeklyplan11s,
) =>
    weeklyplan11s?.map((e) => getWeeklyplan11FirestoreData(e, true)).toList() ??
    [];
