// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyTasksStruct extends FFFirebaseStruct {
  DailyTasksStruct({
    int? day,
    MorningRoutineStruct? morningRoutine,
    String? dailyTask,
    DailyChallengeStruct? dailyChallenge,
    EveningReflectionStruct? eveningReflection,
    String? meditationExercise,
    String? verseOfTheDay,
    DailyDevotionStruct? dailyDevotion,
    DailyChristianQuoteStruct? dailyChristianQuote,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _morningRoutine = morningRoutine,
        _dailyTask = dailyTask,
        _dailyChallenge = dailyChallenge,
        _eveningReflection = eveningReflection,
        _meditationExercise = meditationExercise,
        _verseOfTheDay = verseOfTheDay,
        _dailyDevotion = dailyDevotion,
        _dailyChristianQuote = dailyChristianQuote,
        super(firestoreUtilData);

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;

  void incrementDay(int amount) => day = day + amount;

  bool hasDay() => _day != null;

  // "morningRoutine" field.
  MorningRoutineStruct? _morningRoutine;
  MorningRoutineStruct get morningRoutine =>
      _morningRoutine ?? MorningRoutineStruct();
  set morningRoutine(MorningRoutineStruct? val) => _morningRoutine = val;

  void updateMorningRoutine(Function(MorningRoutineStruct) updateFn) {
    updateFn(_morningRoutine ??= MorningRoutineStruct());
  }

  bool hasMorningRoutine() => _morningRoutine != null;

  // "dailyTask" field.
  String? _dailyTask;
  String get dailyTask => _dailyTask ?? '';
  set dailyTask(String? val) => _dailyTask = val;

  bool hasDailyTask() => _dailyTask != null;

  // "dailyChallenge" field.
  DailyChallengeStruct? _dailyChallenge;
  DailyChallengeStruct get dailyChallenge =>
      _dailyChallenge ?? DailyChallengeStruct();
  set dailyChallenge(DailyChallengeStruct? val) => _dailyChallenge = val;

  void updateDailyChallenge(Function(DailyChallengeStruct) updateFn) {
    updateFn(_dailyChallenge ??= DailyChallengeStruct());
  }

  bool hasDailyChallenge() => _dailyChallenge != null;

  // "eveningReflection" field.
  EveningReflectionStruct? _eveningReflection;
  EveningReflectionStruct get eveningReflection =>
      _eveningReflection ?? EveningReflectionStruct();
  set eveningReflection(EveningReflectionStruct? val) =>
      _eveningReflection = val;

  void updateEveningReflection(Function(EveningReflectionStruct) updateFn) {
    updateFn(_eveningReflection ??= EveningReflectionStruct());
  }

  bool hasEveningReflection() => _eveningReflection != null;

  // "meditationExercise" field.
  String? _meditationExercise;
  String get meditationExercise => _meditationExercise ?? '';
  set meditationExercise(String? val) => _meditationExercise = val;

  bool hasMeditationExercise() => _meditationExercise != null;

  // "verseOfTheDay" field.
  String? _verseOfTheDay;
  String get verseOfTheDay => _verseOfTheDay ?? '';
  set verseOfTheDay(String? val) => _verseOfTheDay = val;

  bool hasVerseOfTheDay() => _verseOfTheDay != null;

  // "dailyDevotion" field.
  DailyDevotionStruct? _dailyDevotion;
  DailyDevotionStruct get dailyDevotion =>
      _dailyDevotion ?? DailyDevotionStruct();
  set dailyDevotion(DailyDevotionStruct? val) => _dailyDevotion = val;

  void updateDailyDevotion(Function(DailyDevotionStruct) updateFn) {
    updateFn(_dailyDevotion ??= DailyDevotionStruct());
  }

  bool hasDailyDevotion() => _dailyDevotion != null;

  // "dailyChristianQuote" field.
  DailyChristianQuoteStruct? _dailyChristianQuote;
  DailyChristianQuoteStruct get dailyChristianQuote =>
      _dailyChristianQuote ?? DailyChristianQuoteStruct();
  set dailyChristianQuote(DailyChristianQuoteStruct? val) =>
      _dailyChristianQuote = val;

  void updateDailyChristianQuote(Function(DailyChristianQuoteStruct) updateFn) {
    updateFn(_dailyChristianQuote ??= DailyChristianQuoteStruct());
  }

  bool hasDailyChristianQuote() => _dailyChristianQuote != null;

  static DailyTasksStruct fromMap(Map<String, dynamic> data) =>
      DailyTasksStruct(
        day: castToType<int>(data['day']),
        morningRoutine: data['morningRoutine'] is MorningRoutineStruct
            ? data['morningRoutine']
            : MorningRoutineStruct.maybeFromMap(data['morningRoutine']),
        dailyTask: data['dailyTask'] as String?,
        dailyChallenge: data['dailyChallenge'] is DailyChallengeStruct
            ? data['dailyChallenge']
            : DailyChallengeStruct.maybeFromMap(data['dailyChallenge']),
        eveningReflection: data['eveningReflection'] is EveningReflectionStruct
            ? data['eveningReflection']
            : EveningReflectionStruct.maybeFromMap(data['eveningReflection']),
        meditationExercise: data['meditationExercise'] as String?,
        verseOfTheDay: data['verseOfTheDay'] as String?,
        dailyDevotion: data['dailyDevotion'] is DailyDevotionStruct
            ? data['dailyDevotion']
            : DailyDevotionStruct.maybeFromMap(data['dailyDevotion']),
        dailyChristianQuote:
            data['dailyChristianQuote'] is DailyChristianQuoteStruct
                ? data['dailyChristianQuote']
                : DailyChristianQuoteStruct.maybeFromMap(
                    data['dailyChristianQuote']),
      );

  static DailyTasksStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyTasksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'morningRoutine': _morningRoutine?.toMap(),
        'dailyTask': _dailyTask,
        'dailyChallenge': _dailyChallenge?.toMap(),
        'eveningReflection': _eveningReflection?.toMap(),
        'meditationExercise': _meditationExercise,
        'verseOfTheDay': _verseOfTheDay,
        'dailyDevotion': _dailyDevotion?.toMap(),
        'dailyChristianQuote': _dailyChristianQuote?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'morningRoutine': serializeParam(
          _morningRoutine,
          ParamType.DataStruct,
        ),
        'dailyTask': serializeParam(
          _dailyTask,
          ParamType.String,
        ),
        'dailyChallenge': serializeParam(
          _dailyChallenge,
          ParamType.DataStruct,
        ),
        'eveningReflection': serializeParam(
          _eveningReflection,
          ParamType.DataStruct,
        ),
        'meditationExercise': serializeParam(
          _meditationExercise,
          ParamType.String,
        ),
        'verseOfTheDay': serializeParam(
          _verseOfTheDay,
          ParamType.String,
        ),
        'dailyDevotion': serializeParam(
          _dailyDevotion,
          ParamType.DataStruct,
        ),
        'dailyChristianQuote': serializeParam(
          _dailyChristianQuote,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DailyTasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyTasksStruct(
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        morningRoutine: deserializeStructParam(
          data['morningRoutine'],
          ParamType.DataStruct,
          false,
          structBuilder: MorningRoutineStruct.fromSerializableMap,
        ),
        dailyTask: deserializeParam(
          data['dailyTask'],
          ParamType.String,
          false,
        ),
        dailyChallenge: deserializeStructParam(
          data['dailyChallenge'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyChallengeStruct.fromSerializableMap,
        ),
        eveningReflection: deserializeStructParam(
          data['eveningReflection'],
          ParamType.DataStruct,
          false,
          structBuilder: EveningReflectionStruct.fromSerializableMap,
        ),
        meditationExercise: deserializeParam(
          data['meditationExercise'],
          ParamType.String,
          false,
        ),
        verseOfTheDay: deserializeParam(
          data['verseOfTheDay'],
          ParamType.String,
          false,
        ),
        dailyDevotion: deserializeStructParam(
          data['dailyDevotion'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyDevotionStruct.fromSerializableMap,
        ),
        dailyChristianQuote: deserializeStructParam(
          data['dailyChristianQuote'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyChristianQuoteStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DailyTasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyTasksStruct &&
        day == other.day &&
        morningRoutine == other.morningRoutine &&
        dailyTask == other.dailyTask &&
        dailyChallenge == other.dailyChallenge &&
        eveningReflection == other.eveningReflection &&
        meditationExercise == other.meditationExercise &&
        verseOfTheDay == other.verseOfTheDay &&
        dailyDevotion == other.dailyDevotion &&
        dailyChristianQuote == other.dailyChristianQuote;
  }

  @override
  int get hashCode => const ListEquality().hash([
        day,
        morningRoutine,
        dailyTask,
        dailyChallenge,
        eveningReflection,
        meditationExercise,
        verseOfTheDay,
        dailyDevotion,
        dailyChristianQuote
      ]);
}

DailyTasksStruct createDailyTasksStruct({
  int? day,
  MorningRoutineStruct? morningRoutine,
  String? dailyTask,
  DailyChallengeStruct? dailyChallenge,
  EveningReflectionStruct? eveningReflection,
  String? meditationExercise,
  String? verseOfTheDay,
  DailyDevotionStruct? dailyDevotion,
  DailyChristianQuoteStruct? dailyChristianQuote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyTasksStruct(
      day: day,
      morningRoutine:
          morningRoutine ?? (clearUnsetFields ? MorningRoutineStruct() : null),
      dailyTask: dailyTask,
      dailyChallenge:
          dailyChallenge ?? (clearUnsetFields ? DailyChallengeStruct() : null),
      eveningReflection: eveningReflection ??
          (clearUnsetFields ? EveningReflectionStruct() : null),
      meditationExercise: meditationExercise,
      verseOfTheDay: verseOfTheDay,
      dailyDevotion:
          dailyDevotion ?? (clearUnsetFields ? DailyDevotionStruct() : null),
      dailyChristianQuote: dailyChristianQuote ??
          (clearUnsetFields ? DailyChristianQuoteStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyTasksStruct? updateDailyTasksStruct(
  DailyTasksStruct? dailyTasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyTasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyTasksStructData(
  Map<String, dynamic> firestoreData,
  DailyTasksStruct? dailyTasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyTasks == null) {
    return;
  }
  if (dailyTasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyTasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyTasksData = getDailyTasksFirestoreData(dailyTasks, forFieldValue);
  final nestedData = dailyTasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyTasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyTasksFirestoreData(
  DailyTasksStruct? dailyTasks, [
  bool forFieldValue = false,
]) {
  if (dailyTasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyTasks.toMap());

  // Handle nested data for "morningRoutine" field.
  addMorningRoutineStructData(
    firestoreData,
    dailyTasks.hasMorningRoutine() ? dailyTasks.morningRoutine : null,
    'morningRoutine',
    forFieldValue,
  );

  // Handle nested data for "dailyChallenge" field.
  addDailyChallengeStructData(
    firestoreData,
    dailyTasks.hasDailyChallenge() ? dailyTasks.dailyChallenge : null,
    'dailyChallenge',
    forFieldValue,
  );

  // Handle nested data for "eveningReflection" field.
  addEveningReflectionStructData(
    firestoreData,
    dailyTasks.hasEveningReflection() ? dailyTasks.eveningReflection : null,
    'eveningReflection',
    forFieldValue,
  );

  // Handle nested data for "dailyDevotion" field.
  addDailyDevotionStructData(
    firestoreData,
    dailyTasks.hasDailyDevotion() ? dailyTasks.dailyDevotion : null,
    'dailyDevotion',
    forFieldValue,
  );

  // Handle nested data for "dailyChristianQuote" field.
  addDailyChristianQuoteStructData(
    firestoreData,
    dailyTasks.hasDailyChristianQuote() ? dailyTasks.dailyChristianQuote : null,
    'dailyChristianQuote',
    forFieldValue,
  );

  // Add any Firestore field values
  dailyTasks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyTasksListFirestoreData(
  List<DailyTasksStruct>? dailyTaskss,
) =>
    dailyTaskss?.map((e) => getDailyTasksFirestoreData(e, true)).toList() ?? [];
