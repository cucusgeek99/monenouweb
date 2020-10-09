import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:monenou_web/Screens/Products/EmailLogIn.dart';
import 'package:monenou_web/Screens/Products/EmailSignUp.dart';
import 'package:monenou_web/Screens/Products/sign_in.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:monenou_web/constant.dart';

class SignUp extends StatefulWidget {
  final themeColor = Color(0xfff5a623);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);
  
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
    final themeColor = Color(0xfff5a623);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);
  

    Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

   Future<Null> openDialog() async {
     FirebaseAuth.instance.authStateChanges().listen((currentUser) {
                  if (currentUser != null) {
     showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: orango,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'EXIT',
                      style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Voulez vous quittez l´application ?',
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.cancel,
                        color: primaryColor,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'NON',
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        color: primaryColor,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'OUI',
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
    });}
        else{
            // Navigator.of(context).pushAndRemoveUntil(
            //               MaterialPageRoute(builder: (context) => TabBarDemo()),
            //               (Route<dynamic> route) => false);
        }

  });}
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
                  child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAA651),
              Color(0xFFEFA142),
              Color(0xFFF49C33),
              Color(0xFFFA9720),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
      ),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text("Connectez vous \n  sur Monenou",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Roboto')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SignInButton(
                    Buttons.Facebook,
                    text: "Facebook",
                    onPressed: () {
                      signInWithFacebook(context);
                        //  whenComplete(() {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return Myproduct();
                        //         },
                        //       ),
                        //     );
                          // });
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Expanded(
                      child: SignInButton(
                        Buttons.Google,
                        text: "Google",
                        onPressed: () {
                          signInWithGoogle(context);
                          // whenComplete(() {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return Myproduct();
                          //       },
                          //     ),
                          //   );
                          // }
                          
                        },
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Email,
                      text: "Email",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => EmailSignUp()),
                        );
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                        child: Text("Se connecter avec email",
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmailLogIn()),
                          );
                        })),
                   
              ]),
      ),
    ),
            onWillPop: onBackPress,
        ));
  }
}
