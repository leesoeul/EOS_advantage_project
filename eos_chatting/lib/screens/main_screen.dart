import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/palette.dart';
import 'package:flutter/animation.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen>{
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top:0, left: 0, right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill),
                  ),


                  child: Container(
                    padding: EdgeInsets.only(top:90, left:20) ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text:'Welcome ',
                                style: TextStyle(
                                    letterSpacing:  1.0, fontSize: 25, color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: (!isSignupScreen) ? 'back!': 'to EOS chat!',
                                    style: TextStyle(letterSpacing:  1.0, fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold  ),
                                  )
                                ])),


                        SizedBox(
                          height: 5.0,
                        ),
                        Text((!isSignupScreen) ? 'signin to continue': 'signup to continue',
                            style: TextStyle(letterSpacing: 1.0, color: Colors.white,))
                      ],
                    ),
                  ),
                )),



            Positioned(
                top: 150,
                child: AnimatedContainer(
                  height: (!isSignupScreen) ? 250.0 : 280.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width -40,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15, spreadRadius: 5)
                      ]),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,



                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap:(){
                                setState((){
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2, width: 55, color: Colors.green,
                                    )
                                ],
                              ),
                            ),


                            GestureDetector(
                                onTap:(){
                                  setState((){
                                    isSignupScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignupScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1),
                                    ),
                                    if (isSignupScreen)
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2, width: 55, color: Colors.green,
                                      )
                                  ],
                                ))
                          ],
                        ),





                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              child: Column(
                                  children: [
                                    for(num i=0;i<((!isSignupScreen)?2:3);i++)
                                    TextFormField(

                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                            color: Palette.iconColor),
                                        hintText : 'User name',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1) ,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))),
                                      ),
                                    ),
                                    // SizedBox(height: 8),


                                  ]),
                            ))
                      ]),)),

            Positioned(
                top: 410,
                right: 0,
                left:0,
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen, Colors.green],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(30 ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3 ),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,1)
                                  )
                                ]
                            ),
                            child: Icon(
                              Icons.airport_shuttle,
                              color:Colors.white,
                            )
                        )
                    )
                )
            ),


            Positioned(
                top : MediaQuery.of(context).size.height -125,
                right:0,
                left:0,
                child: Column(
                  children: [
                    (!isSignupScreen) ? Text('or Signin with') : Text('or Signup with'),
                    // TODO : LOGIN 누르면 ‘or Signin with’, SIGNUP 누르면 ‘or Signup with’
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton.icon(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                          backgroundColor: Palette.googleColor,
                      ),
                      icon: Icon(Icons.add),
                      label: Text('Google'),
                    )
                  ],
                )
            )



          ],));} }
