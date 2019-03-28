import 'package:flutter/material.dart';
import 'package:flutter_trans/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 练习',
      home: HomePage(),
      theme: ThemeData(
          primaryColor: Colors.green,
          backgroundColor: Colors.white,
          textTheme: TextTheme(body1: TextStyle(fontSize: 15.0)),
          iconTheme: IconThemeData(color: Colors.white, size: 36.0)),
    );
  }
}
