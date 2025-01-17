import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/actionablestep_dialog/actionablestep_dialog_widget.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/components/growth_menu/growth_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'growth_page_model.dart';
export 'growth_page_model.dart';

class GrowthPageWidget extends StatefulWidget {
  const GrowthPageWidget({super.key});

  @override
  State<GrowthPageWidget> createState() => _GrowthPageWidgetState();
}

class _GrowthPageWidgetState extends State<GrowthPageWidget>
    with TickerProviderStateMixin {
  late GrowthPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrowthPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: CoachCommentaryDialogWidget(
                buttonLabel: 'Ok, thanks',
                commentary:
                    functions.coachQuestionResponse(12, FFAppState().name),
                buttonAction: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      );

      if ((FFAppState().growTracker.growtracker.length < 7) &&
          (FFAppState().Weekplan11.weeklyPlan.weeklyGoal != null &&
              FFAppState().Weekplan11.weeklyPlan.weeklyGoal != '')) {
        while (FFAppState().growTracker.growtracker.length <=
            (FFAppState().dailyIndexTracker + 1)) {
          _model.loadingStateForDailyPlan11 = true;
          safeSetState(() {});
          _model.apiResult8jb = await DailyPlanCall.call(
            topic: FFAppState().Weekplan11.weeklyPlan.weeklyGoal,
          );

          if ((_model.apiResult8jb?.succeeded ?? true)) {
            FFAppState().dailyPlan11 = functions.dailyplan11Adder(
                DailyPlanCall.plan(
                  (_model.apiResult8jb?.jsonBody ?? ''),
                )!,
                FFAppState().dailyPlan11)!;
            FFAppState().growTracker = functions.goalStructAdder(
                DailyPlanCall.plan(
                  (_model.apiResult8jb?.jsonBody ?? ''),
                )?.dailyTasks?.toList(),
                FFAppState().growTracker)!;
            safeSetState(() {});
            _model.loadingStateForDailyPlan11 = false;
            safeSetState(() {});
          }
        }
        if (FFAppState().growTracker.growtracker.length >
            (FFAppState().dailyIndexTracker + 1)) {
          if (FFAppState().growTracker.growtracker.length < 7) {
            _model.apiResult8jb5 = await DailyPlanCall.call(
              topic: FFAppState().Weekplan11.weeklyPlan.weeklyGoal,
            );

            if ((_model.apiResult8jb5?.succeeded ?? true)) {
              FFAppState().dailyPlan11 = functions.dailyplan11Adder(
                  DailyPlanCall.plan(
                    (_model.apiResult8jb5?.jsonBody ?? ''),
                  )!,
                  FFAppState().dailyPlan11)!;
              FFAppState().growTracker = functions.goalStructAdder(
                  DailyPlanCall.plan(
                    (_model.apiResult8jb5?.jsonBody ?? ''),
                  )?.dailyTasks?.toList(),
                  FFAppState().growTracker)!;
              safeSetState(() {});
              _model.loadingStateForDailyPlan11 = false;
              safeSetState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'failed to connect',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            }
          }
        }
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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

    return Builder(
      builder: (context) => GestureDetector(
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 62.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().updateGrowTrackerStruct(
                                      (e) => e
                                        ..updateGrowtracker(
                                          (e) =>
                                              e[FFAppState().dailyIndexTracker]
                                                ..scriptureReadingBool = false
                                                ..prayerPromptBool = false
                                                ..reflectionQuestionBool = false
                                                ..eveningReflection = false
                                                ..eveningAction = false
                                                ..morningAction = false
                                                ..eveningScripture = false
                                                ..eveningprayer = false,
                                        ),
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    'Growth',
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
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showAlignedDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              -1.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: GrowthMenuWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    FFIcons.kmenu,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                labelColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                unselectedLabelColor: Colors.white,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderWidth: 0.0,
                                borderRadius: 59.0,
                                elevation: 0.0,
                                buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                padding: EdgeInsets.all(24.0),
                                tabs: [
                                  Tab(
                                    text: 'Daily Tasks',
                                  ),
                                  Tab(
                                    text: 'Weekly Overview',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 32.0,
                                                          24.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 160.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF171819),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Container(
                                                      height: 162.0,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 162.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0x13000000),
                                                                      Color(
                                                                          0xFF3E3E3E)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.01,
                                                                          0.68),
                                                                  child: Text(
                                                                    FFAppState()
                                                                            .dailyPlan11
                                                                            .dailyTasks
                                                                            .isNotEmpty
                                                                        ? FFAppState()
                                                                            .dailyPlan11
                                                                            .dailyTasks
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .dailyChristianQuote
                                                                            .quoteAuthor
                                                                        : ' ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -0.07),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 47.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    AutoSizeText(
                                                                  FFAppState()
                                                                          .dailyPlan11
                                                                          .dailyTasks
                                                                          .isNotEmpty
                                                                      ? FFAppState()
                                                                          .dailyPlan11
                                                                          .dailyTasks
                                                                          .elementAtOrNull(
                                                                              FFAppState().dailyIndexTracker)!
                                                                          .dailyChristianQuote
                                                                          .quote
                                                                      : ' ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  minFontSize:
                                                                      11.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.88,
                                                                    -3.6),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\"',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Oswald',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          77.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.96, 3.14),
                                                            child: Text(
                                                              '\"',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Oswald',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        77.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 32.0,
                                                          24.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 122.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF171819),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        35.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Daily Progress Bar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${((functions.dailyProgessBarCal(FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker))!) * 100).toString()}% Done',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0x9EFFFFFF),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          LinearPercentIndicator(
                                                            percent: functions
                                                                .dailyProgessBarCal(FFAppState()
                                                                    .growTracker
                                                                    .growtracker
                                                                    .elementAtOrNull(
                                                                        FFAppState()
                                                                            .dailyIndexTracker))!,
                                                            lineHeight: 10.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF1C1E1F),
                                                            barRadius:
                                                                Radius.circular(
                                                                    20.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 40.0, 0.0,
                                                          16.0),
                                                  child: Text(
                                                    'Today’s Task',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 0.0, 16.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (_model
                                                          .uncompletedTaskBool) {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.uncompletedTaskBool =
                                                                false;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 155.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1000.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Uncompleted',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Transform
                                                                    .rotate(
                                                                  angle: 270.0 *
                                                                      (math.pi /
                                                                          180),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .karrow,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.uncompletedTaskBool =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 241.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1000.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Uncompleted',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Transform
                                                                    .rotate(
                                                                  angle: 180.0 *
                                                                      (math.pi /
                                                                          180),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .karrow,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                if (_model.uncompletedTaskBool)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    32.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .morningRoutine) {
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: !(!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState()
                                                                                  .dailyIndexTracker)!
                                                                              .prayerPromptBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState()
                                                                                  .dailyIndexTracker)!
                                                                              .reflectionQuestionBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                              .morningAction)
                                                                      ? 400.0
                                                                      : 729.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF1D1F23),
                                                                      width:
                                                                          1.5,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (!(!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState()
                                                                                  .dailyIndexTracker)!
                                                                              .prayerPromptBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState()
                                                                                  .dailyIndexTracker)!
                                                                              .reflectionQuestionBool ||
                                                                          !FFAppState()
                                                                              .growTracker
                                                                              .growtracker
                                                                              .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                              .morningAction)) {
                                                                        return Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 32.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.morningRoutine = !_model.morningRoutine;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Morning Routine',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                        Transform.rotate(
                                                                                          angle: 180.0 * (math.pi / 180),
                                                                                          child: Icon(
                                                                                            FFIcons.kimage2vector1,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'All Task Completed 🥳 !',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 22.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 10.0,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              24.0,
                                                                              16.0,
                                                                              32.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.morningRoutine = true;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Morning Routine',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                        Icon(
                                                                                          FFIcons.kimage2vector1,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.radio_button_off_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Scripture Reading',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)?.dailyTask?.morningRoutine?.scriptureReading : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 35,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                              (e) => e
                                                                                                                ..bookID = functions.bibleBookIdretriever(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.scriptureReading : ' ')!)).book)
                                                                                                                ..chapterId = functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.scriptureReading : ' ')!)).chapter
                                                                                                                ..versionId = FFAppState().IQBIbleGetChapter.versionId
                                                                                                                ..index = functions.convertTOinteger(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.scriptureReading : ' ')!)).verses),
                                                                                                            );
                                                                                                            safeSetState(() {});
                                                                                                            _model.apiResultej0 = await IQBibleAPIGroup.getChapterCall.call(
                                                                                                              bookId: FFAppState().IQBIbleGetChapter.bookID,
                                                                                                              chapterId: FFAppState().IQBIbleGetChapter.chapterId,
                                                                                                              versionId: FFAppState().IQBIbleGetChapter.versionId,
                                                                                                            );

                                                                                                            if ((_model.apiResultej0?.succeeded ?? true)) {
                                                                                                              FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                                (e) => e
                                                                                                                  ..verseResult = IQBibleAPIGroup.getChapterCall
                                                                                                                      .versesList(
                                                                                                                        (_model.apiResultej0?.jsonBody ?? ''),
                                                                                                                      )!
                                                                                                                      .toList(),
                                                                                                              );
                                                                                                              safeSetState(() {});

                                                                                                              context.goNamed(
                                                                                                                'bible_page',
                                                                                                                queryParameters: {
                                                                                                                  'fromReadScripture': serializeParam(
                                                                                                                    functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.scriptureReading : ' ')!),
                                                                                                                    ParamType.String,
                                                                                                                  ),
                                                                                                                  'eveningORmorning': serializeParam(
                                                                                                                    true,
                                                                                                                    ParamType.bool,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Errror',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                            }

                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          text: 'Read now',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.prayerPromptBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 202.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF1C1E1F),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.radio_button_off,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Prayer',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                            child: Text(
                                                                                                              functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.prayerPrompt : ' ')!.maybeHandleOverflow(
                                                                                                                    maxChars: 75,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
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
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(
                                                                                                  'daily_prayer_page',
                                                                                                  queryParameters: {
                                                                                                    'prayer': serializeParam(
                                                                                                      functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.prayerPrompt : ' '),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'featureVerse': serializeParam(
                                                                                                      FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.scriptureReading : ' ',
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'eveningORMorning': serializeParam(
                                                                                                      true,
                                                                                                      ParamType.bool,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              text: 'Proceed',
                                                                                              options: FFButtonOptions(
                                                                                                width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: Color(0xFF282828),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.reflectionQuestionBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 202.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF1C1E1F),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.radio_button_off_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Reflection Question',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                            child: Text(
                                                                                                              functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.reflectionQuestion : ' ')!.maybeHandleOverflow(
                                                                                                                    maxChars: 75,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              context.pushNamed(
                                                                                                                'createReflection',
                                                                                                                queryParameters: {
                                                                                                                  'weeklyFocus': serializeParam(
                                                                                                                    (currentUserDocument?.onboardingQ?.toList() ?? []).elementAtOrNull(11)?.response,
                                                                                                                    ParamType.String,
                                                                                                                  ),
                                                                                                                  'reflectionQuestion': serializeParam(
                                                                                                                    functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.reflectionQuestion : ' '),
                                                                                                                    ParamType.String,
                                                                                                                  ),
                                                                                                                  'eveningORMorning': serializeParam(
                                                                                                                    true,
                                                                                                                    ParamType.bool,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            },
                                                                                                            text: 'Add Reflection',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: Color(0xFF282828),
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: Colors.white,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                              elevation: 0.0,
                                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.morningAction && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF1C1E1F),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.radio_button_off_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Actionable Step',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: Text(
                                                                                                              functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.actionableStep : ' ')!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Builder(
                                                                                                            builder: (context) => FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                await showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (dialogContext) {
                                                                                                                    return Dialog(
                                                                                                                      elevation: 0,
                                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                      child: GestureDetector(
                                                                                                                        onTap: () {
                                                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                        },
                                                                                                                        child: ActionablestepDialogWidget(
                                                                                                                          eveningOrMorning: true,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              },
                                                                                                              text: 'Mark as done',
                                                                                                              options: FFButtonOptions(
                                                                                                                width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                                height: 40.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: Color(0xFF282828),
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: Colors.white,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderRadius: BorderRadius.circular(10.0),
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
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.morningRoutine =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Morning Routine',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Transform.rotate(
                                                                                angle: 180.0 * (math.pi / 180),
                                                                                child: Icon(
                                                                                  FFIcons.kimage2vector1,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
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
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    32.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .eveningReflection) {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: !(!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningReflection ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningAction ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningprayer ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .eveningScripture)
                                                                    ? 400.0
                                                                    : 729.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (!(!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningScripture ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningprayer ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningReflection ||
                                                                        !FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .eveningAction)) {
                                                                      return Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                24.0,
                                                                                16.0,
                                                                                32.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.eveningReflection = !_model.eveningReflection;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Evening Routine',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Transform.rotate(
                                                                                        angle: 180.0 * (math.pi / 180),
                                                                                        child: Icon(
                                                                                          FFIcons.kimage2vector1,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'All Task Completed 🥳 !',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 10.0,
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            16.0,
                                                                            32.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.eveningReflection = !_model.eveningReflection;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Evening Reflection',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.kimage2vector1,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningScripture && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.radio_button_off_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Scripture Reading',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 35,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                              (e) => e
                                                                                                                ..bookID = functions.bibleBookIdretriever(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).book)
                                                                                                                ..chapterId = functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).chapter
                                                                                                                ..versionId = FFAppState().IQBIbleGetChapter.versionId
                                                                                                                ..index = functions.convertTOinteger(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).verses),
                                                                                                            );
                                                                                                            safeSetState(() {});
                                                                                                            _model.apiResultej03 = await IQBibleAPIGroup.getChapterCall.call(
                                                                                                              bookId: FFAppState().IQBIbleGetChapter.bookID,
                                                                                                              chapterId: FFAppState().IQBIbleGetChapter.chapterId,
                                                                                                              versionId: FFAppState().IQBIbleGetChapter.versionId,
                                                                                                            );

                                                                                                            if ((_model.apiResultej03?.succeeded ?? true)) {
                                                                                                              FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                                (e) => e
                                                                                                                  ..verseResult = IQBibleAPIGroup.getChapterCall
                                                                                                                      .versesList(
                                                                                                                        (_model.apiResultej03?.jsonBody ?? ''),
                                                                                                                      )!
                                                                                                                      .toList(),
                                                                                                              );
                                                                                                              safeSetState(() {});

                                                                                                              context.goNamed(
                                                                                                                'bible_page',
                                                                                                                queryParameters: {
                                                                                                                  'fromReadScripture': serializeParam(
                                                                                                                    functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!),
                                                                                                                    ParamType.String,
                                                                                                                  ),
                                                                                                                  'eveningORmorning': serializeParam(
                                                                                                                    false,
                                                                                                                    ParamType.bool,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Errror',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                            }

                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          text: 'Read now',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningprayer && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.radio_button_off,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Prayer',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.prayerPrompt : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            context.pushNamed(
                                                                                                              'daily_prayer_page',
                                                                                                              queryParameters: {
                                                                                                                'prayer': serializeParam(
                                                                                                                  functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.prayerPrompt : ' '),
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'featureVerse': serializeParam(
                                                                                                                  FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ',
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'eveningORMorning': serializeParam(
                                                                                                                  false,
                                                                                                                  ParamType.bool,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                          text: 'Proceed',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningReflection && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.radio_button_off_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Reflection Question',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.reflectionQuestion : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            context.pushNamed(
                                                                                                              'createReflection',
                                                                                                              queryParameters: {
                                                                                                                'weeklyFocus': serializeParam(
                                                                                                                  (currentUserDocument?.onboardingQ?.toList() ?? []).elementAtOrNull(11)?.response,
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'reflectionQuestion': serializeParam(
                                                                                                                  functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.reflectionQuestion : ' '),
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'eveningORMorning': serializeParam(
                                                                                                                  false,
                                                                                                                  ParamType.bool,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                          text: 'Add Reflection',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (!FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningAction && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.radio_button_off_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Actionable Step',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.actionableStep : ' ')!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Builder(
                                                                                                          builder: (context) => FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (dialogContext) {
                                                                                                                  return Dialog(
                                                                                                                    elevation: 0,
                                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                    child: GestureDetector(
                                                                                                                      onTap: () {
                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                      },
                                                                                                                      child: ActionablestepDialogWidget(
                                                                                                                        eveningOrMorning: false,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                            text: 'Mark as done',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: Color(0xFF282828),
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: Colors.white,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                              elevation: 0.0,
                                                                                                              borderRadius: BorderRadius.circular(10.0),
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.eveningReflection =
                                                                                !_model.eveningReflection;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Evening Reflection',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Transform.rotate(
                                                                                angle: 180.0 * (math.pi / 180),
                                                                                child: Icon(
                                                                                  FFIcons.kimage2vector1,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
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
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 0.0, 16.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.completedTaskBool =
                                                          !_model
                                                              .completedTaskBool;
                                                      safeSetState(() {});
                                                    },
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (_model
                                                            .completedTaskBool) {
                                                          return Container(
                                                            width: 155.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1000.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Completed',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Transform
                                                                    .rotate(
                                                                  angle: 270.0 *
                                                                      (math.pi /
                                                                          180),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .karrow,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 241.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1000.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Completed',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Transform
                                                                    .rotate(
                                                                  angle: 180.0 *
                                                                      (math.pi /
                                                                          180),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .karrow,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                if (_model.completedTaskBool)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    32.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .morningRoutineConplete) {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: !(FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .prayerPromptBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .reflectionQuestionBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .morningAction)
                                                                    ? 300.0
                                                                    : 729.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (!(FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .prayerPromptBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .reflectionQuestionBool ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .morningAction)) {
                                                                      return Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                24.0,
                                                                                16.0,
                                                                                32.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.morningRoutineConplete = !_model.morningRoutineConplete;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Morning Routine',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Icon(
                                                                                        FFIcons.kimage2vector1,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'No Task Completed yet !',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 10.0,
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            16.0,
                                                                            32.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.morningRoutineConplete = !_model.morningRoutineConplete;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Morning Routine',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.kimage2vector1,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.scriptureReadingBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Scripture Reading',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)?.dailyTask?.morningRoutine?.scriptureReading : ' ')!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.prayerPromptBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Prayer',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.prayerPrompt : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.reflectionQuestionBool && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Reflection Question',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.reflectionQuestion : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.morningAction && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Actionable Step',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.morningRoutine?.actionableStep : ' ')!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.morningRoutineConplete =
                                                                                !_model.morningRoutineConplete;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Morning Routine',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Transform.rotate(
                                                                                angle: 180.0 * (math.pi / 180),
                                                                                child: Icon(
                                                                                  FFIcons.kimage2vector1,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
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
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    32.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .eveningReflectionComplete) {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: !(FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningReflection ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningAction ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningprayer ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .eveningScripture)
                                                                    ? 300.0
                                                                    : 729.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (!(FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningReflection ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningAction ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState()
                                                                                .dailyIndexTracker)!
                                                                            .eveningprayer ||
                                                                        FFAppState()
                                                                            .growTracker
                                                                            .growtracker
                                                                            .elementAtOrNull(FFAppState().dailyIndexTracker)!
                                                                            .eveningScripture)) {
                                                                      return Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                24.0,
                                                                                16.0,
                                                                                32.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.eveningReflectionComplete = !_model.eveningReflectionComplete;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Evening Reflection',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Icon(
                                                                                        FFIcons.kimage2vector1,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'No Task Completed yet !',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            16.0,
                                                                            32.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.eveningReflectionComplete = !_model.eveningReflectionComplete;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Evening Reflection',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.kimage2vector1,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningScripture && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Scripture Reading',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                              (e) => e
                                                                                                                ..bookID = functions.bibleBookIdretriever(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).book)
                                                                                                                ..chapterId = functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).chapter
                                                                                                                ..versionId = FFAppState().IQBIbleGetChapter.versionId
                                                                                                                ..index = functions.convertTOinteger(functions.scriptureCoverter(functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!)).verses),
                                                                                                            );
                                                                                                            safeSetState(() {});
                                                                                                            _model.apiResultej036 = await IQBibleAPIGroup.getChapterCall.call(
                                                                                                              bookId: FFAppState().IQBIbleGetChapter.bookID,
                                                                                                              chapterId: FFAppState().IQBIbleGetChapter.chapterId,
                                                                                                              versionId: FFAppState().IQBIbleGetChapter.versionId,
                                                                                                            );

                                                                                                            if ((_model.apiResultej036?.succeeded ?? true)) {
                                                                                                              FFAppState().updateIQBIbleGetChapterStruct(
                                                                                                                (e) => e
                                                                                                                  ..verseResult = IQBibleAPIGroup.getChapterCall
                                                                                                                      .versesList(
                                                                                                                        (_model.apiResultej036?.jsonBody ?? ''),
                                                                                                                      )!
                                                                                                                      .toList(),
                                                                                                              );
                                                                                                              safeSetState(() {});

                                                                                                              context.goNamed(
                                                                                                                'bible_page',
                                                                                                                queryParameters: {
                                                                                                                  'fromReadScripture': serializeParam(
                                                                                                                    functions.bibleReferenceFilter(functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ')!),
                                                                                                                    ParamType.String,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Errror',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                            }

                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          text: 'Read now',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningprayer && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Prayer',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.prayerPrompt : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            context.pushNamed(
                                                                                                              'daily_prayer_page',
                                                                                                              queryParameters: {
                                                                                                                'prayer': serializeParam(
                                                                                                                  functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.prayerPrompt : ' '),
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'featureVerse': serializeParam(
                                                                                                                  FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.scriptureReading : ' ',
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                          text: 'Proceed',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: Color(0xFF282828),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningReflection && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 202.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Reflection Question',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.reflectionQuestion : ' ')!.maybeHandleOverflow(
                                                                                                                  maxChars: 75,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (FFAppState().growTracker.growtracker.elementAtOrNull(FFAppState().dailyIndexTracker)!.eveningAction && (FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1)))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF1C1E1F),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Actionable Step',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            functions.simpleString(FFAppState().growTracker.growtracker.length >= (FFAppState().dailyIndexTracker + 1) ? FFAppState().dailyPlan11.dailyTasks.elementAtOrNull(FFAppState().dailyIndexTracker)?.eveningReflection?.actionableStep : ' ')!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF1D1F23),
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.eveningReflectionComplete =
                                                                                !_model.eveningReflectionComplete;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Evening Reflection',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Transform.rotate(
                                                                                angle: 180.0 * (math.pi / 180),
                                                                                child: Icon(
                                                                                  FFIcons.kimage2vector1,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
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
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          23.0, 0.0, 23.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Performance Dashboard',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 32.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 337.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Color(0xFF1D1F23),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Weekly Goal',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Color(0xFF1D1F23),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 32.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              FFAppState().Weekplan11.weeklyPlan.weeklyGoal !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .Weekplan11
                                                                              .weeklyPlan
                                                                              .weeklyGoal !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .Weekplan11
                                                                      .weeklyPlan
                                                                      .weeklyGoal
                                                                  : ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF1C1E1F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        24.0,
                                                                        16.0,
                                                                        24.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Objective Summary',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFAppState().Weekplan11.weeklyPlan.objectiveSummary,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 184.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF1C1E1F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        24.0,
                                                                        16.0,
                                                                        24.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Reflection Question',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              if (FFAppState().Weekplan11.weeklyPlan.reflectionQuestion != null && FFAppState().Weekplan11.weeklyPlan.reflectionQuestion != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                  child: Text(
                                                                                    FFAppState().Weekplan11.weeklyPlan.reflectionQuestion.maybeHandleOverflow(
                                                                                          maxChars: 30,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontStyle: FontStyle.italic,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  context.pushNamed(
                                                                                    'createReflection',
                                                                                    queryParameters: {
                                                                                      'weeklyFocus': serializeParam(
                                                                                        (currentUserDocument?.onboardingQ?.toList() ?? []).elementAtOrNull(11)?.response,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'reflectionQuestion': serializeParam(
                                                                                        FFAppState().Weekplan11.weeklyPlan.reflectionQuestion,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                text: 'Add Reflection',
                                                                                options: FFButtonOptions(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF282828),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Text(
                                                'Badges',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Welldone, You earned 2 new badges this week',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Container(
                                                width: 345.0,
                                                height: 184.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Color(0xFF1D1F23),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 32.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 104.0,
                                                                height: 104.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/Frame_542_(2).png',
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Prayer Warrior',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 104.0,
                                                                height: 104.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/Frame_541.png',
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Reflection Master',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 104.0,
                                                                height: 104.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/Frame_541.png',
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Reflection Master',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Text(
                                                'Weekly Goal',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Container(
                                                width: 345.0,
                                                height: 422.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Color(0xFF1D1F23),
                                                    width: 1.5,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.loadingStateForDailyPlan11)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0xC1171819),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Icon(
                                  FFIcons.kimage2vector,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 70.0,
                                ).animateOnPageLoad(
                                    animationsMap['iconOnPageLoadAnimation']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().growTracker =
                                        GrowthTrackerMajorStruct();
                                    FFAppState().dailyPlan11 =
                                        DailyPlan11Struct();
                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    'Ai is generating daily \ntask this wiil take some few seconds......',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
