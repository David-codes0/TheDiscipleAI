// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyChristianQuoteStruct extends FFFirebaseStruct {
  DailyChristianQuoteStruct({
    String? quoteAuthor,
    String? quote,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quoteAuthor = quoteAuthor,
        _quote = quote,
        super(firestoreUtilData);

  // "quoteAuthor" field.
  String? _quoteAuthor;
  String get quoteAuthor => _quoteAuthor ?? '';
  set quoteAuthor(String? val) => _quoteAuthor = val;

  bool hasQuoteAuthor() => _quoteAuthor != null;

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  set quote(String? val) => _quote = val;

  bool hasQuote() => _quote != null;

  static DailyChristianQuoteStruct fromMap(Map<String, dynamic> data) =>
      DailyChristianQuoteStruct(
        quoteAuthor: data['quoteAuthor'] as String?,
        quote: data['quote'] as String?,
      );

  static DailyChristianQuoteStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyChristianQuoteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quoteAuthor': _quoteAuthor,
        'quote': _quote,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quoteAuthor': serializeParam(
          _quoteAuthor,
          ParamType.String,
        ),
        'quote': serializeParam(
          _quote,
          ParamType.String,
        ),
      }.withoutNulls;

  static DailyChristianQuoteStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailyChristianQuoteStruct(
        quoteAuthor: deserializeParam(
          data['quoteAuthor'],
          ParamType.String,
          false,
        ),
        quote: deserializeParam(
          data['quote'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DailyChristianQuoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyChristianQuoteStruct &&
        quoteAuthor == other.quoteAuthor &&
        quote == other.quote;
  }

  @override
  int get hashCode => const ListEquality().hash([quoteAuthor, quote]);
}

DailyChristianQuoteStruct createDailyChristianQuoteStruct({
  String? quoteAuthor,
  String? quote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyChristianQuoteStruct(
      quoteAuthor: quoteAuthor,
      quote: quote,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyChristianQuoteStruct? updateDailyChristianQuoteStruct(
  DailyChristianQuoteStruct? dailyChristianQuote, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyChristianQuote
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyChristianQuoteStructData(
  Map<String, dynamic> firestoreData,
  DailyChristianQuoteStruct? dailyChristianQuote,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyChristianQuote == null) {
    return;
  }
  if (dailyChristianQuote.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyChristianQuote.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyChristianQuoteData =
      getDailyChristianQuoteFirestoreData(dailyChristianQuote, forFieldValue);
  final nestedData =
      dailyChristianQuoteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dailyChristianQuote.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyChristianQuoteFirestoreData(
  DailyChristianQuoteStruct? dailyChristianQuote, [
  bool forFieldValue = false,
]) {
  if (dailyChristianQuote == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyChristianQuote.toMap());

  // Add any Firestore field values
  dailyChristianQuote.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyChristianQuoteListFirestoreData(
  List<DailyChristianQuoteStruct>? dailyChristianQuotes,
) =>
    dailyChristianQuotes
        ?.map((e) => getDailyChristianQuoteFirestoreData(e, true))
        .toList() ??
    [];
