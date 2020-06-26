import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:zw/utils/config.dart';
import 'package:zw/utils/models.dart';
import 'package:zw/screens/details.dart';




class carousel extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,

          itemBuilder: (BuildContext context, int index) {
            Post _post = posts[index];
            return GestureDetector(child:Container(
                width: SizeConfig.blockSizeHorizontal*50 ,
                height: SizeConfig.blockSizeVertical*30,
                margin: EdgeInsets.all(10.0),

                decoration: BoxDecoration(color:Colors.white,
                ),
                child: Stack(
                  children: <Widget>[Positioned(child: Container(
                    height: SizeConfig.blockSizeVertical*13,
                    width: SizeConfig.blockSizeHorizontal*50,
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26,
                        offset:Offset(0.0, 2.0),blurRadius: 6.0 )],color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                    child:  Padding(padding: EdgeInsets.only(left:5.0),child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: SizeConfig.blockSizeVertical*2,),
                          Text(_post.title,style: TextStyle(fontSize: 12.0),),
//                     Flexible(
//                       child: RichText(
//                         overflow: TextOverflow.ellipsis,
//                         strutStyle: StrutStyle(fontSize: 12.0),
//                         text: TextSpan(
//                             style: TextStyle(color: Colors.black,fontSize:10.0),
//                             text: _post.location,),
//                       ),
//                     ),
                          Row(children: <Widget>[Text('Price:',style: TextStyle(fontSize: 10.0,color: Colors.black,fontWeight: FontWeight.bold),),
                            Text('\$ ${_post.price}',style: TextStyle(fontSize: 10.0,color: Colors.grey,fontWeight: FontWeight.bold)),

                          ],)
                        ])),
                  ),bottom: SizeConfig.blockSizeVertical*0,),
                    Container(
                      width: SizeConfig.blockSizeHorizontal*46,
                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                      height: SizeConfig.blockSizeVertical*15,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(20.0)),
                      child: ClipRRect(
                        child: Hero(tag: _post.image, child: Image(image:AssetImage(_post.image),width:SizeConfig.blockSizeHorizontal*46 ,
                          height:SizeConfig.blockSizeVertical*15,
                          fit: BoxFit.cover,),) ,
                        borderRadius: BorderRadius.circular(20.0),

                      ),
                    ),



                  ],
                )
            ),
                onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>details(post:_post)));}
            );
          }),
    );
  }





}