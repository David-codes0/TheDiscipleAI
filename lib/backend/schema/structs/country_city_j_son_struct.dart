// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryCityJSonStruct extends FFFirebaseStruct {
  CountryCityJSonStruct({
    bool? error,
    String? msg,
    List<DataStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _error = error,
        _msg = msg,
        _data = data,
        super(firestoreUtilData);

  // "error" field.
  bool? _error;
  bool get error => _error ?? false;
  set error(bool? val) => _error = val;

  bool hasError() => _error != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static CountryCityJSonStruct fromMap(Map<String, dynamic> data) =>
      CountryCityJSonStruct(
        error: data['error'] as bool?,
        msg: data['msg'] as String?,
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static CountryCityJSonStruct? maybeFromMap(dynamic data) => data is Map
      ? CountryCityJSonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'error': _error,
        'msg': _msg,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'error': serializeParam(
          _error,
          ParamType.bool,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CountryCityJSonStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryCityJSonStruct(
        error: deserializeParam(
          data['error'],
          ParamType.bool,
          false,
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CountryCityJSonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CountryCityJSonStruct &&
        error == other.error &&
        msg == other.msg &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([error, msg, data]);
}

CountryCityJSonStruct createCountryCityJSonStruct({
  bool? error,
  String? msg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryCityJSonStruct(
      error: error,
      msg: msg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryCityJSonStruct? updateCountryCityJSonStruct(
  CountryCityJSonStruct? countryCityJSon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    countryCityJSon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryCityJSonStructData(
  Map<String, dynamic> firestoreData,
  CountryCityJSonStruct? countryCityJSon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (countryCityJSon == null) {
    return;
  }
  if (countryCityJSon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && countryCityJSon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryCityJSonData =
      getCountryCityJSonFirestoreData(countryCityJSon, forFieldValue);
  final nestedData =
      countryCityJSonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = countryCityJSon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryCityJSonFirestoreData(
  CountryCityJSonStruct? countryCityJSon, [
  bool forFieldValue = false,
]) {
  if (countryCityJSon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(countryCityJSon.toMap());

  // Add any Firestore field values
  countryCityJSon.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryCityJSonListFirestoreData(
  List<CountryCityJSonStruct>? countryCityJSons,
) =>
    countryCityJSons
        ?.map((e) => getCountryCityJSonFirestoreData(e, true))
        .toList() ??
    [];
