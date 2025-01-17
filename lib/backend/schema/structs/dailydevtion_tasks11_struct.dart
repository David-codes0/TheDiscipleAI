// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailydevtionTasks11Struct extends FFFirebaseStruct {
  DailydevtionTasks11Struct({
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

  static DailydevtionTasks11Struct fromMap(Map<String, dynamic> data) =>
      DailydevtionTasks11Struct(
        dailyTasks: getStructList(
          data['dailyTasks'],
          DailyTasksStruct.fromMap,
        ),
      );

  static DailydevtionTasks11Struct? maybeFromMap(dynamic data) => data is Map
      ? DailydevtionTasks11Struct.fromMap(data.cast<String, dynamic>())
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

  static DailydevtionTasks11Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailydevtionTasks11Struct(
        dailyTasks: deserializeStructParam<DailyTasksStruct>(
          data['dailyTasks'],
          ParamType.DataStruct,
          true,
          structBuilder: DailyTasksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DailydevtionTasks11Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DailydevtionTasks11Struct &&
        listEquality.equals(dailyTasks, other.dailyTasks);
  }

  @override
  int get hashCode => const ListEquality().hash([dailyTasks]);
}

DailydevtionTasks11Struct createDailydevtionTasks11Struct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailydevtionTasks11Struct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailydevtionTasks11Struct? updateDailydevtionTasks11Struct(
  DailydevtionTasks11Struct? dailydevtionTasks11, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailydevtionTasks11
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailydevtionTasks11StructData(
  Map<String, dynamic> firestoreData,
  DailydevtionTasks11Struct? dailydevtionTasks11,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailydevtionTasks11 == null) {
    return;
  }
  if (dailydevtionTasks11.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailydevtionTasks11.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailydevtionTasks11Data =
      getDailydevtionTasks11FirestoreData(dailydevtionTasks11, forFieldValue);
  final nestedData =
      dailydevtionTasks11Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dailydevtionTasks11.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailydevtionTasks11FirestoreData(
  DailydevtionTasks11Struct? dailydevtionTasks11, [
  bool forFieldValue = false,
]) {
  if (dailydevtionTasks11 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailydevtionTasks11.toMap());

  // Add any Firestore field values
  dailydevtionTasks11.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailydevtionTasks11ListFirestoreData(
  List<DailydevtionTasks11Struct>? dailydevtionTasks11s,
) =>
    dailydevtionTasks11s
        ?.map((e) => getDailydevtionTasks11FirestoreData(e, true))
        .toList() ??
    [];
