// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortSessionParttwoStruct extends FFFirebaseStruct {
  ShortSessionParttwoStruct({
    String? adaptiveAIResponse,
    String? scripture,
    String? prayer,
    String? simpleActionStep,
    String? closingEncouragement,
    String? nextSessionPrompt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _adaptiveAIResponse = adaptiveAIResponse,
        _scripture = scripture,
        _prayer = prayer,
        _simpleActionStep = simpleActionStep,
        _closingEncouragement = closingEncouragement,
        _nextSessionPrompt = nextSessionPrompt,
        super(firestoreUtilData);

  // "adaptiveAIResponse" field.
  String? _adaptiveAIResponse;
  String get adaptiveAIResponse => _adaptiveAIResponse ?? '';
  set adaptiveAIResponse(String? val) => _adaptiveAIResponse = val;

  bool hasAdaptiveAIResponse() => _adaptiveAIResponse != null;

  // "scripture" field.
  String? _scripture;
  String get scripture => _scripture ?? '';
  set scripture(String? val) => _scripture = val;

  bool hasScripture() => _scripture != null;

  // "prayer" field.
  String? _prayer;
  String get prayer => _prayer ?? '';
  set prayer(String? val) => _prayer = val;

  bool hasPrayer() => _prayer != null;

  // "simpleActionStep" field.
  String? _simpleActionStep;
  String get simpleActionStep => _simpleActionStep ?? '';
  set simpleActionStep(String? val) => _simpleActionStep = val;

  bool hasSimpleActionStep() => _simpleActionStep != null;

  // "closingEncouragement" field.
  String? _closingEncouragement;
  String get closingEncouragement => _closingEncouragement ?? '';
  set closingEncouragement(String? val) => _closingEncouragement = val;

  bool hasClosingEncouragement() => _closingEncouragement != null;

  // "nextSessionPrompt" field.
  String? _nextSessionPrompt;
  String get nextSessionPrompt => _nextSessionPrompt ?? '';
  set nextSessionPrompt(String? val) => _nextSessionPrompt = val;

  bool hasNextSessionPrompt() => _nextSessionPrompt != null;

  static ShortSessionParttwoStruct fromMap(Map<String, dynamic> data) =>
      ShortSessionParttwoStruct(
        adaptiveAIResponse: data['adaptiveAIResponse'] as String?,
        scripture: data['scripture'] as String?,
        prayer: data['prayer'] as String?,
        simpleActionStep: data['simpleActionStep'] as String?,
        closingEncouragement: data['closingEncouragement'] as String?,
        nextSessionPrompt: data['nextSessionPrompt'] as String?,
      );

  static ShortSessionParttwoStruct? maybeFromMap(dynamic data) => data is Map
      ? ShortSessionParttwoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'adaptiveAIResponse': _adaptiveAIResponse,
        'scripture': _scripture,
        'prayer': _prayer,
        'simpleActionStep': _simpleActionStep,
        'closingEncouragement': _closingEncouragement,
        'nextSessionPrompt': _nextSessionPrompt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'adaptiveAIResponse': serializeParam(
          _adaptiveAIResponse,
          ParamType.String,
        ),
        'scripture': serializeParam(
          _scripture,
          ParamType.String,
        ),
        'prayer': serializeParam(
          _prayer,
          ParamType.String,
        ),
        'simpleActionStep': serializeParam(
          _simpleActionStep,
          ParamType.String,
        ),
        'closingEncouragement': serializeParam(
          _closingEncouragement,
          ParamType.String,
        ),
        'nextSessionPrompt': serializeParam(
          _nextSessionPrompt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShortSessionParttwoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShortSessionParttwoStruct(
        adaptiveAIResponse: deserializeParam(
          data['adaptiveAIResponse'],
          ParamType.String,
          false,
        ),
        scripture: deserializeParam(
          data['scripture'],
          ParamType.String,
          false,
        ),
        prayer: deserializeParam(
          data['prayer'],
          ParamType.String,
          false,
        ),
        simpleActionStep: deserializeParam(
          data['simpleActionStep'],
          ParamType.String,
          false,
        ),
        closingEncouragement: deserializeParam(
          data['closingEncouragement'],
          ParamType.String,
          false,
        ),
        nextSessionPrompt: deserializeParam(
          data['nextSessionPrompt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShortSessionParttwoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShortSessionParttwoStruct &&
        adaptiveAIResponse == other.adaptiveAIResponse &&
        scripture == other.scripture &&
        prayer == other.prayer &&
        simpleActionStep == other.simpleActionStep &&
        closingEncouragement == other.closingEncouragement &&
        nextSessionPrompt == other.nextSessionPrompt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        adaptiveAIResponse,
        scripture,
        prayer,
        simpleActionStep,
        closingEncouragement,
        nextSessionPrompt
      ]);
}

ShortSessionParttwoStruct createShortSessionParttwoStruct({
  String? adaptiveAIResponse,
  String? scripture,
  String? prayer,
  String? simpleActionStep,
  String? closingEncouragement,
  String? nextSessionPrompt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShortSessionParttwoStruct(
      adaptiveAIResponse: adaptiveAIResponse,
      scripture: scripture,
      prayer: prayer,
      simpleActionStep: simpleActionStep,
      closingEncouragement: closingEncouragement,
      nextSessionPrompt: nextSessionPrompt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShortSessionParttwoStruct? updateShortSessionParttwoStruct(
  ShortSessionParttwoStruct? shortSessionParttwo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shortSessionParttwo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShortSessionParttwoStructData(
  Map<String, dynamic> firestoreData,
  ShortSessionParttwoStruct? shortSessionParttwo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shortSessionParttwo == null) {
    return;
  }
  if (shortSessionParttwo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shortSessionParttwo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shortSessionParttwoData =
      getShortSessionParttwoFirestoreData(shortSessionParttwo, forFieldValue);
  final nestedData =
      shortSessionParttwoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      shortSessionParttwo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShortSessionParttwoFirestoreData(
  ShortSessionParttwoStruct? shortSessionParttwo, [
  bool forFieldValue = false,
]) {
  if (shortSessionParttwo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shortSessionParttwo.toMap());

  // Add any Firestore field values
  shortSessionParttwo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShortSessionParttwoListFirestoreData(
  List<ShortSessionParttwoStruct>? shortSessionParttwos,
) =>
    shortSessionParttwos
        ?.map((e) => getShortSessionParttwoFirestoreData(e, true))
        .toList() ??
    [];
