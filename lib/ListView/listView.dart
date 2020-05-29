import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'temporaryUserClass.dart';

class RecipeList extends StatefulWidget {
  final String apiLink;

  RecipeList(this.apiLink);

  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  // apiLink --> URL of API link

  Future<List<TemporaryUser>> _getRecipe() async {
    // Future is a function with return type List of TemporaryUser

    var data = await http.get(apiLink);
    // data from api --> in json format

    var jsonData = json.decode(data.body);
    // Convert  json data to dart

    List<TemporaryUser> recipeList = [];
    // Empty list

    for (var x in jsonData) {
      TemporaryUser infoRecipe = TemporaryUser(
          x["index"], x["about"], x["name"], x["email"], x["picture"]);
      // infoRecipe is an object of TemporaryUser
      // infoRecipe returns unique data against each index,about,name,email etc.

      recipeList.add(infoRecipe);
    }

    print(recipeList.length);

    return recipeList;
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getRecipe(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading Data....'),
              ),
            );
          } else {
            return ListView.builder(
                // snapshot.data --> array
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  // index --> Used to find data at a particular index of array
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                  );
                });
          }
        },
      ),
    );
  }
}
