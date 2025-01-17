import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? questionParser(String? question) {
  // return a the first two letter of the quesion passed
  if (question == null || question.isEmpty) {
    return null;
  }
  return question.substring(0, math.min(2, question.length));
}

String? oppostiteQuestionEditor(String? question) {
  // remove the first two letter of the question and return the remain and also trim ot
  if (question == null || question.length < 3) {
    return null;
  }
  return question.substring(2).trim();
}

List<OnboardQuestionStruct>? listAdderForSingleOptionCopy(
  List<OnboardQuestionStruct>? question1,
  List<OnboardQuestionStruct>? question2,
  List<OnboardQuestionStruct>? question3,
  List<OnboardQuestionStruct>? question4,
  List<OnboardQuestionStruct>? question5,
  List<OnboardQuestionStruct>? question6,
  List<OnboardQuestionStruct>? question7,
) {
  return [
    ...question1!,
    ...question2!,
    ...question3!,
    ...question4!,
    ...question5!,
    ...question6!,
    ...question7!,
  ];
}

dynamic covertQuestionsToJson(
  List<OnboardQuestionStruct>? allQuestion,
  List<MultiSelQStruct>? multiQ,
) {
  List<Map<String, dynamic>> allMap = [];
  List<Map<String, dynamic>> allMap2 = [];
  allQuestion!.forEach((element) {
    allMap.add(element.toMap());
  });
  multiQ!.forEach((element) {
    allMap2.add(element.toMap());
  });
  Map<String, dynamic> newJson = {
    "user_responses": allMap,
    "user_response2": allMap2
  };
  return newJson;
}

List<MultiSelQStruct>? listAdderForMultiOption(
  List<MultiSelQStruct>? question1,
  List<MultiSelQStruct>? question2,
  List<MultiSelQStruct>? question3,
) {
  return [
    ...question1!,
    ...question2!,
    ...question3!,
  ];
}

