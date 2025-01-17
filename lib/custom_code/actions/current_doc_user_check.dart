// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

Future currentDocUserCheck() async {
  // Add your function code here!
  Map<String, dynamic> currentUserDocument = {};
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      final userData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
      currentUserDocument = userData.data() as Map<String, dynamic>;
      log(currentUserDocument['onboardingQ'].toString());

      List<dynamic> onboardingQList = currentUserDocument['onboardingQ'] ?? [];
      FFAppState().update(() {
        FFAppState().CheckerForQuestions = onboardingQList.isNotEmpty;
      });
    }
  });
}
