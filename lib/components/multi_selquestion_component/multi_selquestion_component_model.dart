import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'multi_selquestion_component_widget.dart'
    show MultiSelquestionComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultiSelquestionComponentModel
    extends FlutterFlowModel<MultiSelquestionComponentWidget> {
  ///  Local state fields for this component.

  int? selectedValue;

  List<int> selectedValList = [];
  void addToSelectedValList(int item) => selectedValList.add(item);
  void removeFromSelectedValList(int item) => selectedValList.remove(item);
  void removeAtIndexFromSelectedValList(int index) =>
      selectedValList.removeAt(index);
  void insertAtIndexInSelectedValList(int index, int item) =>
      selectedValList.insert(index, item);
  void updateSelectedValListAtIndex(int index, Function(int) updateFn) =>
      selectedValList[index] = updateFn(selectedValList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
