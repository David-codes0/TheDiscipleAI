import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'actionablestep_dialog_model.dart';
export 'actionablestep_dialog_model.dart';

class ActionablestepDialogWidget extends StatefulWidget {
  const ActionablestepDialogWidget({
    super.key,
    bool? eveningOrMorning,
  }) : this.eveningOrMorning = eveningOrMorning ?? false;

  final bool eveningOrMorning;

  @override
  State<ActionablestepDialogWidget> createState() =>
      _ActionablestepDialogWidgetState();
}

class _ActionablestepDialogWidgetState
    extends State<ActionablestepDialogWidget> {
  late ActionablestepDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionablestepDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 313.0,
            height: 313.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).customColor4,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.clear_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 42.0),
                    child: Text(
                      'Are you sure you have completed the actionable step. \n\nAnd if you haven\'t kindly finish up with the step required',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget!.eveningOrMorning) {
                            FFAppState().updateGrowTrackerStruct(
                              (e) => e
                                ..updateGrowtracker(
                                  (e) => e[FFAppState().dailyIndexTracker]
                                    ..morningAction = true,
                                ),
                            );
                            safeSetState(() {});
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: CoachCommentaryDialogWidget(
                                    buttonLabel: 'Back',
                                    commentary:
                                        functions.coachQuestionResponse(16, ''),
                                    buttonAction: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );

                            context.safePop();
                          } else {
                            FFAppState().updateGrowTrackerStruct(
                              (e) => e
                                ..updateGrowtracker(
                                  (e) => e[FFAppState().dailyIndexTracker]
                                    ..eveningAction = true,
                                ),
                            );
                            safeSetState(() {});
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: CoachCommentaryDialogWidget(
                                    buttonLabel: 'Back',
                                    commentary:
                                        functions.coachQuestionResponse(16, ''),
                                    buttonAction: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );

                            context.safePop();
                          }
                        },
                        text: 'Yes',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'No',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).customColor6,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
