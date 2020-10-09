// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:giffy_dialog/giffy_dialog.dart';
// import 'package:monenou/main.dart';
// import 'package:monenou/models/product.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/SignUp.dart';
// import 'package:monenou/views/add_image.dart';
// import 'package:monenou/views/addproduct.dart';
// // import 'package:monenou/views/product_detail.dart';
// import 'package:monenou/views/bottombar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:monenou/views/search_box.dart';
// import 'package:floating_search_bar/floating_search_bar.dart';
// import 'package:monenou/views/categorywidget.dart';
// import 'package:monenou/views/into_screen.dart';
// import 'package:monenou/views/product_card.dart';
// import 'package:monenou/views/product_detail.dart';
// import 'package:monenou/views/products.dart';
// import 'package:monenou/views/search_box.dart';
// import 'package:provider/provider.dart';
// import 'package:connectivity/connectivity.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

// class MyHomePage extends StatefulWidget {
//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   bool _tryAgain = false;
//   void initState() {
//     super.initState();
//     _checkWifi();
//   }

//   _checkWifi() async {
//     // the method below returns a Future
//     var connectivityResult = await (new Connectivity().checkConnectivity());
//     bool connectedToWifi = (connectivityResult == ConnectivityResult.wifi);
//     if (!connectedToWifi) {
//       _showAlert(context);
//     }
//     if (_tryAgain != !connectedToWifi) {
//       setState(() => _tryAgain = !connectedToWifi);
//     }
//   }

//   void _showAlert(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text("Wifi"),
//               content: Text("Vérifier votre connection internet."),
//             ));
//   }

//   int _current = 0;

//   @override
//   Widget build(BuildContext context) {
//     final products = Provider.of<List<Product>>(context);
//     final dbPremiums = FirebaseFirestore.instance
//         .collection('products')
//         .where('isValidated', isEqualTo: true)
//         .where('isPremium', isEqualTo: true)
//         .get();

//     return Scaffold(
//         floatingActionButton: new FloatingActionButton(
//           backgroundColor: Colors.white,
//           onPressed: () {
//             FirebaseAuth.instance.authStateChanges().listen((currentUser) {
//               if (currentUser == null) {
//                 showDialog(
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
//               } else {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => EditProduct()));
//               }
//             });
//           },
//           tooltip: 'Ajouter un produit',
//           child: Icon(
//             Icons.add,
//             color: orango,
//           ),
//           elevation: 4.0,
//         ),
//         bottomNavigationBar: BottomBar(),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         body: (products != null)
//             ? CustomScrollView(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 slivers: <Widget>[
//                   SliverAppBar(
//                     pinned: false,
//                     floating: true,
//                     snap: true,
//                     expandedHeight: 100.0,
//                     title: Text(
//                       'Monenou',
//                       style: TextStyle(
//                           fontFamily: 'Helvetica',
//                           fontSize: 40,
//                           color: Colors.white),
//                       textAlign: TextAlign.right,
//                     ),
//                     actions: <Widget>[
//                       IconButton(
//                         icon: Icon(
//                           Icons.notifications,

//                           // color: Colors.black,
//                         ),
//                         onPressed: () {
//                           null;
//                         },
//                       )
//                     ],
//                   ),

//                   SliverToBoxAdapter(
//                     child: Column(children: [
//                       Container(
//                         color: orango,
//                         height: 100,
                        
//                         child: SearchBox(),
//                       ),
//                       Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 15),
//                           color: Colors.white,
//                           height: 50,
//                           child: CategoryW()),
//                       CarouselSlider(
//                         items: imageSliders,
//                         options: CarouselOptions(
//                             height: 100,
//                             autoPlay: true,
//                             autoPlayInterval: Duration(seconds: 5),
//                             enlargeCenterPage: true,
//                             aspectRatio: 2.0,
//                             onPageChanged: (index, reason) {
//                               // setState(() {
//                               _current = index++;
//                               // });
//                             }),
//                       ),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: imgList.map((url) {
//                       //     int index = imgList.indexOf(url);