BibleVerseAndChspternumberStruct? bibleVerserAndChapterNumber(String? bible) {
  if (bible == "Psalm") {
    bible = "Psalms";
  }
  List<Map<String, dynamic>> allBook = [
    {
      "abbr": "Gen",
      "book": "Genesis",
      "chapters": [
        {"chapter": "1", "verses": "31"},
        {"chapter": "2", "verses": "25"},
        {"chapter": "3", "verses": "24"},
        {"chapter": "4", "verses": "26"},
        {"chapter": "5", "verses": "32"},
        {"chapter": "6", "verses": "22"},
        {"chapter": "7", "verses": "24"},
        {"chapter": "8", "verses": "22"},
        {"chapter": "9", "verses": "29"},
        {"chapter": "10", "verses": "32"},
        {"chapter": "11", "verses": "32"},
        {"chapter": "12", "verses": "20"},
        {"chapter": "13", "verses": "18"},
        {"chapter": "14", "verses": "24"},
        {"chapter": "15", "verses": "21"},
        {"chapter": "16", "verses": "16"},
        {"chapter": "17", "verses": "27"},
        {"chapter": "18", "verses": "33"},
        {"chapter": "19", "verses": "38"},
        {"chapter": "20", "verses": "18"},
        {"chapter": "21", "verses": "34"},
        {"chapter": "22", "verses": "24"},
        {"chapter": "23", "verses": "20"},
        {"chapter": "24", "verses": "67"},
        {"chapter": "25", "verses": "34"},
        {"chapter": "26", "verses": "35"},
        {"chapter": "27", "verses": "46"},
        {"chapter": "28", "verses": "22"},
        {"chapter": "29", "verses": "35"},
        {"chapter": "30", "verses": "43"},
        {"chapter": "31", "verses": "55"},
        {"chapter": "32", "verses": "32"},
        {"chapter": "33", "verses": "20"},
        {"chapter": "34", "verses": "31"},
        {"chapter": "35", "verses": "29"},
        {"chapter": "36", "verses": "43"},
        {"chapter": "37", "verses": "36"},
        {"chapter": "38", "verses": "30"},
        {"chapter": "39", "verses": "23"},
        {"chapter": "40", "verses": "23"},
        {"chapter": "41", "verses": "57"},
        {"chapter": "42", "verses": "38"},
        {"chapter": "43", "verses": "34"},
        {"chapter": "44", "verses": "34"},
        {"chapter": "45", "verses": "28"},
        {"chapter": "46", "verses": "34"},
        {"chapter": "47", "verses": "31"},
        {"chapter": "48", "verses": "22"},
        {"chapter": "49", "verses": "33"},
        {"chapter": "50", "verses": "26"}
      ]
    },
    {
      "abbr": "Exod",
      "book": "Exodus",
      "chapters": [
        {"chapter": "1", "verses": "22"},
        {"chapter": "2", "verses": "25"},
        {"chapter": "3", "verses": "22"},
        {"chapter": "4", "verses": "31"},
        {"chapter": "5", "verses": "23"},
        {"chapter": "6", "verses": "30"},
        {"chapter": "7", "verses": "25"},
        {"chapter": "8", "verses": "32"},
        {"chapter": "9", "verses": "35"},
        {"chapter": "10", "verses": "29"},
        {"chapter": "11", "verses": "10"},
        {"chapter": "12", "verses": "51"},
        {"chapter": "13", "verses": "22"},
        {"chapter": "14", "verses": "31"},
        {"chapter": "15", "verses": "27"},
        {"chapter": "16", "verses": "36"},
        {"chapter": "17", "verses": "16"},
        {"chapter": "18", "verses": "27"},
        {"chapter": "19", "verses": "25"},
        {"chapter": "20", "verses": "26"},
        {"chapter": "21", "verses": "36"},
        {"chapter": "22", "verses": "31"},
        {"chapter": "23", "verses": "33"},
        {"chapter": "24", "verses": "18"},
        {"chapter": "25", "verses": "40"},
        {"chapter": "26", "verses": "37"},
        {"chapter": "27", "verses": "21"},
        {"chapter": "28", "verses": "43"},
        {"chapter": "29", "verses": "46"},
        {"chapter": "30", "verses": "38"},
        {"chapter": "31", "verses": "18"},
        {"chapter": "32", "verses": "35"},
        {"chapter": "33", "verses": "23"},
        {"chapter": "34", "verses": "35"},
        {"chapter": "35", "verses": "35"},
        {"chapter": "36", "verses": "38"},
        {"chapter": "37", "verses": "29"},
        {"chapter": "38", "verses": "31"},
        {"chapter": "39", "verses": "43"},
        {"chapter": "40", "verses": "38"}
      ]
    },
    {
      "abbr": "Lev",
      "book": "Leviticus",
      "chapters": [
        {"chapter": "1", "verses": "17"},
        {"chapter": "2", "verses": "16"},
        {"chapter": "3", "verses": "17"},
        {"chapter": "4", "verses": "35"},
        {"chapter": "5", "verses": "19"},
        {"chapter": "6", "verses": "30"},
        {"chapter": "7", "verses": "38"},
        {"chapter": "8", "verses": "36"},
        {"chapter": "9", "verses": "24"},
        {"chapter": "10", "verses": "20"},
        {"chapter": "11", "verses": "47"},
        {"chapter": "12", "verses": "8"},
        {"chapter": "13", "verses": "59"},
        {"chapter": "14", "verses": "57"},
        {"chapter": "15", "verses": "33"},
        {"chapter": "16", "verses": "34"},
        {"chapter": "17", "verses": "16"},
        {"chapter": "18", "verses": "30"},
        {"chapter": "19", "verses": "37"},
        {"chapter": "20", "verses": "27"},
        {"chapter": "21", "verses": "24"},
        {"chapter": "22", "verses": "33"},
        {"chapter": "23", "verses": "44"},
        {"chapter": "24", "verses": "23"},
        {"chapter": "25", "verses": "55"},
        {"chapter": "26", "verses": "46"},
        {"chapter": "27", "verses": "34"}
      ]
    },
    {
      "abbr": "Num",
      "book": "Numbers",
      "chapters": [
        {"chapter": "1", "verses": "54"},
        {"chapter": "2", "verses": "34"},
        {"chapter": "3", "verses": "51"},
        {"chapter": "4", "verses": "49"},
        {"chapter": "5", "verses": "31"},
        {"chapter": "6", "verses": "27"},
        {"chapter": "7", "verses": "89"},
        {"chapter": "8", "verses": "26"},
        {"chapter": "9", "verses": "23"},
        {"chapter": "10", "verses": "36"},
        {"chapter": "11", "verses": "35"},
        {"chapter": "12", "verses": "16"},
        {"chapter": "13", "verses": "33"},
        {"chapter": "14", "verses": "45"},
        {"chapter": "15", "verses": "41"},
        {"chapter": "16", "verses": "50"},
        {"chapter": "17", "verses": "13"},
        {"chapter": "18", "verses": "32"},
        {"chapter": "19", "verses": "22"},
        {"chapter": "20", "verses": "29"},
        {"chapter": "21", "verses": "35"},
        {"chapter": "22", "verses": "41"},
        {"chapter": "23", "verses": "30"},
        {"chapter": "24", "verses": "25"},
        {"chapter": "25", "verses": "18"},
        {"chapter": "26", "verses": "65"},
        {"chapter": "27", "verses": "23"},
        {"chapter": "28", "verses": "31"},
        {"chapter": "29", "verses": "40"},
        {"chapter": "30", "verses": "16"},
        {"chapter": "31", "verses": "54"},
        {"chapter": "32", "verses": "42"},
        {"chapter": "33", "verses": "56"},
        {"chapter": "34", "verses": "29"},
        {"chapter": "35", "verses": "34"},
        {"chapter": "36", "verses": "13"}
      ]
    },
    {
      "abbr": "Deut",
      "book": "Deuteronomy",
      "chapters": [
        {"chapter": "1", "verses": "46"},
        {"chapter": "2", "verses": "37"},
        {"chapter": "3", "verses": "29"},
        {"chapter": "4", "verses": "49"},
        {"chapter": "5", "verses": "33"},
        {"chapter": "6", "verses": "25"},
        {"chapter": "7", "verses": "26"},
        {"chapter": "8", "verses": "20"},
        {"chapter": "9", "verses": "29"},
        {"chapter": "10", "verses": "22"},
        {"chapter": "11", "verses": "32"},
        {"chapter": "12", "verses": "32"},
        {"chapter": "13", "verses": "18"},
        {"chapter": "14", "verses": "29"},
        {"chapter": "15", "verses": "23"},
        {"chapter": "16", "verses": "22"},
        {"chapter": "17", "verses": "20"},
        {"chapter": "18", "verses": "22"},
        {"chapter": "19", "verses": "21"},
        {"chapter": "20", "verses": "20"},
        {"chapter": "21", "verses": "23"},
        {"chapter": "22", "verses": "30"},
        {"chapter": "23", "verses": "25"},
        {"chapter": "24", "verses": "22"},
        {"chapter": "25", "verses": "19"},
        {"chapter": "26", "verses": "19"},
        {"chapter": "27", "verses": "26"},
        {"chapter": "28", "verses": "68"},
        {"chapter": "29", "verses": "29"},
        {"chapter": "30", "verses": "20"},
        {"chapter": "31", "verses": "30"},
        {"chapter": "32", "verses": "52"},
        {"chapter": "33", "verses": "29"},
        {"chapter": "34", "verses": "12"}
      ]
    },
    {
      "abbr": "Josh",
      "book": "Joshua",
      "chapters": [
        {"chapter": "1", "verses": "18"},
        {"chapter": "2", "verses": "24"},
        {"chapter": "3", "verses": "17"},
        {"chapter": "4", "verses": "24"},
        {"chapter": "5", "verses": "15"},
        {"chapter": "6", "verses": "27"},
        {"chapter": "7", "verses": "26"},
        {"chapter": "8", "verses": "35"},
        {"chapter": "9", "verses": "27"},
        {"chapter": "10", "verses": "43"},
        {"chapter": "11", "verses": "23"},
        {"chapter": "12", "verses": "24"},
        {"chapter": "13", "verses": "33"},
        {"chapter": "14", "verses": "15"},
        {"chapter": "15", "verses": "63"},
        {"chapter": "16", "verses": "10"},
        {"chapter": "17", "verses": "18"},
        {"chapter": "18", "verses": "28"},
        {"chapter": "19", "verses": "51"},
        {"chapter": "20", "verses": "9"},
        {"chapter": "21", "verses": "45"},
        {"chapter": "22", "verses": "34"},
        {"chapter": "23", "verses": "16"},
        {"chapter": "24", "verses": "33"}
      ]
    },
    {
      "abbr": "Judg",
      "book": "Judges",
      "chapters": [
        {"chapter": "1", "verses": "36"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "31"},
        {"chapter": "4", "verses": "24"},
        {"chapter": "5", "verses": "31"},
        {"chapter": "6", "verses": "40"},
        {"chapter": "7", "verses": "25"},
        {"chapter": "8", "verses": "35"},
        {"chapter": "9", "verses": "57"},
        {"chapter": "10", "verses": "18"},
        {"chapter": "11", "verses": "40"},
        {"chapter": "12", "verses": "15"},
        {"chapter": "13", "verses": "25"},
        {"chapter": "14", "verses": "20"},
        {"chapter": "15", "verses": "20"},
        {"chapter": "16", "verses": "31"},
        {"chapter": "17", "verses": "13"},
        {"chapter": "18", "verses": "31"},
        {"chapter": "19", "verses": "30"},
        {"chapter": "20", "verses": "48"},
        {"chapter": "21", "verses": "25"}
      ]
    },
    {
      "abbr": "Ruth",
      "book": "Ruth",
      "chapters": [
        {"chapter": "1", "verses": "22"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "18"},
        {"chapter": "4", "verses": "22"}
      ]
    },
    {
      "abbr": "1Sam",
      "book": "1 Samuel",
      "chapters": [
        {"chapter": "1", "verses": "28"},
        {"chapter": "2", "verses": "36"},
        {"chapter": "3", "verses": "21"},
        {"chapter": "4", "verses": "22"},
        {"chapter": "5", "verses": "12"},
        {"chapter": "6", "verses": "21"},
        {"chapter": "7", "verses": "17"},
        {"chapter": "8", "verses": "22"},
        {"chapter": "9", "verses": "27"},
        {"chapter": "10", "verses": "27"},
        {"chapter": "11", "verses": "15"},
        {"chapter": "12", "verses": "25"},
        {"chapter": "13", "verses": "23"},
        {"chapter": "14", "verses": "52"},
        {"chapter": "15", "verses": "35"},
        {"chapter": "16", "verses": "23"},
        {"chapter": "17", "verses": "58"},
        {"chapter": "18", "verses": "30"},
        {"chapter": "19", "verses": "24"},
        {"chapter": "20", "verses": "42"},
        {"chapter": "21", "verses": "15"},
        {"chapter": "22", "verses": "23"},
        {"chapter": "23", "verses": "29"},
        {"chapter": "24", "verses": "22"},
        {"chapter": "25", "verses": "44"},
        {"chapter": "26", "verses": "25"},
        {"chapter": "27", "verses": "12"},
        {"chapter": "28", "verses": "25"},
        {"chapter": "29", "verses": "11"},
        {"chapter": "30", "verses": "31"},
        {"chapter": "31", "verses": "13"}
      ]
    },
    {
      "abbr": "2Sam",
      "book": "2 Samuel",
      "chapters": [
        {"chapter": "1", "verses": "27"},
        {"chapter": "2", "verses": "32"},
        {"chapter": "3", "verses": "39"},
        {"chapter": "4", "verses": "12"},
        {"chapter": "5", "verses": "25"},
        {"chapter": "6", "verses": "23"},
        {"chapter": "7", "verses": "29"},
        {"chapter": "8", "verses": "18"},
        {"chapter": "9", "verses": "13"},
        {"chapter": "10", "verses": "19"},
        {"chapter": "11", "verses": "27"},
        {"chapter": "12", "verses": "31"},
        {"chapter": "13", "verses": "39"},
        {"chapter": "14", "verses": "33"},
        {"chapter": "15", "verses": "37"},
        {"chapter": "16", "verses": "23"},
        {"chapter": "17", "verses": "29"},
        {"chapter": "18", "verses": "33"},
        {"chapter": "19", "verses": "43"},
        {"chapter": "20", "verses": "26"},
        {"chapter": "21", "verses": "22"},
        {"chapter": "22", "verses": "51"},
        {"chapter": "23", "verses": "39"},
        {"chapter": "24", "verses": "25"}
      ]
    },
    {
      "abbr": "1Kgs",
      "book": "1 Kings",
      "chapters": [
        {"chapter": "1", "verses": "53"},
        {"chapter": "2", "verses": "46"},
        {"chapter": "3", "verses": "28"},
        {"chapter": "4", "verses": "34"},
        {"chapter": "5", "verses": "18"},
        {"chapter": "6", "verses": "38"},
        {"chapter": "7", "verses": "51"},
        {"chapter": "8", "verses": "66"},
        {"chapter": "9", "verses": "28"},
        {"chapter": "10", "verses": "29"},
        {"chapter": "11", "verses": "43"},
        {"chapter": "12", "verses": "33"},
        {"chapter": "13", "verses": "34"},
        {"chapter": "14", "verses": "31"},
        {"chapter": "15", "verses": "34"},
        {"chapter": "16", "verses": "34"},
        {"chapter": "17", "verses": "24"},
        {"chapter": "18", "verses": "46"},
        {"chapter": "19", "verses": "21"},
        {"chapter": "20", "verses": "43"},
        {"chapter": "21", "verses": "29"},
        {"chapter": "22", "verses": "53"}
      ]
    },
    {
      "abbr": "2Kgs",
      "book": "2 Kings",
      "chapters": [
        {"chapter": "1", "verses": "18"},
        {"chapter": "2", "verses": "25"},
        {"chapter": "3", "verses": "27"},
        {"chapter": "4", "verses": "44"},
        {"chapter": "5", "verses": "27"},
        {"chapter": "6", "verses": "33"},
        {"chapter": "7", "verses": "20"},
        {"chapter": "8", "verses": "29"},
        {"chapter": "9", "verses": "37"},
        {"chapter": "10", "verses": "36"},
        {"chapter": "11", "verses": "21"},
        {"chapter": "12", "verses": "21"},
        {"chapter": "13", "verses": "25"},
        {"chapter": "14", "verses": "29"},
        {"chapter": "15", "verses": "38"},
        {"chapter": "16", "verses": "20"},
        {"chapter": "17", "verses": "41"},
        {"chapter": "18", "verses": "37"},
        {"chapter": "19", "verses": "37"},
        {"chapter": "20", "verses": "21"},
        {"chapter": "21", "verses": "26"},
        {"chapter": "22", "verses": "20"},
        {"chapter": "23", "verses": "37"},
        {"chapter": "24", "verses": "20"},
        {"chapter": "25", "verses": "30"}
      ]
    },
    {
      "abbr": "1Chr",
      "book": "1 Chronicles",
      "chapters": [
        {"chapter": "1", "verses": "54"},
        {"chapter": "2", "verses": "55"},
        {"chapter": "3", "verses": "24"},
        {"chapter": "4", "verses": "43"},
        {"chapter": "5", "verses": "26"},
        {"chapter": "6", "verses": "81"},
        {"chapter": "7", "verses": "40"},
        {"chapter": "8", "verses": "40"},
        {"chapter": "9", "verses": "44"},
        {"chapter": "10", "verses": "14"},
        {"chapter": "11", "verses": "47"},
        {"chapter": "12", "verses": "40"},
        {"chapter": "13", "verses": "14"},
        {"chapter": "14", "verses": "17"},
        {"chapter": "15", "verses": "29"},
        {"chapter": "16", "verses": "43"},
        {"chapter": "17", "verses": "27"},
        {"chapter": "18", "verses": "17"},
        {"chapter": "19", "verses": "19"},
        {"chapter": "20", "verses": "8"},
        {"chapter": "21", "verses": "30"},
        {"chapter": "22", "verses": "19"},
        {"chapter": "23", "verses": "32"},
        {"chapter": "24", "verses": "31"},
        {"chapter": "25", "verses": "31"},
        {"chapter": "26", "verses": "32"},
        {"chapter": "27", "verses": "34"},
        {"chapter": "28", "verses": "21"},
        {"chapter": "29", "verses": "30"}
      ]
    },
    {
      "abbr": "2Chr",
      "book": "2 Chronicles",
      "chapters": [
        {"chapter": "1", "verses": "17"},
        {"chapter": "2", "verses": "18"},
        {"chapter": "3", "verses": "17"},
        {"chapter": "4", "verses": "22"},
        {"chapter": "5", "verses": "14"},
        {"chapter": "6", "verses": "42"},
        {"chapter": "7", "verses": "22"},
        {"chapter": "8", "verses": "18"},
        {"chapter": "9", "verses": "31"},
        {"chapter": "10", "verses": "19"},
        {"chapter": "11", "verses": "23"},
        {"chapter": "12", "verses": "16"},
        {"chapter": "13", "verses": "22"},
        {"chapter": "14", "verses": "15"},
        {"chapter": "15", "verses": "19"},
        {"chapter": "16", "verses": "14"},
        {"chapter": "17", "verses": "19"},
        {"chapter": "18", "verses": "34"},
        {"chapter": "19", "verses": "11"},
        {"chapter": "20", "verses": "37"},
        {"chapter": "21", "verses": "20"},
        {"chapter": "22", "verses": "12"},
        {"chapter": "23", "verses": "21"},
        {"chapter": "24", "verses": "27"},
        {"chapter": "25", "verses": "28"},
        {"chapter": "26", "verses": "23"},
        {"chapter": "27", "verses": "9"},
        {"chapter": "28", "verses": "27"},
        {"chapter": "29", "verses": "36"},
        {"chapter": "30", "verses": "27"},
        {"chapter": "31", "verses": "21"},
        {"chapter": "32", "verses": "33"},
        {"chapter": "33", "verses": "25"},
        {"chapter": "34", "verses": "33"},
        {"chapter": "35", "verses": "27"},
        {"chapter": "36", "verses": "23"}
      ]
    },
    {
      "abbr": "Ezra",
      "book": "Ezra",
      "chapters": [
        {"chapter": "1", "verses": "11"},
        {"chapter": "2", "verses": "70"},
        {"chapter": "3", "verses": "13"},
        {"chapter": "4", "verses": "24"},
        {"chapter": "5", "verses": "17"},
        {"chapter": "6", "verses": "22"},
        {"chapter": "7", "verses": "28"},
        {"chapter": "8", "verses": "36"},
        {"chapter": "9", "verses": "15"},
        {"chapter": "10", "verses": "44"}
      ]
    },
    {
      "abbr": "Neh",
      "book": "Nehemiah",
      "chapters": [
        {"chapter": "1", "verses": "11"},
        {"chapter": "2", "verses": "20"},
        {"chapter": "3", "verses": "32"},
        {"chapter": "4", "verses": "23"},
        {"chapter": "5", "verses": "19"},
        {"chapter": "6", "verses": "19"},
        {"chapter": "7", "verses": "73"},
        {"chapter": "8", "verses": "18"},
        {"chapter": "9", "verses": "38"},
        {"chapter": "10", "verses": "39"},
        {"chapter": "11", "verses": "36"},
        {"chapter": "12", "verses": "47"},
        {"chapter": "13", "verses": "31"}
      ]
    },
    {
      "abbr": "Esth",
      "book": "Esther",
      "chapters": [
        {"chapter": "1", "verses": "22"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "15"},
        {"chapter": "4", "verses": "17"},
        {"chapter": "5", "verses": "14"},
        {"chapter": "6", "verses": "14"},
        {"chapter": "7", "verses": "10"},
        {"chapter": "8", "verses": "17"},
        {"chapter": "9", "verses": "32"},
        {"chapter": "10", "verses": "3"}
      ]
    },
    {
      "abbr": "Job",
      "book": "Job",
      "chapters": [
        {"chapter": "1", "verses": "22"},
        {"chapter": "2", "verses": "13"},
        {"chapter": "3", "verses": "26"},
        {"chapter": "4", "verses": "21"},
        {"chapter": "5", "verses": "27"},
        {"chapter": "6", "verses": "30"},
        {"chapter": "7", "verses": "21"},
        {"chapter": "8", "verses": "22"},
        {"chapter": "9", "verses": "35"},
        {"chapter": "10", "verses": "22"},
        {"chapter": "11", "verses": "20"},
        {"chapter": "12", "verses": "25"},
        {"chapter": "13", "verses": "28"},
        {"chapter": "14", "verses": "22"},
        {"chapter": "15", "verses": "35"},
        {"chapter": "16", "verses": "22"},
        {"chapter": "17", "verses": "16"},
        {"chapter": "18", "verses": "21"},
        {"chapter": "19", "verses": "29"},
        {"chapter": "20", "verses": "29"},
        {"chapter": "21", "verses": "34"},
        {"chapter": "22", "verses": "30"},
        {"chapter": "23", "verses": "17"},
        {"chapter": "24", "verses": "25"},
        {"chapter": "25", "verses": "6"},
        {"chapter": "26", "verses": "14"},
        {"chapter": "27", "verses": "23"},
        {"chapter": "28", "verses": "28"},
        {"chapter": "29", "verses": "25"},
        {"chapter": "30", "verses": "31"},
        {"chapter": "31", "verses": "40"},
        {"chapter": "32", "verses": "22"},
        {"chapter": "33", "verses": "33"},
        {"chapter": "34", "verses": "37"},
        {"chapter": "35", "verses": "16"},
        {"chapter": "36", "verses": "33"},
        {"chapter": "37", "verses": "24"},
        {"chapter": "38", "verses": "41"},
        {"chapter": "39", "verses": "30"},
        {"chapter": "40", "verses": "24"},
        {"chapter": "41", "verses": "34"},
        {"chapter": "42", "verses": "17"}
      ]
    },
    {
      "abbr": "Ps",
      "book": "Psalms",
      "chapters": [
        {"chapter": "1", "verses": "6"},
        {"chapter": "2", "verses": "12"},
        {"chapter": "3", "verses": "8"},
        {"chapter": "4", "verses": "8"},
        {"chapter": "5", "verses": "12"},
        {"chapter": "6", "verses": "10"},
        {"chapter": "7", "verses": "17"},
        {"chapter": "8", "verses": "9"},
        {"chapter": "9", "verses": "20"},
        {"chapter": "10", "verses": "18"},
        {"chapter": "11", "verses": "7"},
        {"chapter": "12", "verses": "8"},
        {"chapter": "13", "verses": "6"},
        {"chapter": "14", "verses": "7"},
        {"chapter": "15", "verses": "5"},
        {"chapter": "16", "verses": "11"},
        {"chapter": "17", "verses": "15"},
        {"chapter": "18", "verses": "50"},
        {"chapter": "19", "verses": "14"},
        {"chapter": "20", "verses": "9"},
        {"chapter": "21", "verses": "13"},
        {"chapter": "22", "verses": "31"},
        {"chapter": "23", "verses": "6"},
        {"chapter": "24", "verses": "10"},
        {"chapter": "25", "verses": "22"},
        {"chapter": "26", "verses": "12"},
        {"chapter": "27", "verses": "14"},
        {"chapter": "28", "verses": "9"},
        {"chapter": "29", "verses": "11"},
        {"chapter": "30", "verses": "12"},
        {"chapter": "31", "verses": "24"},
        {"chapter": "32", "verses": "11"},
        {"chapter": "33", "verses": "22"},
        {"chapter": "34", "verses": "22"},
        {"chapter": "35", "verses": "28"},
        {"chapter": "36", "verses": "12"},
        {"chapter": "37", "verses": "40"},
        {"chapter": "38", "verses": "22"},
        {"chapter": "39", "verses": "13"},
        {"chapter": "40", "verses": "17"},
        {"chapter": "41", "verses": "13"},
        {"chapter": "42", "verses": "11"},
        {"chapter": "43", "verses": "5"},
        {"chapter": "44", "verses": "26"},
        {"chapter": "45", "verses": "17"},
        {"chapter": "46", "verses": "11"},
        {"chapter": "47", "verses": "9"},
        {"chapter": "48", "verses": "14"},
        {"chapter": "49", "verses": "20"},
        {"chapter": "50", "verses": "23"},
        {"chapter": "51", "verses": "19"},
        {"chapter": "52", "verses": "9"},
        {"chapter": "53", "verses": "6"},
        {"chapter": "54", "verses": "7"},
        {"chapter": "55", "verses": "23"},
        {"chapter": "56", "verses": "13"},
        {"chapter": "57", "verses": "11"},
        {"chapter": "58", "verses": "11"},
        {"chapter": "59", "verses": "17"},
        {"chapter": "60", "verses": "12"},
        {"chapter": "61", "verses": "8"},
        {"chapter": "62", "verses": "12"},
        {"chapter": "63", "verses": "11"},
        {"chapter": "64", "verses": "10"},
        {"chapter": "65", "verses": "13"},
        {"chapter": "66", "verses": "20"},
        {"chapter": "67", "verses": "7"},
        {"chapter": "68", "verses": "35"},
        {"chapter": "69", "verses": "36"},
        {"chapter": "70", "verses": "5"},
        {"chapter": "71", "verses": "24"},
        {"chapter": "72", "verses": "20"},
        {"chapter": "73", "verses": "28"},
        {"chapter": "74", "verses": "23"},
        {"chapter": "75", "verses": "10"},
        {"chapter": "76", "verses": "12"},
        {"chapter": "77", "verses": "20"},
        {"chapter": "78", "verses": "72"},
        {"chapter": "79", "verses": "13"},
        {"chapter": "80", "verses": "19"},
        {"chapter": "81", "verses": "16"},
        {"chapter": "82", "verses": "8"},
        {"chapter": "83", "verses": "18"},
        {"chapter": "84", "verses": "12"},
        {"chapter": "85", "verses": "13"},
        {"chapter": "86", "verses": "17"},
        {"chapter": "87", "verses": "7"},
        {"chapter": "88", "verses": "18"},
        {"chapter": "89", "verses": "52"},
        {"chapter": "90", "verses": "17"},
        {"chapter": "91", "verses": "16"},
        {"chapter": "92", "verses": "15"},
        {"chapter": "93", "verses": "5"},
        {"chapter": "94", "verses": "23"},
        {"chapter": "95", "verses": "11"},
        {"chapter": "96", "verses": "13"},
        {"chapter": "97", "verses": "12"},
        {"chapter": "98", "verses": "9"},
        {"chapter": "99", "verses": "9"},
        {"chapter": "100", "verses": "5"},
        {"chapter": "101", "verses": "8"},
        {"chapter": "102", "verses": "28"},
        {"chapter": "103", "verses": "22"},
        {"chapter": "104", "verses": "35"},
        {"chapter": "105", "verses": "45"},
        {"chapter": "106", "verses": "48"},
        {"chapter": "107", "verses": "43"},
        {"chapter": "108", "verses": "13"},
        {"chapter": "109", "verses": "31"},
        {"chapter": "110", "verses": "7"},
        {"chapter": "111", "verses": "10"},
        {"chapter": "112", "verses": "10"},
        {"chapter": "113", "verses": "9"},
        {"chapter": "114", "verses": "8"},
        {"chapter": "115", "verses": "18"},
        {"chapter": "116", "verses": "19"},
        {"chapter": "117", "verses": "2"},
        {"chapter": "118", "verses": "29"},
        {"chapter": "119", "verses": "176"},
        {"chapter": "120", "verses": "7"},
        {"chapter": "121", "verses": "8"},
        {"chapter": "122", "verses": "9"},
        {"chapter": "123", "verses": "4"},
        {"chapter": "124", "verses": "8"},
        {"chapter": "125", "verses": "5"},
        {"chapter": "126", "verses": "6"},
        {"chapter": "127", "verses": "5"},
        {"chapter": "128", "verses": "6"},
        {"chapter": "129", "verses": "8"},
        {"chapter": "130", "verses": "8"},
        {"chapter": "131", "verses": "3"},
        {"chapter": "132", "verses": "18"},
        {"chapter": "133", "verses": "3"},
        {"chapter": "134", "verses": "3"},
        {"chapter": "135", "verses": "21"},
        {"chapter": "136", "verses": "26"},
        {"chapter": "137", "verses": "9"},
        {"chapter": "138", "verses": "8"},
        {"chapter": "139", "verses": "24"},
        {"chapter": "140", "verses": "13"},
        {"chapter": "141", "verses": "10"},
        {"chapter": "142", "verses": "7"},
        {"chapter": "143", "verses": "12"},
        {"chapter": "144", "verses": "15"},
        {"chapter": "145", "verses": "21"},
        {"chapter": "146", "verses": "10"},
        {"chapter": "147", "verses": "20"},
        {"chapter": "148", "verses": "14"},
        {"chapter": "149", "verses": "9"},
        {"chapter": "150", "verses": "6"}
      ]
    },
    {
      "abbr": "Prov",
      "book": "Proverbs",
      "chapters": [
        {"chapter": "1", "verses": "33"},
        {"chapter": "2", "verses": "22"},
        {"chapter": "3", "verses": "35"},
        {"chapter": "4", "verses": "27"},
        {"chapter": "5", "verses": "23"},
        {"chapter": "6", "verses": "35"},
        {"chapter": "7", "verses": "27"},
        {"chapter": "8", "verses": "36"},
        {"chapter": "9", "verses": "18"},
        {"chapter": "10", "verses": "32"},
        {"chapter": "11", "verses": "31"},
        {"chapter": "12", "verses": "28"},
        {"chapter": "13", "verses": "25"},
        {"chapter": "14", "verses": "35"},
        {"chapter": "15", "verses": "33"},
        {"chapter": "16", "verses": "33"},
        {"chapter": "17", "verses": "28"},
        {"chapter": "18", "verses": "24"},
        {"chapter": "19", "verses": "29"},
        {"chapter": "20", "verses": "30"},
        {"chapter": "21", "verses": "31"},
        {"chapter": "22", "verses": "29"},
        {"chapter": "23", "verses": "35"},
        {"chapter": "24", "verses": "34"},
        {"chapter": "25", "verses": "28"},
        {"chapter": "26", "verses": "28"},
        {"chapter": "27", "verses": "27"},
        {"chapter": "28", "verses": "28"},
        {"chapter": "29", "verses": "27"},
        {"chapter": "30", "verses": "33"},
        {"chapter": "31", "verses": "31"}
      ]
    },
    {
      "abbr": "Eccl",
      "book": "Ecclesiastes",
      "chapters": [
        {"chapter": "1", "verses": "18"},
        {"chapter": "2", "verses": "26"},
        {"chapter": "3", "verses": "22"},
        {"chapter": "4", "verses": "16"},
        {"chapter": "5", "verses": "20"},
        {"chapter": "6", "verses": "12"},
        {"chapter": "7", "verses": "29"},
        {"chapter": "8", "verses": "17"},
        {"chapter": "9", "verses": "18"},
        {"chapter": "10", "verses": "20"},
        {"chapter": "11", "verses": "10"},
        {"chapter": "12", "verses": "14"}
      ]
    },
    {
      "abbr": "Song",
      "book": "Song of Solomon",
      "chapters": [
        {"chapter": "1", "verses": "17"},
        {"chapter": "2", "verses": "17"},
        {"chapter": "3", "verses": "11"},
        {"chapter": "4", "verses": "16"},
        {"chapter": "5", "verses": "16"},
        {"chapter": "6", "verses": "13"},
        {"chapter": "7", "verses": "13"},
        {"chapter": "8", "verses": "14"}
      ]
    },
    {
      "abbr": "Isa",
      "book": "Isaiah",
      "chapters": [
        {"chapter": "1", "verses": "31"},
        {"chapter": "2", "verses": "22"},
        {"chapter": "3", "verses": "26"},
        {"chapter": "4", "verses": "6"},
        {"chapter": "5", "verses": "30"},
        {"chapter": "6", "verses": "13"},
        {"chapter": "7", "verses": "25"},
        {"chapter": "8", "verses": "22"},
        {"chapter": "9", "verses": "21"},
        {"chapter": "10", "verses": "34"},
        {"chapter": "11", "verses": "16"},
        {"chapter": "12", "verses": "6"},
        {"chapter": "13", "verses": "22"},
        {"chapter": "14", "verses": "32"},
        {"chapter": "15", "verses": "9"},
        {"chapter": "16", "verses": "14"},
        {"chapter": "17", "verses": "14"},
        {"chapter": "18", "verses": "7"},
        {"chapter": "19", "verses": "25"},
        {"chapter": "20", "verses": "6"},
        {"chapter": "21", "verses": "17"},
        {"chapter": "22", "verses": "25"},
        {"chapter": "23", "verses": "18"},
        {"chapter": "24", "verses": "23"},
        {"chapter": "25", "verses": "12"},
        {"chapter": "26", "verses": "21"},
        {"chapter": "27", "verses": "13"},
        {"chapter": "28", "verses": "29"},
        {"chapter": "29", "verses": "24"},
        {"chapter": "30", "verses": "33"},
        {"chapter": "31", "verses": "9"},
        {"chapter": "32", "verses": "20"},
        {"chapter": "33", "verses": "24"},
        {"chapter": "34", "verses": "17"},
        {"chapter": "35", "verses": "10"},
        {"chapter": "36", "verses": "22"},
        {"chapter": "37", "verses": "38"},
        {"chapter": "38", "verses": "22"},
        {"chapter": "39", "verses": "8"},
        {"chapter": "40", "verses": "31"},
        {"chapter": "41", "verses": "29"},
        {"chapter": "42", "verses": "25"},
        {"chapter": "43", "verses": "28"},
        {"chapter": "44", "verses": "28"},
        {"chapter": "45", "verses": "25"},
        {"chapter": "46", "verses": "13"},
        {"chapter": "47", "verses": "15"},
        {"chapter": "48", "verses": "22"},
        {"chapter": "49", "verses": "26"},
        {"chapter": "50", "verses": "11"},
        {"chapter": "51", "verses": "23"},
        {"chapter": "52", "verses": "15"},
        {"chapter": "53", "verses": "12"},
        {"chapter": "54", "verses": "17"},
        {"chapter": "55", "verses": "13"},
        {"chapter": "56", "verses": "12"},
        {"chapter": "57", "verses": "21"},
        {"chapter": "58", "verses": "14"},
        {"chapter": "59", "verses": "21"},
        {"chapter": "60", "verses": "22"},
        {"chapter": "61", "verses": "11"},
        {"chapter": "62", "verses": "12"},
        {"chapter": "63", "verses": "19"},
        {"chapter": "64", "verses": "12"},
        {"chapter": "65", "verses": "25"},
        {"chapter": "66", "verses": "24"}
      ]
    },
    {
      "abbr": "Jer",
      "book": "Jeremiah",
      "chapters": [
        {"chapter": "1", "verses": "19"},
        {"chapter": "2", "verses": "37"},
        {"chapter": "3", "verses": "25"},
        {"chapter": "4", "verses": "31"},
        {"chapter": "5", "verses": "31"},
        {"chapter": "6", "verses": "30"},
        {"chapter": "7", "verses": "34"},
        {"chapter": "8", "verses": "22"},
        {"chapter": "9", "verses": "26"},
        {"chapter": "10", "verses": "25"},
        {"chapter": "11", "verses": "23"},
        {"chapter": "12", "verses": "17"},
        {"chapter": "13", "verses": "27"},
        {"chapter": "14", "verses": "22"},
        {"chapter": "15", "verses": "21"},
        {"chapter": "16", "verses": "21"},
        {"chapter": "17", "verses": "27"},
        {"chapter": "18", "verses": "23"},
        {"chapter": "19", "verses": "15"},
        {"chapter": "20", "verses": "18"},
        {"chapter": "21", "verses": "14"},
        {"chapter": "22", "verses": "30"},
        {"chapter": "23", "verses": "40"},
        {"chapter": "24", "verses": "10"},
        {"chapter": "25", "verses": "38"},
        {"chapter": "26", "verses": "24"},
        {"chapter": "27", "verses": "22"},
        {"chapter": "28", "verses": "17"},
        {"chapter": "29", "verses": "32"},
        {"chapter": "30", "verses": "24"},
        {"chapter": "31", "verses": "40"},
        {"chapter": "32", "verses": "44"},
        {"chapter": "33", "verses": "26"},
        {"chapter": "34", "verses": "22"},
        {"chapter": "35", "verses": "19"},
        {"chapter": "36", "verses": "32"},
        {"chapter": "37", "verses": "21"},
        {"chapter": "38", "verses": "28"},
        {"chapter": "39", "verses": "18"},
        {"chapter": "40", "verses": "16"},
        {"chapter": "41", "verses": "18"},
        {"chapter": "42", "verses": "22"},
        {"chapter": "43", "verses": "13"},
        {"chapter": "44", "verses": "30"},
        {"chapter": "45", "verses": "5"},
        {"chapter": "46", "verses": "28"},
        {"chapter": "47", "verses": "7"},
        {"chapter": "48", "verses": "47"},
        {"chapter": "49", "verses": "39"},
        {"chapter": "50", "verses": "46"},
        {"chapter": "51", "verses": "64"},
        {"chapter": "52", "verses": "34"}
      ]
    },
    {
      "abbr": "Lam",
      "book": "Lamentations",
      "chapters": [
        {"chapter": "1", "verses": "22"},
        {"chapter": "2", "verses": "22"},
        {"chapter": "3", "verses": "66"},
        {"chapter": "4", "verses": "22"},
        {"chapter": "5", "verses": "22"}
      ]
    },
    {
      "abbr": "Ezek",
      "book": "Ezekiel",
      "chapters": [
        {"chapter": "1", "verses": "28"},
        {"chapter": "2", "verses": "10"},
        {"chapter": "3", "verses": "27"},
        {"chapter": "4", "verses": "17"},
        {"chapter": "5", "verses": "17"},
        {"chapter": "6", "verses": "14"},
        {"chapter": "7", "verses": "27"},
        {"chapter": "8", "verses": "18"},
        {"chapter": "9", "verses": "11"},
        {"chapter": "10", "verses": "22"},
        {"chapter": "11", "verses": "25"},
        {"chapter": "12", "verses": "28"},
        {"chapter": "13", "verses": "23"},
        {"chapter": "14", "verses": "23"},
        {"chapter": "15", "verses": "8"},
        {"chapter": "16", "verses": "63"},
        {"chapter": "17", "verses": "24"},
        {"chapter": "18", "verses": "32"},
        {"chapter": "19", "verses": "14"},
        {"chapter": "20", "verses": "49"},
        {"chapter": "21", "verses": "32"},
        {"chapter": "22", "verses": "31"},
        {"chapter": "23", "verses": "49"},
        {"chapter": "24", "verses": "27"},
        {"chapter": "25", "verses": "17"},
        {"chapter": "26", "verses": "21"},
        {"chapter": "27", "verses": "36"},
        {"chapter": "28", "verses": "26"},
        {"chapter": "29", "verses": "21"},
        {"chapter": "30", "verses": "26"},
        {"chapter": "31", "verses": "18"},
        {"chapter": "32", "verses": "32"},
        {"chapter": "33", "verses": "33"},
        {"chapter": "34", "verses": "31"},
        {"chapter": "35", "verses": "15"},
        {"chapter": "36", "verses": "38"},
        {"chapter": "37", "verses": "28"},
        {"chapter": "38", "verses": "23"},
        {"chapter": "39", "verses": "29"},
        {"chapter": "40", "verses": "49"},
        {"chapter": "41", "verses": "26"},
        {"chapter": "42", "verses": "20"},
        {"chapter": "43", "verses": "27"},
        {"chapter": "44", "verses": "31"},
        {"chapter": "45", "verses": "25"},
        {"chapter": "46", "verses": "24"},
        {"chapter": "47", "verses": "23"},
        {"chapter": "48", "verses": "35"}
      ]
    },
    {
      "abbr": "Dan",
      "book": "Daniel",
      "chapters": [
        {"chapter": "1", "verses": "21"},
        {"chapter": "2", "verses": "49"},
        {"chapter": "3", "verses": "30"},
        {"chapter": "4", "verses": "37"},
        {"chapter": "5", "verses": "31"},
        {"chapter": "6", "verses": "28"},
        {"chapter": "7", "verses": "28"},
        {"chapter": "8", "verses": "27"},
        {"chapter": "9", "verses": "27"},
        {"chapter": "10", "verses": "21"},
        {"chapter": "11", "verses": "45"},
        {"chapter": "12", "verses": "13"}
      ]
    },
    {
      "abbr": "Hos",
      "book": "Hosea",
      "chapters": [
        {"chapter": "1", "verses": "11"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "5"},
        {"chapter": "4", "verses": "19"},
        {"chapter": "5", "verses": "15"},
        {"chapter": "6", "verses": "11"},
        {"chapter": "7", "verses": "16"},
        {"chapter": "8", "verses": "14"},
        {"chapter": "9", "verses": "17"},
        {"chapter": "10", "verses": "15"},
        {"chapter": "11", "verses": "12"},
        {"chapter": "12", "verses": "14"},
        {"chapter": "13", "verses": "16"},
        {"chapter": "14", "verses": "9"}
      ]
    },
    {
      "abbr": "Joel",
      "book": "Joel",
      "chapters": [
        {"chapter": "1", "verses": "20"},
        {"chapter": "2", "verses": "32"},
        {"chapter": "3", "verses": "21"}
      ]
    },
    {
      "abbr": "Amos",
      "book": "Amos",
      "chapters": [
        {"chapter": "1", "verses": "15"},
        {"chapter": "2", "verses": "16"},
        {"chapter": "3", "verses": "15"},
        {"chapter": "4", "verses": "13"},
        {"chapter": "5", "verses": "27"},
        {"chapter": "6", "verses": "14"},
        {"chapter": "7", "verses": "17"},
        {"chapter": "8", "verses": "14"},
        {"chapter": "9", "verses": "15"}
      ]
    },
    {
      "abbr": "Obad",
      "book": "Obadiah",
      "chapters": [
        {"chapter": "1", "verses": "21"}
      ]
    },
    {
      "abbr": "Jonah",
      "book": "Jonah",
      "chapters": [
        {"chapter": "1", "verses": "17"},
        {"chapter": "2", "verses": "10"},
        {"chapter": "3", "verses": "10"},
        {"chapter": "4", "verses": "11"}
      ]
    },
    {
      "abbr": "Mic",
      "book": "Micah",
      "chapters": [
        {"chapter": "1", "verses": "16"},
        {"chapter": "2", "verses": "13"},
        {"chapter": "3", "verses": "12"},
        {"chapter": "4", "verses": "13"},
        {"chapter": "5", "verses": "15"},
        {"chapter": "6", "verses": "16"},
        {"chapter": "7", "verses": "20"}
      ]
    },
    {
      "abbr": "Nah",
      "book": "Nahum",
      "chapters": [
        {"chapter": "1", "verses": "15"},
        {"chapter": "2", "verses": "13"},
        {"chapter": "3", "verses": "19"}
      ]
    },
    {
      "abbr": "Hab",
      "book": "Habakkuk",
      "chapters": [
        {"chapter": "1", "verses": "17"},
        {"chapter": "2", "verses": "20"},
        {"chapter": "3", "verses": "19"}
      ]
    },
    {
      "abbr": "Zeph",
      "book": "Zephaniah",
      "chapters": [
        {"chapter": "1", "verses": "18"},
        {"chapter": "2", "verses": "15"},
        {"chapter": "3", "verses": "20"}
      ]
    },
    {
      "abbr": "Hag",
      "book": "Haggai",
      "chapters": [
        {"chapter": "1", "verses": "15"},
        {"chapter": "2", "verses": "23"}
      ]
    },
    {
      "abbr": "Zech",
      "book": "Zechariah",
      "chapters": [
        {"chapter": "1", "verses": "21"},
        {"chapter": "2", "verses": "13"},
        {"chapter": "3", "verses": "10"},
        {"chapter": "4", "verses": "14"},
        {"chapter": "5", "verses": "11"},
        {"chapter": "6", "verses": "15"},
        {"chapter": "7", "verses": "14"},
        {"chapter": "8", "verses": "23"},
        {"chapter": "9", "verses": "17"},
        {"chapter": "10", "verses": "12"},
        {"chapter": "11", "verses": "17"},
        {"chapter": "12", "verses": "14"},
        {"chapter": "13", "verses": "9"},
        {"chapter": "14", "verses": "21"}
      ]
    },
    {
      "abbr": "Mal",
      "book": "Malachi",
      "chapters": [
        {"chapter": "1", "verses": "14"},
        {"chapter": "2", "verses": "17"},
        {"chapter": "3", "verses": "18"},
        {"chapter": "4", "verses": "6"}
      ]
    },
    {
      "abbr": "Matt",
      "book": "Matthew",
      "chapters": [
        {"chapter": "1", "verses": "25"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "17"},
        {"chapter": "4", "verses": "25"},
        {"chapter": "5", "verses": "48"},
        {"chapter": "6", "verses": "34"},
        {"chapter": "7", "verses": "29"},
        {"chapter": "8", "verses": "34"},
        {"chapter": "9", "verses": "38"},
        {"chapter": "10", "verses": "42"},
        {"chapter": "11", "verses": "30"},
        {"chapter": "12", "verses": "50"},
        {"chapter": "13", "verses": "58"},
        {"chapter": "14", "verses": "36"},
        {"chapter": "15", "verses": "39"},
        {"chapter": "16", "verses": "28"},
        {"chapter": "17", "verses": "27"},
        {"chapter": "18", "verses": "35"},
        {"chapter": "19", "verses": "30"},
        {"chapter": "20", "verses": "34"},
        {"chapter": "21", "verses": "46"},
        {"chapter": "22", "verses": "46"},
        {"chapter": "23", "verses": "39"},
        {"chapter": "24", "verses": "51"},
        {"chapter": "25", "verses": "46"},
        {"chapter": "26", "verses": "75"},
        {"chapter": "27", "verses": "66"},
        {"chapter": "28", "verses": "20"}
      ]
    },
    {
      "abbr": "Mark",
      "book": "Mark",
      "chapters": [
        {"chapter": "1", "verses": "45"},
        {"chapter": "2", "verses": "28"},
        {"chapter": "3", "verses": "35"},
        {"chapter": "4", "verses": "41"},
        {"chapter": "5", "verses": "43"},
        {"chapter": "6", "verses": "56"},
        {"chapter": "7", "verses": "37"},
        {"chapter": "8", "verses": "38"},
        {"chapter": "9", "verses": "50"},
        {"chapter": "10", "verses": "52"},
        {"chapter": "11", "verses": "33"},
        {"chapter": "12", "verses": "44"},
        {"chapter": "13", "verses": "37"},
        {"chapter": "14", "verses": "72"},
        {"chapter": "15", "verses": "47"},
        {"chapter": "16", "verses": "20"}
      ]
    },
    {
      "abbr": "Luke",
      "book": "Luke",
      "chapters": [
        {"chapter": "1", "verses": "80"},
        {"chapter": "2", "verses": "52"},
        {"chapter": "3", "verses": "38"},
        {"chapter": "4", "verses": "44"},
        {"chapter": "5", "verses": "39"},
        {"chapter": "6", "verses": "49"},
        {"chapter": "7", "verses": "50"},
        {"chapter": "8", "verses": "56"},
        {"chapter": "9", "verses": "62"},
        {"chapter": "10", "verses": "42"},
        {"chapter": "11", "verses": "54"},
        {"chapter": "12", "verses": "59"},
        {"chapter": "13", "verses": "35"},
        {"chapter": "14", "verses": "35"},
        {"chapter": "15", "verses": "32"},
        {"chapter": "16", "verses": "31"},
        {"chapter": "17", "verses": "37"},
        {"chapter": "18", "verses": "43"},
        {"chapter": "19", "verses": "48"},
        {"chapter": "20", "verses": "47"},
        {"chapter": "21", "verses": "38"},
        {"chapter": "22", "verses": "71"},
        {"chapter": "23", "verses": "56"},
        {"chapter": "24", "verses": "53"}
      ]
    },
    {
      "abbr": "John",
      "book": "John",
      "chapters": [
        {"chapter": "1", "verses": "51"},
        {"chapter": "2", "verses": "25"},
        {"chapter": "3", "verses": "36"},
        {"chapter": "4", "verses": "54"},
        {"chapter": "5", "verses": "47"},
        {"chapter": "6", "verses": "71"},
        {"chapter": "7", "verses": "53"},
        {"chapter": "8", "verses": "59"},
        {"chapter": "9", "verses": "41"},
        {"chapter": "10", "verses": "42"},
        {"chapter": "11", "verses": "57"},
        {"chapter": "12", "verses": "50"},
        {"chapter": "13", "verses": "38"},
        {"chapter": "14", "verses": "31"},
        {"chapter": "15", "verses": "27"},
        {"chapter": "16", "verses": "33"},
        {"chapter": "17", "verses": "26"},
        {"chapter": "18", "verses": "40"},
        {"chapter": "19", "verses": "42"},
        {"chapter": "20", "verses": "31"},
        {"chapter": "21", "verses": "25"}
      ]
    },
    {
      "abbr": "Acts",
      "book": "Acts",
      "chapters": [
        {"chapter": "1", "verses": "26"},
        {"chapter": "2", "verses": "47"},
        {"chapter": "3", "verses": "26"},
        {"chapter": "4", "verses": "37"},
        {"chapter": "5", "verses": "42"},
        {"chapter": "6", "verses": "15"},
        {"chapter": "7", "verses": "60"},
        {"chapter": "8", "verses": "40"},
        {"chapter": "9", "verses": "43"},
        {"chapter": "10", "verses": "48"},
        {"chapter": "11", "verses": "30"},
        {"chapter": "12", "verses": "25"},
        {"chapter": "13", "verses": "52"},
        {"chapter": "14", "verses": "28"},
        {"chapter": "15", "verses": "41"},
        {"chapter": "16", "verses": "40"},
        {"chapter": "17", "verses": "34"},
        {"chapter": "18", "verses": "28"},
        {"chapter": "19", "verses": "41"},
        {"chapter": "20", "verses": "38"},
        {"chapter": "21", "verses": "40"},
        {"chapter": "22", "verses": "30"},
        {"chapter": "23", "verses": "35"},
        {"chapter": "24", "verses": "27"},
        {"chapter": "25", "verses": "27"},
        {"chapter": "26", "verses": "32"},
        {"chapter": "27", "verses": "44"},
        {"chapter": "28", "verses": "31"}
      ]
    },
    {
      "abbr": "Rom",
      "book": "Romans",
      "chapters": [
        {"chapter": "1", "verses": "32"},
        {"chapter": "2", "verses": "29"},
        {"chapter": "3", "verses": "31"},
        {"chapter": "4", "verses": "25"},
        {"chapter": "5", "verses": "21"},
        {"chapter": "6", "verses": "23"},
        {"chapter": "7", "verses": "25"},
        {"chapter": "8", "verses": "39"},
        {"chapter": "9", "verses": "33"},
        {"chapter": "10", "verses": "21"},
        {"chapter": "11", "verses": "36"},
        {"chapter": "12", "verses": "21"},
        {"chapter": "13", "verses": "14"},
        {"chapter": "14", "verses": "23"},
        {"chapter": "15", "verses": "33"},
        {"chapter": "16", "verses": "27"}
      ]
    },
    {
      "abbr": "1Cor",
      "book": "1 Corinthians",
      "chapters": [
        {"chapter": "1", "verses": "31"},
        {"chapter": "2", "verses": "16"},
        {"chapter": "3", "verses": "23"},
        {"chapter": "4", "verses": "21"},
        {"chapter": "5", "verses": "13"},
        {"chapter": "6", "verses": "20"},
        {"chapter": "7", "verses": "40"},
        {"chapter": "8", "verses": "13"},
        {"chapter": "9", "verses": "27"},
        {"chapter": "10", "verses": "33"},
        {"chapter": "11", "verses": "34"},
        {"chapter": "12", "verses": "31"},
        {"chapter": "13", "verses": "13"},
        {"chapter": "14", "verses": "40"},
        {"chapter": "15", "verses": "58"},
        {"chapter": "16", "verses": "24"}
      ]
    },
    {
      "abbr": "2Cor",
      "book": "2 Corinthians",
      "chapters": [
        {"chapter": "1", "verses": "24"},
        {"chapter": "2", "verses": "17"},
        {"chapter": "3", "verses": "18"},
        {"chapter": "4", "verses": "18"},
        {"chapter": "5", "verses": "21"},
        {"chapter": "6", "verses": "18"},
        {"chapter": "7", "verses": "16"},
        {"chapter": "8", "verses": "24"},
        {"chapter": "9", "verses": "15"},
        {"chapter": "10", "verses": "18"},
        {"chapter": "11", "verses": "33"},
        {"chapter": "12", "verses": "21"},
        {"chapter": "13", "verses": "14"}
      ]
    },
    {
      "abbr": "Gal",
      "book": "Galatians",
      "chapters": [
        {"chapter": "1", "verses": "24"},
        {"chapter": "2", "verses": "21"},
        {"chapter": "3", "verses": "29"},
        {"chapter": "4", "verses": "31"},
        {"chapter": "5", "verses": "26"},
        {"chapter": "6", "verses": "18"}
      ]
    },
    {
      "abbr": "Eph",
      "book": "Ephesians",
      "chapters": [
        {"chapter": "1", "verses": "23"},
        {"chapter": "2", "verses": "22"},
        {"chapter": "3", "verses": "21"},
        {"chapter": "4", "verses": "32"},
        {"chapter": "5", "verses": "33"},
        {"chapter": "6", "verses": "24"}
      ]
    },
    {
      "abbr": "Phil",
      "book": "Philippians",
      "chapters": [
        {"chapter": "1", "verses": "30"},
        {"chapter": "2", "verses": "30"},
        {"chapter": "3", "verses": "21"},
        {"chapter": "4", "verses": "23"}
      ]
    },
    {
      "abbr": "Col",
      "book": "Colossians",
      "chapters": [
        {"chapter": "1", "verses": "29"},
        {"chapter": "2", "verses": "23"},
        {"chapter": "3", "verses": "25"},
        {"chapter": "4", "verses": "18"}
      ]
    },
    {
      "abbr": "1Thess",
      "book": "1 Thessalonians",
      "chapters": [
        {"chapter": "1", "verses": "10"},
        {"chapter": "2", "verses": "20"},
        {"chapter": "3", "verses": "13"},
        {"chapter": "4", "verses": "18"},
        {"chapter": "5", "verses": "28"}
      ]
    },
    {
      "abbr": "2Thess",
      "book": "2 Thessalonians",
      "chapters": [
        {"chapter": "1", "verses": "12"},
        {"chapter": "2", "verses": "17"},
        {"chapter": "3", "verses": "18"}
      ]
    },
    {
      "abbr": "1Tim",
      "book": "1 Timothy",
      "chapters": [
        {"chapter": "1", "verses": "20"},
        {"chapter": "2", "verses": "15"},
        {"chapter": "3", "verses": "16"},
        {"chapter": "4", "verses": "16"},
        {"chapter": "5", "verses": "25"},
        {"chapter": "6", "verses": "21"}
      ]
    },
    {
      "abbr": "2Tim",
      "book": "2 Timothy",
      "chapters": [
        {"chapter": "1", "verses": "18"},
        {"chapter": "2", "verses": "26"},
        {"chapter": "3", "verses": "17"},
        {"chapter": "4", "verses": "22"}
      ]
    },
    {
      "abbr": "Titus",
      "book": "Titus",
      "chapters": [
        {"chapter": "1", "verses": "16"},
        {"chapter": "2", "verses": "15"},
        {"chapter": "3", "verses": "15"}
      ]
    },
    {
      "abbr": "Phlm",
      "book": "Philemon",
      "chapters": [
        {"chapter": "1", "verses": "25"}
      ]
    },
    {
      "abbr": "Heb",
      "book": "Hebrews",
      "chapters": [
        {"chapter": "1", "verses": "14"},
        {"chapter": "2", "verses": "18"},
        {"chapter": "3", "verses": "19"},
        {"chapter": "4", "verses": "16"},
        {"chapter": "5", "verses": "14"},
        {"chapter": "6", "verses": "20"},
        {"chapter": "7", "verses": "28"},
        {"chapter": "8", "verses": "13"},
        {"chapter": "9", "verses": "28"},
        {"chapter": "10", "verses": "39"},
        {"chapter": "11", "verses": "40"},
        {"chapter": "12", "verses": "29"},
        {"chapter": "13", "verses": "25"}
      ]
    },
    {
      "abbr": "Jas",
      "book": "James",
      "chapters": [
        {"chapter": "1", "verses": "27"},
        {"chapter": "2", "verses": "26"},
        {"chapter": "3", "verses": "18"},
        {"chapter": "4", "verses": "17"},
        {"chapter": "5", "verses": "20"}
      ]
    },
    {
      "abbr": "1Pet",
      "book": "1 Peter",
      "chapters": [
        {"chapter": "1", "verses": "25"},
        {"chapter": "2", "verses": "25"},
        {"chapter": "3", "verses": "22"},
        {"chapter": "4", "verses": "19"},
        {"chapter": "5", "verses": "14"}
      ]
    },
    {
      "abbr": "2Pet",
      "book": "2 Peter",
      "chapters": [
        {"chapter": "1", "verses": "21"},
        {"chapter": "2", "verses": "22"},
        {"chapter": "3", "verses": "18"}
      ]
    },
    {
      "abbr": "1John",
      "book": "1 John",
      "chapters": [
        {"chapter": "1", "verses": "10"},
        {"chapter": "2", "verses": "29"},
        {"chapter": "3", "verses": "24"},
        {"chapter": "4", "verses": "21"},
        {"chapter": "5", "verses": "21"}
      ]
    },
    {
      "abbr": "2John",
      "book": "2 John",
      "chapters": [
        {"chapter": "1", "verses": "13"}
      ]
    },
    {
      "abbr": "3John",
      "book": "3 John",
      "chapters": [
        {"chapter": "1", "verses": "14"}
      ]
    },
    {
      "abbr": "Jude",
      "book": "Jude",
      "chapters": [
        {"chapter": "1", "verses": "25"}
      ]
    },
    {
      "abbr": "Rev",
      "book": "Revelation",
      "chapters": [
        {"chapter": "1", "verses": "20"},
        {"chapter": "2", "verses": "29"},
        {"chapter": "3", "verses": "22"},
        {"chapter": "4", "verses": "11"},
        {"chapter": "5", "verses": "14"},
        {"chapter": "6", "verses": "17"},
        {"chapter": "7", "verses": "17"},
        {"chapter": "8", "verses": "13"},
        {"chapter": "9", "verses": "21"},
        {"chapter": "10", "verses": "11"},
        {"chapter": "11", "verses": "19"},
        {"chapter": "12", "verses": "17"},
        {"chapter": "13", "verses": "18"},
        {"chapter": "14", "verses": "20"},
        {"chapter": "15", "verses": "8"},
        {"chapter": "16", "verses": "21"},
        {"chapter": "17", "verses": "18"},
        {"chapter": "18", "verses": "24"},
        {"chapter": "19", "verses": "21"},
        {"chapter": "20", "verses": "15"},
        {"chapter": "21", "verses": "27"},
        {"chapter": "22", "verses": "21"}
      ]
    }
  ];

  for (var val in allBook) {
    if (val['book'] == bible) {
      List<ChaptersStruct> allChap = [];
      List<Map<String, dynamic>> chap = val['chapters'];
      for (var chaptersVal in chap) {
        allChap.add(ChaptersStruct(
            chapter: chaptersVal['chapter'], verses: chaptersVal['verses']));
      }
      return BibleVerseAndChspternumberStruct(
          abbr: val['abbr'], book: val['book'], chapters: allChap);
    }
  }
  return BibleVerseAndChspternumberStruct();
}

