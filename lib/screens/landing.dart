import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:zw/utils/config.dart';
import 'package:zw/components/carousel.dart';
import 'package:zw/utils/models.dart';
import 'package:zw/screens/details.dart';







class landing extends StatefulWidget{




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _landingState();
  }

}


class _landingState extends State<landing> with SingleTickerProviderStateMixin {
  TabController _categoriesController;

  @override
  void initState() {
//    getNamePreference().then((updateToken));
    super.initState();
    _categoriesController = TabController(length: 4, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // TODO: implement build
    return Scaffold( appBar:AppBar(leading: IconButton(icon: Icon(Icons.settings),),backgroundColor: Colors.transparent,elevation: 0.0,),
      body: Container(
      color: Colors.white,
      child: ListView(


        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            width: SizeConfig.blockSizeHorizontal * 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15.0, right: 2.0),
                  child: GestureDetector(
                      child: Text("See more", style: TextStyle(color: Color(
                          0xff39ABC6),
                        fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.justify,),
                      onTap: () {
                        print('see more');
                      }
                  ),)

              ],
            ),
          )
          ,

          Container(child: carousel(),
            height: SizeConfig.blockSizeVertical * 30,
          ),
          _categories(),
          Container(height: SizeConfig.blockSizeHorizontal * 90,
            child:
            TabBarView(controller: _categoriesController,
                key: PageStorageKey('scrollkey'),
                children: [
                  _vehicle("key1", posts),
                  _vehicle("key2", posts),
                  _vehicle("key3", posts),
                  _vehicle("key4", posts),

                ]),
          )


        ],
      ),),);  }

  Widget _categories(){



    return TabBar(
      controller: _categoriesController,
      indicatorColor:Colors.transparent,
      labelColor: Color(0xff39ABC6),

      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      tabs: <Widget>[
        Tab(
          child: Text('Vehicle', style: TextStyle(
              fontSize: 21.0
          ),),
        ),
        Tab(
          child: Text('Rent', style: TextStyle(
              fontSize: 21.0
          ),),
        ),
        Tab(
          child: Text('Stand', style: TextStyle(
              fontSize: 21.0
          ),),
        ),
        Tab(
          child: Text('House', style: TextStyle(
              fontSize: 21.0
          ),),
        ),

      ],
    );
  }
  Widget _vehicle(String key, List<Post> Posts){


    return ListView.builder(
      key: PageStorageKey(key),
      itemCount: Posts.length,
      itemBuilder:(BuildContext context, int index){

        Post post = Posts[index];

        return GestureDetector(
          child:Container(
              width: SizeConfig.blockSizeHorizontal*95,
              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*2.5,bottom: SizeConfig.blockSizeHorizontal*3 ),
              child:Card( elevation: 6.0,
                child: Column(children: <Widget>[
                  Container(height: SizeConfig.blockSizeVertical*25,width: SizeConfig.blockSizeHorizontal*95,
                    child: ClipRRect(
                      child: Image(image: AssetImage(post.image),fit: BoxFit.cover,),borderRadius: BorderRadius.circular(10.0),),
                  ),

                  ListTile(title: Text('${post.title}'),subtitle:Row(children: <Widget>[Icon(Icons.location_on,color: Colors.redAccent,),Text('${post.title}')],),

                  ),Row(children: <Widget>[ButtonBar(children: <Widget>[IconButton(icon: Icon(LineAwesomeIcons.phone), onPressed: null)],)],)
                ],),
              )),
          onTap: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>details(post:post)));
            });
          },
        );


      },
    );





  }



}