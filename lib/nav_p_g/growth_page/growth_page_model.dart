import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/actionablestep_dialog/actionablestep_dialog_widget.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/components/growth_menu/growth_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'growth_page_widget.dart' show GrowthPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class GrowthPageModel extends FlutterFlowModel<GrowthPageWidget> {
  ///  Local state fields for this page.

  bool uncompletedTaskBool = false;

  bool completedTaskBool = false;

  bool morningRoutine = true;

  bool dailyChallenge = true;

  bool eveningReflection = true;

  bool morningRoutineConplete = true;

  bool dailyChallengeComplete = true;

  bool eveningReflectionComplete = true;

  bool loadingStateForDailyPlan11 = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DailyPlan)] action in growth_page widget.
  ApiCallResponse? apiResult8jb;
  // Stores action output result for [Backend Call - API (DailyPlan)] action in growth_page widget.
  ApiCallResponse? apiResult8jb5;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (GetChapter)] action in Button widget.
  ApiCallResponse? apiResultej0;
  // Stores action output result for [Backend Call - API (GetChapter)] action in Button widget.
  ApiCallResponse? apiResultej03;
  // Stores action output result for [Backend Call - API (GetChapter)] action in Button widget.
  ApiCallResponse? apiResultej036;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
