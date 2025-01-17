import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'account_create_page_copy_widget.dart' show AccountCreatePageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountCreatePageCopyModel
    extends FlutterFlowModel<AccountCreatePageCopyWidget> {
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
