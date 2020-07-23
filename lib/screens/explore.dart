
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:zw/utils/config.dart';
import 'package:zw/utils/models.dart';
import 'package:zw/components/filterchip.dart';
import 'package:floating_search_bar/floating_search_bar.dart';




class explore extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return exploreState();  }

}

class exploreState extends State<explore>{
  Widget filter(){
    return Container(
      child:Column(
        children: <Widget>[
           Container(height: SizeConfig.blockSizeVertical*5,
          child: Text('Choose Category to Explore?',
            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),),
         Container(child: Wrap(
           spacing: 5.0,runSpacing:3.0,children: <Widget>[ FilterChipWidget(chipName: 'Vehicles',),
           FilterChipWidget(chipName: 'Houses',), FilterChipWidget(chipName: 'Rent',), FilterChipWidget(chipName: 'Stand',)

         ],
         ),)
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);

return Scaffold(
//  appBar:,
    appBar:AppBar(leading: IconButton(icon: Icon(Icons.settings),),backgroundColor: Colors.transparent,elevation: 0.0,),
  body: ListView(
    children: <Widget>[
//      search(),
      filter(),
      GridView.count(shrinkWrap: true,physics: BouncingScrollPhysics(),crossAxisCount: 4, children: List.generate(posts.length, (index){
      return Center(
        child:_imageCardSm(posts[index]) ,
      );}),)],));  }
Widget _imageCardSm(post){
    return Container(
      height: SizeConfig.blockSizeVertical*20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      width: SizeConfig.blockSizeHorizontal*22,
      margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*1,left:SizeConfig.blockSizeHorizontal*1,
          right:SizeConfig.blockSizeHorizontal*1),
      child: ClipRRect(
        child: Image(image:AssetImage(post.image),

          fit: BoxFit.contain,),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
}
Widget _imageCardLg(){
    return Container(
      height: SizeConfig.blockSizeVertical*30,
      width: SizeConfig.blockSizeHorizontal*98,
 decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),color: Colors.deepPurpleAccent),
      margin: EdgeInsets.all(SizeConfig.blockSizeVertical*1),

    );

}
Widget search(){
    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal*5,),
      width: SizeConfig.blockSizeVertical*90,
      height: SizeConfig.blockSizeHorizontal*15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Color(0xFFB5EDFA)
      ),
      child: Container(margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*70),
      child: Icon(Icons.search,color: Color(0xff226F81)),)

    );
}


}