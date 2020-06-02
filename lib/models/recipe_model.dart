import 'package:scoped_model/scoped_model.dart';

class Recipe extends Model{
  int id;
  String title;
  String imageURI;
  int readyMinutes;

  Recipe({this.id, this.title, this.imageURI, this.readyMinutes});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageURI = json['imageURI'];
    readyMinutes = json['readyMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageURI'] = this.imageURI;
    data['readyMinutes'] = this.readyMinutes;
    return data;
  }
}

class RecipeData extends Model{
  
}

