import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "multipleChoiceRespoonseQ" field.
  List<MultiSelQStruct>? _multipleChoiceRespoonseQ;
  List<MultiSelQStruct> get multipleChoiceRespoonseQ =>
      _multipleChoiceRespoonseQ ?? const [];
  bool hasMultipleChoiceRespoonseQ() => _multipleChoiceRespoonseQ != null;

  // "onboardingQ" field.
  List<OnboardQuestionStruct>? _onboardingQ;
  List<OnboardQuestionStruct> get onboardingQ => _onboardingQ ?? const [];
  bool hasOnboardingQ() => _onboardingQ != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "personalIntroQ" field.
  List<OnboardQuestionStruct>? _personalIntroQ;
  List<OnboardQuestionStruct> get personalIntroQ => _personalIntroQ ?? const [];
  bool hasPersonalIntroQ() => _personalIntroQ != null;

  // "lifeStyleDailyQ" field.
  List<OnboardQuestionStruct>? _lifeStyleDailyQ;
  List<OnboardQuestionStruct> get lifeStyleDailyQ =>
      _lifeStyleDailyQ ?? const [];
  bool hasLifeStyleDailyQ() => _lifeStyleDailyQ != null;

  // "spiritPraticeHQ" field.
  List<OnboardQuestionStruct>? _spiritPraticeHQ;
  List<OnboardQuestionStruct> get spiritPraticeHQ =>
      _spiritPraticeHQ ?? const [];
  bool hasSpiritPraticeHQ() => _spiritPraticeHQ != null;

  // "spiritPracticeQb" field.
  List<OnboardQuestionStruct>? _spiritPracticeQb;
  List<OnboardQuestionStruct> get spiritPracticeQb =>
      _spiritPracticeQb ?? const [];
  bool hasSpiritPracticeQb() => _spiritPracticeQb != null;

  // "lifeChallengeQ" field.
  List<OnboardQuestionStruct>? _lifeChallengeQ;
  List<OnboardQuestionStruct> get lifeChallengeQ => _lifeChallengeQ ?? const [];
  bool hasLifeChallengeQ() => _lifeChallengeQ != null;

  // "lifeChallengeMultiQ" field.
  List<MultiSelQStruct>? _lifeChallengeMultiQ;
  List<MultiSelQStruct> get lifeChallengeMultiQ =>
      _lifeChallengeMultiQ ?? const [];
  bool hasLifeChallengeMultiQ() => _lifeChallengeMultiQ != null;

  // "goalSettingQ" field.
  List<MultiSelQStruct>? _goalSettingQ;
  List<MultiSelQStruct> get goalSettingQ => _goalSettingQ ?? const [];
  bool hasGoalSettingQ() => _goalSettingQ != null;

  // "finalTouchQ" field.
  List<OnboardQuestionStruct>? _finalTouchQ;
  List<OnboardQuestionStruct> get finalTouchQ => _finalTouchQ ?? const [];
  bool hasFinalTouchQ() => _finalTouchQ != null;

  // "EmotionalMentalQ" field.
  List<MultiSelQStruct>? _emotionalMentalQ;
  List<MultiSelQStruct> get emotionalMentalQ => _emotionalMentalQ ?? const [];
  bool hasEmotionalMentalQ() => _emotionalMentalQ != null;

  // "understandingLifeStyle" field.
  List<OnboardQuestionStruct>? _understandingLifeStyle;
  List<OnboardQuestionStruct> get understandingLifeStyle =>
      _understandingLifeStyle ?? const [];
  bool hasUnderstandingLifeStyle() => _understandingLifeStyle != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _multipleChoiceRespoonseQ = getStructList(
      snapshotData['multipleChoiceRespoonseQ'],
      MultiSelQStruct.fromMap,
    );
    _onboardingQ = getStructList(
      snapshotData['onboardingQ'],
      OnboardQuestionStruct.fromMap,
    );
    _country = snapshotData['country'] as String?;
    _city = snapshotData['city'] as String?;
    _age = snapshotData['age'] as String?;
    _personalIntroQ = getStructList(
      snapshotData['personalIntroQ'],
      OnboardQuestionStruct.fromMap,
    );
    _lifeStyleDailyQ = getStructList(
      snapshotData['lifeStyleDailyQ'],
      OnboardQuestionStruct.fromMap,
    );
    _spiritPraticeHQ = getStructList(
      snapshotData['spiritPraticeHQ'],
      OnboardQuestionStruct.fromMap,
    );
    _spiritPracticeQb = getStructList(
      snapshotData['spiritPracticeQb'],
      OnboardQuestionStruct.fromMap,
    );
    _lifeChallengeQ = getStructList(
      snapshotData['lifeChallengeQ'],
      OnboardQuestionStruct.fromMap,
    );
    _lifeChallengeMultiQ = getStructList(
      snapshotData['lifeChallengeMultiQ'],
      MultiSelQStruct.fromMap,
    );
    _goalSettingQ = getStructList(
      snapshotData['goalSettingQ'],
      MultiSelQStruct.fromMap,
    );
    _finalTouchQ = getStructList(
      snapshotData['finalTouchQ'],
      OnboardQuestionStruct.fromMap,
    );
    _emotionalMentalQ = getStructList(
      snapshotData['EmotionalMentalQ'],
      MultiSelQStruct.fromMap,
    );
    _understandingLifeStyle = getStructList(
      snapshotData['understandingLifeStyle'],
      OnboardQuestionStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? country,
  String? city,
  String? age,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'country': country,
      'city': city,
      'age': age,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(
            e1?.multipleChoiceRespoonseQ, e2?.multipleChoiceRespoonseQ) &&
        listEquality.equals(e1?.onboardingQ, e2?.onboardingQ) &&
        e1?.country == e2?.country &&
        e1?.city == e2?.city &&
        e1?.age == e2?.age &&
        listEquality.equals(e1?.personalIntroQ, e2?.personalIntroQ) &&
        listEquality.equals(e1?.lifeStyleDailyQ, e2?.lifeStyleDailyQ) &&
        listEquality.equals(e1?.spiritPraticeHQ, e2?.spiritPraticeHQ) &&
        listEquality.equals(e1?.spiritPracticeQb, e2?.spiritPracticeQb) &&
        listEquality.equals(e1?.lifeChallengeQ, e2?.lifeChallengeQ) &&
        listEquality.equals(e1?.lifeChallengeMultiQ, e2?.lifeChallengeMultiQ) &&
        listEquality.equals(e1?.goalSettingQ, e2?.goalSettingQ) &&
        listEquality.equals(e1?.finalTouchQ, e2?.finalTouchQ) &&
        listEquality.equals(e1?.emotionalMentalQ, e2?.emotionalMentalQ) &&
        listEquality.equals(
            e1?.understandingLifeStyle, e2?.understandingLifeStyle);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.multipleChoiceRespoonseQ,
        e?.onboardingQ,
        e?.country,
        e?.city,
        e?.age,
        e?.personalIntroQ,
        e?.lifeStyleDailyQ,
        e?.spiritPraticeHQ,
        e?.spiritPracticeQb,
        e?.lifeChallengeQ,
        e?.lifeChallengeMultiQ,
        e?.goalSettingQ,
        e?.finalTouchQ,
        e?.emotionalMentalQ,
        e?.understandingLifeStyle
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