List<String>? listOfOldandNewTestment(String? oldOrNew) {
  // write a function that return list of the bible Old testament books List of String when the Argument oldOrNew is 'old' and else return new testament
  if (oldOrNew == 'old') {
    return [
      'Genesis',
      'Exodus',
      'Leviticus',
      'Numbers',
      'Deuteronomy',
      'Joshua',
      'Judges',
      'Ruth',
      '1 Samuel',
      '2 Samuel',
      '1 Kings',
      '2 Kings',
      '1 Chronicles',
      '2 Chronicles',
      'Ezra',
      'Nehemiah',
      'Esther',
      'Job',
      'Psalms',
      'Proverbs',
      'Ecclesiastes',
      'Song of Solomon',
      'Isaiah',
      'Jeremiah',
      'Lamentations',
      'Ezekiel',
      'Daniel',
      'Hosea',
      'Joel',
      'Amos',
      'Obadiah',
      'Jonah',
      'Micah',
      'Nahum',
      'Habakkuk',
      'Zephaniah',
      'Haggai',
      'Zechariah',
      'Malachi'
    ];
  } else {
    return [
      'Matthew',
      'Mark',
      'Luke',
      'John',
      'Acts',
      'Romans',
      '1 Corinthians',
      '2 Corinthians',
      'Galatians',
      'Ephesians',
      'Philippians',
      'Colossians',
      '1 Thessalonians',
      '2 Thessalonians',
      '1 Timothy',
      '2 Timothy',
      'Titus',
      'Philemon',
      'Hebrews',
      'James',
      '1 Peter',
      '2 Peter',
      '1 John',
      '2 John',
      '3 John',
      'Jude',
      'Revelation'
    ];
  }
}

