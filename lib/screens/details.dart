import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:zw/utils/models.dart';
import 'package:zw/utils/config.dart';



class details extends StatefulWidget{
  final Post post;
  details({this.post});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _detailsState();
  }

}
class _detailsState extends State<details>{


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(leading: IconButton(icon: Icon(CupertinoIcons.back,color: Colors.black26,), onPressed: (){
    Navigator.pop(context);
  }),backgroundColor: Colors.white,elevation: 0.0,),
  body:Column(
    children: <Widget>[
      Container(height:SizeConfig.blockSizeVertical*50,
        child: Hero(tag: widget.post.image, child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),

          child: Image(image: AssetImage(widget.post.image)),
        ),)
        
      ),ListTile(title: Text('Price: \$ ${widget.post.price}'??""),selected:true,subtitle:Row(children: <Widget>[FaIcon(FontAwesomeIcons.locationArrow,color: Colors.grey,),Text("${widget.post.location}??")],),)

    ],
  ) ,
);  }

}