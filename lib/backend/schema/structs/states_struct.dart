// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatesStruct extends FFFirebaseStruct {
  StatesStruct({
    String? name,
    String? stateCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _stateCode = stateCode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "state_code" field.
  String? _stateCode;
  String get stateCode => _stateCode ?? '';
  set stateCode(String? val) => _stateCode = val;

  bool hasStateCode() => _stateCode != null;

  static StatesStruct fromMap(Map<String, dynamic> data) => StatesStruct(
        name: data['name'] as String?,
        stateCode: data['state_code'] as String?,
      );

  static StatesStruct? maybeFromMap(dynamic data) =>
      data is Map ? StatesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'state_code': _stateCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'state_code': serializeParam(
          _stateCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        stateCode: deserializeParam(
          data['state_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatesStruct &&
        name == other.name &&
        stateCode == other.stateCode;
  }

  @override
  int get hashCode => const ListEquality().hash([name, stateCode]);
}

StatesStruct createStatesStruct({
  String? name,
  String? stateCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatesStruct(
      name: name,
      stateCode: stateCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatesStruct? updateStatesStruct(
  StatesStruct? states, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    states
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatesStructData(
  Map<String, dynamic> firestoreData,
  StatesStruct? states,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (states == null) {
    return;
  }
  if (states.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && states.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statesData = getStatesFirestoreData(states, forFieldValue);
  final nestedData = statesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = states.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatesFirestoreData(
  StatesStruct? states, [
  bool forFieldValue = false,
]) {
  if (states == null) {
    return {};
  }
  final firestoreData = mapToFirestore(states.toMap());

  // Add any Firestore field values
  states.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatesListFirestoreData(
  List<StatesStruct>? statess,
) =>
    statess?.map((e) => getStatesFirestoreData(e, true)).toList() ?? [];
