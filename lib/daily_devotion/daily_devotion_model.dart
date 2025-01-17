import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/daily_devotion_menu/daily_devotion_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'daily_devotion_widget.dart' show DailyDevotionWidget;
import 'dart:math' as math;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DailyDevotionModel extends FlutterFlowModel<DailyDevotionWidget> {
  ///  Local state fields for this page.

  bool showBible = true;

  bool showdevtions = true;

  bool showReflection = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
