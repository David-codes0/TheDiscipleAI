import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'onboarding_completion_widget.dart' show OnboardingCompletionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingCompletionModel
    extends FlutterFlowModel<OnboardingCompletionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for coachCommentaryDialog component.
  late CoachCommentaryDialogModel coachCommentaryDialogModel;

  @override
  void initState(BuildContext context) {
    coachCommentaryDialogModel =
        createModel(context, () => CoachCommentaryDialogModel());
  }

  @override
  void dispose() {
    coachCommentaryDialogModel.dispose();
  }
}
