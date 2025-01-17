import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_component/question_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'guide_page_widget.dart' show GuidePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class GuidePageModel extends FlutterFlowModel<GuidePageWidget> {
  ///  Local state fields for this page.

  int? pagesIndex = 0;

  int? selectedsessionIndex;

  bool airesponse = false;

  String? sessionID = ' ';

  List<FreechatStruct> listFreechat = [];
  void addToListFreechat(FreechatStruct item) => listFreechat.add(item);
  void removeFromListFreechat(FreechatStruct item) => listFreechat.remove(item);
  void removeAtIndexFromListFreechat(int index) => listFreechat.removeAt(index);
  void insertAtIndexInListFreechat(int index, FreechatStruct item) =>
      listFreechat.insert(index, item);
  void updateListFreechatAtIndex(
          int index, Function(FreechatStruct) updateFn) =>
      listFreechat[index] = updateFn(listFreechat[index]);

  ShortSessionPartoneStruct? shortsesssion1;
  void updateShortsesssion1Struct(
      Function(ShortSessionPartoneStruct) updateFn) {
    updateFn(shortsesssion1 ??= ShortSessionPartoneStruct());
  }

  ShortSessionParttwoStruct? shortsession2;
  void updateShortsession2Struct(Function(ShortSessionParttwoStruct) updateFn) {
    updateFn(shortsession2 ??= ShortSessionParttwoStruct());
  }

  bool loadingState = false;

  double? progressingbar = 0.1;

  String? optionsSelected;

  bool selectAnOptionBOol = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Stores action output result for [Backend Call - API (shortSessionPart)] action in Container widget.
  ApiCallResponse? apiresponse456;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // Stores action output result for [Backend Call - API (shortSessionPart Copy)] action in Button widget.
  ApiCallResponse? apiResultjyc;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (freechat)] action in Icon widget.
  ApiCallResponse? freechat;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    listViewController?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