//                       //     return Container(
//                       //       width: 5.0,
//                       //       height: 5.0,
//                       //       margin: EdgeInsets.symmetric(
//                       //           vertical: 10.0, horizontal: 2.0),
//                       //       decoration: BoxDecoration(
//                       //         shape: BoxShape.circle,
//                       //         color:
//                       //         // _current == index
//                       //             // ? Color.fromRGBO(0, 0, 0, 0.9)
//                       //              Color.fromRGBO(0, 0, 0, 0.4),
//                       //       ),
//                       //     );
//                       //   }).toList(),
//                       // ),
//                     ]),
//                   ),
//                   SliverToBoxAdapter(
//                       child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Premiums',
//                       style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontSize: 20,
//                           fontFamily: 'Varela'),
//                     ),
//                   )),
//                   SliverToBoxAdapter(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: 20.0),
//                       height: 150,
//                       child: FutureBuilder(
//                         future: dbPremiums,
//                         builder:
//                             (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             return ListView.builder(
//                               physics: ScrollPhysics(),
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: snapshot.data.docs.length,
//                               itemBuilder: (context, index) {
//                                 return _buildPremiumCard(
//                                     snapshot.data.docs[index].get('productId'),
//                                     snapshot.data.docs[index].get('name'),
//                                     snapshot.data.docs[index].get('userId'),
//                                     snapshot.data.docs[index]
//                                         .get('price')
//                                         .toInt()
//                                         .toString(),
//                                     snapshot.data.docs[index].get('img'),
//                                     snapshot.data.docs[index].get('img1'),
//                                     false,
//                                     snapshot.data.docs[index]
//                                         .get('description'),
//                                     snapshot.data.docs[index].get('category'),
//                                     'Good',
//                                     context,
//                                     index);
//                               },
//                             );
//                           } else if (snapshot.connectionState ==
//                               ConnectionState.none) {
//                             return Center(child: Text("No get(field)"));
//                           }
//                           return Center(child: CircularProgressIndicator());
//                         },
//                       ),
//                     ),
//                   ),

//                   // (products != null)
//                   SliverToBoxAdapter(
//                       child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 20.0),
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Produits',
//                       style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontSize: 20,
//                           fontFamily: 'Varela'),
//                     ),
//                   )),
//                   SliverGrid(
//                       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 280.0,
//                         mainAxisSpacing: 15.0,
//                         crossAxisSpacing: 2.0,
//                       ),
//                       delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                           return buildCard(
//                               products[index].productId,
//                               products[index].productName,
//                               products[index].productPrice.toInt().toString(),
//                               products[index].userId,
//                               products[index].imgurl,
//                               products[index].imgurl1,
//                               false,
//                               products[index].productDescription,
//                               products[index].category,
//                               'Good',
//                               context,
//                               index);
//                         },
//                         childCount: products.length,
//                       ))

//                   // (products != null)
//                   //     ?  GridView.builder(
//                   //         // shrinkWrap: true,

//                   //         // scrollDirection: Axis.vertical,

//                   //         reverse: false,

//                   //         primary: true,

//                   //         addAutomaticKeepAlives: true,

//                   //         addRepaintBoundaries: true,

//                   //         addSemanticIndexes: true,

//                   //         semanticChildCount: products.length,

//                   //         itemCount: products.length,

//                   //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                   //           maxCrossAxisExtent: 280.0,
//                   //           mainAxisSpacing: 15.0,
//                   //           crossAxisSpacing: 2.0,
//                   //         ),

//                   //         itemBuilder: (context, index) {
//                   //           return _buildCard(
//                   //               products[index].productName,
//                   //               products[index].productPrice.toInt().toString(),
//                   //               products[index].imgurl,
//                   //               false,
//                   //               products[index].productDescription,
//                   //               'Good',
//                   //               context,
//                   //               index);
//                   //         },
//                   //       )
//                   // : Center(child: CircularProgressIndicator()),
//                 ],
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               )
//         //
//         );
//   }

