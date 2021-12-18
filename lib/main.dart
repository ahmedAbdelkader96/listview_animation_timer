import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:listview_animation_timer/screen/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.deepPurple
      ),
      home: Home(),
    );
  }


}




