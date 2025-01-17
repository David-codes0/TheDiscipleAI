import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/components/multi_selquestion_component/multi_selquestion_component_widget.dart';
import '/components/question_component/question_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other_option_texr_input/other_option_texr_input_widget.dart';
import '/pages/question_component_alphabet_v/question_component_alphabet_v_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'onboarding_question_widget.dart' show OnboardingQuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingQuestionModel
    extends FlutterFlowModel<OnboardingQuestionWidget> {
  ///  Local state fields for this page.

  int? personalQInteger = 0;

  int? pageindexQ = 0;

  bool pagecleared = false;

  List<int> listOfindexPage = [0];
  void addToListOfindexPage(int item) => listOfindexPage.add(item);
  void removeFromListOfindexPage(int item) => listOfindexPage.remove(item);
  void removeAtIndexFromListOfindexPage(int index) =>
      listOfindexPage.removeAt(index);
  void insertAtIndexInListOfindexPage(int index, int item) =>
      listOfindexPage.insert(index, item);
  void updateListOfindexPageAtIndex(int index, Function(int) updateFn) =>
      listOfindexPage[index] = updateFn(listOfindexPage[index]);

  List<CountryWidgetListStruct> countryList = [];
  void addToCountryList(CountryWidgetListStruct item) => countryList.add(item);
  void removeFromCountryList(CountryWidgetListStruct item) =>
      countryList.remove(item);
  void removeAtIndexFromCountryList(int index) => countryList.removeAt(index);
  void insertAtIndexInCountryList(int index, CountryWidgetListStruct item) =>
      countryList.insert(index, item);
  void updateCountryListAtIndex(
          int index, Function(CountryWidgetListStruct) updateFn) =>
      countryList[index] = updateFn(countryList[index]);

  String? selsectedCountry;

  List<String> citylist = [];
  void addToCitylist(String item) => citylist.add(item);
  void removeFromCitylist(String item) => citylist.remove(item);
  void removeAtIndexFromCitylist(int index) => citylist.removeAt(index);
  void insertAtIndexInCitylist(int index, String item) =>
      citylist.insert(index, item);
  void updateCitylistAtIndex(int index, Function(String) updateFn) =>
      citylist[index] = updateFn(citylist[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - countrycityList] action in onboardingQuestion widget.
  List<CountryWidgetListStruct>? listOfCountry;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDownAge widget.
  String? dropDownAgeValue;
  FormFieldController<String>? dropDownAgeValueController;
  // State field(s) for DropDowncountry widget.
  String? dropDowncountryValue;
  FormFieldController<String>? dropDowncountryValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;

  @override
  void initState(BuildContext context) {
    fullnameTextControllerValidator = _fullnameTextControllerValidator;
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();
  }
}
