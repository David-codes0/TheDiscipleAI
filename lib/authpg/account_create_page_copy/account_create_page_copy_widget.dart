import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_create_page_copy_model.dart';
export 'account_create_page_copy_model.dart';

class AccountCreatePageCopyWidget extends StatefulWidget {
  const AccountCreatePageCopyWidget({super.key});

  @override
  State<AccountCreatePageCopyWidget> createState() =>
      _AccountCreatePageCopyWidgetState();
}

class _AccountCreatePageCopyWidgetState
    extends State<AccountCreatePageCopyWidget> {
  late AccountCreatePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountCreatePageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Group_5.png',
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 134.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Group_6_(1).png',
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 134.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: wrapWithModel(
                              model: _model.coachCommentaryDialogModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: CoachCommentaryDialogWidget(
                                buttonLabel: 'Proceed',
                                commentary:
                                    functions.coachQuestionResponse(11, ' '),
                                buttonAction: () async {
                                  context.pushNamed('onboardingQuestion');
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
