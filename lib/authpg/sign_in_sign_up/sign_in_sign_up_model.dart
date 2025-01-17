import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sign_in_sign_up_widget.dart' show SignInSignUpWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInSignUpModel extends FlutterFlowModel<SignInSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for signInemailAddy widget.
  FocusNode? signInemailAddyFocusNode;
  TextEditingController? signInemailAddyTextController;
  String? Function(BuildContext, String?)?
      signInemailAddyTextControllerValidator;
  // State field(s) for signInPass widget.
  FocusNode? signInPassFocusNode;
  TextEditingController? signInPassTextController;
  late bool signInPassVisibility;
  String? Function(BuildContext, String?)? signInPassTextControllerValidator;
  // State field(s) for signUpemailAddy widget.
  FocusNode? signUpemailAddyFocusNode;
  TextEditingController? signUpemailAddyTextController;
  String? Function(BuildContext, String?)?
      signUpemailAddyTextControllerValidator;
  // State field(s) for signUpPass widget.
  FocusNode? signUpPassFocusNode;
  TextEditingController? signUpPassTextController;
  late bool signUpPassVisibility;
  String? Function(BuildContext, String?)? signUpPassTextControllerValidator;
  // State field(s) for signUpComfPass widget.
  FocusNode? signUpComfPassFocusNode;
  TextEditingController? signUpComfPassTextController;
  late bool signUpComfPassVisibility;
  String? Function(BuildContext, String?)?
      signUpComfPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signInPassVisibility = false;
    signUpPassVisibility = false;
    signUpComfPassVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signInemailAddyFocusNode?.dispose();
    signInemailAddyTextController?.dispose();

    signInPassFocusNode?.dispose();
    signInPassTextController?.dispose();

    signUpemailAddyFocusNode?.dispose();
    signUpemailAddyTextController?.dispose();

    signUpPassFocusNode?.dispose();
    signUpPassTextController?.dispose();

    signUpComfPassFocusNode?.dispose();
    signUpComfPassTextController?.dispose();
  }
}
