import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zw/utils/config.dart';
import 'package:zw/screens/home.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:zw/screens/register.dart';

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // TODO: implement build
    return login_screen();
  }

  
}
class login_screen extends StatefulWidget{




  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return login_screenState();
  }
  

 
}

class login_screenState extends State<login_screen>{




  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
  GlobalKey<FormFieldState>();
  Color kablue = const Color(0xff39ABC6);

  final _padding = 5.0;
  final _textboxDeco = BoxDecoration(
    color:Color(0xff39ABC6),
    borderRadius: BorderRadius.circular(5.0),

    boxShadow: [BoxShadow(
      color: Color(0xff6F727B),
      blurRadius: 6.0,
      offset: Offset(0,2)
    )]
  );
  
final _monteserrati = TextStyle(
  fontFamily:'Montserrat',
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.bold

);
  final _monteserrati_sm = TextStyle(
      fontFamily:'Montserrat',
      fontSize: 15.0,
      color: Colors.white

  );
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _errorstyle = TextStyle(
//    fontFamily: 'Sans Serif',
    color: Colors.red,height: -1,
  );

  int _maxlength = 9;
bool _AutoValidateEmail = false;
bool _AutoValidatePassword = false;
bool _loading = false;

@override
void initState() {
  // TODO: implement initState


  super.initState();

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        backgroundColor:kablue,
        drawer:Drawer(
          child: Column(children: <Widget>[
            IconButton(icon: Icon(CupertinoIcons.person_solid), onPressed: null)
          ],
          ),
        ),

        body:Container(
          decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [const Color(0xFF16D9E3), const Color(0xFF30C7EC)], )
          ),
          child: FormBuilder(
          key: _formKey,
          child:
            _loading ? Center(child: Container(width: SizeConfig.blockSizeHorizontal*50,height:SizeConfig.blockSizeHorizontal*50,decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: [const Color(0xFF16D9E3), const Color(0xFF30C7EC)], )
            ),
                child:CircularProgressIndicator())) : ListView(


              children:<Widget>[ Container(

                margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15.5,top:SizeConfig.blockSizeVertical*30),

                width: SizeConfig.blockSizeHorizontal*25,
                height: SizeConfig.blockSizeVertical*4.2,
                child: Text("Email",style: _monteserrati_sm,),
              ),Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15,top:SizeConfig.blockSizeVertical*1),

                    width: SizeConfig.blockSizeHorizontal*70,
                    height: SizeConfig.blockSizeHorizontal*13,
                    decoration: _textboxDeco,


                    child:FormBuilderTextField(
                      attribute: 'Username',
                      autovalidate: _AutoValidateEmail,

                      controller: _email,
                      maxLines: 1,
                      style: _monteserrati_sm,
                      validators: [//FormBuilderValidators.email(errorText:'enter valid email',),
                        FormBuilderValidators.required(errorText: 'username can not empty')

                      ],
                      onChanged: (value){
                        setState(() {
                        });
                      },

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorStyle: _errorstyle,
                        suffixIcon: Icon(LineAwesomeIcons.user,
                        color: Colors.blueGrey,),
                        contentPadding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.2)
                      )


                    ),

                  ),
                ],

              ),Container(

            margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15.5,top:SizeConfig.blockSizeVertical*3),

            width: SizeConfig.blockSizeHorizontal*25,
                height: SizeConfig.blockSizeVertical*4.2,

                child: Text("Password",style: _monteserrati_sm,),),
                Row(
                children: <Widget>[Container(margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15,top:SizeConfig.blockSizeVertical*1),

                  width: SizeConfig.blockSizeHorizontal*70,
                  height: SizeConfig.blockSizeHorizontal*13,
                  decoration: _textboxDeco,


                  child:FormBuilderTextField(
                     attribute:'password',
                      controller: _password,
                      autovalidate: _AutoValidatePassword,


                      obscureText: true,
                      maxLines: 1,
                      validators: [FormBuilderValidators.required(errorText: 'password should not be empty'),
                        FormBuilderValidators.maxLength(_maxlength,errorText: 'password should not be less than $_maxlength'),

                      ],

                      style:_monteserrati_sm,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(LineAwesomeIcons.lock,
                            color: Colors.blueGrey,),errorStyle:_errorstyle,
                          contentPadding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.5),


                      )


                  ),

                )
                ],


              ),
                SizedBox(height: SizeConfig.blockSizeVertical*5,),
                Container(
                    margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15,top:SizeConfig.blockSizeVertical*3,
                        right:SizeConfig.blockSizeHorizontal*15),

                    width: SizeConfig.blockSizeHorizontal*50,
                    height: SizeConfig.blockSizeHorizontal*13,



                    child:FlatButton(

                      child:Container(width: SizeConfig.blockSizeHorizontal*70,
                      height: SizeConfig.blockSizeHorizontal*13,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                          colors: [const Color(0xFF16D9E3), const Color(0xFF30C7EC)], ),
                          borderRadius: BorderRadius.circular(5.0),

                          boxShadow: [BoxShadow(
                              color: Color(0xff6F727B),
                              blurRadius: 10.0,
                              offset: Offset(1,2)

                          )],

                      ),
                      alignment: Alignment.center,
                      child: Text('LOGIN',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,
                          fontWeight:FontWeight.w700,fontSize: 20.0,letterSpacing: 1.2,
                          fontFamily: 'Montserrat'),),
                    ),

                      padding: EdgeInsets.all(0.0),

                      onPressed: (){

                     if(_formKey.currentState.validate()){
                       setState(() {
                         _loading = true;
                         _Login(_email.text, _password.text);
                       });




                     }
                     else{
                          setState(() {
                            _AutoValidateEmail =true;
                            _AutoValidatePassword =true;

                          });
                       }

                      },

                    )

                ),SizedBox(height: SizeConfig.blockSizeVertical*2,),
                Row(
                  children: <Widget>[ Container(
                    margin: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*15,right:SizeConfig.blockSizeHorizontal*15) ,
                    width: SizeConfig.blockSizeHorizontal*35,
                    child: GestureDetector(

                      child: Text("forgot Password?",style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Montserrat_Bold',
                      ),),
                      onTap: ()=>print('tapped'),
                    ),
                  ),
                    Container(
                      child: GestureDetector(
                        child: Text("Register",style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.0,fontFamily:'Montserrat_Bold'

                        ),textAlign: TextAlign.center,),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>register())),
                      ),

                    )],
                )

                
                  


                  




    ]
            ),

        )
        ,),
      )

    );
  }
  Future<bool> saveNamePreference(String name) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('name', name);
    return _prefs.commit();
  }


void _showhome(){

    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
}

_Login(String username, String password) async{
   Map data = {
     "username": username,
     "password": password
   };
   
   var jsonResponse = null;
   SharedPreferences _prefs = await SharedPreferences.getInstance();
  var response = await http.post('http://10.0.2.2:8000/rest-auth/login/',body: data);
  if(response.statusCode ==200){
    jsonResponse = json.decode(response.body);
    setState(() {
      saveNamePreference(jsonResponse['key']);
     _loading = false;
     _showhome();
    });
  }
}

}

