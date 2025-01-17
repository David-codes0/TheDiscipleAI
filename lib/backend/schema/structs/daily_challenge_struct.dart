// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyChallengeStruct extends FFFirebaseStruct {
  DailyChallengeStruct({
    String? prayer,
    String? shareAndPray,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prayer = prayer,
        _shareAndPray = shareAndPray,
        super(firestoreUtilData);

  // "prayer" field.
  String? _prayer;
  String get prayer => _prayer ?? '';
  set prayer(String? val) => _prayer = val;

  bool hasPrayer() => _prayer != null;

  // "shareAndPray" field.
  String? _shareAndPray;
  String get shareAndPray => _shareAndPray ?? '';
  set shareAndPray(String? val) => _shareAndPray = val;

  bool hasShareAndPray() => _shareAndPray != null;

  static DailyChallengeStruct fromMap(Map<String, dynamic> data) =>
      DailyChallengeStruct(
        prayer: data['prayer'] as String?,
        shareAndPray: data['shareAndPray'] as String?,
      );

  static DailyChallengeStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyChallengeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prayer': _prayer,
        'shareAndPray': _shareAndPray,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prayer': serializeParam(
          _prayer,
          ParamType.String,
        ),
        'shareAndPray': serializeParam(
          _shareAndPray,
          ParamType.String,
        ),
      }.withoutNulls;

  static DailyChallengeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyChallengeStruct(
        prayer: deserializeParam(
          data['prayer'],
          ParamType.String,
          false,
        ),
        shareAndPray: deserializeParam(
          data['shareAndPray'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DailyChallengeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyChallengeStruct &&
        prayer == other.prayer &&
        shareAndPray == other.shareAndPray;
  }

  @override
  int get hashCode => const ListEquality().hash([prayer, shareAndPray]);
}

DailyChallengeStruct createDailyChallengeStruct({
  String? prayer,
  String? shareAndPray,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyChallengeStruct(
      prayer: prayer,
      shareAndPray: shareAndPray,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyChallengeStruct? updateDailyChallengeStruct(
  DailyChallengeStruct? dailyChallenge, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyChallenge
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyChallengeStructData(
  Map<String, dynamic> firestoreData,
  DailyChallengeStruct? dailyChallenge,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyChallenge == null) {
    return;
  }
  if (dailyChallenge.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyChallenge.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyChallengeData =
      getDailyChallengeFirestoreData(dailyChallenge, forFieldValue);
  final nestedData =
      dailyChallengeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyChallenge.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyChallengeFirestoreData(
  DailyChallengeStruct? dailyChallenge, [
  bool forFieldValue = false,
]) {
  if (dailyChallenge == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyChallenge.toMap());

  // Add any Firestore field values
  dailyChallenge.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyChallengeListFirestoreData(
  List<DailyChallengeStruct>? dailyChallenges,
) =>
    dailyChallenges
        ?.map((e) => getDailyChallengeFirestoreData(e, true))
        .toList() ??
    [];
