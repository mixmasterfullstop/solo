import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zw/utils/config.dart';
import 'package:zw/screens/search.dart';
import 'package:zw/screens/landing.dart';
import 'package:zw/screens/explore.dart';
import 'package:zw/screens/profile.dart';

import 'package:google_nav_bar/google_nav_bar.dart';







class home extends StatefulWidget{


  // TODO: implement build


  @override
  _homePage createState() => new _homePage();
}


class _homePage extends State<home> with SingleTickerProviderStateMixin {
//  String token;


//  Future<String> getNamePreference() async {
//    SharedPreferences _prefs = await SharedPreferences.getInstance();
//    String name = _prefs.getString('name');
//    return name;
//  }
  int _selectedIndex = 0;
  List<Widget> _routes = <Widget>[
    landing(),
    explore(),
    profile()



  ];

  int selectedIndex = 0;




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        backgroundColor: Colors.white,
//        elevation: 0.0,actions: <Widget>[],
//        leading: IconButton(
//            icon: FaIcon(FontAwesomeIcons.bars), onPressed: null),),


      body:_routes.elementAt(selectedIndex),
      bottomNavigationBar:Container(

        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:5.0, vertical: 8),
            child: GNav(
                gap: 6,
                activeColor: Color(0xff226F81),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color(0xFFB5EDFA),
                tabs: [
                  GButton(
                    iconColor:Color(0xff226F81) ,
                    icon: LineAwesomeIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    iconColor:Color(0xff226F81) ,

                    icon: LineAwesomeIcons.search,
                    text: 'Explore',
                  ),
                  GButton(                    iconColor:Color(0xff226F81) ,

                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                  GButton(
                    iconColor:Color(0xff226F81) ,

                    icon: Icons.info_outline,
                    text: 'About Us',
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
          ),
        ),) ,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => search()));
        });
      },
        child: FaIcon(FontAwesomeIcons.filter),
        backgroundColor: Color(0xff226F81),),


    );
  }



}
//  void updateToken(String token){
//    setState(()=>this.token=token);
//  }












