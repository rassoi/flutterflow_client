// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future mealCountUpdate(
  String? uid,
  String? ingredtext,
  String? name,
) async {
  // Add your function code here!

  var db1 = FirebaseFirestore.instance;
  WriteBatch batch1 = db1.batch();

  List<String> b = ingredtext!.split("*");
  List<String> nameList = [];

  for (var i = 0; i < b.length - 1; i++) {
    String currentElement = b[i];
    List<String> c = currentElement.split("+");
    nameList.add(c[1]);
  }
  var ingredIds = nameList;
  // List<String> mealCountList = [];
  for (var i = 0; i < ingredIds.length; i++) {
    var ingred = uid! + ingredIds[i];
    var nycRef = db1.collection("meal_ingred").doc(ingred);
    nycRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data["recipe_names"].length);

        // mealCountList.add(data["recipe_names"].length);
        nycRef.update({"meal_count": data["recipe_names"].length}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
            onError: (e) => print("Error updating document $e"));
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
