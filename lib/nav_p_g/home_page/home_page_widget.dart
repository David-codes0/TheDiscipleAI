import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().CheckerForQuestions || FFAppState().signedUp) {
        if (FFAppState().weeklyPLan.weekNo == functions.currentWeekNumber()) {
          if (dateTimeFormat("d", FFAppState().previousDay) !=
              dateTimeFormat("d", getCurrentTimestamp)) {
            FFAppState().dailyIndexTracker = FFAppState().dailyIndexTracker + 1;
            safeSetState(() {});
          }
        } else {
          FFAppState().dailyIndexTracker = 0;
          safeSetState(() {});
        }

        if (dateTimeFormat("d", FFAppState().previousDay) !=
            dateTimeFormat("d", getCurrentTimestamp)) {
          _model.verseImgs = await queryDailyVersesRecordOnce(
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          FFAppState().verseImg = _model.verseImgs!.imagesLink.elementAtOrNull(
              random_data.randomInteger(
                  0, _model.verseImgs!.imagesLink.length - 1))!;
          FFAppState().previousDay = getCurrentTimestamp;
          safeSetState(() {});
        }
        if (FFAppState().weeklyPLan.weekNo == functions.currentWeekNumber()) {
          while (FFAppState().DailyDevo11.dailyTasks.length < 7) {
            _model.apiresponseDailyDevo2 = await DailyDevotionCall.call(
              topic: FFAppState().Weekplan11.weeklyPlan.weeklyGoal,
            );

            if ((_model.apiresponseDailyDevo2?.succeeded ?? true)) {
              FFAppState().DailyDevo11 = functions.dailyDevo11Adder(
                  DailyDevotionCall.dailyDevotion(
                    (_model.apiresponseDailyDevo2?.jsonBody ?? ''),
                  )!,
                  FFAppState().DailyDevo11)!;
              safeSetState(() {});
            }
          }
          FFAppState().updateWeeklyPLanStruct(
            (e) => e..weekNo = functions.currentWeekNumber(),
          );
          safeSetState(() {});
        } else {
          FFAppState().dailyIndexTracker = 0;
          FFAppState().growTracker = GrowthTrackerMajorStruct();
          FFAppState().dailyPlan11 = DailyPlan11Struct();
          FFAppState().DailyDevo11 = DailydevtionTasks11Struct();
          safeSetState(() {});
          _model.loadingDevotionState = true;
          safeSetState(() {});
          _model.apiResultw3g = await WeeklyPlanCall.call(
            prompText:
                '${(currentUserDocument?.lifeChallengeQ?.toList() ?? []).elementAtOrNull(0)?.response} in json',
          );

          if ((_model.apiResultw3g?.succeeded ?? true)) {
            FFAppState().Weekplan11 = WeeklyPlanCall.weekplan11(
              (_model.apiResultw3g?.jsonBody ?? ''),
            )!;
            FFAppState().updateWeeklyPLanStruct(
              (e) => e..weekNo = functions.currentWeekNumber(),
            );
            safeSetState(() {});
            _model.apiresponseDailyDevo = await DailyDevotionCall.call(
              topic: FFAppState().Weekplan11.weeklyPlan.weeklyGoal,
            );

            if ((_model.apiresponseDailyDevo?.succeeded ?? true)) {
              FFAppState().DailyDevo11 = DailyDevotionCall.dailyDevotion(
                (_model.apiresponseDailyDevo?.jsonBody ?? ''),
              )!;
              safeSetState(() {});
              _model.loadingDevotionState = false;
              safeSetState(() {});
            }
          }
        }

        if (FFAppState().growTracker.weekNo != functions.currentWeekNumber()) {
          FFAppState().growTracker = GrowthTrackerMajorStruct(
            weekNo: functions.currentWeekNumber(),
            growtracker: functions.growTrackerCoversion(
                FFAppState().weeklyPLan.plan.dailyTasks.toList()),
          );
          safeSetState(() {});
        }
      } else {
        context.goNamed('accountCreatePageCopy');
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 109.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 42.0,
                              height: 42.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/656/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().Weekplan11 =
                                      Weeklyplan11Struct();
                                  FFAppState().DailyDevo11 =
                                      DailydevtionTasks11Struct();
                                  FFAppState().dailyPlan11 =
                                      DailyPlan11Struct();
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('notificationpg');
                                    },
                                    child: Icon(
                                      FFIcons.knotification1,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 37.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(
                                      color: Color(0xFFDFC900),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              'Basic',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          FFIcons.kstard,
                                          color: Color(0xFFFFFF00),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Verse of the Day',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 1000.0,
                                              borderWidth: 1.5,
                                              buttonSize: 38.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                FFIcons.kbookmarkicon,
                                                color: Color(0xFFCBCBCB),
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 1000.0,
                                            borderWidth: 1.5,
                                            buttonSize: 38.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.download_sharp,
                                              color: Color(0xFFCBCBCB),
                                              size: 24.0,
                                            ),
                                            onPressed: () async {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 270.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.network(
                                        FFAppState().verseImg,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  CoachCommentaryDialogWidget(
                                                buttonLabel: 'nlll',
                                                commentary: 'll;l',
                                                buttonAction: () async {
                                                  Navigator.pop(context);
                                                  FFAppState()
                                                          .dailyIndexTracker =
                                                      FFAppState()
                                                              .dailyIndexTracker +
                                                          1;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Text(
                                      FFAppState().dailyIndexTracker.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 219.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 18.0, 4.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (FFAppState()
                                                  .DailyDevo11
                                                  .dailyTasks
                                                  .isNotEmpty)
                                                Text(
                                                  FFAppState()
                                                      .DailyDevo11
                                                      .dailyTasks
                                                      .elementAtOrNull(
                                                          FFAppState()
                                                              .dailyIndexTracker)!
                                                      .dailyDevotion
                                                      .devotionTitle
                                                      .maybeHandleOverflow(
                                                        maxChars: 25,
                                                        replacement: '…',
                                                      ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Joan',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              if (FFAppState()
                                                  .DailyDevo11
                                                  .dailyTasks
                                                  .isNotEmpty)
                                                Text(
                                                  FFAppState()
                                                      .DailyDevo11
                                                      .dailyTasks
                                                      .elementAtOrNull(
                                                          FFAppState()
                                                              .dailyIndexTracker)!
                                                      .dailyDevotion
                                                      .devotionBibleVerse
                                                      .maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              if (FFAppState()
                                                  .DailyDevo11
                                                  .dailyTasks
                                                  .isNotEmpty)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFAppState()
                                                        .DailyDevo11
                                                        .dailyTasks
                                                        .elementAtOrNull(
                                                            FFAppState()
                                                                .dailyIndexTracker)!
                                                        .dailyDevotion
                                                        .devotionExposition
                                                        .maybeHandleOverflow(
                                                          maxChars: 70,
                                                          replacement: '…',
                                                        ),
                                                    minFontSize: 11.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 16.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'dailyDevotion',
                                                      queryParameters: {
                                                        'devotion':
                                                            serializeParam(
                                                          FFAppState()
                                                              .DailyDevo11
                                                              .dailyTasks
                                                              .elementAtOrNull(
                                                                  FFAppState()
                                                                      .dailyIndexTracker)
                                                              ?.dailyDevotion,
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: 'Read now',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 45.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF282828),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.loadingDevotionState)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 219.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kimage2vector,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 45.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation']!),
                                            ),
                                            Text(
                                              'Ai is generating devotions \nthis will take some few seconds...',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  FFAppState()
                                      .DailyDevo11
                                      .dailyTasks
                                      .length
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 60.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.goNamed('growth_page');
                                    },
                                    text: 'View My Growth Plan',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .customColor8,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
