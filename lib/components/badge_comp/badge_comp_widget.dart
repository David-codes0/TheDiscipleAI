import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'badge_comp_model.dart';
export 'badge_comp_model.dart';

class BadgeCompWidget extends StatefulWidget {
  const BadgeCompWidget({
    super.key,
    required this.icon1,
  });

  final Widget? icon1;

  @override
  State<BadgeCompWidget> createState() => _BadgeCompWidgetState();
}

class _BadgeCompWidgetState extends State<BadgeCompWidget> {
  late BadgeCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Frame_539.png',
            ).image,
          ),
          shape: BoxShape.circle,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: widget!.icon1!,
      ),
    );
  }
}
