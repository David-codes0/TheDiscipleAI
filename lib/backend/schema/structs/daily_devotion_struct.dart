// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyDevotionStruct extends FFFirebaseStruct {
  DailyDevotionStruct({
    String? devotionBibleVerse,
    String? devotionExposition,
    String? devotionReflection,
    String? devotionTitle,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _devotionBibleVerse = devotionBibleVerse,
        _devotionExposition = devotionExposition,
        _devotionReflection = devotionReflection,
        _devotionTitle = devotionTitle,
        super(firestoreUtilData);

  // "devotionBibleVerse" field.
  String? _devotionBibleVerse;
  String get devotionBibleVerse => _devotionBibleVerse ?? '';
  set devotionBibleVerse(String? val) => _devotionBibleVerse = val;

  bool hasDevotionBibleVerse() => _devotionBibleVerse != null;

  // "devotionExposition" field.
  String? _devotionExposition;
  String get devotionExposition => _devotionExposition ?? '';
  set devotionExposition(String? val) => _devotionExposition = val;

  bool hasDevotionExposition() => _devotionExposition != null;

  // "devotionReflection" field.
  String? _devotionReflection;
  String get devotionReflection => _devotionReflection ?? '';
  set devotionReflection(String? val) => _devotionReflection = val;

  bool hasDevotionReflection() => _devotionReflection != null;

  // "devotionTitle" field.
  String? _devotionTitle;
  String get devotionTitle => _devotionTitle ?? '';
  set devotionTitle(String? val) => _devotionTitle = val;

  bool hasDevotionTitle() => _devotionTitle != null;

  static DailyDevotionStruct fromMap(Map<String, dynamic> data) =>
      DailyDevotionStruct(
        devotionBibleVerse: data['devotionBibleVerse'] as String?,
        devotionExposition: data['devotionExposition'] as String?,
        devotionReflection: data['devotionReflection'] as String?,
        devotionTitle: data['devotionTitle'] as String?,
      );

  static DailyDevotionStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyDevotionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'devotionBibleVerse': _devotionBibleVerse,
        'devotionExposition': _devotionExposition,
        'devotionReflection': _devotionReflection,
        'devotionTitle': _devotionTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'devotionBibleVerse': serializeParam(
          _devotionBibleVerse,
          ParamType.String,
        ),
        'devotionExposition': serializeParam(
          _devotionExposition,
          ParamType.String,
        ),
        'devotionReflection': serializeParam(
          _devotionReflection,
          ParamType.String,
        ),
        'devotionTitle': serializeParam(
          _devotionTitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static DailyDevotionStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyDevotionStruct(
        devotionBibleVerse: deserializeParam(
          data['devotionBibleVerse'],
          ParamType.String,
          false,
        ),
        devotionExposition: deserializeParam(
          data['devotionExposition'],
          ParamType.String,
          false,
        ),
        devotionReflection: deserializeParam(
          data['devotionReflection'],
          ParamType.String,
          false,
        ),
        devotionTitle: deserializeParam(
          data['devotionTitle'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DailyDevotionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyDevotionStruct &&
        devotionBibleVerse == other.devotionBibleVerse &&
        devotionExposition == other.devotionExposition &&
        devotionReflection == other.devotionReflection &&
        devotionTitle == other.devotionTitle;
  }

  @override
  int get hashCode => const ListEquality().hash([
        devotionBibleVerse,
        devotionExposition,
        devotionReflection,
        devotionTitle
      ]);
}

DailyDevotionStruct createDailyDevotionStruct({
  String? devotionBibleVerse,
  String? devotionExposition,
  String? devotionReflection,
  String? devotionTitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyDevotionStruct(
      devotionBibleVerse: devotionBibleVerse,
      devotionExposition: devotionExposition,
      devotionReflection: devotionReflection,
      devotionTitle: devotionTitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyDevotionStruct? updateDailyDevotionStruct(
  DailyDevotionStruct? dailyDevotion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyDevotion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyDevotionStructData(
  Map<String, dynamic> firestoreData,
  DailyDevotionStruct? dailyDevotion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyDevotion == null) {
    return;
  }
  if (dailyDevotion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyDevotion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyDevotionData =
      getDailyDevotionFirestoreData(dailyDevotion, forFieldValue);
  final nestedData =
      dailyDevotionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyDevotion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyDevotionFirestoreData(
  DailyDevotionStruct? dailyDevotion, [
  bool forFieldValue = false,
]) {
  if (dailyDevotion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyDevotion.toMap());

  // Add any Firestore field values
  dailyDevotion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyDevotionListFirestoreData(
  List<DailyDevotionStruct>? dailyDevotions,
) =>
    dailyDevotions
        ?.map((e) => getDailyDevotionFirestoreData(e, true))
        .toList() ??
    [];
