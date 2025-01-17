import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkboxgroup_model.dart';
export 'checkboxgroup_model.dart';

class CheckboxgroupWidget extends StatefulWidget {
  const CheckboxgroupWidget({super.key});

  @override
  State<CheckboxgroupWidget> createState() => _CheckboxgroupWidgetState();
}

class _CheckboxgroupWidgetState extends State<CheckboxgroupWidget> {
  late CheckboxgroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxgroupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.uncheckAndCheck = !_model.uncheckAndCheck;
        safeSetState(() {});
      },
      child: Builder(
        builder: (context) {
          if (_model.uncheckAndCheck) {
            return Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Color(0xFF575767),
                borderRadius: BorderRadius.circular(5.0),
              ),
            );
          } else {
            return Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Color(0xFF575767),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Icon(
                Icons.done_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            );
          }
        },
      ),
    );
  }
}
