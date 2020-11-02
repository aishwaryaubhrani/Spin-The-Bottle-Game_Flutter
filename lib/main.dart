import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var last = 0.0;
  var random = new Random();
  AnimationController animationController;
  double getPosition(){
    last = random.nextDouble();
    return last;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  spinTheBottle(){
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            child: Image.asset("images/wooden_background.jpg", fit: BoxFit.fill,),
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: new Container(
              child: RotationTransition(
                turns: Tween(begin: last, end: getPosition()).animate(new CurvedAnimation(parent: animationController, curve: Curves.linear)),
                child: GestureDetector(
                    onTap: (){
                      if(animationController.isCompleted){
                        setState(() {
                          spinTheBottle();
                        });
                      }
                    },
                      child: Image.asset("images/glass_bottle.png", width: 220, height: 220,))),
            ),
          )
        ],
      ),
    );
  }
}

