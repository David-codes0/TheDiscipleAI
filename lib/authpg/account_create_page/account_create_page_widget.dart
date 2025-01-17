import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_create_page_model.dart';
export 'account_create_page_model.dart';

class AccountCreatePageWidget extends StatefulWidget {
  const AccountCreatePageWidget({super.key});

  @override
  State<AccountCreatePageWidget> createState() =>
      _AccountCreatePageWidgetState();
}

class _AccountCreatePageWidgetState extends State<AccountCreatePageWidget> {
  late AccountCreatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountCreatePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().weeklyPlanCheck = WeeklyPlanCheck2Struct();
      FFAppState().growTracker = GrowthTrackerMajorStruct();
      FFAppState().DailyDevo11 = DailydevtionTasks11Struct();
      FFAppState().dailyPlan11 = DailyPlan11Struct();
      FFAppState().signedUp = true;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 1500));

      context.pushNamed('accountCreatePageCopy');
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_5.png',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 134.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_(2).png',
                    width: 219.0,
                    height: 219.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Account Created',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_6_(1).png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 134.0,
                    fit: BoxFit.cover,
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
