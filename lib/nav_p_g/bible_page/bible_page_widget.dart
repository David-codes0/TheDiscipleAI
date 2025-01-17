import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/bible_pagemennu/bible_pagemennu_widget.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bible_page_model.dart';
export 'bible_page_model.dart';

class BiblePageWidget extends StatefulWidget {
  const BiblePageWidget({
    super.key,
    this.fromReadScripture,
    bool? eveningORmorning,
  }) : this.eveningORmorning = eveningORmorning ?? false;

  final String? fromReadScripture;
  final bool eveningORmorning;

  @override
  State<BiblePageWidget> createState() => _BiblePageWidgetState();
}

class _BiblePageWidgetState extends State<BiblePageWidget>
    with TickerProviderStateMixin {
  late BiblePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiblePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.fromReadScripture != null &&
          widget!.fromReadScripture != '') {
        _model.bibleVersefromOtherPage =
            functions.scriptureCoverter(widget!.fromReadScripture);
        _model.chosenBook = functions
            .bibleVerserAndChapterNumber(_model.bibleVersefromOtherPage?.book);
        _model.chapterIndex = functions
                .convertTOinteger(_model.bibleVersefromOtherPage!.chapter) -
            1;
        safeSetState(() {});
        FFAppState().updateIQBIbleGetChapterStruct(
          (e) => e
            ..bookID = functions
                .bibleBookIdretriever(_model.bibleVersefromOtherPage?.book)
            ..chapterId = _model.bibleVersefromOtherPage?.chapter,
        );
        safeSetState(() {});
        FFAppState().biblePageIndex = 1;
        safeSetState(() {});
        await _model.pageViewController?.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        FFAppState().biblePageIndex = 0;
        safeSetState(() {});
        _model.chosenBook = null;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            end: Offset(3.0, 3.0),
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 109.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 62.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (widget!.fromReadScripture != null &&
                                    widget!.fromReadScripture != '') {
                                  context.safePop();
                                  FFAppState().biblePageIndex = 0;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().biblePageIndex = 0;
                                  safeSetState(() {});
                                }
                              },
                              child: Icon(
                                FFIcons.karrow,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 34.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Text(
                              'Bible',
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
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 14.0, 0.0),
                              child: InkWell(
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
                                          child: BiblePagemennuWidget(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  FFIcons.kmenu,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 34.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 12.0, 25.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor4,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Search the scripture',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 14.0, 0.0, 0.0),
                                suffixIcon: Icon(
                                  FFIcons.ksearch,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Builder(
                                builder: (context) {
                                  if (FFAppState().biblePageIndex == 0) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Text(
                                              'Book',
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
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21.0, 32.0, 24.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    onTap: () async {
                                                      _model.oldTestamentbool =
                                                          !_model
                                                              .oldTestamentbool;
                                                      safeSetState(() {});
                                                    },
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (_model
                                                            .oldTestamentbool) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Old Testament',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              Transform.rotate(
                                                                angle: 180.0 *
                                                                    (math.pi /
                                                                        180),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kimage2vector1,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Old Testament',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              Icon(
                                                                FFIcons
                                                                    .kimage2vector1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  if (_model.oldTestamentbool)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final oldList = functions
                                                                    .listOfOldandNewTestment(
                                                                        'old')
                                                                    ?.toList() ??
                                                                [];

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  oldList
                                                                      .length,
                                                                  (oldListIndex) {
                                                                final oldListItem =
                                                                    oldList[
                                                                        oldListIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.book =
                                                                          oldListItem;
                                                                      _model.chosenBook =
                                                                          functions
                                                                              .bibleVerserAndChapterNumber(oldListItem);
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .updateIQBIbleGetChapterStruct(
                                                                        (e) => e
                                                                          ..bookID =
                                                                              functions.bibleBookIdretriever(oldListItem),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      await _model
                                                                          .pageViewController
                                                                          ?.nextPage(
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      oldListItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.newTestamentbookBool =
                                                          !_model
                                                              .newTestamentbookBool;
                                                      safeSetState(() {});
                                                    },
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (_model
                                                            .newTestamentbookBool) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'New Testament',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              Transform.rotate(
                                                                angle: 180.0 *
                                                                    (math.pi /
                                                                        180),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kimage2vector1,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'New Testament',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              Icon(
                                                                FFIcons
                                                                    .kimage2vector1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  if (_model
                                                      .newTestamentbookBool)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final newList = functions
                                                                    .listOfOldandNewTestment(
                                                                        'newold')
                                                                    ?.toList() ??
                                                                [];

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  newList
                                                                      .length,
                                                                  (newListIndex) {
                                                                final newListItem =
                                                                    newList[
                                                                        newListIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.book =
                                                                          newListItem;
                                                                      _model.chosenBook =
                                                                          functions
                                                                              .bibleVerserAndChapterNumber(newListItem);
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .updateIQBIbleGetChapterStruct(
                                                                        (e) => e
                                                                          ..bookID =
                                                                              functions.bibleBookIdretriever(newListItem),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      await _model
                                                                          .pageViewController
                                                                          ?.nextPage(
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      newListItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (((_model.chapterIndex!) + 1) >
                                                1)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.chapterIndex =
                                                      _model.chapterIndex! + -1;
                                                  _model.valueRange =
                                                      'one to end';
                                                  _model.bibleVersefromOtherPage =
                                                      GrowPlanBibleReadingStruct(
                                                    chapter:
                                                        ((_model.chapterIndex!) +
                                                                1)
                                                            .toString(),
                                                    book:
                                                        _model.chosenBook?.book,
                                                    verses: _model.valueRange,
                                                  );
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateIQBIbleGetChapterStruct(
                                                    (e) => e
                                                      ..index = 0
                                                      ..chapterId =
                                                          ((_model.chapterIndex!) +
                                                                  1)
                                                              .toString(),
                                                  );
                                                  safeSetState(() {});
                                                  _model.apiResultt5bCopy5 =
                                                      await IQBibleAPIGroup
                                                          .getChapterCall
                                                          .call(
                                                    bookId: FFAppState()
                                                        .IQBIbleGetChapter
                                                        .bookID,
                                                    chapterId: FFAppState()
                                                        .IQBIbleGetChapter
                                                        .chapterId,
                                                    versionId: FFAppState()
                                                        .IQBIbleGetChapter
                                                        .versionId,
                                                  );

                                                  if ((_model.apiResultt5bCopy5
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState()
                                                        .updateIQBIbleGetChapterStruct(
                                                      (e) => e
                                                        ..verseResult =
                                                            IQBibleAPIGroup
                                                                .getChapterCall
                                                                .versesList(
                                                                  (_model.apiResultt5bCopy5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                .toList(),
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 28.0,
                                                  height: 28.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.karrow,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '${_model.chosenBook?.book} ${((_model.chapterIndex!) + 1).toString()} ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Joan',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '(KJV)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Joan',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (((_model.chapterIndex!) + 1) <
                                                _model.chosenBook!.chapters
                                                    .length)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 28.0,
                                                  height: 28.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                  ),
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
                                                      _model.chapterIndex =
                                                          _model.chapterIndex! +
                                                              1;
                                                      _model.valueRange =
                                                          'one to end';
                                                      _model.bibleVersefromOtherPage =
                                                          GrowPlanBibleReadingStruct(
                                                        chapter:
                                                            ((_model.chapterIndex!) +
                                                                    1)
                                                                .toString(),
                                                        book: _model
                                                            .chosenBook?.book,
                                                        verses:
                                                            _model.valueRange,
                                                      );
                                                      _model.showLoadingState =
                                                          true;
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .updateIQBIbleGetChapterStruct(
                                                        (e) => e
                                                          ..index = 0
                                                          ..chapterId =
                                                              ((_model.chapterIndex!) +
                                                                      1)
                                                                  .toString(),
                                                      );
                                                      safeSetState(() {});
                                                      _model.apiResultt5bh =
                                                          await IQBibleAPIGroup
                                                              .getChapterCall
                                                              .call(
                                                        bookId: FFAppState()
                                                            .IQBIbleGetChapter
                                                            .bookID,
                                                        chapterId: FFAppState()
                                                            .IQBIbleGetChapter
                                                            .chapterId,
                                                        versionId: FFAppState()
                                                            .IQBIbleGetChapter
                                                            .versionId,
                                                      );

                                                      if ((_model.apiResultt5bh
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .updateIQBIbleGetChapterStruct(
                                                          (e) => e
                                                            ..verseResult =
                                                                IQBibleAPIGroup
                                                                    .getChapterCall
                                                                    .versesList(
                                                                      (_model.apiResultt5bh
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .toList(),
                                                        );
                                                        safeSetState(() {});
                                                        _model.showLoadingState =
                                                            false;
                                                        safeSetState(() {});
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              (_model.apiResultt5bh
                                                                          ?.jsonBody ??
                                                                      '')
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: Transform.rotate(
                                                      angle: 180.0 *
                                                          (math.pi / 180),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          FFIcons.karrow,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.58,
                                          child: custom_widgets.BibleVerseList(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.58,
                                            versesList: FFAppState()
                                                .IQBIbleGetChapter
                                                .verseResult,
                                            index: FFAppState()
                                                .IQBIbleGetChapter
                                                .index,
                                            bibleRef: widget!.fromReadScripture,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await _model.pageViewController
                                                ?.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Icon(
                                            FFIcons.karrow,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 34.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Chapter',
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
                                      Opacity(
                                        opacity: 0.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.karrow,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 34.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 32.0, 24.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final chapterlist = _model
                                                .chosenBook?.chapters
                                                ?.toList() ??
                                            [];

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 6,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: chapterlist.length,
                                          itemBuilder:
                                              (context, chapterlistIndex) {
                                            final chapterlistItem =
                                                chapterlist[chapterlistIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.chapterIndex =
                                                    chapterlistIndex;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateIQBIbleGetChapterStruct(
                                                  (e) => e
                                                    ..chapterId =
                                                        (chapterlistIndex + 1)
                                                            .toString(),
                                                );
                                                safeSetState(() {});
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF1C1E1F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.25),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  (chapterlistIndex + 1)
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await _model.pageViewController
                                                    ?.previousPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Icon(
                                                FFIcons.karrow,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 34.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Verse',
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
                                          Opacity(
                                            opacity: 0.0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                FFIcons.karrow,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 34.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            21.0, 32.0, 24.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final verselist = functions
                                                    .versesList(
                                                        _model.chosenBook
                                                            ?.chapters
                                                            ?.toList(),
                                                        _model.chapterIndex)
                                                    ?.toList() ??
                                                [];

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 6,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount: verselist.length,
                                              itemBuilder:
                                                  (context, verselistIndex) {
                                                final verselistItem =
                                                    verselist[verselistIndex];
                                                return Builder(
                                                  builder: (context) {
                                                    if (_model.rangeList
                                                        .contains(
                                                            verselistItem)) {
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model
                                                              .removeFromRangeList(
                                                                  verselistItem);
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 45.0,
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.25),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            (verselistIndex + 1)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                              .biblePageIndex = 1;
                                                          FFAppState()
                                                              .updateIQBIbleGetChapterStruct(
                                                            (e) => e
                                                              ..index =
                                                                  verselistIndex,
                                                          );
                                                          safeSetState(() {});
                                                          _model.showLoadingState =
                                                              true;
                                                          _model.bookPageRead =
                                                              true;
                                                          safeSetState(() {});
                                                          _model.apiResultt5b1 =
                                                              await IQBibleAPIGroup
                                                                  .getChapterCall
                                                                  .call(
                                                            bookId: FFAppState()
                                                                .IQBIbleGetChapter
                                                                .bookID,
                                                            chapterId: FFAppState()
                                                                .IQBIbleGetChapter
                                                                .chapterId,
                                                            versionId: FFAppState()
                                                                .IQBIbleGetChapter
                                                                .versionId,
                                                          );

                                                          if ((_model
                                                                  .apiResultt5b1
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                .updateIQBIbleGetChapterStruct(
                                                              (e) => e
                                                                ..verseResult =
                                                                    IQBibleAPIGroup
                                                                        .getChapterCall
                                                                        .versesList(
                                                                          (_model.apiResultt5b1?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                        .toList(),
                                                            );
                                                            safeSetState(() {});
                                                          }
                                                          _model.showLoadingState =
                                                              false;
                                                          _model.bookPageRead =
                                                              false;
                                                          safeSetState(() {});
                                                          await _model
                                                              .pageViewController
                                                              ?.animateToPage(
                                                            0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 45.0,
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.25),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            (verselistIndex + 1)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
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
              if (_model.showLoadingState)
                Align(
                  alignment: AlignmentDirectional(-0.15, 0.14),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x18000000),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        FFIcons.kimage2vector,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                    ),
                  ),
                ),
              if (widget!.fromReadScripture != null &&
                  widget!.fromReadScripture != '')
                Align(
                  alignment: AlignmentDirectional(0.93, 0.96),
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        if (widget!.eveningORmorning) {
                          FFAppState().updateGrowTrackerStruct(
                            (e) => e
                              ..updateGrowtracker(
                                (e) => e[FFAppState().dailyIndexTracker]
                                  ..scriptureReadingBool = true,
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
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: CoachCommentaryDialogWidget(
                                    buttonLabel: 'Back',
                                    commentary:
                                        functions.coachQuestionResponse(13, ''),
                                    buttonAction: () async {
                                      context.safePop();

                                      context.pushNamed('growth_page');
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          FFAppState().updateGrowTrackerStruct(
                            (e) => e
                              ..updateGrowtracker(
                                (e) => e[FFAppState().dailyIndexTracker]
                                  ..eveningScripture = true,
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
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: CoachCommentaryDialogWidget(
                                    buttonLabel: 'Back',
                                    commentary:
                                        functions.coachQuestionResponse(13, ''),
                                    buttonAction: () async {
                                      context.safePop();

                                      context.pushNamed('growth_page');
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      text: 'Mark as read',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor6,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
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