List<int>? versesList(
  List<ChaptersStruct>? allchapters,
  int? choosenChapterIndex,
) {
  // given a choosenChapterIndex and allChapters Chapters datatype like this " [         {"chapter": "1", "verses": "31"},         {"chapter": "2", "verses": "25"}]" return the numbers the verses key value which can come in this form "24" as a list of integers from 1 to that number of verse
  if (allchapters == null || choosenChapterIndex == null) {
    return null;
  }

  final chapter = allchapters.firstWhere(
      (element) => element.chapter == (choosenChapterIndex + 1).toString(),
      orElse: () => ChaptersStruct(chapter: '', verses: '0'));

  final int numberOfVerses = int.tryParse(chapter.verses) ?? 0;

  return List<int>.generate(numberOfVerses, (index) => index + 1);
}

DailyPlan11Struct? dailyplan11Adder(
  DailyPlan11Struct newdevoAdder,
  DailyPlan11Struct oldDevoAdder,
) {
  DailyPlan11Struct combinedDevo = DailyPlan11Struct(
      dailyTasks: [...oldDevoAdder.dailyTasks, ...newdevoAdder.dailyTasks]);

  return combinedDevo;
}

GrowthTrackerMajorStruct? goalStructAdder(
  List<DailyTasksStruct>? dailyTasks,
  GrowthTrackerMajorStruct oldDevoAdder,
) {
  List<GrowTrackerStruct>? growGenfromTasks = growTrackerCoversion(dailyTasks);
  GrowthTrackerMajorStruct combinedDevo = GrowthTrackerMajorStruct();
  if (oldDevoAdder.growtracker.isEmpty) {
    combinedDevo = GrowthTrackerMajorStruct(
        weekNo: currentWeekNumber(), growtracker: [...growGenfromTasks!]);
  } else {
    combinedDevo = GrowthTrackerMajorStruct(
        weekNo: currentWeekNumber(),
        growtracker: [...oldDevoAdder.growtracker, ...growGenfromTasks!]);
  }

  return combinedDevo;
}

