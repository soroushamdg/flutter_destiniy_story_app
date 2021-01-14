import 'package:destini_app/objects/story_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

Widget generateOptionButton(PageOption option) {}

List<Widget> returnOptionsButtons() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.indigo,
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        "here goes the title",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text("here goes page text",
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            //options
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
