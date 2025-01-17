import '/components/badge_comp/badge_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'badges_widget.dart' show BadgesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BadgesModel extends FlutterFlowModel<BadgesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for badgeComp component.
  late BadgeCompModel badgeCompModel1;
  // Model for badgeComp component.
  late BadgeCompModel badgeCompModel2;

  @override
  void initState(BuildContext context) {
    badgeCompModel1 = createModel(context, () => BadgeCompModel());
    badgeCompModel2 = createModel(context, () => BadgeCompModel());
  }

  @override
  void dispose() {
    badgeCompModel1.dispose();
    badgeCompModel2.dispose();
  }
}
