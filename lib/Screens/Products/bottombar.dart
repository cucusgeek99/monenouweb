// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/SignUp.dart';
// import 'package:monenou/views/add_image.dart';
// import 'package:monenou/views/caroussel.dart';
// import 'package:monenou/views/dynamiclink.dart';
// import 'package:monenou/views/favlist.dart';
// import 'package:monenou/views/firestore_search.dart';
// import 'package:monenou/views/home_page.dart';
// import 'package:monenou/views/into_screen.dart';
// import 'package:monenou/views/myproduct.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:monenou/views/photoview.dart';

// class BottomBar extends StatefulWidget {
//   @override
//   _BottomBarState createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     var id;
//     // FirebaseAuth.instance.currentUser.then((res) async {
//     // });
//     setState(() {
//       FirebaseAuth.instance.authStateChanges().listen((res) {
//         id = res.uid;
//       });
//     });

//     return BottomAppBar(
//       child: new Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: IconButton(
//               icon: FaIcon(FontAwesomeIcons.home),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute<void>(
//                   builder: (BuildContext context) {
//                     return TabBarDemo();
//                   },
//                 ));
//               },
//             ),
//           ),
//           Expanded(
//             child: IconButton(
//               icon: FaIcon(FontAwesomeIcons.star),
//               onPressed: () {
//                 FirebaseAuth.instance.authStateChanges().listen((currentUser) {
//                   if (currentUser == null) {
//                     showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                               backgroundColor: orango,
//                               contentTextStyle: TextStyle(color: Colors.white),
//                               title: Center(
//                                 child: Text('Monenou',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 30,
//                                         fontFamily: 'Roboto')),
//                               ),
//                               content: Column(
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                         'Connectez vous pour pouvoir publier des articles',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                             fontFamily: 'Roboto')),
//                                   ),
//                                   SizedBox(
//                                     height: 100,
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text("Se connecter",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                               fontFamily: 'Roboto')),
//                                       textColor: Colors.black,
//                                       padding: EdgeInsets.all(16),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => SignUp()),
//                                         );
//                                       },
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text("Annuler",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                               fontFamily: 'Roboto')),
//                                       textColor: Colors.black,
//                                       padding: EdgeInsets.all(16),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ));
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Favlist(
//                                   id: id,
//                                 )));
//                   }
//                 });

//                 // Navigator.push(context, MaterialPageRoute<void>(
//                 //   builder: (BuildContext context) {
//                 //     return Favlist(id: id);
//                 //   },
//                 // ));
//               },
//             ),
//           ),
//           Expanded(child: new Text('')),
//           Expanded(
//             child: IconButton(
//               icon: FaIcon(FontAwesomeIcons.bell),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute<void>(
//                   builder: (BuildContext context) {
//                     return HeroExample();
//                   },
//                 ));
//               },
//             ),
//           ),
//           Expanded(
//             child: IconButton(
//               icon: FaIcon(FontAwesomeIcons.userCircle),
//               onPressed: () {
//                 FirebaseAuth.instance.authStateChanges().listen((currentUser) {
//                   if (currentUser == null) {
//                     showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                               backgroundColor: orango,
//                               contentTextStyle: TextStyle(color: Colors.white),
//                               title: Center(
//                                 child: Text('Monenou',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 30,
//                                         fontFamily: 'Roboto')),
//                               ),
//                               content: Column(
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                         'Connectez vous pour pouvoir publier des articles',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                             fontFamily: 'Roboto')),
//                                   ),
//                                   SizedBox(
//                                     height: 100,
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text("Se connecter",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                               fontFamily: 'Roboto')),
//                                       textColor: Colors.black,
//                                       padding: EdgeInsets.all(16),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => SignUp()),
//                                         );
//                                       },
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text("Annuler",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                               fontFamily: 'Roboto')),
//                                       textColor: Colors.black,
//                                       padding: EdgeInsets.all(16),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ));
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Myproduct(
//                                   id: id,
//                                 )));
//                   }
//                 });

//                 // Navigator.push(context, MaterialPageRoute<void>(
//                 //   builder: (BuildContext context) {
//                 //     return IntroScreen();
//                 //   },
//                 // ));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
