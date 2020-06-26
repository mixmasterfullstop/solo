import 'package:flutter/material.dart';
import 'package:zw/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColorLight:Colors.white,backgroundColor:Colors.white),
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }



}