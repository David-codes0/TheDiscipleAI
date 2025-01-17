import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptylist_model.dart';
export 'emptylist_model.dart';

class EmptylistWidget extends StatefulWidget {
  const EmptylistWidget({
    super.key,
    required this.label,
  });

  final String? label;

  @override
  State<EmptylistWidget> createState() => _EmptylistWidgetState();
}

class _EmptylistWidgetState extends State<EmptylistWidget> {
  late EmptylistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptylistModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        widget!.label!,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
