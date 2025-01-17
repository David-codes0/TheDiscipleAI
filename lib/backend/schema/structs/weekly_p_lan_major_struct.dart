// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyPLanMajorStruct extends FFFirebaseStruct {
  WeeklyPLanMajorStruct({
    int? weekNo,
    DevotionWeeklyAIplanStruct? plan,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weekNo = weekNo,
        _plan = plan,
        super(firestoreUtilData);

  // "weekNo" field.
  int? _weekNo;
  int get weekNo => _weekNo ?? 0;
  set weekNo(int? val) => _weekNo = val;

  void incrementWeekNo(int amount) => weekNo = weekNo + amount;

  bool hasWeekNo() => _weekNo != null;

  // "plan" field.
  DevotionWeeklyAIplanStruct? _plan;
  DevotionWeeklyAIplanStruct get plan => _plan ?? DevotionWeeklyAIplanStruct();
  set plan(DevotionWeeklyAIplanStruct? val) => _plan = val;

  void updatePlan(Function(DevotionWeeklyAIplanStruct) updateFn) {
    updateFn(_plan ??= DevotionWeeklyAIplanStruct());
  }

  bool hasPlan() => _plan != null;

  static WeeklyPLanMajorStruct fromMap(Map<String, dynamic> data) =>
      WeeklyPLanMajorStruct(
        weekNo: castToType<int>(data['weekNo']),
        plan: data['plan'] is DevotionWeeklyAIplanStruct
            ? data['plan']
            : DevotionWeeklyAIplanStruct.maybeFromMap(data['plan']),
      );

  static WeeklyPLanMajorStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyPLanMajorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weekNo': _weekNo,
        'plan': _plan?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weekNo': serializeParam(
          _weekNo,
          ParamType.int,
        ),
        'plan': serializeParam(
          _plan,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WeeklyPLanMajorStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyPLanMajorStruct(
        weekNo: deserializeParam(
          data['weekNo'],
          ParamType.int,
          false,
        ),
        plan: deserializeStructParam(
          data['plan'],
          ParamType.DataStruct,
          false,
          structBuilder: DevotionWeeklyAIplanStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WeeklyPLanMajorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeeklyPLanMajorStruct &&
        weekNo == other.weekNo &&
        plan == other.plan;
  }

  @override
  int get hashCode => const ListEquality().hash([weekNo, plan]);
}

WeeklyPLanMajorStruct createWeeklyPLanMajorStruct({
  int? weekNo,
  DevotionWeeklyAIplanStruct? plan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyPLanMajorStruct(
      weekNo: weekNo,
      plan: plan ?? (clearUnsetFields ? DevotionWeeklyAIplanStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyPLanMajorStruct? updateWeeklyPLanMajorStruct(
  WeeklyPLanMajorStruct? weeklyPLanMajor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyPLanMajor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyPLanMajorStructData(
  Map<String, dynamic> firestoreData,
  WeeklyPLanMajorStruct? weeklyPLanMajor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyPLanMajor == null) {
    return;
  }
  if (weeklyPLanMajor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyPLanMajor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyPLanMajorData =
      getWeeklyPLanMajorFirestoreData(weeklyPLanMajor, forFieldValue);
  final nestedData =
      weeklyPLanMajorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyPLanMajor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyPLanMajorFirestoreData(
  WeeklyPLanMajorStruct? weeklyPLanMajor, [
  bool forFieldValue = false,
]) {
  if (weeklyPLanMajor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyPLanMajor.toMap());

  // Handle nested data for "plan" field.
  addDevotionWeeklyAIplanStructData(
    firestoreData,
    weeklyPLanMajor.hasPlan() ? weeklyPLanMajor.plan : null,
    'plan',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyPLanMajor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyPLanMajorListFirestoreData(
  List<WeeklyPLanMajorStruct>? weeklyPLanMajors,
) =>
    weeklyPLanMajors
        ?.map((e) => getWeeklyPLanMajorFirestoreData(e, true))
        .toList() ??
    [];
