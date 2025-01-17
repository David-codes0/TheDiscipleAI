// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeepSessionStruct extends FFFirebaseStruct {
  DeepSessionStruct({
    String? welcomeOpeningPrayerorThought,
    String? inDepthScriptureOrPassage,
    String? guidedPrayer,
    String? deeperActionStep,
    String? closingEncouragementandBlessin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _welcomeOpeningPrayerorThought = welcomeOpeningPrayerorThought,
        _inDepthScriptureOrPassage = inDepthScriptureOrPassage,
        _guidedPrayer = guidedPrayer,
        _deeperActionStep = deeperActionStep,
        _closingEncouragementandBlessin = closingEncouragementandBlessin,
        super(firestoreUtilData);

  // "welcomeOpeningPrayerorThought" field.
  String? _welcomeOpeningPrayerorThought;
  String get welcomeOpeningPrayerorThought =>
      _welcomeOpeningPrayerorThought ?? '';
  set welcomeOpeningPrayerorThought(String? val) =>
      _welcomeOpeningPrayerorThought = val;

  bool hasWelcomeOpeningPrayerorThought() =>
      _welcomeOpeningPrayerorThought != null;

  // "inDepthScriptureOrPassage" field.
  String? _inDepthScriptureOrPassage;
  String get inDepthScriptureOrPassage => _inDepthScriptureOrPassage ?? '';
  set inDepthScriptureOrPassage(String? val) =>
      _inDepthScriptureOrPassage = val;

  bool hasInDepthScriptureOrPassage() => _inDepthScriptureOrPassage != null;

  // "guidedPrayer" field.
  String? _guidedPrayer;
  String get guidedPrayer => _guidedPrayer ?? '';
  set guidedPrayer(String? val) => _guidedPrayer = val;

  bool hasGuidedPrayer() => _guidedPrayer != null;

  // "deeperActionStep" field.
  String? _deeperActionStep;
  String get deeperActionStep => _deeperActionStep ?? '';
  set deeperActionStep(String? val) => _deeperActionStep = val;

  bool hasDeeperActionStep() => _deeperActionStep != null;

  // "closingEncouragementandBlessin" field.
  String? _closingEncouragementandBlessin;
  String get closingEncouragementandBlessin =>
      _closingEncouragementandBlessin ?? '';
  set closingEncouragementandBlessin(String? val) =>
      _closingEncouragementandBlessin = val;

  bool hasClosingEncouragementandBlessin() =>
      _closingEncouragementandBlessin != null;

  static DeepSessionStruct fromMap(Map<String, dynamic> data) =>
      DeepSessionStruct(
        welcomeOpeningPrayerorThought:
            data['welcomeOpeningPrayerorThought'] as String?,
        inDepthScriptureOrPassage: data['inDepthScriptureOrPassage'] as String?,
        guidedPrayer: data['guidedPrayer'] as String?,
        deeperActionStep: data['deeperActionStep'] as String?,
        closingEncouragementandBlessin:
            data['closingEncouragementandBlessin'] as String?,
      );

  static DeepSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? DeepSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'welcomeOpeningPrayerorThought': _welcomeOpeningPrayerorThought,
        'inDepthScriptureOrPassage': _inDepthScriptureOrPassage,
        'guidedPrayer': _guidedPrayer,
        'deeperActionStep': _deeperActionStep,
        'closingEncouragementandBlessin': _closingEncouragementandBlessin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'welcomeOpeningPrayerorThought': serializeParam(
          _welcomeOpeningPrayerorThought,
          ParamType.String,
        ),
        'inDepthScriptureOrPassage': serializeParam(
          _inDepthScriptureOrPassage,
          ParamType.String,
        ),
        'guidedPrayer': serializeParam(
          _guidedPrayer,
          ParamType.String,
        ),
        'deeperActionStep': serializeParam(
          _deeperActionStep,
          ParamType.String,
        ),
        'closingEncouragementandBlessin': serializeParam(
          _closingEncouragementandBlessin,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeepSessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeepSessionStruct(
        welcomeOpeningPrayerorThought: deserializeParam(
          data['welcomeOpeningPrayerorThought'],
          ParamType.String,
          false,
        ),
        inDepthScriptureOrPassage: deserializeParam(
          data['inDepthScriptureOrPassage'],
          ParamType.String,
          false,
        ),
        guidedPrayer: deserializeParam(
          data['guidedPrayer'],
          ParamType.String,
          false,
        ),
        deeperActionStep: deserializeParam(
          data['deeperActionStep'],
          ParamType.String,
          false,
        ),
        closingEncouragementandBlessin: deserializeParam(
          data['closingEncouragementandBlessin'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeepSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeepSessionStruct &&
        welcomeOpeningPrayerorThought == other.welcomeOpeningPrayerorThought &&
        inDepthScriptureOrPassage == other.inDepthScriptureOrPassage &&
        guidedPrayer == other.guidedPrayer &&
        deeperActionStep == other.deeperActionStep &&
        closingEncouragementandBlessin == other.closingEncouragementandBlessin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        welcomeOpeningPrayerorThought,
        inDepthScriptureOrPassage,
        guidedPrayer,
        deeperActionStep,
        closingEncouragementandBlessin
      ]);
}

DeepSessionStruct createDeepSessionStruct({
  String? welcomeOpeningPrayerorThought,
  String? inDepthScriptureOrPassage,
  String? guidedPrayer,
  String? deeperActionStep,
  String? closingEncouragementandBlessin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeepSessionStruct(
      welcomeOpeningPrayerorThought: welcomeOpeningPrayerorThought,
      inDepthScriptureOrPassage: inDepthScriptureOrPassage,
      guidedPrayer: guidedPrayer,
      deeperActionStep: deeperActionStep,
      closingEncouragementandBlessin: closingEncouragementandBlessin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeepSessionStruct? updateDeepSessionStruct(
  DeepSessionStruct? deepSession, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deepSession
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeepSessionStructData(
  Map<String, dynamic> firestoreData,
  DeepSessionStruct? deepSession,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deepSession == null) {
    return;
  }
  if (deepSession.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deepSession.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deepSessionData =
      getDeepSessionFirestoreData(deepSession, forFieldValue);
  final nestedData =
      deepSessionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deepSession.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeepSessionFirestoreData(
  DeepSessionStruct? deepSession, [
  bool forFieldValue = false,
]) {
  if (deepSession == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deepSession.toMap());

  // Add any Firestore field values
  deepSession.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeepSessionListFirestoreData(
  List<DeepSessionStruct>? deepSessions,
) =>
    deepSessions?.map((e) => getDeepSessionFirestoreData(e, true)).toList() ??
    [];
