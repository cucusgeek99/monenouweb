import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monenou_web/Screens/Products/SignUp.dart';
import 'package:monenou_web/Screens/Products/addproduct.dart';
import 'package:monenou_web/Screens/Products/sign_in.dart';
import 'package:monenou_web/Screens/Products/user_update.dart';
import 'package:monenou_web/constant.dart';
import 'package:monenou_web/main.dart';

import 'package:provider/provider.dart';

class Myproduct extends StatefulWidget {
  final id;

  const Myproduct({Key key, this.id}) : super(key: key);
  @override
  _MyproductState createState() => _MyproductState();
}

class _MyproductState extends State<Myproduct> {
  String name;
  bool isLoading = false;
  var phone_number;
  var email;
  var photo_url;
  // String id;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.id)
        .get()
        .then((value) async {
      setState(() {
        name = value.get('name');
        email = value.get('email');
        phone_number = value.get('phone_number');
        photo_url = value.get('photoUrl');
      });
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    final dbRefer = FirebaseFirestore.instance
        .collection('products')
        .where('userId', isEqualTo: widget.id)
        .get();

    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.white,
          onPressed: () {
            FirebaseAuth.instance.authStateChanges().listen((currentUser) {
              if (currentUser == null) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: orango,
                          contentTextStyle: TextStyle(color: Colors.white),
                          title: Center(
                            child: Text('Monenou',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: 'Roboto')),
                          ),
                          content: Column(
                            children: [
                              Center(
                                child: Text(
                                    'Connectez vous pour pouvoir publier des articles',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Roboto')),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                width: double.infinity,
                                child: FlatButton(
                                  child: Text("Se connecter",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Roboto')),
                                  textColor: Colors.black,
                                  padding: EdgeInsets.all(16),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()),
                                    );
                                  },
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: double.infinity,
                                child: FlatButton(
                                  child: Text("Annuler",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Roboto')),
                                  textColor: Colors.black,
                                  padding: EdgeInsets.all(16),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ));
              } else {
               
              }
            });
          },
          tooltip: 'Ajouter un produit',
          child: Icon(
            Icons.add,
            color: orango,
          ),
          elevation: 4.0,
        ),
        // bottomNavigationBar: BottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: (name != null)
            ? CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    snap: true,
                    expandedHeight: 80.0,
                    title: Text(
                      'Profil',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 20,
                          color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.exit_to_app,

                          // color: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Center(
                                      child: Text('Déconnexion'),
                                    ),
                                    content: Text('Etes-vous sur ?'),
                                    actions: <Widget>[
                                      FlatButton(
                                          child: Text('NON'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                      FlatButton(
                                          child: Text('OUI'),
                                          onPressed: () {
                                            FirebaseAuth auth =
                                                FirebaseAuth.instance;
                                            auth.signOut().then((value) {
                                              googleSignIn.signOut();
                                              googleSignIn.disconnect();
                                            }).then((res) {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyApp()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                            });
                                          }),
                                    ],
                                  ));
                        },
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    height: 200,
                    color: orango,
                    child: Row(
                      children: <Widget>[
                        //   FutureBuilder(
                        // future: userinfo,
                        // builder:
                        //     (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        //   if (snapshot.connectionState == ConnectionState.done) {

                        Expanded(
                          child: Container(
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  // (avatarImageFile == null)
                                  (photo_url != 'null'
                                      ? Material(
                                          child: CachedNetworkImage(
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            placeholder: (context, url) =>
                                                Container(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.0,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.blue),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              padding: EdgeInsets.all(20.0),
                                            ),
                                            imageUrl: photo_url,
                                            width: 90.0,
                                            height: 90.0,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(45.0)),
                                          clipBehavior: Clip.hardEdge,
                                        )
                                      : Icon(
                                          Icons.account_circle,
                                          size: 90.0,
                                          color: Colors.grey,
                                        )),
                                ],
                              ),
                            ),
                            // width: double.infinity,
                            // margin: EdgeInsets.all(20.0),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                height: 150,
                                child: Column(
                                  children: <Widget>[
                                    (name != null)
                                        ? Text(
                                            name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )
                                        : Text('Nom à définir'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      email,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    (phone_number != null)
                                        ? Text(
                                            phone_number,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )
                                        : Text('Numéro')
                                  ],
                                )

                                // color: Colors.blue,
                                )),
                        //              } else if (snapshot.connectionState ==
                        //         ConnectionState.none) {
                        //       return Center(child: Text("No get(field)"));
                        //     }
                        //     return Center(child: CircularProgressIndicator());
                        //   },
                        // ),
                      ],
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: Container(
                    height: 55,
                    color: orango,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.none),
                        ),
                        height: 40,
                        width: 300,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return UserUpdate(
                                  name: name,
                                  phoneNumber: phone_number,
                                  photourl: photo_url,
                                );
                              },
                            ));
                          },
                          child: Text(
                            'Modifier le profil',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  SliverToBoxAdapter(
                      child: Center(
                    child: Text(
                      'Mes produits',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[150],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: dbRefer,
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 280.0,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 2.0,
                            ),
                            itemBuilder: (context, index) {
                              return _buildCard(
                                  snapshot.data.docs[index].get('productId'),
                                  snapshot.data.docs[index].get('name'),
                                  snapshot.data.docs[index]
                                      .get('price')
                                      .toInt()
                                      .toString(),
                                  snapshot.data.docs[index].get('userId'),
                                  snapshot.data.docs[index].get('img'),
                                  snapshot.data.docs[index].get('img1'),
                                  false,
                                  snapshot.data.docs[index].get('description'),
                                  snapshot.data.docs[index].get('category'),
                                  'Good',
                                  context,
                                  index);
                            },
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return Center(child: Text("No get(field)"));
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Positioned(
                      child: isLoading
                          ? Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue)),
                              ),
                              color: Colors.white.withOpacity(0.8),
                            )
                          : Container(),
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget _buildCard(
      String id,
      String name,
      String price,
      String sellerId,
      String imgPath,
      String imgPath1,
      bool state,
      String description,
      String category,
      String condition,
      context,
      index) {
    // var newProduct = Product(
    //   productId: id,
    //   productName: name,
    //   imgurl: imgPath,
    //   imgurl1: imgPath1,
    //   productDescription: description,
    //   category: category,
    //   productPrice: double.parse(price),
    //   userId: sellerId,
    //   // saveDate: saveDate
    // );
    // final products = Provider.of<List<Product>>(context);
    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 0.1, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) =>
            //         //  Updateproduct(
            //         //       sellerid: sellerId,
            //         //       id: id,
            //         //       name: name,
            //         //       description: description,
            //         //       assetPath: imgPath,
            //         //       state: condition,
            //         //       price: price,
            //         //       category: category,
            //         //     )
            //         EditProduct(newProduct))
            // );
            null;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ],
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // children: <Widget>[
                  //   isFavorite
                  //       ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                  //       : Icon(Icons.favorite_border, color: Color(0xFFEF7532))
                  // ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgPath),
                            fit: BoxFit.contain))),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                price.toString(),
                style: TextStyle(
                    color: orango, fontFamily: 'Varela', fontSize: 14.0),
              ),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        'Modifier',
                        style: TextStyle(
                            color: orango,
                            fontFamily: 'Varela',
                            fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
