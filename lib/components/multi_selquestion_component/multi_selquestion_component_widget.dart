import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multi_selquestion_component_model.dart';
export 'multi_selquestion_component_model.dart';

class MultiSelquestionComponentWidget extends StatefulWidget {
  const MultiSelquestionComponentWidget({
    super.key,
    required this.questionNo,
    required this.indexValue,
    required this.action1,
    required this.action2,
    required this.multiSelectQ,
  });

  final String? questionNo;
  final int? indexValue;
  final Future Function(String responseval)? action1;
  final Future Function(String responseVal)? action2;
  final MultiSelQStruct? multiSelectQ;

  @override
  State<MultiSelquestionComponentWidget> createState() =>
      _MultiSelquestionComponentWidgetState();
}

class _MultiSelquestionComponentWidgetState
    extends State<MultiSelquestionComponentWidget> {
  late MultiSelquestionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiSelquestionComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget!.questionNo!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.77,
                    decoration: BoxDecoration(),
                    child: Text(
                      widget!.multiSelectQ!.question,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget!.multiSelectQ?.hasResponse ?? false) {
                        return Text(
                          'Select an option to proceed',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        );
                      } else {
                        return Text(
                          'Select an option',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listvalues =
                            widget!.multiSelectQ?.listOFOption?.toList() ?? [];

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(listvalues.length,
                              (listvaluesIndex) {
                            final listvaluesItem = listvalues[listvaluesIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.selectedValList
                                          .contains(listvaluesIndex) ||
                                      widget!.multiSelectQ!.listOfResponse
                                          .contains(listvaluesItem)) {
                                    _model.selectedValue = null;
                                    _model.removeFromSelectedValList(
                                        listvaluesIndex);
                                    safeSetState(() {});
                                    await widget.action1?.call(
                                      listvaluesItem,
                                    );
                                  } else {
                                    _model.selectedValue = listvaluesIndex;
                                    _model
                                        .addToSelectedValList(listvaluesIndex);
                                    safeSetState(() {});
                                    await widget.action2?.call(
                                      listvaluesItem,
                                    );
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedValList
                                                .contains(listvaluesIndex) ||
                                            widget!.multiSelectQ!.listOfResponse
                                                .contains(listvaluesItem)
                                        ? FlutterFlowTheme.of(context)
                                            .customColor6
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(0x254A4A4A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (_model.selectedValList.contains(
                                                    listvaluesIndex) ||
                                                widget!.multiSelectQ!
                                                    .listOfResponse
                                                    .contains(listvaluesItem)) {
                                              return Icon(
                                                FFIcons.kselectbox,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              );
                                            } else {
                                              return Container(
                                                width: 16.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor3,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              listvaluesItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