String? rangelistval(List<int> rangeList) {
  // given a listofinteger return the range in form of this "first integer-last integer in the list" if the length is greater than one or return just the single integer
  if (rangeList.length > 1) {
    return '${rangeList.first}-${rangeList.last}';
  } else if (rangeList.length == 1) {
    return '${rangeList.first}';
  } else {
    return null;
  }
}

String? coachQuestionResponse(
  int? questionNumber,
  String? name,
) {
  // i have 7 questions so i want to return different numbers base on the argument question number
  switch (questionNumber) {
    case 1:
      return '''
Great to meet you, $name!
You’re not here by accident. Every 
detail of your life is woven into a 
grand story, and I’m thrilled to be a 
part of it. 

Now that we’ve got the basics down,
let’s dive a little deeper into how you
live your day-to-day. This will help us 
create a plan that fits perfectly with 
your lifestyle. 
      ''';
    case 2:
      return '''
Life’s rhythm is unique to each of us. 
We want to craft a growth plan that 
fits seamlessly into your everyday 
life, enhancing what you already do. 
Now that we’ve got a sense of your 
routine, let’s talk about how you’re 
currently connecting with God. 

Your spiritual practices are the 
foundation of your growth, so let’s 
make sure they’re solid.
      ''';
    case 3:
      return '''
Consistency is the secret sauce of 
spiritual growth. Whether it’s 
morning, noon, or night, what 
matters is that you’re showing up. 

With a strong foundation in place, 
let’s move on to how you’re feeling 
emotionally and mentally. This is key 
to ensuring your spiritual journey is 
well-rounded and healthy.''';
    case 4:
      return '''
Emotional health is the soil in which 
your spiritual life grows. Recognizing 
where you’re at emotionally is a 
powerful step toward breakthrough.

Now that we’ve got a sense of your 
emotional landscape, let’s identify 
the challenges you’re currently facing 
and where you feel most called to 
focus. These are the mountains we’ll 
climb together.''';
    case 5:
      return '''
Every mountain you face is an 
opportunity for God to show His 
strength in your life. By naming these 
challenges, you’re not just identifying 
obstacles—you’re setting the stage 
for your next victory. 

With a clear view of where you’re 
headed, it’s time to set some 
concrete goals. Let’s chart the 
course for the next few months 
together.''';
    case 6:
      return '''
Goals are like the stars you set your 
sights on—they guide your journey 
and keep you on course. With these 
goals in place, we’ll make sure every 
step you take brings you closer to 
the life you’re meant to live. 

Next, let’s talk about how you best 
learn and grow, so we can tailor the 
experience to fit you perfectly.''';
    case 7:
      return '''
God speaks to each of us in different 
ways—some hear His voice in the 
quiet of reading, others through 
listening or active engagement. We’ll 
tailor this journey to match the way 
you connect best, making sure every 
word hits home. 

Finally, let’s get a sense of how much 
time you can commit to this journey 
and how often you’d like to check in.
      ''';
    case 8:
      return '''
It’s not about how much time you 
have—it’s about making every 
moment count. Whether it’s a few minutes or a full hour, we’ll make sure 
your time is well spent, and that 
you’re growing every day. 

With everything in place, you’re 
ready to embark on this incredible journey. 
Let’s get started!''';
    case 9:
      return '''
It’s not about how much time you 
have—it’s about making every 
moment count. Whether it’s a few minutes or a full hour, we’ll make sure 
your time is well spent, and that 
you’re growing every day. 

With everything in place, you’re 
ready to embark on this incredible journey. 
Let’s get started!''';
    case 10:
      return '''
Welcome aboard, $name! I’m excited 
to walk this path with you. Remember, every great journey 
begins with a single step—and 
you’ve just taken yours. 

Let’s dive into your growth plan and 
start exploring the amazing things 
God has in store for you!"''';
    case 11:
      return '''
To serve you best, we’d love to learn 
more about you. 

Let’s start your journey with a few 
quick questions!''';
    case 12:
      return '''
Here’s what we’ve crafted just for you, $name. 

This plan is all about helping you 
grow in every area of your life—
spiritually, emotionally, and mentally. 
Each day, you’ll receive personalized 
tasks and reflections to guide you 
closer to your true identity and 
purpose. Remember, growth isn’t just 
about the destination; it’s about 
embracing the journey and becoming 
who you were always meant to be.''';
    case 13:
      return '''
Wow, congratulations on completing your scripture reading! 
Dedicating time to immerse yourself in God's Word is no small feat—it's a beautiful act of faith and devotion. 
Each verse you’ve read has the potential to shape your heart, provide clarity, and deepen your connection with God.
 ''';
    case 14:
      return '''
That's wonderful—you’ve just taken a meaningful step in strengthening your relationship with God through prayer. 

It’s such a powerful way to connect, express gratitude, seek guidance, and pour out your heart. 

Remember, every prayer—whether long or short, spoken or silent—reaches His ears and moves His heart.
 ''';
    case 15:
      return '''
That's truly commendable—taking time for reflection is a powerful practice that many overlook. 

By pausing to examine your thoughts, experiences, and intentions, you’ve not only deepened your understanding of yourself but also opened the door to growth and clarity.
 ''';
    case 16:
      return """
     Congratulations on completing that actionable step! 
     
     Taking a plan from thought to action is a big achievement, and it’s a testament to your determination and focus. 
     
     Every small step moves you closer to your goals and reinforces the habit of turning intentions into results.
     """;
    default:
      return null;
  }
}

