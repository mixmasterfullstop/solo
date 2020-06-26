import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return searchState();  }

}
class searchState extends State<search>{
  String dropdownValue = 'Vehicle';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
  appBar: AppBar(leading: IconButton(icon: Icon(CupertinoIcons.back,color: Colors.black26,), onPressed: (){
    Navigator.pop(context);
  }),backgroundColor: Colors.white,elevation: 0.0,actions: <Widget>[Container( width:100.0,height: 200.0,child: TextField(decoration: InputDecoration(hintText:'Search.....') ,)),IconButton(icon:(FaIcon(FontAwesomeIcons.search)), onPressed: null)],),
    body:ListView(children: <Widget>[
      Container(height: 300.0, width: 300.0,child: Center(
        child:  _model() ,
      ),)

    ],) );
  }
  Widget _model(){
    return DropdownButton<String>(
      value: dropdownValue,
      icon: FaIcon(FontAwesomeIcons.sort,color: Color(0xff39ABC6),),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(color: Colors.black45,fontFamily: 'Montserrat'),
      underline: Container(
        height: 4,
        color:Color(0xff39ABC6),
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Vehicle', 'Rent', 'Stand', 'House']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
