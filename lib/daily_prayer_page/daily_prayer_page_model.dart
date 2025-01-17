import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/components/switch_button/switch_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'daily_prayer_page_widget.dart' show DailyPrayerPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyPrayerPageModel extends FlutterFlowModel<DailyPrayerPageWidget> {
  ///  Local state fields for this page.

  bool uncompletedTaskBool = false;

  bool completedTaskBool = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
