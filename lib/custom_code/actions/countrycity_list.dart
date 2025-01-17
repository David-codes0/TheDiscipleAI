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

import 'package:country_state_city/utils/country_utils.dart';

Future<List<CountryWidgetListStruct>> countrycityList() async {
  // Add your function code here!
  List<CountryWidgetListStruct> listCountry = [];
  final countries = await getAllCountries();
  final oneCountry = countries[0];
  // final countryCitis = await getCountryCities(oneCountry.isoCode);
  // final onecity = countryCitis[0].name;
  countries.forEach(
    (element) {
      listCountry.add(CountryWidgetListStruct(
          isocodes: element.isoCode, name: element.name));
    },
  );
  return listCountry;
}
