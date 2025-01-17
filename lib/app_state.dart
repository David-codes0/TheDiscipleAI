import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _onboardingDone = prefs.getBool('ff_onboardingDone') ?? _onboardingDone;
    });
    _safeInit(() {
      _biblePageIndex = prefs.getInt('ff_biblePageIndex') ?? _biblePageIndex;
    });
    _safeInit(() {
      _defaultbibleVersion =
          prefs.getString('ff_defaultbibleVersion') ?? _defaultbibleVersion;
    });
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_weeklyPLan')) {
        try {
          final serializedData = prefs.getString('ff_weeklyPLan') ?? '{}';
          _weeklyPLan = WeeklyPLanMajorStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dailyProgress = prefs.getDouble('ff_dailyProgress') ?? _dailyProgress;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_growTracker')) {
        try {
          final serializedData = prefs.getString('ff_growTracker') ?? '{}';
          _growTracker = GrowthTrackerMajorStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_weeklyPlanCheck')) {
        try {
          final serializedData = prefs.getString('ff_weeklyPlanCheck') ?? '{}';
          _weeklyPlanCheck = WeeklyPlanCheck2Struct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _previousDay = prefs.containsKey('ff_previousDay')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_previousDay')!)
          : _previousDay;
    });
    _safeInit(() {
      _verseImg = prefs.getString('ff_verseImg') ?? _verseImg;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Weekplan11')) {
        try {
          final serializedData = prefs.getString('ff_Weekplan11') ?? '{}';
          _Weekplan11 = Weeklyplan11Struct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_DailyDevo11')) {
        try {
          final serializedData = prefs.getString('ff_DailyDevo11') ?? '{}';
          _DailyDevo11 = DailydevtionTasks11Struct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dailyPlan11')) {
        try {
          final serializedData = prefs.getString('ff_dailyPlan11') ?? '{}';
          _dailyPlan11 =
              DailyPlan11Struct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dailyIndexTracker =
          prefs.getInt('ff_dailyIndexTracker') ?? _dailyIndexTracker;
    });
    _safeInit(() {
      _CheckerForQuestions =
          prefs.getBool('ff_CheckerForQuestions') ?? _CheckerForQuestions;
    });
    _safeInit(() {
      _guideSessionQuestion = prefs
              .getStringList('ff_guideSessionQuestion')
              ?.map((x) {
                try {
                  return OnboardQuestionStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _guideSessionQuestion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _onboardingDone = false;
  bool get onboardingDone => _onboardingDone;
  set onboardingDone(bool value) {
    _onboardingDone = value;
    prefs.setBool('ff_onboardingDone', value);
  }

  List<OnboardQuestionStruct> _personaLIntroQ = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Personality type\",\"listOFOption\":\"[\\\"Introverted (likes being lonely)\\\",\\\"Extroverted (enjoys socializing)\\\",\\\"Ambivert (depends on the situation)\\\",\\\"Not certain\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do you spend your day?\",\"listOFOption\":\"[\\\"Busy with work or studies\\\",\\\"Balanced with personal time\\\",\\\"Focused on family or relationships\\\",\\\"Other...\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get personaLIntroQ => _personaLIntroQ;
  set personaLIntroQ(List<OnboardQuestionStruct> value) {
    _personaLIntroQ = value;
  }

  void addToPersonaLIntroQ(OnboardQuestionStruct value) {
    personaLIntroQ.add(value);
  }

  void removeFromPersonaLIntroQ(OnboardQuestionStruct value) {
    personaLIntroQ.remove(value);
  }

  void removeAtIndexFromPersonaLIntroQ(int index) {
    personaLIntroQ.removeAt(index);
  }

  void updatePersonaLIntroQAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    personaLIntroQ[index] = updateFn(_personaLIntroQ[index]);
  }

  void insertAtIndexInPersonaLIntroQ(int index, OnboardQuestionStruct value) {
    personaLIntroQ.insert(index, value);
  }

  List<OnboardQuestionStruct> _lifestyleDailyRQ = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do you spend your day?\",\"listOFOption\":\"[\\\"Busy with work or studies\\\",\\\"Balanced with personal time\\\",\\\"Focused on family or relationships\\\",\\\"Other...\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do you spend your free time?\",\"listOFOption\":\"[\\\"Reading\\\",\\\"Spending time outdoors\\\",\\\" Meditating\\\",\\\"Other...\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get lifestyleDailyRQ => _lifestyleDailyRQ;
  set lifestyleDailyRQ(List<OnboardQuestionStruct> value) {
    _lifestyleDailyRQ = value;
  }

  void addToLifestyleDailyRQ(OnboardQuestionStruct value) {
    lifestyleDailyRQ.add(value);
  }

  void removeFromLifestyleDailyRQ(OnboardQuestionStruct value) {
    lifestyleDailyRQ.remove(value);
  }

  void removeAtIndexFromLifestyleDailyRQ(int index) {
    lifestyleDailyRQ.removeAt(index);
  }

  void updateLifestyleDailyRQAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    lifestyleDailyRQ[index] = updateFn(_lifestyleDailyRQ[index]);
  }

  void insertAtIndexInLifestyleDailyRQ(int index, OnboardQuestionStruct value) {
    lifestyleDailyRQ.insert(index, value);
  }

  List<OnboardQuestionStruct> _spiritPracticeHQ = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"When do you like to spend time with God most?\",\"listOFOption\":\"[\\\"Morning\\\",\\\"Afternoon\\\",\\\"Evening\\\",\\\"Late night\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get spiritPracticeHQ => _spiritPracticeHQ;
  set spiritPracticeHQ(List<OnboardQuestionStruct> value) {
    _spiritPracticeHQ = value;
  }

  void addToSpiritPracticeHQ(OnboardQuestionStruct value) {
    spiritPracticeHQ.add(value);
  }

  void removeFromSpiritPracticeHQ(OnboardQuestionStruct value) {
    spiritPracticeHQ.remove(value);
  }

  void removeAtIndexFromSpiritPracticeHQ(int index) {
    spiritPracticeHQ.removeAt(index);
  }

  void updateSpiritPracticeHQAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    spiritPracticeHQ[index] = updateFn(_spiritPracticeHQ[index]);
  }

  void insertAtIndexInSpiritPracticeHQ(int index, OnboardQuestionStruct value) {
    spiritPracticeHQ.insert(index, value);
  }

  List<OnboardQuestionStruct> _spiritualPractQb = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"a. Bible Reading\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"b. Prayer\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"c. Meditation\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"d. Attending Church\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"e. Fasting\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"f. Evangelism\",\"listOFOption\":\"[\\\"Daily\\\",\\\"A few times a week\\\",\\\"Weekly\\\",\\\"Occasionally\\\",\\\"Never\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get spiritualPractQb => _spiritualPractQb;
  set spiritualPractQb(List<OnboardQuestionStruct> value) {
    _spiritualPractQb = value;
  }

  void addToSpiritualPractQb(OnboardQuestionStruct value) {
    spiritualPractQb.add(value);
  }

  void removeFromSpiritualPractQb(OnboardQuestionStruct value) {
    spiritualPractQb.remove(value);
  }

  void removeAtIndexFromSpiritualPractQb(int index) {
    spiritualPractQb.removeAt(index);
  }

  void updateSpiritualPractQbAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    spiritualPractQb[index] = updateFn(_spiritualPractQb[index]);
  }

  void insertAtIndexInSpiritualPractQb(int index, OnboardQuestionStruct value) {
    spiritualPractQb.insert(index, value);
  }

  List<MultiSelQStruct> _EmotionalMentalQ = [
    MultiSelQStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How would you describe your current emotional state?\",\"listOFOption\":\"[\\\"Peaceful\\\",\\\"Anxious\\\",\\\"Joyful\\\",\\\"Overwhelmed\\\",\\\"Content\\\",\\\"Stressed\\\",\\\"Other...\\\"]\",\"hasResponse\":\"false\",\"listOfResponse\":\"[]\"}')),
    MultiSelQStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What are some habits or thoughts that you find challenging to manage?\",\"listOFOption\":\"[\\\"Overthinking\\\",\\\"Negative Self-Talk\\\",\\\"Difficulty Trusting Others\\\",\\\"Procrastination\\\",\\\"Balancing Work and Life\\\",\\\"Other...\\\"]\",\"hasResponse\":\"false\",\"listOfResponse\":\"[]\"}'))
  ];
  List<MultiSelQStruct> get EmotionalMentalQ => _EmotionalMentalQ;
  set EmotionalMentalQ(List<MultiSelQStruct> value) {
    _EmotionalMentalQ = value;
  }

  void addToEmotionalMentalQ(MultiSelQStruct value) {
    EmotionalMentalQ.add(value);
  }

  void removeFromEmotionalMentalQ(MultiSelQStruct value) {
    EmotionalMentalQ.remove(value);
  }

  void removeAtIndexFromEmotionalMentalQ(int index) {
    EmotionalMentalQ.removeAt(index);
  }

  void updateEmotionalMentalQAtIndex(
    int index,
    MultiSelQStruct Function(MultiSelQStruct) updateFn,
  ) {
    EmotionalMentalQ[index] = updateFn(_EmotionalMentalQ[index]);
  }

  void insertAtIndexInEmotionalMentalQ(int index, MultiSelQStruct value) {
    EmotionalMentalQ.insert(index, value);
  }

  List<OnboardQuestionStruct> _lifeChallengeQ = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Which area of your life do you feel most called to focus on right now?\",\"listOFOption\":\"[\\\"Developing Faith\\\",\\\"Building Relationships\\\",\\\"Finding Purpose\\\",\\\"Healing\\\",\\\"Leadership\\\",\\\"Other...\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get lifeChallengeQ => _lifeChallengeQ;
  set lifeChallengeQ(List<OnboardQuestionStruct> value) {
    _lifeChallengeQ = value;
  }

  void addToLifeChallengeQ(OnboardQuestionStruct value) {
    lifeChallengeQ.add(value);
  }

  void removeFromLifeChallengeQ(OnboardQuestionStruct value) {
    lifeChallengeQ.remove(value);
  }

  void removeAtIndexFromLifeChallengeQ(int index) {
    lifeChallengeQ.removeAt(index);
  }

  void updateLifeChallengeQAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    lifeChallengeQ[index] = updateFn(_lifeChallengeQ[index]);
  }

  void insertAtIndexInLifeChallengeQ(int index, OnboardQuestionStruct value) {
    lifeChallengeQ.insert(index, value);
  }

  List<MultiSelQStruct> _lifeChallengeMultiSelQ = [
    MultiSelQStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What challenges are you facing right now?\",\"listOFOption\":\"[\\\"Stress/Anxiety\\\",\\\"Lack of Purpose\\\",\\\"Spiritual Doubt\\\",\\\"Relationship Issues\\\",\\\"Career Challenges\\\",\\\"Other...\\\"]\",\"hasResponse\":\"false\",\"listOfResponse\":\"[]\"}'))
  ];
  List<MultiSelQStruct> get lifeChallengeMultiSelQ => _lifeChallengeMultiSelQ;
  set lifeChallengeMultiSelQ(List<MultiSelQStruct> value) {
    _lifeChallengeMultiSelQ = value;
  }

  void addToLifeChallengeMultiSelQ(MultiSelQStruct value) {
    lifeChallengeMultiSelQ.add(value);
  }

  void removeFromLifeChallengeMultiSelQ(MultiSelQStruct value) {
    lifeChallengeMultiSelQ.remove(value);
  }

  void removeAtIndexFromLifeChallengeMultiSelQ(int index) {
    lifeChallengeMultiSelQ.removeAt(index);
  }

  void updateLifeChallengeMultiSelQAtIndex(
    int index,
    MultiSelQStruct Function(MultiSelQStruct) updateFn,
  ) {
    lifeChallengeMultiSelQ[index] = updateFn(_lifeChallengeMultiSelQ[index]);
  }

  void insertAtIndexInLifeChallengeMultiSelQ(int index, MultiSelQStruct value) {
    lifeChallengeMultiSelQ.insert(index, value);
  }

  List<MultiSelQStruct> _goalSettingQ = [
    MultiSelQStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What are your top 3 spiritual goals for the next 6 months? \",\"listOFOption\":\"[\\\"Deepening Faith\\\",\\\"Developing a Prayer Habit\\\",\\\"Serving in Ministry\\\",\\\"Improving Relationships\\\",\\\"Other...\\\"]\",\"hasResponse\":\"false\",\"listOfResponse\":\"[]\"}')),
    MultiSelQStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What are your top personal goals for the next 6 months?\",\"listOFOption\":\"[\\\"Career Growth\\\",\\\"Physical Health\\\",\\\"Emotional Healing\\\",\\\"Financial Stability\\\",\\\"Other...\\\"]\",\"hasResponse\":\"false\",\"listOfResponse\":\"[]\"}'))
  ];
  List<MultiSelQStruct> get goalSettingQ => _goalSettingQ;
  set goalSettingQ(List<MultiSelQStruct> value) {
    _goalSettingQ = value;
  }

  void addToGoalSettingQ(MultiSelQStruct value) {
    goalSettingQ.add(value);
  }

  void removeFromGoalSettingQ(MultiSelQStruct value) {
    goalSettingQ.remove(value);
  }

  void removeAtIndexFromGoalSettingQ(int index) {
    goalSettingQ.removeAt(index);
  }

  void updateGoalSettingQAtIndex(
    int index,
    MultiSelQStruct Function(MultiSelQStruct) updateFn,
  ) {
    goalSettingQ[index] = updateFn(_goalSettingQ[index]);
  }

  void insertAtIndexInGoalSettingQ(int index, MultiSelQStruct value) {
    goalSettingQ.insert(index, value);
  }

  List<OnboardQuestionStruct> _understandLifeStyle = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do you prefer to receive guidance?\",\"listOFOption\":\"[\\\"Reading\\\",\\\"Listening\\\",\\\"Interactive Exercises\\\",\\\"One-on-One Coaching\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get understandLifeStyle => _understandLifeStyle;
  set understandLifeStyle(List<OnboardQuestionStruct> value) {
    _understandLifeStyle = value;
  }

  void addToUnderstandLifeStyle(OnboardQuestionStruct value) {
    understandLifeStyle.add(value);
  }

  void removeFromUnderstandLifeStyle(OnboardQuestionStruct value) {
    understandLifeStyle.remove(value);
  }

  void removeAtIndexFromUnderstandLifeStyle(int index) {
    understandLifeStyle.removeAt(index);
  }

  void updateUnderstandLifeStyleAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    understandLifeStyle[index] = updateFn(_understandLifeStyle[index]);
  }

  void insertAtIndexInUnderstandLifeStyle(
      int index, OnboardQuestionStruct value) {
    understandLifeStyle.insert(index, value);
  }

  List<OnboardQuestionStruct> _finalTouchQ = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How much time can you commit to your spiritual growth daily\",\"listOFOption\":\"[\\\"5-10 minutes\\\",\\\"30-60 minutes\\\",\\\"More than an hour\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How often would you like to check in on your progress?\",\"listOFOption\":\"[\\\"Daily\\\",\\\"Weekly\\\",\\\"Bi-Weekly\\\",\\\"Monthly\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get finalTouchQ => _finalTouchQ;
  set finalTouchQ(List<OnboardQuestionStruct> value) {
    _finalTouchQ = value;
  }

  void addToFinalTouchQ(OnboardQuestionStruct value) {
    finalTouchQ.add(value);
  }

  void removeFromFinalTouchQ(OnboardQuestionStruct value) {
    finalTouchQ.remove(value);
  }

  void removeAtIndexFromFinalTouchQ(int index) {
    finalTouchQ.removeAt(index);
  }

  void updateFinalTouchQAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    finalTouchQ[index] = updateFn(_finalTouchQ[index]);
  }

  void insertAtIndexInFinalTouchQ(int index, OnboardQuestionStruct value) {
    finalTouchQ.insert(index, value);
  }

  int _biblePageIndex = 0;
  int get biblePageIndex => _biblePageIndex;
  set biblePageIndex(int value) {
    _biblePageIndex = value;
    prefs.setInt('ff_biblePageIndex', value);
  }

  List<String> _allcityList = [];
  List<String> get allcityList => _allcityList;
  set allcityList(List<String> value) {
    _allcityList = value;
  }

  void addToAllcityList(String value) {
    allcityList.add(value);
  }

  void removeFromAllcityList(String value) {
    allcityList.remove(value);
  }

  void removeAtIndexFromAllcityList(int index) {
    allcityList.removeAt(index);
  }

  void updateAllcityListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    allcityList[index] = updateFn(_allcityList[index]);
  }

  void insertAtIndexInAllcityList(int index, String value) {
    allcityList.insert(index, value);
  }

  String _defaultbibleVersion = 'KJV';
  String get defaultbibleVersion => _defaultbibleVersion;
  set defaultbibleVersion(String value) {
    _defaultbibleVersion = value;
    prefs.setString('ff_defaultbibleVersion', value);
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  WeeklyPLanMajorStruct _weeklyPLan = WeeklyPLanMajorStruct();
  WeeklyPLanMajorStruct get weeklyPLan => _weeklyPLan;
  set weeklyPLan(WeeklyPLanMajorStruct value) {
    _weeklyPLan = value;
    prefs.setString('ff_weeklyPLan', value.serialize());
  }

  void updateWeeklyPLanStruct(Function(WeeklyPLanMajorStruct) updateFn) {
    updateFn(_weeklyPLan);
    prefs.setString('ff_weeklyPLan', _weeklyPLan.serialize());
  }

  double _dailyProgress = 0.1;
  double get dailyProgress => _dailyProgress;
  set dailyProgress(double value) {
    _dailyProgress = value;
    prefs.setDouble('ff_dailyProgress', value);
  }

  GrowthTrackerMajorStruct _growTracker = GrowthTrackerMajorStruct();
  GrowthTrackerMajorStruct get growTracker => _growTracker;
  set growTracker(GrowthTrackerMajorStruct value) {
    _growTracker = value;
    prefs.setString('ff_growTracker', value.serialize());
  }

  void updateGrowTrackerStruct(Function(GrowthTrackerMajorStruct) updateFn) {
    updateFn(_growTracker);
    prefs.setString('ff_growTracker', _growTracker.serialize());
  }

  WeeklyPlanCheck2Struct _weeklyPlanCheck = WeeklyPlanCheck2Struct();
  WeeklyPlanCheck2Struct get weeklyPlanCheck => _weeklyPlanCheck;
  set weeklyPlanCheck(WeeklyPlanCheck2Struct value) {
    _weeklyPlanCheck = value;
    prefs.setString('ff_weeklyPlanCheck', value.serialize());
  }

  void updateWeeklyPlanCheckStruct(Function(WeeklyPlanCheck2Struct) updateFn) {
    updateFn(_weeklyPlanCheck);
    prefs.setString('ff_weeklyPlanCheck', _weeklyPlanCheck.serialize());
  }

  DateTime? _previousDay;
  DateTime? get previousDay => _previousDay;
  set previousDay(DateTime? value) {
    _previousDay = value;
    value != null
        ? prefs.setInt('ff_previousDay', value.millisecondsSinceEpoch)
        : prefs.remove('ff_previousDay');
  }

  String _verseImg = '';
  String get verseImg => _verseImg;
  set verseImg(String value) {
    _verseImg = value;
    prefs.setString('ff_verseImg', value);
  }

  IIQBibleGetChapterStruct _IQBIbleGetChapter =
      IIQBibleGetChapterStruct.fromSerializableMap(
          jsonDecode('{\"versionId\":\"kjv\"}'));
  IIQBibleGetChapterStruct get IQBIbleGetChapter => _IQBIbleGetChapter;
  set IQBIbleGetChapter(IIQBibleGetChapterStruct value) {
    _IQBIbleGetChapter = value;
  }

  void updateIQBIbleGetChapterStruct(
      Function(IIQBibleGetChapterStruct) updateFn) {
    updateFn(_IQBIbleGetChapter);
  }

  String _reflectionDate = '';
  String get reflectionDate => _reflectionDate;
  set reflectionDate(String value) {
    _reflectionDate = value;
  }

  Weeklyplan11Struct _Weekplan11 = Weeklyplan11Struct();
  Weeklyplan11Struct get Weekplan11 => _Weekplan11;
  set Weekplan11(Weeklyplan11Struct value) {
    _Weekplan11 = value;
    prefs.setString('ff_Weekplan11', value.serialize());
  }

  void updateWeekplan11Struct(Function(Weeklyplan11Struct) updateFn) {
    updateFn(_Weekplan11);
    prefs.setString('ff_Weekplan11', _Weekplan11.serialize());
  }

  DailydevtionTasks11Struct _DailyDevo11 = DailydevtionTasks11Struct();
  DailydevtionTasks11Struct get DailyDevo11 => _DailyDevo11;
  set DailyDevo11(DailydevtionTasks11Struct value) {
    _DailyDevo11 = value;
    prefs.setString('ff_DailyDevo11', value.serialize());
  }

  void updateDailyDevo11Struct(Function(DailydevtionTasks11Struct) updateFn) {
    updateFn(_DailyDevo11);
    prefs.setString('ff_DailyDevo11', _DailyDevo11.serialize());
  }

  DailyPlan11Struct _dailyPlan11 = DailyPlan11Struct();
  DailyPlan11Struct get dailyPlan11 => _dailyPlan11;
  set dailyPlan11(DailyPlan11Struct value) {
    _dailyPlan11 = value;
    prefs.setString('ff_dailyPlan11', value.serialize());
  }

  void updateDailyPlan11Struct(Function(DailyPlan11Struct) updateFn) {
    updateFn(_dailyPlan11);
    prefs.setString('ff_dailyPlan11', _dailyPlan11.serialize());
  }

  int _dailyIndexTracker = 0;
  int get dailyIndexTracker => _dailyIndexTracker;
  set dailyIndexTracker(int value) {
    _dailyIndexTracker = value;
    prefs.setInt('ff_dailyIndexTracker', value);
  }

  DateTime? _reflectionDatetime;
  DateTime? get reflectionDatetime => _reflectionDatetime;
  set reflectionDatetime(DateTime? value) {
    _reflectionDatetime = value;
  }

  bool _prayerTimerBool = false;
  bool get prayerTimerBool => _prayerTimerBool;
  set prayerTimerBool(bool value) {
    _prayerTimerBool = value;
  }

  bool _CheckerForQuestions = false;
  bool get CheckerForQuestions => _CheckerForQuestions;
  set CheckerForQuestions(bool value) {
    _CheckerForQuestions = value;
    prefs.setBool('ff_CheckerForQuestions', value);
  }

  bool _signedUp = false;
  bool get signedUp => _signedUp;
  set signedUp(bool value) {
    _signedUp = value;
  }

  List<OnboardQuestionStruct> _guideSessionQuestion = [
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What brings you here today?\",\"listOFOption\":\"[\\\"I feel stuck\\\",\\\"I’m looking for clarity.\\\",\\\"I need encouragement.\\\",\\\"I’m struggling with a specific situation\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What would you like to focus on during this session?\",\"listOFOption\":\"[\\\"Emotions\\\",\\\"Relationships\\\",\\\"Faith\\\",\\\"Decisions\\\",\\\"General Encouragement\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Hello World\",\"listOFOption\":\"[\\\"Hello World\\\"]\",\"response\":\"Hello World\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How connected do you feel to God right now?\",\"listOFOption\":\"[\\\"Very Connected\\\",\\\"Somewhat Connected\\\",\\\"Disconnected\\\",\\\"Unsure\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What would you like to walk away with from this session?\",\"listOFOption\":\"[\\\"Peace\\\",\\\"Direction\\\",\\\"Renewed Faith\\\",\\\"Encouragement\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}')),
    OnboardQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What kind of tone would be most helpful to you today?\",\"listOFOption\":\"[\\\"Gentle and Empathetic\\\",\\\"Direct and Action-Oriented\\\",\\\"A Mix of Both\\\"]\",\"response\":\"\",\"hasResponse\":\"false\"}'))
  ];
  List<OnboardQuestionStruct> get guideSessionQuestion => _guideSessionQuestion;
  set guideSessionQuestion(List<OnboardQuestionStruct> value) {
    _guideSessionQuestion = value;
    prefs.setStringList(
        'ff_guideSessionQuestion', value.map((x) => x.serialize()).toList());
  }

  void addToGuideSessionQuestion(OnboardQuestionStruct value) {
    guideSessionQuestion.add(value);
    prefs.setStringList('ff_guideSessionQuestion',
        _guideSessionQuestion.map((x) => x.serialize()).toList());
  }

  void removeFromGuideSessionQuestion(OnboardQuestionStruct value) {
    guideSessionQuestion.remove(value);
    prefs.setStringList('ff_guideSessionQuestion',
        _guideSessionQuestion.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGuideSessionQuestion(int index) {
    guideSessionQuestion.removeAt(index);
    prefs.setStringList('ff_guideSessionQuestion',
        _guideSessionQuestion.map((x) => x.serialize()).toList());
  }

  void updateGuideSessionQuestionAtIndex(
    int index,
    OnboardQuestionStruct Function(OnboardQuestionStruct) updateFn,
  ) {
    guideSessionQuestion[index] = updateFn(_guideSessionQuestion[index]);
    prefs.setStringList('ff_guideSessionQuestion',
        _guideSessionQuestion.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGuideSessionQuestion(
      int index, OnboardQuestionStruct value) {
    guideSessionQuestion.insert(index, value);
    prefs.setStringList('ff_guideSessionQuestion',
        _guideSessionQuestion.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
