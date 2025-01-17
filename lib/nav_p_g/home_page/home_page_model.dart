import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  GrowPlanBibleReadingStruct? verseOFtheDay;
  void updateVerseOFtheDayStruct(
      Function(GrowPlanBibleReadingStruct) updateFn) {
    updateFn(verseOFtheDay ??= GrowPlanBibleReadingStruct());
  }

  bool loadingDevotionState = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in home_page widget.
  DailyVersesRecord? verseImgs;
  // Stores action output result for [Backend Call - API (DailyDevotion)] action in home_page widget.
  ApiCallResponse? apiresponseDailyDevo2;
  // Stores action output result for [Backend Call - API (Weekly plan)] action in home_page widget.
  ApiCallResponse? apiResultw3g;
  // Stores action output result for [Backend Call - API (DailyDevotion)] action in home_page widget.
  ApiCallResponse? apiresponseDailyDevo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
