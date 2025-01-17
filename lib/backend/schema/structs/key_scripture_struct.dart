// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyScriptureStruct extends FFFirebaseStruct {
  KeyScriptureStruct({
    String? passage,
    String? commentary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _passage = passage,
        _commentary = commentary,
        super(firestoreUtilData);

  // "passage" field.
  String? _passage;
  String get passage => _passage ?? '';
  set passage(String? val) => _passage = val;

  bool hasPassage() => _passage != null;

  // "commentary" field.
  String? _commentary;
  String get commentary => _commentary ?? '';
  set commentary(String? val) => _commentary = val;

  bool hasCommentary() => _commentary != null;

  static KeyScriptureStruct fromMap(Map<String, dynamic> data) =>
      KeyScriptureStruct(
        passage: data['passage'] as String?,
        commentary: data['commentary'] as String?,
      );

  static KeyScriptureStruct? maybeFromMap(dynamic data) => data is Map
      ? KeyScriptureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'passage': _passage,
        'commentary': _commentary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'passage': serializeParam(
          _passage,
          ParamType.String,
        ),
        'commentary': serializeParam(
          _commentary,
          ParamType.String,
        ),
      }.withoutNulls;

  static KeyScriptureStruct fromSerializableMap(Map<String, dynamic> data) =>
      KeyScriptureStruct(
        passage: deserializeParam(
          data['passage'],
          ParamType.String,
          false,
        ),
        commentary: deserializeParam(
          data['commentary'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'KeyScriptureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KeyScriptureStruct &&
        passage == other.passage &&
        commentary == other.commentary;
  }

  @override
  int get hashCode => const ListEquality().hash([passage, commentary]);
}

KeyScriptureStruct createKeyScriptureStruct({
  String? passage,
  String? commentary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KeyScriptureStruct(
      passage: passage,
      commentary: commentary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

KeyScriptureStruct? updateKeyScriptureStruct(
  KeyScriptureStruct? keyScripture, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    keyScripture
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addKeyScriptureStructData(
  Map<String, dynamic> firestoreData,
  KeyScriptureStruct? keyScripture,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (keyScripture == null) {
    return;
  }
  if (keyScripture.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && keyScripture.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final keyScriptureData =
      getKeyScriptureFirestoreData(keyScripture, forFieldValue);
  final nestedData =
      keyScriptureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = keyScripture.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getKeyScriptureFirestoreData(
  KeyScriptureStruct? keyScripture, [
  bool forFieldValue = false,
]) {
  if (keyScripture == null) {
    return {};
  }
  final firestoreData = mapToFirestore(keyScripture.toMap());

  // Add any Firestore field values
  keyScripture.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getKeyScriptureListFirestoreData(
  List<KeyScriptureStruct>? keyScriptures,
) =>
    keyScriptures?.map((e) => getKeyScriptureFirestoreData(e, true)).toList() ??
    [];
