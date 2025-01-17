import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_reflection_widget.dart' show CreateReflectionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateReflectionModel extends FlutterFlowModel<CreateReflectionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for reflectionTitiTextField widget.
  FocusNode? reflectionTitiTextFieldFocusNode;
  TextEditingController? reflectionTitiTextFieldTextController;
  String? Function(BuildContext, String?)?
      reflectionTitiTextFieldTextControllerValidator;
  String? _reflectionTitiTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reflectionQTextField widget.
  FocusNode? reflectionQTextFieldFocusNode;
  TextEditingController? reflectionQTextFieldTextController;
  String? Function(BuildContext, String?)?
      reflectionQTextFieldTextControllerValidator;
  String? _reflectionQTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reflectionAnsTextField widget.
  FocusNode? reflectionAnsTextFieldFocusNode;
  TextEditingController? reflectionAnsTextFieldTextController;
  String? Function(BuildContext, String?)?
      reflectionAnsTextFieldTextControllerValidator;
  String? _reflectionAnsTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    reflectionTitiTextFieldTextControllerValidator =
        _reflectionTitiTextFieldTextControllerValidator;
    reflectionQTextFieldTextControllerValidator =
        _reflectionQTextFieldTextControllerValidator;
    reflectionAnsTextFieldTextControllerValidator =
        _reflectionAnsTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    reflectionTitiTextFieldFocusNode?.dispose();
    reflectionTitiTextFieldTextController?.dispose();

    reflectionQTextFieldFocusNode?.dispose();
    reflectionQTextFieldTextController?.dispose();

    reflectionAnsTextFieldFocusNode?.dispose();
    reflectionAnsTextFieldTextController?.dispose();
  }
}