int? currentWeekNumber() {
  // return the number of weeks of the current day
  DateTime now = DateTime.now();
  DateTime firstDayOfYear = DateTime(now.year, 1, 1);
  int daysSinceFirstDay = now.difference(firstDayOfYear).inDays;
  int currentWeek = (daysSinceFirstDay / 7).ceil();
  return currentWeek;
}

int? currentDayNumber() {
  // return the number of the week day
  return DateTime.now().weekday;
}

List<GrowTrackerStruct>? growTrackerCoversion(
    List<DailyTasksStruct>? dailyTasks) {
  if (dailyTasks == null) {
    return [];
  }
  List<GrowTrackerStruct> growT = [];

  for (DailyTasksStruct task in dailyTasks) {
    GrowTrackerStruct grwt = GrowTrackerStruct(
      scriptureReadingBool: false,
      eveningprayer: false,
      eveningReflection: false,
      prayerPromptBool: false,
      reflectionQuestionBool: false,
      morningAction: false,
      eveningScripture: false,
      eveningAction: false,
      dailyTask: task,
    );
    growT.add(grwt);
  }
  return growT;
}

GrowPlanBibleReadingStruct scriptureCoverter(String? bibleVerse) {
  // give a bible verse  for example like this 1 John 4:7-8 i want to split and get the  book "1 john", the chapter "4" and the verse "7-8"  seperately
  RegExp regExp = RegExp(r"^([1-3]?\s?[A-Za-z]+)\s(\d+):([\d-]+)$");
  Match? match = regExp.firstMatch(bibleVerse!);

  if (match != null) {
    String book = match.group(1) ?? "";
    String chapter = match.group(2) ?? "";
    String verses = match.group(3) ?? "";
    print(book);
    print(verses[0]);
    print(chapter);
    return GrowPlanBibleReadingStruct(
        book: book, chapter: chapter, verses: verseId(verses));
  }
  // return "nothing";

  return GrowPlanBibleReadingStruct();
}

