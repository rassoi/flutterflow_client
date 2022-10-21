// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future deleteIngred(
  String? uid,
  String? name,
  String? ingredtext,
) async {
  // Add your function code here!

  var db = FirebaseFirestore.instance;
  WriteBatch batch = db.batch();

  List<String> b = ingredtext!.split("*");
  List<String> nameList = [];

  for (var i = 0; i < b.length - 1; i++) {
    String currentElement = b[i];
    List<String> c = currentElement.split("+");
    nameList.add(c[1]);
  }
  var ingredIds = nameList;
  for (var i = 0; i < ingredIds.length; i++) {
    var ingred = uid! + ingredIds[i];
    var nycRef = db.collection("meal_ingred").doc(ingred);
    batch.update(nycRef, {
      "recipe_names": FieldValue.arrayRemove([name]),
    });
  }
  batch.commit();
}
