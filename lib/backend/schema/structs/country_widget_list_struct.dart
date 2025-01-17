// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryWidgetListStruct extends FFFirebaseStruct {
  CountryWidgetListStruct({
    String? name,
    String? isocodes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _isocodes = isocodes,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'name';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "isocodes" field.
  String? _isocodes;
  String get isocodes => _isocodes ?? 'code';
  set isocodes(String? val) => _isocodes = val;

  bool hasIsocodes() => _isocodes != null;

  static CountryWidgetListStruct fromMap(Map<String, dynamic> data) =>
      CountryWidgetListStruct(
        name: data['name'] as String?,
        isocodes: data['isocodes'] as String?,
      );

  static CountryWidgetListStruct? maybeFromMap(dynamic data) => data is Map
      ? CountryWidgetListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'isocodes': _isocodes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'isocodes': serializeParam(
          _isocodes,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryWidgetListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CountryWidgetListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isocodes: deserializeParam(
          data['isocodes'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryWidgetListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryWidgetListStruct &&
        name == other.name &&
        isocodes == other.isocodes;
  }

  @override
  int get hashCode => const ListEquality().hash([name, isocodes]);
}

CountryWidgetListStruct createCountryWidgetListStruct({
  String? name,
  String? isocodes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryWidgetListStruct(
      name: name,
      isocodes: isocodes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryWidgetListStruct? updateCountryWidgetListStruct(
  CountryWidgetListStruct? countryWidgetList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    countryWidgetList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryWidgetListStructData(
  Map<String, dynamic> firestoreData,
  CountryWidgetListStruct? countryWidgetList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (countryWidgetList == null) {
    return;
  }
  if (countryWidgetList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && countryWidgetList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryWidgetListData =
      getCountryWidgetListFirestoreData(countryWidgetList, forFieldValue);
  final nestedData =
      countryWidgetListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = countryWidgetList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryWidgetListFirestoreData(
  CountryWidgetListStruct? countryWidgetList, [
  bool forFieldValue = false,
]) {
  if (countryWidgetList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(countryWidgetList.toMap());

  // Add any Firestore field values
  countryWidgetList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryWidgetListListFirestoreData(
  List<CountryWidgetListStruct>? countryWidgetLists,
) =>
    countryWidgetLists
        ?.map((e) => getCountryWidgetListFirestoreData(e, true))
        .toList() ??
    [];