//   Widget _buildPremiumCard(
//       String id,
//       String name,
//       String sellerId,
//       String price,
//       String imgPath,
//       String imgPath1,
//       bool state,
//       String description,
//       String category,
//       String condition,
//       context,
//       index) {
//     final products = Provider.of<List<Product>>(context);

//     return Padding(
//         padding: EdgeInsets.only(top: 0.5, bottom: 5.0, left: 5.0, right: 5.0),
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ProductDetail(
//                       sellerid: sellerId,
//                       id: id,
//                       name: name,
//                       description: description,
//                       assetPath: imgPath,
//                       assetPath1: imgPath1,
//                       state: condition,
//                       category: category,
//                       price: price,
//                     )));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 3.0,
//                   blurRadius: 5.0,
//                 )
//               ],
//               color: Colors.white,
//             ),
//             child: Column(children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   // children: <Widget>[
//                   //   isFavorite
//                   //       ? Icon(Icons.favorite, color: Color(0xFFEF7532))
//                   //       : Icon(Icons.favorite_border, color: Color(0xFFEF7532))
//                   // ],
//                 ),
//               ),
//               Hero(
//                 tag: NetworkImage(imgPath),
//                 child: Container(
//                     height: 75.0,
//                     width: 75.0,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(imgPath),
//                             fit: BoxFit.contain))),
//               ),
//               SizedBox(
//                 height: 7.0,
//               ),
//               Text(
//                 price.toString(),
//                 style: TextStyle(
//                     color: orango, fontFamily: 'Varela', fontSize: 14.0),
//               ),
//               name.length <= 5
//                   ? Text(name,
//                       style: TextStyle(
//                           color: Color(0xFF575E67),
//                           fontFamily: 'Varela',
//                           fontSize: 14.0))
//                   : Text(name.substring(0, 6) + '...',
//                       style: TextStyle(
//                           color: Color(0xFF575E67),
//                           fontFamily: 'Varela',
//                           fontSize: 14.0)),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   color: Color(0xFFEBEBEB),
//                   height: 1.0,
//                 ),
//               ),
//             ]),
//           ),
//         ));
//   }

//   final List<Widget> imageSliders = imgList
//       .map((item) => Container(
//             child: Container(
//               margin: EdgeInsets.all(5.0),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   child: Stack(
//                     children: <Widget>[
//                       Image.network(item,
//                           fit: BoxFit.cover, width: 1000.0, height: 100),
//                       // Positioned(
//                       //   bottom: 0.0,
//                       //   left: 0.0,
//                       //   right: 0.0,
//                       //   child: Container(
//                       //     decoration: BoxDecoration(
//                       //       // gradient: LinearGradient(
//                       //       //   colors: [
//                       //       //     Color.fromARGB(200, 0, 0, 0),
//                       //       //     Color.fromARGB(0, 0, 0, 0)
//                       //       //   ],
//                       //       //   begin: Alignment.bottomCenter,
//                       //       //   end: Alignment.topCenter,
//                       //       // ),
//                       //     ),
//                       //     // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

//                       //   ),
//                       // ),
//                     ],
//                   )),
//             ),
//           ))
//       .toList();
// }

// class TabBarDemo extends StatelessWidget {
//   // final primaryColor = const Color(#EE82EE);
//   TabBarDemo({Key key, String uid}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Monenou',
//       theme: ThemeData(
//         primaryColor: orango,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: DefaultTabController(
//         length: 9,
//         child: Scaffold(
//             // appBar: AppBar(
//             //   bottom: TabBar(
//             //     tabs: [
//             //       Tab(icon: Icon(Icons.directions_car)),
//             //       Tab(icon: Icon(Icons.directions_transit)),
//             //       Tab(icon: Icon(Icons.directions_bike)),
//             //     ],
//             //   ),
//             //   title: Text('Tabs Demo'),
//             // ),
//             body: MyHomePage()),
//       ),
//     );
//   }
// }
