// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyReviewStruct extends FFFirebaseStruct {
  WeeklyReviewStruct({
    String? weeklyReflection,
    List<String>? questions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weeklyReflection = weeklyReflection,
        _questions = questions,
        super(firestoreUtilData);

  // "weeklyReflection" field.
  String? _weeklyReflection;
  String get weeklyReflection => _weeklyReflection ?? '';
  set weeklyReflection(String? val) => _weeklyReflection = val;

  bool hasWeeklyReflection() => _weeklyReflection != null;

  // "questions" field.
  List<String>? _questions;
  List<String> get questions => _questions ?? const [];
  set questions(List<String>? val) => _questions = val;

  void updateQuestions(Function(List<String>) updateFn) {
    updateFn(_questions ??= []);
  }

  bool hasQuestions() => _questions != null;

  static WeeklyReviewStruct fromMap(Map<String, dynamic> data) =>
      WeeklyReviewStruct(
        weeklyReflection: data['weeklyReflection'] as String?,
        questions: getDataList(data['questions']),
      );

  static WeeklyReviewStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyReviewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weeklyReflection': _weeklyReflection,
        'questions': _questions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weeklyReflection': serializeParam(
          _weeklyReflection,
          ParamType.String,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static WeeklyReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyReviewStruct(
        weeklyReflection: deserializeParam(
          data['weeklyReflection'],
          ParamType.String,
          false,
        ),
        questions: deserializeParam<String>(
          data['questions'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'WeeklyReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeklyReviewStruct &&
        weeklyReflection == other.weeklyReflection &&
        listEquality.equals(questions, other.questions);
  }

  @override
  int get hashCode => const ListEquality().hash([weeklyReflection, questions]);
}

WeeklyReviewStruct createWeeklyReviewStruct({
  String? weeklyReflection,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyReviewStruct(
      weeklyReflection: weeklyReflection,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyReviewStruct? updateWeeklyReviewStruct(
  WeeklyReviewStruct? weeklyReview, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyReview
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyReviewStructData(
  Map<String, dynamic> firestoreData,
  WeeklyReviewStruct? weeklyReview,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyReview == null) {
    return;
  }
  if (weeklyReview.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyReview.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyReviewData =
      getWeeklyReviewFirestoreData(weeklyReview, forFieldValue);
  final nestedData =
      weeklyReviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyReview.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyReviewFirestoreData(
  WeeklyReviewStruct? weeklyReview, [
  bool forFieldValue = false,
]) {
  if (weeklyReview == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyReview.toMap());

  // Add any Firestore field values
  weeklyReview.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyReviewListFirestoreData(
  List<WeeklyReviewStruct>? weeklyReviews,
) =>
    weeklyReviews?.map((e) => getWeeklyReviewFirestoreData(e, true)).toList() ??
    [];
