import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String> ingredname(String? ingredtext) {
  List<String> b = ingredtext!.split("*");
  List<String> nameList = [];

  for (var i = 0; i < b.length; i++) {
    String currentElement = b[i];
    List<String> c = currentElement.split("+");
    nameList.add(c[0]);
  }
  return nameList;
}

DateTime geCurrentTimeStamp() {
  return DateTime.now();
}

String recipeList(List<String>? recipelist) {
  return recipelist!.join(",");
  // Add your function code here!
}

String getStrTimeStamp(
  List<String>? dates,
  List<String>? days,
  String? day,
) {
  return dates![days!.indexOf(day!)];
}

int mealStatus(List<String>? mealTime) {
  // Add your function code here!

  return mealTime!.length;
}

List<String> recipeName(List<String>? recipeArray) {
  List<String> nameList = [];

  for (var i = 0; i < recipeArray!.length; i++) {
    String currentElement = recipeArray[i];
    List<String> c = currentElement.split("+");
    nameList.add(c[0]);
  }
  return nameList;
}
