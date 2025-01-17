// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    String? name,
    List<StatesStruct>? states,
    String? iso3,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _states = states,
        _iso3 = iso3,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "states" field.
  List<StatesStruct>? _states;
  List<StatesStruct> get states => _states ?? const [];
  set states(List<StatesStruct>? val) => _states = val;

  void updateStates(Function(List<StatesStruct>) updateFn) {
    updateFn(_states ??= []);
  }

  bool hasStates() => _states != null;

  // "iso3" field.
  String? _iso3;
  String get iso3 => _iso3 ?? '';
  set iso3(String? val) => _iso3 = val;

  bool hasIso3() => _iso3 != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        name: data['name'] as String?,
        states: getStructList(
          data['states'],
          StatesStruct.fromMap,
        ),
        iso3: data['iso3'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'states': _states?.map((e) => e.toMap()).toList(),
        'iso3': _iso3,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'states': serializeParam(
          _states,
          ParamType.DataStruct,
          isList: true,
        ),
        'iso3': serializeParam(
          _iso3,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        states: deserializeStructParam<StatesStruct>(
          data['states'],
          ParamType.DataStruct,
          true,
          structBuilder: StatesStruct.fromSerializableMap,
        ),
        iso3: deserializeParam(
          data['iso3'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataStruct &&
        name == other.name &&
        listEquality.equals(states, other.states) &&
        iso3 == other.iso3;
  }

  @override
  int get hashCode => const ListEquality().hash([name, states, iso3]);
}

DataStruct createDataStruct({
  String? name,
  String? iso3,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      name: name,
      iso3: iso3,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Add any Firestore field values
  data.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
