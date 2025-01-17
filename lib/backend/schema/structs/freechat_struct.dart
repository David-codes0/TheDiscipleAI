// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FreechatStruct extends FFFirebaseStruct {
  FreechatStruct({
    String? sessionId,
    String? sender,
    String? message,
    String? messageTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sessionId = sessionId,
        _sender = sender,
        _message = message,
        _messageTime = messageTime,
        super(firestoreUtilData);

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;

  bool hasSender() => _sender != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "message_time" field.
  String? _messageTime;
  String get messageTime => _messageTime ?? '';
  set messageTime(String? val) => _messageTime = val;

  bool hasMessageTime() => _messageTime != null;

  static FreechatStruct fromMap(Map<String, dynamic> data) => FreechatStruct(
        sessionId: data['sessionId'] as String?,
        sender: data['sender'] as String?,
        message: data['message'] as String?,
        messageTime: data['message_time'] as String?,
      );

  static FreechatStruct? maybeFromMap(dynamic data) =>
      data is Map ? FreechatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sessionId': _sessionId,
        'sender': _sender,
        'message': _message,
        'message_time': _messageTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sessionId': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'message_time': serializeParam(
          _messageTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static FreechatStruct fromSerializableMap(Map<String, dynamic> data) =>
      FreechatStruct(
        sessionId: deserializeParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        messageTime: deserializeParam(
          data['message_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FreechatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FreechatStruct &&
        sessionId == other.sessionId &&
        sender == other.sender &&
        message == other.message &&
        messageTime == other.messageTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([sessionId, sender, message, messageTime]);
}

FreechatStruct createFreechatStruct({
  String? sessionId,
  String? sender,
  String? message,
  String? messageTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FreechatStruct(
      sessionId: sessionId,
      sender: sender,
      message: message,
      messageTime: messageTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FreechatStruct? updateFreechatStruct(
  FreechatStruct? freechat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    freechat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFreechatStructData(
  Map<String, dynamic> firestoreData,
  FreechatStruct? freechat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (freechat == null) {
    return;
  }
  if (freechat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && freechat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final freechatData = getFreechatFirestoreData(freechat, forFieldValue);
  final nestedData = freechatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = freechat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFreechatFirestoreData(
  FreechatStruct? freechat, [
  bool forFieldValue = false,
]) {
  if (freechat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(freechat.toMap());

  // Add any Firestore field values
  freechat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFreechatListFirestoreData(
  List<FreechatStruct>? freechats,
) =>
    freechats?.map((e) => getFreechatFirestoreData(e, true)).toList() ?? [];
