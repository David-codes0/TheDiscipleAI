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

import 'package:country_state_city/utils/city_utils.dart';

Future<List<String>> cityList(String? isocode) async {
  // Add your function code here!
  List<String> allCity = [];

  final countryCitis = await getCountryCities(isocode!);
  // final onecity = countryCitis[0].name;
  print(countryCitis);
  countryCitis.forEach((ele) {
    allCity.add(ele.name);
  });
  print(allCity);
  FFAppState().update(() {
    FFAppState().allcityList = allCity;
  });
  // FFAppState().update(
  //   (){

  //   }
  // );
  return allCity;
}
