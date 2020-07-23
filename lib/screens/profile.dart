import 'package:flutter/material.dart';
class profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _profileState();
   }

}
class _profileState extends State<profile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( body: Center(
      child: Column(
        children: List.generate(4, (index) =>Text(index.toString())),
      ),
    ),);
  }

}