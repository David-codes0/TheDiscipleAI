// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyPlan11Struct extends FFFirebaseStruct {
  DailyPlan11Struct({
    List<DailyTasksStruct>? dailyTasks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dailyTasks = dailyTasks,
        super(firestoreUtilData);

  // "dailyTasks" field.
  List<DailyTasksStruct>? _dailyTasks;
  List<DailyTasksStruct> get dailyTasks => _dailyTasks ?? const [];
  set dailyTasks(List<DailyTasksStruct>? val) => _dailyTasks = val;

  void updateDailyTasks(Function(List<DailyTasksStruct>) updateFn) {
    updateFn(_dailyTasks ??= []);
  }

  bool hasDailyTasks() => _dailyTasks != null;

  static DailyPlan11Struct fromMap(Map<String, dynamic> data) =>
      DailyPlan11Struct(
        dailyTasks: getStructList(
          data['dailyTasks'],
          DailyTasksStruct.fromMap,
        ),
      );

  static DailyPlan11Struct? maybeFromMap(dynamic data) => data is Map
      ? DailyPlan11Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dailyTasks': _dailyTasks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dailyTasks': serializeParam(
          _dailyTasks,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DailyPlan11Struct fromSerializableMap(Map<String, dynamic> data) =>
      DailyPlan11Struct(
        dailyTasks: deserializeStructParam<DailyTasksStruct>(
          data['dailyTasks'],
          ParamType.DataStruct,
          true,
          structBuilder: DailyTasksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DailyPlan11Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DailyPlan11Struct &&
        listEquality.equals(dailyTasks, other.dailyTasks);
  }

  @override
  int get hashCode => const ListEquality().hash([dailyTasks]);
}

DailyPlan11Struct createDailyPlan11Struct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyPlan11Struct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyPlan11Struct? updateDailyPlan11Struct(
  DailyPlan11Struct? dailyPlan11, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyPlan11
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyPlan11StructData(
  Map<String, dynamic> firestoreData,
  DailyPlan11Struct? dailyPlan11,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyPlan11 == null) {
    return;
  }
  if (dailyPlan11.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyPlan11.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyPlan11Data =
      getDailyPlan11FirestoreData(dailyPlan11, forFieldValue);
  final nestedData =
      dailyPlan11Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyPlan11.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyPlan11FirestoreData(
  DailyPlan11Struct? dailyPlan11, [
  bool forFieldValue = false,
]) {
  if (dailyPlan11 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyPlan11.toMap());

  // Add any Firestore field values
  dailyPlan11.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyPlan11ListFirestoreData(
  List<DailyPlan11Struct>? dailyPlan11s,
) =>
    dailyPlan11s?.map((e) => getDailyPlan11FirestoreData(e, true)).toList() ??
    [];
