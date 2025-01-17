import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personalized_welcome_p_g_model.dart';
export 'personalized_welcome_p_g_model.dart';

class PersonalizedWelcomePGWidget extends StatefulWidget {
  const PersonalizedWelcomePGWidget({super.key});

  @override
  State<PersonalizedWelcomePGWidget> createState() =>
      _PersonalizedWelcomePGWidgetState();
}

class _PersonalizedWelcomePGWidgetState
    extends State<PersonalizedWelcomePGWidget> {
  late PersonalizedWelcomePGModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalizedWelcomePGModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Group_5.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 134.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Group_6_(1).png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 134.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.coachCommentaryDialogModel,
                updateCallback: () => safeSetState(() {}),
                child: CoachCommentaryDialogWidget(
                  buttonLabel: 'Proceed',
                  commentary:
                      '\"Welcome,\n\nI\'m excited to start this journey with you. You\'ve taken the first step. Let\'s explore the great things God has planned for you!\"',
                  buttonAction: () async {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
