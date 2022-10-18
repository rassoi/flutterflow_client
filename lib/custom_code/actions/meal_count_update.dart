// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future mealCountUpdate(
  String? ingredtext,
  String? name,
  String? uid,
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
    nycRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        batch.update(nycRef, {"meal_count": data["meal_count"].length});
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
  batch.commit();
}