String? bibleBookIdretriever(String? bibleBook) {
  if (bibleBook == "Psalm") {
    bibleBook = "Psalms";
  }
  List<Map<String, dynamic>> allBook = [
    {"b": "1", "n": "Genesis"},
    {"b": "2", "n": "Exodus"},
    {"b": "3", "n": "Leviticus"},
    {"b": "4", "n": "Numbers"},
    {"b": "5", "n": "Deuteronomy"},
    {"b": "6", "n": "Joshua"},
    {"b": "7", "n": "Judges"},
    {"b": "8", "n": "Ruth"},
    {"b": "9", "n": "1 Samuel"},
    {"b": "10", "n": "2 Samuel"},
    {"b": "11", "n": "1 Kings"},
    {"b": "12", "n": "2 Kings"},
    {"b": "13", "n": "1 Chronicles"},
    {"b": "14", "n": "2 Chronicles"},
    {"b": "15", "n": "Ezra"},
    {"b": "16", "n": "Nehemiah"},
    {"b": "17", "n": "Esther"},
    {"b": "18", "n": "Job"},
    {"b": "19", "n": "Psalms"},
    {"b": "20", "n": "Proverbs"},
    {"b": "21", "n": "Ecclesiastes"},
    {"b": "22", "n": "Song of Solomon"},
    {"b": "23", "n": "Isaiah"},
    {"b": "24", "n": "Jeremiah"},
    {"b": "25", "n": "Lamentations"},
    {"b": "26", "n": "Ezekiel"},
    {"b": "27", "n": "Daniel"},
    {"b": "28", "n": "Hosea"},
    {"b": "29", "n": "Joel"},
    {"b": "30", "n": "Amos"},
    {"b": "31", "n": "Obadiah"},
    {"b": "32", "n": "Jonah"},
    {"b": "33", "n": "Micah"},
    {"b": "34", "n": "Nahum"},
    {"b": "35", "n": "Habakkuk"},
    {"b": "36", "n": "Zephaniah"},
    {"b": "37", "n": "Haggai"},
    {"b": "38", "n": "Zechariah"},
    {"b": "39", "n": "Malachi"},
    {"b": "40", "n": "Matthew"},
    {"b": "41", "n": "Mark"},
    {"b": "42", "n": "Luke"},
    {"b": "43", "n": "John"},
    {"b": "44", "n": "Acts"},
    {"b": "45", "n": "Romans"},
    {"b": "46", "n": "1 Corinthians"},
    {"b": "47", "n": "2 Corinthians"},
    {"b": "48", "n": "Galatians"},
    {"b": "49", "n": "Ephesians"},
    {"b": "50", "n": "Philippians"},
    {"b": "51", "n": "Colossians"},
    {"b": "52", "n": "1 Thessalonians"},
    {"b": "53", "n": "2 Thessalonians"},
    {"b": "54", "n": "1 Timothy"},
    {"b": "55", "n": "2 Timothy"},
    {"b": "56", "n": "Titus"},
    {"b": "57", "n": "Philemon"},
    {"b": "58", "n": "Hebrews"},
    {"b": "59", "n": "James"},
    {"b": "60", "n": "1 Peter"},
    {"b": "61", "n": "2 Peter"},
    {"b": "62", "n": "1 John"},
    {"b": "63", "n": "2 John"},
    {"b": "64", "n": "3 John"},
    {"b": "65", "n": "Jude"},
    {"b": "66", "n": "Revelation"}
  ];
  for (var val in allBook) {
    if (val['n'] == bibleBook) {
      String id = val['b'];
      if (id.length == 1) {
        return "$id";
      } else {
        return "$id";
      }
    }
  }
}

