import 'package:flutter/material.dart';


class FilterChipWidget extends StatefulWidget{
  final String chipName;
  FilterChipWidget({Key key, String this.chipName}): super (key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
 return _FilterChipState();
   }

}
class _FilterChipState extends State<FilterChipWidget>{

  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  FilterChip(label: Text(widget.chipName), onSelected: (isSelected){
     setState(() {
       _isSelected = isSelected;
     });
   },selected: _isSelected, shape:RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(
         30.0),),labelStyle: TextStyle(
     fontSize: 16.0, fontWeight: FontWeight.bold, color:Colors.black,
   ),selectedColor:Color(0xff39ABC6),);
  }


}