import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/bible_pagemennu/bible_pagemennu_widget.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'bible_page_widget.dart' show BiblePageWidget;
import 'dart:math' as math;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BiblePageModel extends FlutterFlowModel<BiblePageWidget> {
  ///  Local state fields for this page.

  String? book;

  BibleVerseAndChspternumberStruct? chosenBook;
  void updateChosenBookStruct(
      Function(BibleVerseAndChspternumberStruct) updateFn) {
    updateFn(chosenBook ??= BibleVerseAndChspternumberStruct());
  }

  bool bookPageRead = false;

  int? chapterIndex = 0;

  List<int> rangeList = [];
  void addToRangeList(int item) => rangeList.add(item);
  void removeFromRangeList(int item) => rangeList.remove(item);
  void removeAtIndexFromRangeList(int index) => rangeList.removeAt(index);
  void insertAtIndexInRangeList(int index, int item) =>
      rangeList.insert(index, item);
  void updateRangeListAtIndex(int index, Function(int) updateFn) =>
      rangeList[index] = updateFn(rangeList[index]);

  String valueRange = '1- the end';

  bool newTestamentbookBool = true;

  bool oldTestamentbool = true;

  GrowPlanBibleReadingStruct? bibleVersefromOtherPage;
  void updateBibleVersefromOtherPageStruct(
      Function(GrowPlanBibleReadingStruct) updateFn) {
    updateFn(bibleVersefromOtherPage ??= GrowPlanBibleReadingStruct());
  }

  bool showLoadingState = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (GetChapter)] action in Container widget.
  ApiCallResponse? apiResultt5bCopy5;
  // Stores action output result for [Backend Call - API (GetChapter)] action in Transform widget.
  ApiCallResponse? apiResultt5bh;
  // Stores action output result for [Backend Call - API (GetChapter)] action in Container widget.
  ApiCallResponse? apiResultt5b1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
