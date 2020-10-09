import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:monenou_web/Screens/Products/SignUp.dart';
import 'package:monenou_web/Screens/Products/myproduct.dart';
import 'package:splashscreen/splashscreen.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    setState(() {
      FirebaseAuth.instance.authStateChanges().listen((currentUser) {
        //  })
      
        // .then((currentUser) => {
        if (currentUser == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        } else {
          // Firestore.instance
          //     .collection("users")
          //     .document(currentUser.uid)
          //     .get()
          //     .then((DocumentSnapshot result) =>
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Myproduct(
                        id: currentUser.uid,
                      )));
          // .catchError((err) => print(err))
        }
      
        super.initState();
      });
    });
  }
  //  {
  //   super.initState();
  //   FirebaseAuth.instance.
  //   currentUser().then((res) {
  //     res.getIdToken();

  //     if (res != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => TabBarDemo()),
  //       );
  //     } else {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => SignUp()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        gradientBackground: LinearGradient(
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
        seconds: 5,
        title: new Text(
          'Bienvenue sur Monenou!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        // backgroundColor: Colors.orange,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}
