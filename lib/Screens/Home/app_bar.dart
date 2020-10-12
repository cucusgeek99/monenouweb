import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monenou_web/Screens/Home/component/default_button.dart';
import 'package:monenou_web/Screens/Products/ProductsGrid.dart';
import 'package:monenou_web/Screens/Products/SignUp.dart';
import 'package:monenou_web/Screens/Products/dashboard.dart';
import 'package:monenou_web/Screens/Products/home_page.dart';
import 'package:monenou_web/Screens/Products/myproduct.dart';
import 'package:monenou_web/constant.dart';

import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {
  var id;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
//   void initState() {

// // if (auth.currentUser != null) {
// //  id= auth.currentUser.uid;
// // }

//   }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/monenou.png",
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Text(
            "monenou",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: "Home",
            press: () {},
          ),
          // MenuItem(
          //   title: "about",
          //   press: () {},
          // ),
          // MenuItem(
          //   title: "Pricing",
          //   press: () {},
          // ),
          // MenuItem(
          //   title: "Contact",
          //   press: () {},
          // ),
          // MenuItem(
          //   title: "Login",
          //   press: () {},
          // ),
          DefaultButton(
            text: "Voir les annonces",
            press: () {
              // FirebaseAuth.instance.authStateChanges().listen((currentUser) {
              //   if (currentUser == null) {
              //     showDialog(
              //         context: context,
              //         builder: (context) => AlertDialog(
              //               backgroundColor: Colors.orange,
              //               contentTextStyle: TextStyle(color: Colors.white),
              //               title: Center(
              //                 child: Text('Monenou',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 30,
              //                         fontFamily: 'Roboto')),
              //               ),
              //               content: Column(
              //                 children: [
              //                   Center(
              //                     child: Text(
              //                         'Connectez vous pour pouvoir publier des articles',
              //                         style: TextStyle(
              //                             fontWeight: FontWeight.bold,
              //                             fontSize: 20,
              //                             fontFamily: 'Roboto')),
              //                   ),
              //                   SizedBox(
              //                     height: 100,
              //                   ),
              //                   Container(
              //                     width: double.infinity,
              //                     child: FlatButton(
              //                       child: Text("Se connecter",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 18,
              //                               fontFamily: 'Roboto')),
              //                       textColor: Colors.black,
              //                       padding: EdgeInsets.all(16),
              //                       onPressed: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) => SignUp()),
              //                         );
              //                       },
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 25,
              //                   ),
              //                   Container(
              //                     width: double.infinity,
              //                     child: FlatButton(
              //                       child: Text("Annuler",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 18,
              //                               fontFamily: 'Roboto')),
              //                       textColor: Colors.black,
              //                       padding: EdgeInsets.all(16),
              //                       onPressed: () {
              //                         Navigator.of(context).pop();
              //                       },
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ));
              //   } else {
              //     Navigator.push(context, MaterialPageRoute<void>(
              //       builder: (BuildContext context) {
              //         return Dashboard();
              //       },
              //     ));
              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //         builder: (context) => Myproduct(
              //     //               id: id,
              //     //             )));
              //   }
              // });
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return TabBarDemo();
                },
              ));
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            onPressed: () {
              FirebaseAuth.instance.authStateChanges().listen((currentUser) {
                // if (currentUser == null) {
                //   showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //             backgroundColor: orango,
                //             contentTextStyle: TextStyle(color: Colors.white),
                //             title: Center(
                //               child: Text('Monenou',
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 30,
                //                       fontFamily: 'Roboto')),
                //             ),
                //             content: Column(
                //               children: [
                //                 Center(
                //                   child: Text(
                //                       'Connectez vous pour pouvoir publier des articles',
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 20,
                //                           fontFamily: 'Roboto')),
                //                 ),
                //                 SizedBox(
                //                   height: 100,
                //                 ),
                //                 Container(
                //                   width: double.infinity,
                //                   child: FlatButton(
                //                     child: Text("Se connecter",
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 18,
                //                             fontFamily: 'Roboto')),
                //                     textColor: Colors.black,
                //                     padding: EdgeInsets.all(16),
                //                     onPressed: () {
                //                       Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) => SignUp()),
                //                       );
                //                     },
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 25,
                //                 ),
                //                 Container(
                //                   width: double.infinity,
                //                   child: FlatButton(
                //                     child: Text("Annuler",
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 18,
                //                             fontFamily: 'Roboto')),
                //                     textColor: Colors.black,
                //                     padding: EdgeInsets.all(16),
                //                     onPressed: () {
                //                       Navigator.of(context).pop();
                //                     },
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ));
                // } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myproduct(
                              id: auth.currentUser.uid,
                            )));
                // }
              });

              // Navigator.push(context, MaterialPageRoute<void>(
              //   builder: (BuildContext context) {
              //     return IntroScreen();
              //   },
              // ));
            },
          ),
        ],
      ),
    );
  }
}
