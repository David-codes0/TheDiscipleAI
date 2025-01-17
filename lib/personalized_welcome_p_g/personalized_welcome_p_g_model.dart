import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'personalized_welcome_p_g_widget.dart' show PersonalizedWelcomePGWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalizedWelcomePGModel
    extends FlutterFlowModel<PersonalizedWelcomePGWidget> {
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