int convertTOinteger(String id) {
  // create a function that covert String to integer
  return int.tryParse(id) ?? 0;
}

DailydevtionTasks11Struct? dailyDevo11Adder(
  DailydevtionTasks11Struct newdevoAdder,
  DailydevtionTasks11Struct oldDevoAdder,
) {
  DailydevtionTasks11Struct combinedDevo = DailydevtionTasks11Struct(
      dailyTasks: [...oldDevoAdder.dailyTasks, ...newdevoAdder.dailyTasks]);

  return combinedDevo;
}

String? simpleString(String? values) {
  return values;
}

String bibleReferenceFilter(String verse) {
  // i have bibke verse in this form "1 Peter 4:10 - 'Each of you should use whatever gift you have received to serve others, as faithful stewards of God’s grace in its various forms.'" i want to return "1 Peter 4:10" the scripture before "-"
  // Find the index of the dash character
  int dashIndex = verse.indexOf('-');

  // Extract the substring before the dash
  String reference = verse.substring(0, dashIndex).trim();

  return reference;
}

String? simpleStringCopy(String? values) {
  return values;
}

String? verseId(String verse) {
  // if the verse looks like this "Psalm 119:105" return whatever comes after ":" but it has  "-" in this "Psalm 119:105-107"  return whatever comes after ":" and before "-"
  // String verse = "Psalm 119:105-107";

  int index = verse.indexOf(":");
  if (verse.contains("-")) {
    return verse.substring(index + 1, verse.indexOf("-"));
  } else {
    return verse.substring(index + 1);
  }
}

List<String>? allCitiesFromCountry(
  CountryCityJSonStruct? country,
  String selectedCountry,
) {
  if (country == null) {
    return null;
  }

  // Find the data entry for the selected country
  final countryData = country.data.firstWhere(
    (element) => element.name == selectedCountry,
    orElse: () => DataStruct(),
  );

  // If no states found for the country, return null
  if (countryData.states.isEmpty) {
    return null;
  }

  // Return the list of states for the selected country
  return countryData.states.map((state) => state.name).toList();
}

double? dailyProgessBarCal(GrowTrackerStruct? growtrack) {
  if (growtrack == null) {
    return 0.0;
  }

  int trueCount = 0;

  // Check each boolean field
  if (growtrack.scriptureReadingBool) trueCount++;
  if (growtrack.eveningprayer) trueCount++;
  if (growtrack.eveningReflection) trueCount++;
  if (growtrack.prayerPromptBool) trueCount++;
  if (growtrack.reflectionQuestionBool) trueCount++;
  if (growtrack.morningAction) trueCount++;
  if (growtrack.eveningScripture) trueCount++;
  if (growtrack.eveningAction) trueCount++;

  // Calculate progress (trueCount divided by total number of fields)
  return trueCount / 8.0;
}
