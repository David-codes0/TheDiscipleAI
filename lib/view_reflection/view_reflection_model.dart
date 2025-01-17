import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'view_reflection_widget.dart' show ViewReflectionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewReflectionModel extends FlutterFlowModel<ViewReflectionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for reflectionTextField widget.
  FocusNode? reflectionTextFieldFocusNode;
  TextEditingController? reflectionTextFieldTextController;
  String? Function(BuildContext, String?)?
      reflectionTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reflectionTextFieldFocusNode?.dispose();
    reflectionTextFieldTextController?.dispose();
  }
}
