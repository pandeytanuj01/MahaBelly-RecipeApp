import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File imageFile;


  void openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {imageFile = picture;
    });
    Navigator.of(context).pop(); 
  }
  void openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {imageFile = picture;
    });
    Navigator.of(context).pop();

  }

  Future<void> _showChooseDialog(BuildContext context){
    return showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
        child: ListBody(
          children:<Widget>[
            Padding(padding: EdgeInsets.all(8.0)),
            
            GestureDetector(
              
              child:imageFile ==null ?Text("Gallary"):Image.file(imageFile),
              onTap:(){
                openGallary(context);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
                        GestureDetector(
              child:imageFile ==null ?Text("Camera"):Image.file(imageFile),
              onTap:(){
                openCamera(context);
              },
            ),
          ]),
      ),);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Welcome to Maha Belly"),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: AssetImage("assets/home2.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome to maha belly ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              MaterialButton(
                child: Text("Click Here",style: TextStyle(fontSize:20.0),),
                
                height: 50.0,
                minWidth: 150.0,
                color: Colors.green,
                splashColor: Colors.teal,
                textColor: Colors.white,
                onPressed: () {_showChooseDialog(context);},
              ),
            ],
          ),
        ],
      ),
    );
  }
}