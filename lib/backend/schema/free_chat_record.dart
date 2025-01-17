import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FreeChatRecord extends FirestoreRecord {
  FreeChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "messages" field.
  List<FreechatStruct>? _messages;
  List<FreechatStruct> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messages = getStructList(
      snapshotData['messages'],
      FreechatStruct.fromMap,
    );
    _createdTime = snapshotData['createdTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('free_chat')
          : FirebaseFirestore.instance.collectionGroup('free_chat');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('free_chat').doc(id);

  static Stream<FreeChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FreeChatRecord.fromSnapshot(s));

  static Future<FreeChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FreeChatRecord.fromSnapshot(s));

  static FreeChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FreeChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FreeChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FreeChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FreeChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FreeChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFreeChatRecordData({
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class FreeChatRecordDocumentEquality implements Equality<FreeChatRecord> {
  const FreeChatRecordDocumentEquality();

  @override
  bool equals(FreeChatRecord? e1, FreeChatRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(FreeChatRecord? e) =>
      const ListEquality().hash([e?.messages, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is FreeChatRecord;
}
