// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowthTrackerMajorStruct extends FFFirebaseStruct {
  GrowthTrackerMajorStruct({
    int? weekNo,
    List<GrowTrackerStruct>? growtracker,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weekNo = weekNo,
        _growtracker = growtracker,
        super(firestoreUtilData);

  // "weekNo" field.
  int? _weekNo;
  int get weekNo => _weekNo ?? 0;
  set weekNo(int? val) => _weekNo = val;

  void incrementWeekNo(int amount) => weekNo = weekNo + amount;

  bool hasWeekNo() => _weekNo != null;

  // "growtracker" field.
  List<GrowTrackerStruct>? _growtracker;
  List<GrowTrackerStruct> get growtracker => _growtracker ?? const [];
  set growtracker(List<GrowTrackerStruct>? val) => _growtracker = val;

  void updateGrowtracker(Function(List<GrowTrackerStruct>) updateFn) {
    updateFn(_growtracker ??= []);
  }

  bool hasGrowtracker() => _growtracker != null;

  static GrowthTrackerMajorStruct fromMap(Map<String, dynamic> data) =>
      GrowthTrackerMajorStruct(
        weekNo: castToType<int>(data['weekNo']),
        growtracker: getStructList(
          data['growtracker'],
          GrowTrackerStruct.fromMap,
        ),
      );

  static GrowthTrackerMajorStruct? maybeFromMap(dynamic data) => data is Map
      ? GrowthTrackerMajorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weekNo': _weekNo,
        'growtracker': _growtracker?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weekNo': serializeParam(
          _weekNo,
          ParamType.int,
        ),
        'growtracker': serializeParam(
          _growtracker,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GrowthTrackerMajorStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GrowthTrackerMajorStruct(
        weekNo: deserializeParam(
          data['weekNo'],
          ParamType.int,
          false,
        ),
        growtracker: deserializeStructParam<GrowTrackerStruct>(
          data['growtracker'],
          ParamType.DataStruct,
          true,
          structBuilder: GrowTrackerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GrowthTrackerMajorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GrowthTrackerMajorStruct &&
        weekNo == other.weekNo &&
        listEquality.equals(growtracker, other.growtracker);
  }

  @override
  int get hashCode => const ListEquality().hash([weekNo, growtracker]);
}

GrowthTrackerMajorStruct createGrowthTrackerMajorStruct({
  int? weekNo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GrowthTrackerMajorStruct(
      weekNo: weekNo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GrowthTrackerMajorStruct? updateGrowthTrackerMajorStruct(
  GrowthTrackerMajorStruct? growthTrackerMajor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    growthTrackerMajor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGrowthTrackerMajorStructData(
  Map<String, dynamic> firestoreData,
  GrowthTrackerMajorStruct? growthTrackerMajor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (growthTrackerMajor == null) {
    return;
  }
  if (growthTrackerMajor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && growthTrackerMajor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final growthTrackerMajorData =
      getGrowthTrackerMajorFirestoreData(growthTrackerMajor, forFieldValue);
  final nestedData =
      growthTrackerMajorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      growthTrackerMajor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGrowthTrackerMajorFirestoreData(
  GrowthTrackerMajorStruct? growthTrackerMajor, [
  bool forFieldValue = false,
]) {
  if (growthTrackerMajor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(growthTrackerMajor.toMap());

  // Add any Firestore field values
  growthTrackerMajor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGrowthTrackerMajorListFirestoreData(
  List<GrowthTrackerMajorStruct>? growthTrackerMajors,
) =>
    growthTrackerMajors
        ?.map((e) => getGrowthTrackerMajorFirestoreData(e, true))
        .toList() ??
    [];
