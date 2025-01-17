import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_completion_model.dart';
export 'onboarding_completion_model.dart';

class OnboardingCompletionWidget extends StatefulWidget {
  const OnboardingCompletionWidget({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  State<OnboardingCompletionWidget> createState() =>
      _OnboardingCompletionWidgetState();
}

class _OnboardingCompletionWidgetState
    extends State<OnboardingCompletionWidget> {
  late OnboardingCompletionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingCompletionModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_5.png',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 98.0,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.coachCommentaryDialogModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CoachCommentaryDialogWidget(
                    buttonLabel: 'Proceed',
                    commentary:
                        functions.coachQuestionResponse(10, widget!.name),
                    buttonAction: () async {
                      await actions.currentDocUserCheck();

                      context.pushNamed('home_page');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_6_(1).png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 94.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
