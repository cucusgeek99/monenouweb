// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/services/user_info.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/SignUp.dart';
// import 'package:monenou/views/addproduct.dart';
// import 'package:monenou/views/bottombar.dart';
// import 'package:monenou/views/product_card.dart';

// class Favlist extends StatefulWidget {
//   final id;

//   const Favlist({Key key, this.id}) : super(key: key);

//   @override
//   _FavlistState createState() => _FavlistState();
// }

// class _FavlistState extends State<Favlist> {
//   @override
//   Widget build(BuildContext context) {
//     // setState(() {
//     //   FirebaseAuth.instance.currentUser().then((res) async {
//     //     id = res.uid;
//     //     print(id);
//     //   });
//     // });

//     final dbRef = FirebaseFirestore.instance
//         .collection("favoris")
//         .where('userId', isEqualTo: widget.id)
//         .get();

//     //  else return CircularProgressIndicator();

//     return Scaffold(
//       floatingActionButton: new FloatingActionButton(
//         backgroundColor: Colors.white,
//         onPressed: () {
//           // Navigator.push(context, MaterialPageRoute<void>(
//           //   builder: (BuildContext context) {
//           //     return EditProduct();
//           //   },
//           // ));
//           FirebaseAuth.instance.authStateChanges().listen((currentUser) {
//             if (currentUser == null) {
//               showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                           backgroundColor: orango,
//                           contentTextStyle: TextStyle(color: Colors.white),
//                           title: Center(
//                             child: Text('Monenou',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30,
//                                     fontFamily: 'Roboto')),
//                           ),
//                           content: Column(
//                             children: [
//                               Center(
//                                 child: Text(
//                                     'Connectez vous pour pouvoir publier des articles',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20,
//                                         fontFamily: 'Roboto')),
//                               ),
//                               SizedBox(
//                                 height: 100,
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 child: FlatButton(
//                                   child: Text("Se connecter",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                           fontFamily: 'Roboto')),
//                                   textColor: Colors.black,
//                                   padding: EdgeInsets.all(16),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => SignUp()),
//                                     );
//                                   },
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 25,
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 child: FlatButton(
//                                   child: Text("Annuler",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                           fontFamily: 'Roboto')),
//                                   textColor: Colors.black,
//                                   padding: EdgeInsets.all(16),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ));
                      
                      
//             } else {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => EditProduct()));
//             }
//           });
//         },
//         tooltip: 'Ajouter un produit',
//         child: Icon(
//           Icons.add,
//           color: orango,
//         ),
//         elevation: 4.0,
//       ),
//       bottomNavigationBar: BottomBar(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: Column(children: [
//         SizedBox(height: 50),
//         Center(
//           child: Text(
//             'Mes favoris',
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.blue[150],
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         (dbRef==null)?
//         Center(
//         child: Container(
//           child: Text('Pas de nouveaux messages',
//           style: TextStyle(
//               color: Colors.black,
//               fontFamily: 'OpenSans',
//             ),
//           )
//         ),
//       )
//        : SizedBox(height: 20),
//         Expanded(
//           child: FutureBuilder(
//             future: dbRef,
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data.docs.length,
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 280.0,
//                     mainAxisSpacing: 15.0,
//                     crossAxisSpacing: 2.0,
//                   ),
//                   itemBuilder: (context, index) {
//                     return buildCard(
//                         snapshot.data.docs[index].get('productId'),
//                         snapshot.data.docs[index].get('name'),
//                         snapshot.data.docs[index].get('price').toString(),
//                         snapshot.data.docs[index].get('userId'),
//                         snapshot.data.docs[index].get('img'),
//                         snapshot.data.docs[index].get('img1'),
//                         false,
//                         snapshot.data.docs[index].get('description'),
//                         snapshot.data.docs[index].get('category'),
//                         'Good',
//                         context,
//                         index);
//                   },
//                 );
//               } else if (snapshot.connectionState == ConnectionState.none) {
//                 return Center(child: Text("No data"));
//               }

//               return Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }
