import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/coach_commentary_dialog/coach_commentary_dialog_widget.dart';
import '/components/multi_selquestion_component/multi_selquestion_component_widget.dart';
import '/components/question_component/question_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other_option_texr_input/other_option_texr_input_widget.dart';
import '/pages/question_component_alphabet_v/question_component_alphabet_v_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_question_model.dart';
export 'onboarding_question_model.dart';

class OnboardingQuestionWidget extends StatefulWidget {
  const OnboardingQuestionWidget({super.key});

  @override
  State<OnboardingQuestionWidget> createState() =>
      _OnboardingQuestionWidgetState();
}

class _OnboardingQuestionWidgetState extends State<OnboardingQuestionWidget> {
  late OnboardingQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingQuestionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listOfCountry = await actions.countrycityList();
      _model.countryList =
          _model.listOfCountry!.toList().cast<CountryWidgetListStruct>();
      safeSetState(() {});
    });

    _model.fullnameTextController ??= TextEditingController();
    _model.fullnameFocusNode ??= FocusNode();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 109.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.listOfindexPage.length != 1) {
                                    _model.removeFromListOfindexPage(
                                        _model.pageindexQ!);
                                    safeSetState(() {});
                                  }
                                  _model.pageindexQ = _model.pageindexQ! +
                                      (_model.pageindexQ != 0 ? -1 : 0);
                                  safeSetState(() {});
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (_model.pageViewCurrentIndex == 0) {
                                    return Text(
                                      'Personal Introduction',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 1) {
                                    return Text(
                                      'Lifestyle & Daily Routine',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 2) {
                                    return Text(
                                      'Spiritual Practices and \nCurrent Habits',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 3) {
                                    return Text(
                                      'Emotional and Mental \nWell-Being',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 4) {
                                    return Text(
                                      'Life’s Challenges and \nCurrent Focus',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 5) {
                                    return Text(
                                      'Goal Setting and \nAspirations',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else if (_model.pageViewCurrentIndex == 6) {
                                    return Text(
                                      'Goal Setting and \nAspirations',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  } else {
                                    return Text(
                                      'Final Touches',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  }
                                },
                              ),
                              Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.76),
                        child: Container(
                          height: 24.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.2, 0.0, 25.2, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(0)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(1)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(2)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(3)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(4)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(5)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(6)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: _model.listOfindexPage.contains(7)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .customColor6,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.2),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.78,
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              onPageChanged: (_) => safeSetState(() {}),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 5.0, 24.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '1. Full name',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 12.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 42.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x254A4A4A),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .fullnameTextController,
                                                          focusNode: _model
                                                              .fullnameFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: false,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText: 'Name',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0x7D57636C),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .fullnameTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '2. Age range',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0,
                                                                12.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 42.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x254A4A4A),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownAgeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.dropDownAgeValue ??=
                                                              '18-24',
                                                        ),
                                                        options: [
                                                          '18-24',
                                                          ' 25-34',
                                                          ' 35-44',
                                                          '44 or more'
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.dropDownAgeValue =
                                                                    val),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
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
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText: '18-24',
                                                        icon: Icon(
                                                          FFIcons
                                                              .kimage2vector1,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '3. Country',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0,
                                                                12.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 42.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x254A4A4A),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            CountriesCitiesCall
                                                                .call(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final dropDowncountryCountriesCitiesResponse =
                                                              snapshot.data!;

                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .dropDowncountryValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options:
                                                                CountriesCitiesCall
                                                                        .countrylist(
                                                              dropDowncountryCountriesCitiesResponse
                                                                  .jsonBody,
                                                            )!
                                                                    .data
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDowncountryValue =
                                                                      val);
                                                              _model.selsectedCountry =
                                                                  _model
                                                                      .dropDowncountryValue;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
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
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            hintText:
                                                                'Select Country',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderWidth: 0.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '4. State',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  if (_model.selsectedCountry !=
                                                          null &&
                                                      _model.selsectedCountry !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 42.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0x254A4A4A),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              CountriesCitiesCall
                                                                  .call(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final dropDownCityCountriesCitiesResponse =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownCityValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: functions
                                                                  .allCitiesFromCountry(
                                                                      CountriesCitiesCall
                                                                          .countrylist(
                                                                        dropDownCityCountriesCitiesResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      _model
                                                                          .selsectedCountry!)!,
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownCityValue =
                                                                          val),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                      ),
                                                              hintText:
                                                                  'Select States',
                                                              icon: Icon(
                                                                FFIcons
                                                                    .kimage2vector1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final questionList = FFAppState()
                                                  .personaLIntroQ
                                                  .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    questionList.length,
                                                    (questionListIndex) {
                                                  final questionListItem =
                                                      questionList[
                                                          questionListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 32.0,
                                                                0.0, 0.0),
                                                    child:
                                                        QuestionComponentWidget(
                                                      key: Key(
                                                          'Keycoi_${questionListIndex}_of_${questionList.length}'),
                                                      questionNo:
                                                          '${(questionListIndex + 5).toString()}. ',
                                                      indexValue:
                                                          questionListIndex,
                                                      onboardingQuestion:
                                                          questionListItem,
                                                      action1:
                                                          (responseval) async {
                                                        FFAppState()
                                                            .updatePersonaLIntroQAtIndex(
                                                          questionListIndex,
                                                          (e) => e
                                                            ..response = null,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      action2:
                                                          (responseVal) async {
                                                        FFAppState()
                                                            .updatePersonaLIntroQAtIndex(
                                                          questionListIndex,
                                                          (e) => e
                                                            ..response =
                                                                responseVal,
                                                        );
                                                        safeSetState(() {});
                                                        if (questionListItem
                                                                .response ==
                                                            'Other...') {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      OtherOptionTexrInputWidget(
                                                                    action11:
                                                                        (testfield) async {
                                                                      FFAppState()
                                                                          .updatePersonaLIntroQAtIndex(
                                                                        questionListIndex,
                                                                        (e) => e
                                                                          ..response =
                                                                              testfield,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Response Saved',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).customColor8,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).customColor3,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 32.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  if (_model.dropDownAgeValue ==
                                                      null) {
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDowncountryValue ==
                                                      null) {
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDownCityValue ==
                                                      null) {
                                                    return;
                                                  }
                                                  while (
                                                      _model.personalQInteger! <
                                                          FFAppState()
                                                              .personaLIntroQ
                                                              .length) {
                                                    if (FFAppState()
                                                                .personaLIntroQ
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .personalQInteger!)
                                                                ?.response ==
                                                            null ||
                                                        FFAppState()
                                                                .personaLIntroQ
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .personalQInteger!)
                                                                ?.response ==
                                                            '') {
                                                      FFAppState()
                                                          .updatePersonaLIntroQAtIndex(
                                                        _model
                                                            .personalQInteger!,
                                                        (e) => e
                                                          ..hasResponse = true,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      FFAppState()
                                                          .updatePersonaLIntroQAtIndex(
                                                        _model
                                                            .personalQInteger!,
                                                        (e) => e
                                                          ..hasResponse = false,
                                                      );
                                                      safeSetState(() {});
                                                    }

                                                    _model.personalQInteger =
                                                        _model.personalQInteger! +
                                                            1;
                                                    safeSetState(() {});
                                                  }
                                                  _model.personalQInteger = 0;
                                                  safeSetState(() {});
                                                  if (FFAppState()
                                                          .personaLIntroQ
                                                          .where((e) =>
                                                              e.hasResponse ==
                                                              true)
                                                          .toList()
                                                          .length <
                                                      1) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                CoachCommentaryDialogWidget(
                                                              buttonLabel:
                                                                  'Proceed',
                                                              commentary: functions
                                                                  .coachQuestionResponse(
                                                                      1,
                                                                      _model
                                                                          .fullnameTextController
                                                                          .text),
                                                              buttonAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );

                                                    await currentUserReference!
                                                        .update({
                                                      ...createUserRecordData(
                                                        displayName: _model
                                                            .fullnameTextController
                                                            .text,
                                                        country: _model
                                                            .dropDowncountryValue,
                                                        email: currentUserEmail,
                                                        city: _model
                                                            .dropDownCityValue,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'personalIntroQ':
                                                              getOnboardQuestionListFirestoreData(
                                                            FFAppState()
                                                                .personaLIntroQ,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    _model.pageindexQ =
                                                        _model.pageindexQ! + 1;
                                                    _model.addToListOfindexPage(
                                                        1);
                                                    safeSetState(() {});
                                                  }
                                                },
                                                text: 'Next step',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor8,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final lifeStyleList = FFAppState()
                                                .lifestyleDailyRQ
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  lifeStyleList.length,
                                                  (lifeStyleListIndex) {
                                                final lifeStyleListItem =
                                                    lifeStyleList[
                                                        lifeStyleListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child:
                                                      QuestionComponentWidget(
                                                    key: Key(
                                                        'Key28g_${lifeStyleListIndex}_of_${lifeStyleList.length}'),
                                                    questionNo:
                                                        '${(lifeStyleListIndex + 1).toString()}.',
                                                    indexValue:
                                                        lifeStyleListIndex,
                                                    onboardingQuestion:
                                                        lifeStyleListItem,
                                                    action1:
                                                        (responseval) async {
                                                      FFAppState()
                                                          .updateLifestyleDailyRQAtIndex(
                                                        lifeStyleListIndex,
                                                        (e) =>
                                                            e..response = null,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    action2:
                                                        (responseVal) async {
                                                      FFAppState()
                                                          .updateLifestyleDailyRQAtIndex(
                                                        lifeStyleListIndex,
                                                        (e) => e
                                                          ..response =
                                                              responseVal,
                                                      );
                                                      safeSetState(() {});
                                                      if (lifeStyleListItem
                                                              .response ==
                                                          'Other...') {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    OtherOptionTexrInputWidget(
                                                                  action11:
                                                                      (testfield) async {
                                                                    FFAppState()
                                                                        .updateLifestyleDailyRQAtIndex(
                                                                      lifeStyleListIndex,
                                                                      (e) => e
                                                                        ..response =
                                                                            testfield,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Response Saved',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor8,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).customColor3,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .lifestyleDailyRQ
                                                            .length) {
                                                  if (FFAppState()
                                                              .lifestyleDailyRQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          null ||
                                                      FFAppState()
                                                              .lifestyleDailyRQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          '') {
                                                    FFAppState()
                                                        .updateLifestyleDailyRQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateLifestyleDailyRQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .lifestyleDailyRQ
                                                        .where((e) =>
                                                            e.hasResponse)
                                                        .toList()
                                                        .length <
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    2,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'lifeStyleDailyQ':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .lifestyleDailyRQ,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(2);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final spritiPracticeList =
                                                FFAppState()
                                                    .spiritPracticeHQ
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  spritiPracticeList.length,
                                                  (spritiPracticeListIndex) {
                                                final spritiPracticeListItem =
                                                    spritiPracticeList[
                                                        spritiPracticeListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child:
                                                      QuestionComponentWidget(
                                                    key: Key(
                                                        'Keygih_${spritiPracticeListIndex}_of_${spritiPracticeList.length}'),
                                                    questionNo:
                                                        '${(spritiPracticeListIndex + 1).toString()}.',
                                                    indexValue:
                                                        spritiPracticeListIndex,
                                                    onboardingQuestion:
                                                        spritiPracticeListItem,
                                                    action1:
                                                        (responseval) async {
                                                      FFAppState()
                                                          .updateSpiritPracticeHQAtIndex(
                                                        spritiPracticeListIndex,
                                                        (e) =>
                                                            e..response = null,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    action2:
                                                        (responseVal) async {
                                                      FFAppState()
                                                          .updateSpiritPracticeHQAtIndex(
                                                        spritiPracticeListIndex,
                                                        (e) => e
                                                          ..response =
                                                              responseVal,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            '2. How often do you engage in these \n    spiritual activities?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final spritiPracticeList2 =
                                                FFAppState()
                                                    .spiritualPractQb
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  spritiPracticeList2.length,
                                                  (spritiPracticeList2Index) {
                                                final spritiPracticeList2Item =
                                                    spritiPracticeList2[
                                                        spritiPracticeList2Index];
                                                return QuestionComponentAlphabetVWidget(
                                                  key: Key(
                                                      'Keybtw_${spritiPracticeList2Index}_of_${spritiPracticeList2.length}'),
                                                  questionNo:
                                                      functions.questionParser(
                                                          spritiPracticeList2Item
                                                              .question)!,
                                                  indexValue:
                                                      spritiPracticeList2Index,
                                                  onboardingQuestion:
                                                      spritiPracticeList2Item,
                                                  action1: (responseval) async {
                                                    FFAppState()
                                                        .updateSpiritualPractQbAtIndex(
                                                      spritiPracticeList2Index,
                                                      (e) => e..response = null,
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  action2: (responseVal) async {
                                                    FFAppState()
                                                        .updateSpiritualPractQbAtIndex(
                                                      spritiPracticeList2Index,
                                                      (e) => e
                                                        ..response =
                                                            responseVal,
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .spiritPracticeHQ
                                                            .length) {
                                                  if (FFAppState()
                                                              .spiritPracticeHQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          null ||
                                                      FFAppState()
                                                              .spiritPracticeHQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          '') {
                                                    FFAppState()
                                                        .updateSpiritPracticeHQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateSpiritPracticeHQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .spiritualPractQb
                                                            .length) {
                                                  if (FFAppState()
                                                              .spiritualPractQb
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          null ||
                                                      FFAppState()
                                                              .spiritualPractQb
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response ==
                                                          '') {
                                                    FFAppState()
                                                        .updateSpiritualPractQbAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateSpiritualPractQbAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (!((FFAppState()
                                                            .spiritPracticeHQ
                                                            .where((e) =>
                                                                e.hasResponse)
                                                            .toList()
                                                            .length >=
                                                        1) ||
                                                    (FFAppState()
                                                            .spiritualPractQb
                                                            .where((e) =>
                                                                e.hasResponse)
                                                            .toList()
                                                            .length >=
                                                        1))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    4,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'spiritPraticeHQ':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .spiritPracticeHQ,
                                                        ),
                                                        'spiritPracticeQb':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .spiritualPractQb,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(3);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final emotionalListList =
                                                FFAppState()
                                                    .EmotionalMentalQ
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  emotionalListList.length,
                                                  (emotionalListListIndex) {
                                                final emotionalListListItem =
                                                    emotionalListList[
                                                        emotionalListListIndex];
                                                return MultiSelquestionComponentWidget(
                                                  key: Key(
                                                      'Keyh7g_${emotionalListListIndex}_of_${emotionalListList.length}'),
                                                  questionNo:
                                                      '${(emotionalListListIndex + 1).toString()}. ',
                                                  indexValue:
                                                      emotionalListListIndex,
                                                  multiSelectQ:
                                                      emotionalListListItem,
                                                  action1: (responseval) async {
                                                    FFAppState()
                                                        .updateEmotionalMentalQAtIndex(
                                                      emotionalListListIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e.remove(
                                                              responseval),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  action2: (responseVal) async {
                                                    FFAppState()
                                                        .updateEmotionalMentalQAtIndex(
                                                      emotionalListListIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e
                                                              .add(responseVal),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                    if (emotionalListListItem
                                                        .listOfResponse
                                                        .contains(FFAppConstants
                                                            .otheer)) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  OtherOptionTexrInputWidget(
                                                                action11:
                                                                    (testfield) async {
                                                                  FFAppState()
                                                                      .updateEmotionalMentalQAtIndex(
                                                                    emotionalListListIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .remove('Other...'),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .updateEmotionalMentalQAtIndex(
                                                                    emotionalListListIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .add(testfield!),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Response Saved',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor8,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .lifestyleDailyRQ
                                                            .length) {
                                                  if (FFAppState()
                                                      .EmotionalMentalQ
                                                      .elementAtOrNull(_model
                                                          .personalQInteger!)!
                                                      .listOfResponse
                                                      .isNotEmpty) {
                                                    FFAppState()
                                                        .updateEmotionalMentalQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateEmotionalMentalQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .EmotionalMentalQ
                                                        .where((e) =>
                                                            e.hasResponse)
                                                        .toList()
                                                        .length <
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    5,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'EmotionalMentalQ':
                                                            getMultiSelQListFirestoreData(
                                                          FFAppState()
                                                              .EmotionalMentalQ,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(4);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final lifechallengeListList =
                                                FFAppState()
                                                    .lifeChallengeMultiSelQ
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  lifechallengeListList.length,
                                                  (lifechallengeListListIndex) {
                                                final lifechallengeListListItem =
                                                    lifechallengeListList[
                                                        lifechallengeListListIndex];
                                                return MultiSelquestionComponentWidget(
                                                  key: Key(
                                                      'Keyovk_${lifechallengeListListIndex}_of_${lifechallengeListList.length}'),
                                                  questionNo: '1.',
                                                  indexValue:
                                                      lifechallengeListListIndex,
                                                  multiSelectQ:
                                                      lifechallengeListListItem,
                                                  action1: (responseval) async {
                                                    FFAppState()
                                                        .updateLifeChallengeMultiSelQAtIndex(
                                                      lifechallengeListListIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e.remove(
                                                              responseval),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  action2: (responseVal) async {
                                                    FFAppState()
                                                        .updateLifeChallengeMultiSelQAtIndex(
                                                      lifechallengeListListIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e
                                                              .add(responseVal),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                    if (lifechallengeListListItem
                                                        .listOfResponse
                                                        .contains(FFAppConstants
                                                            .otheer)) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  OtherOptionTexrInputWidget(
                                                                action11:
                                                                    (testfield) async {
                                                                  FFAppState()
                                                                      .updateLifeChallengeMultiSelQAtIndex(
                                                                    lifechallengeListListIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .remove('Other...'),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .updateLifeChallengeMultiSelQAtIndex(
                                                                    lifechallengeListListIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .add(testfield!),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Response Saved',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor8,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final lifechallengeOnePracticeList =
                                                FFAppState()
                                                    .lifeChallengeQ
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  lifechallengeOnePracticeList
                                                      .length,
                                                  (lifechallengeOnePracticeListIndex) {
                                                final lifechallengeOnePracticeListItem =
                                                    lifechallengeOnePracticeList[
                                                        lifechallengeOnePracticeListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child:
                                                      QuestionComponentWidget(
                                                    key: Key(
                                                        'Keybe4_${lifechallengeOnePracticeListIndex}_of_${lifechallengeOnePracticeList.length}'),
                                                    questionNo: '2.',
                                                    indexValue:
                                                        lifechallengeOnePracticeListIndex,
                                                    onboardingQuestion:
                                                        lifechallengeOnePracticeListItem,
                                                    action1:
                                                        (responseval) async {
                                                      FFAppState()
                                                          .updateLifeChallengeQAtIndex(
                                                        lifechallengeOnePracticeListIndex,
                                                        (e) =>
                                                            e..response = null,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    action2:
                                                        (responseVal) async {
                                                      FFAppState()
                                                          .updateLifeChallengeQAtIndex(
                                                        lifechallengeOnePracticeListIndex,
                                                        (e) => e
                                                          ..response =
                                                              responseVal,
                                                      );
                                                      safeSetState(() {});
                                                      if (lifechallengeOnePracticeListItem
                                                              .response ==
                                                          'Other...') {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    OtherOptionTexrInputWidget(
                                                                  action11:
                                                                      (testfield) async {
                                                                    FFAppState()
                                                                        .updateLifeChallengeQAtIndex(
                                                                      lifechallengeOnePracticeListIndex,
                                                                      (e) => e
                                                                        ..response =
                                                                            testfield,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Response Saved',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor8,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).customColor3,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .lifeChallengeQ
                                                            .length) {
                                                  if (FFAppState()
                                                              .lifeChallengeQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          null &&
                                                      FFAppState()
                                                              .lifeChallengeQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          '') {
                                                    FFAppState()
                                                        .updateLifeChallengeQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateLifeChallengeQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                while (_model
                                                        .personalQInteger! <
                                                    FFAppState()
                                                        .lifeChallengeMultiSelQ
                                                        .length) {
                                                  if (FFAppState()
                                                      .lifeChallengeMultiSelQ
                                                      .elementAtOrNull(_model
                                                          .personalQInteger!)!
                                                      .listOfResponse
                                                      .isNotEmpty) {
                                                    FFAppState()
                                                        .updateLifeChallengeMultiSelQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateLifeChallengeMultiSelQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (!((FFAppState()
                                                            .lifeChallengeQ
                                                            .where((e) =>
                                                                e.hasResponse)
                                                            .toList()
                                                            .length >=
                                                        1) ||
                                                    (FFAppState()
                                                            .lifeChallengeMultiSelQ
                                                            .where((e) =>
                                                                e.hasResponse)
                                                            .toList()
                                                            .length >=
                                                        1))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    6,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'lifeChallengeQ':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .lifeChallengeQ,
                                                        ),
                                                        'lifeChallengeMultiQ':
                                                            getMultiSelQListFirestoreData(
                                                          FFAppState()
                                                              .lifeChallengeMultiSelQ,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(5);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final goalsettinglist = FFAppState()
                                                .goalSettingQ
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  goalsettinglist.length,
                                                  (goalsettinglistIndex) {
                                                final goalsettinglistItem =
                                                    goalsettinglist[
                                                        goalsettinglistIndex];
                                                return MultiSelquestionComponentWidget(
                                                  key: Key(
                                                      'Keyu1y_${goalsettinglistIndex}_of_${goalsettinglist.length}'),
                                                  questionNo:
                                                      '${(goalsettinglistIndex + 1).toString()}. ',
                                                  indexValue:
                                                      goalsettinglistIndex,
                                                  multiSelectQ:
                                                      goalsettinglistItem,
                                                  action1: (responseval) async {
                                                    FFAppState()
                                                        .updateGoalSettingQAtIndex(
                                                      goalsettinglistIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e.remove(
                                                              responseval),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  action2: (responseVal) async {
                                                    FFAppState()
                                                        .updateGoalSettingQAtIndex(
                                                      goalsettinglistIndex,
                                                      (e) => e
                                                        ..updateListOfResponse(
                                                          (e) => e
                                                              .add(responseVal),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                    if (goalsettinglistItem
                                                        .listOfResponse
                                                        .contains(FFAppConstants
                                                            .otheer)) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  OtherOptionTexrInputWidget(
                                                                action11:
                                                                    (testfield) async {
                                                                  FFAppState()
                                                                      .updateGoalSettingQAtIndex(
                                                                    goalsettinglistIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .remove('Other...'),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .updateGoalSettingQAtIndex(
                                                                    goalsettinglistIndex,
                                                                    (e) => e
                                                                      ..updateListOfResponse(
                                                                        (e) => e
                                                                            .add(testfield!),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Response Saved',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor8,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .goalSettingQ
                                                            .length) {
                                                  if (FFAppState()
                                                      .goalSettingQ
                                                      .elementAtOrNull(_model
                                                          .personalQInteger!)!
                                                      .listOfResponse
                                                      .isNotEmpty) {
                                                    FFAppState()
                                                        .updateGoalSettingQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateGoalSettingQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .goalSettingQ
                                                        .where((e) =>
                                                            e.hasResponse)
                                                        .toList()
                                                        .length <
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    7,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'goalSettingQ':
                                                            getMultiSelQListFirestoreData(
                                                          FFAppState()
                                                              .goalSettingQ,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(6);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final understadningList =
                                                FFAppState()
                                                    .understandLifeStyle
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  understadningList.length,
                                                  (understadningListIndex) {
                                                final understadningListItem =
                                                    understadningList[
                                                        understadningListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child:
                                                      QuestionComponentWidget(
                                                    key: Key(
                                                        'Keya3j_${understadningListIndex}_of_${understadningList.length}'),
                                                    questionNo:
                                                        '${(understadningListIndex + 1).toString()}.',
                                                    indexValue:
                                                        understadningListIndex,
                                                    onboardingQuestion:
                                                        understadningListItem,
                                                    action1:
                                                        (responseval) async {
                                                      FFAppState()
                                                          .updateUnderstandLifeStyleAtIndex(
                                                        understadningListIndex,
                                                        (e) =>
                                                            e..response = null,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    action2:
                                                        (responseVal) async {
                                                      FFAppState()
                                                          .updateUnderstandLifeStyleAtIndex(
                                                        understadningListIndex,
                                                        (e) => e
                                                          ..response =
                                                              responseVal,
                                                      );
                                                      safeSetState(() {});
                                                      if (understadningListItem
                                                              .response ==
                                                          'Other...') {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    OtherOptionTexrInputWidget(
                                                                  action11:
                                                                      (testfield) async {
                                                                    FFAppState()
                                                                        .updateUnderstandLifeStyleAtIndex(
                                                                      understadningListIndex,
                                                                      (e) => e
                                                                        ..response =
                                                                            testfield,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Response Saved',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor8,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).customColor3,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .understandLifeStyle
                                                            .length) {
                                                  if (FFAppState()
                                                              .understandLifeStyle
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          null &&
                                                      FFAppState()
                                                              .understandLifeStyle
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          '') {
                                                    FFAppState()
                                                        .updateUnderstandLifeStyleAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateUnderstandLifeStyleAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .understandLifeStyle
                                                        .where((e) =>
                                                            e.hasResponse)
                                                        .toList()
                                                        .length <
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    8,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'understandingLifeStyle':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .understandLifeStyle,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  _model.pageindexQ =
                                                      _model.pageindexQ! + 1;
                                                  _model
                                                      .addToListOfindexPage(7);
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: 'Last step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final finalTouchList = FFAppState()
                                                .finalTouchQ
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  finalTouchList.length,
                                                  (finalTouchListIndex) {
                                                final finalTouchListItem =
                                                    finalTouchList[
                                                        finalTouchListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child:
                                                      QuestionComponentWidget(
                                                    key: Key(
                                                        'Keyd2r_${finalTouchListIndex}_of_${finalTouchList.length}'),
                                                    questionNo:
                                                        '${(finalTouchListIndex + 1).toString()}.',
                                                    indexValue:
                                                        finalTouchListIndex,
                                                    onboardingQuestion:
                                                        finalTouchListItem,
                                                    action1:
                                                        (responseval) async {
                                                      FFAppState()
                                                          .updateFinalTouchQAtIndex(
                                                        finalTouchListIndex,
                                                        (e) =>
                                                            e..response = null,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    action2:
                                                        (responseVal) async {
                                                      FFAppState()
                                                          .updateFinalTouchQAtIndex(
                                                        finalTouchListIndex,
                                                        (e) => e
                                                          ..response =
                                                              responseVal,
                                                      );
                                                      safeSetState(() {});
                                                      if (finalTouchListItem
                                                              .response ==
                                                          'Other...') {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    OtherOptionTexrInputWidget(
                                                                  action11:
                                                                      (testfield) async {
                                                                    FFAppState()
                                                                        .updateFinalTouchQAtIndex(
                                                                      finalTouchListIndex,
                                                                      (e) => e
                                                                        ..response =
                                                                            testfield,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Response Saved',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor8,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).customColor3,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                while (
                                                    _model.personalQInteger! <
                                                        FFAppState()
                                                            .finalTouchQ
                                                            .length) {
                                                  if (FFAppState()
                                                              .finalTouchQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          null &&
                                                      FFAppState()
                                                              .finalTouchQ
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .personalQInteger!)
                                                              ?.response !=
                                                          '') {
                                                    FFAppState()
                                                        .updateFinalTouchQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) => e
                                                        ..hasResponse = false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateFinalTouchQAtIndex(
                                                      _model.personalQInteger!,
                                                      (e) =>
                                                          e..hasResponse = true,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  _model.personalQInteger =
                                                      _model.personalQInteger! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.personalQInteger = 0;
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .finalTouchQ
                                                        .where((e) =>
                                                            e.hasResponse)
                                                        .toList()
                                                        .length <
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              CoachCommentaryDialogWidget(
                                                            buttonLabel:
                                                                'Proceed',
                                                            commentary: functions
                                                                .coachQuestionResponse(
                                                                    9,
                                                                    _model
                                                                        .fullnameTextController
                                                                        .text),
                                                            buttonAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  FFAppState().name = _model
                                                      .fullnameTextController
                                                      .text;
                                                  FFAppState().previousDay =
                                                      null;
                                                  FFAppState().Weekplan11 =
                                                      Weeklyplan11Struct();
                                                  FFAppState().growTracker =
                                                      GrowthTrackerMajorStruct();
                                                  FFAppState().DailyDevo11 =
                                                      DailydevtionTasks11Struct();
                                                  FFAppState().verseImg = '';
                                                  FFAppState().dailyPlan11 =
                                                      DailyPlan11Struct();
                                                  FFAppState().weeklyPLan =
                                                      WeeklyPLanMajorStruct();
                                                  safeSetState(() {});

                                                  await currentUserReference!
                                                      .update({
                                                    ...createUserRecordData(
                                                      displayName: _model
                                                          .fullnameTextController
                                                          .text,
                                                      email: currentUserEmail,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'multipleChoiceRespoonseQ':
                                                            getMultiSelQListFirestoreData(
                                                          functions.listAdderForMultiOption(
                                                              FFAppState()
                                                                  .EmotionalMentalQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .lifeChallengeMultiSelQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .goalSettingQ
                                                                  .toList()),
                                                        ),
                                                        'onboardingQ':
                                                            getOnboardQuestionListFirestoreData(
                                                          functions.listAdderForSingleOptionCopy(
                                                              FFAppState()
                                                                  .personaLIntroQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .lifestyleDailyRQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .spiritPracticeHQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .spiritualPractQb
                                                                  .toList(),
                                                              FFAppState()
                                                                  .lifeChallengeQ
                                                                  .toList(),
                                                              FFAppState()
                                                                  .understandLifeStyle
                                                                  .toList(),
                                                              FFAppState()
                                                                  .finalTouchQ
                                                                  .toList()),
                                                        ),
                                                        'finalTouchQ':
                                                            getOnboardQuestionListFirestoreData(
                                                          FFAppState()
                                                              .finalTouchQ,
                                                        ),
                                                      },
                                                    ),
                                                  });

                                                  context.pushNamed(
                                                    'onboardingCompletion',
                                                    queryParameters: {
                                                      'name': serializeParam(
                                                        _model
                                                            .fullnameTextController
                                                            .text,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              },
                                              text: 'Next step',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}
