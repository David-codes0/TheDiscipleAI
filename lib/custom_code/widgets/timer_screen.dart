// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:the_disciple/flutter_flow/flutter_flow_widgets.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    super.key,
    this.width,
    this.height,
    this.switchForTimer,
  });

  final double? width;
  final double? height;
  final Widget Function()? switchForTimer;

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int selectedHours = 0;
  int selectedMinutes = 10;
  int selectedSeconds = 0;
  Duration remainingTime = Duration(minutes: 10);
  Timer? countdownTimer;
  bool isRunning = false;

  void startTimer() {
    setState(() {
      remainingTime = Duration(
        hours: selectedHours,
        minutes: selectedMinutes,
        seconds: selectedSeconds,
      );
      isRunning = true;
    });
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => updateTimer());
  }

  void stopTimer() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
      countdownTimer = null;
    }
    setState(() {
      isRunning = false;
    });
  }

  void updateTimer() {
    setState(() {
      final seconds = remainingTime.inSeconds - 1;
      if (seconds < 0) {
        countdownTimer?.cancel();
        isRunning = false;
      } else {
        remainingTime = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 196,
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).customColor4,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Set Timer',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    FFAppState().update(() {
                      FFAppState().prayerTimerBool = false;
                    });
                  },
                  child: Container(
                    width: 44.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor7,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            3.0, 0.0, 3.0, 0.0),
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            boxShadow: [
                              const BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTimePicker("Hrs", 24, (index) {
                      setState(() {
                        selectedHours = index;
                      });
                      print(remainingTime.inSeconds /
                          (selectedHours * 3600 +
                              selectedMinutes * 60 +
                              selectedSeconds));
                      // print((remainingTime.inSeconds / (selectedHours * 3600 +selectedMinutes * 60 + selectedSeconds).toString());
                    }),
                    buildTimePicker("Mins", 60, (index) {
                      setState(() {
                        selectedMinutes = index;
                      });
                      print(index);
                    }),
                    buildTimePicker("Sec", 60, (index) {
                      setState(() {
                        selectedSeconds = index;
                      });
                      print(index);
                    }),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 103,
                    height: 103,
                    child: CircularProgressIndicator(
                      value: (remainingTime.inSeconds /
                                  (selectedHours * 3600 +
                                      selectedMinutes * 60 +
                                      selectedSeconds) ==
                              double.infinity)
                          ? 0
                          : remainingTime.inSeconds /
                              (selectedHours * 3600 +
                                  selectedMinutes * 60 +
                                  selectedSeconds),
                      color: Color(0xffB8C1B8),
                      strokeWidth: 6,
                      backgroundColor: Colors.grey[700],
                    ),
                  ),
                  Text(
                    '${remainingTime.inHours.remainder(60).toString().padLeft(2, '0')}:${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FFButtonWidget(
              onPressed: isRunning ? stopTimer : startTimer,
              text: isRunning ? 'Stop' : 'Start',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 45.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.grey[800],
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimePicker(
      String label, int itemCount, ValueChanged<int> onSelectedItemChanged) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          height: 40,
          width: 50,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 40,
            onSelectedItemChanged: onSelectedItemChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Text(
                  index.toString().padLeft(2, '0'),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                );
              },
              childCount: itemCount,
            ),
          ),
        ),
      ],
    );
  }
}
