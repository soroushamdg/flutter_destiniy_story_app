import 'package:destini_app/objects/story_objects.dart';
import 'package:destini_app/objects/storyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

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
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: StoryTeller(),
                ))));
  }
}

class StoryTeller extends StatefulWidget {
  @override
  _StoryTellerState createState() => _StoryTellerState();
}

class _StoryTellerState extends State<StoryTeller> {
  StoryboardController stb_controller;

  _StoryTellerState() {
    print("init _StoryTellerState");
    this.stb_controller = StoryboardController();
    this.stb_controller.findInitiationPage();
  }

  Widget generateOptionButton(PageOption option) {
    return FlatButton(
        color: Colors.white,
        onPressed: () {
          setState(() {
            this.stb_controller.continueToNextPage(option);
          });
        },
        child: Text(option.option_text));
  }

  List<Widget> returnOptionsButtons(List<PageOption> options) {
    if (options.length == 0) {
      return [
        FlatButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                this.stb_controller = StoryboardController();
                this.stb_controller.findInitiationPage();
              });
            },
            child: Text("End of story! Start Over!")),
      ];
    }
    return options.map((item) => generateOptionButton(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (this.stb_controller.returnCurrentPageID() >= 0) {
      StoryPage storypage = this.stb_controller.returnCurrentPage();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              storypage.title,
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                storypage.text,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: returnOptionsButtons(storypage.pageOptions),
              ),
            ),
          )
        ],
      );
    } else {
      return Center(
        child: Column(
          children: [
            Text("Story is finished!"),
            FlatButton(
                onPressed: () {
                  setState(() {
                    this.stb_controller = StoryboardController();
                    this.stb_controller.findInitiationPage();
                  });
                },
                child: Text("Start over!"))
          ],
        ),
      );
    }
  }
}
