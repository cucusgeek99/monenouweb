import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:share/share.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:monenou_web/Screens/Products/product_card.dart';
import 'package:photo_view/photo_view.dart';

class ProductDetail extends StatefulWidget {
  final id,
      assetPath,
      assetPath1,
      price,
      sellerid,
      name,
      description,
      category,
      state;

  ProductDetail(
      {this.assetPath,
      this.assetPath1,
      this.price,
      this.name,
      this.description,
      this.category,
      this.state,
      this.id,
      this.sellerid});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  @override
  var numero;
  var id;
  var currentuser;
  var dynamicLink;

  bool click = true;
  void initState() {
    super.initState();

    // doSomeAsyncStuff();

    dynamicLink = createDynamicLink();

    fetchLinkData();

    Chgfav();
    // currentuser = getCurrentUser();

    // FirebaseAuth.instance.currentUser().then((res) async {

    //   // var uid = id.toString();
    //   // print(numero);
    // });
    FirebaseAuth.instance.authStateChanges().listen((res) {
      id = res.uid;
    });

    FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.sellerid)
        .get()
        .then((value) async {
      setState(() {
        numero = value.get('phone_number');
      });
    });

    final dbfav = FirebaseFirestore.instance
        .collection('favoris')
        .where('userId', isEqualTo: id)
        .where('productId')
        .get();

    if (dbfav == null) {
      setState(() {
        click = false;
      });
    } else {
      setState(() {
        click = true;
      });
    }
  }

  void fetchLinkData() async {
    // FirebaseDynamicLinks.getInitialLInk does a call to firebase to get us the real link because we have shortened it.
    var link = await FirebaseDynamicLinks.instance.getInitialLink();

    // This link may exist if the app was opened fresh so we'll want to handle it the same way onLink will.
    handleLinkData(link);

    // This will handle incoming links if the application is already opened
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      handleLinkData(dynamicLink);
    });
  }

  void handleLinkData(PendingDynamicLinkData data) {
    final Uri uri = data?.link;
    if (uri != null) {
      final queryParams = uri.queryParameters;
      if (queryParams.length > 0) {
        String userName = queryParams["username"];
        // verify the username is parsed correctly
        print("My users username is: $userName");
      }
    }
  }

  Chgfav() {
    setState(() {
      click = !click;
    });
  }

  Future<void> doSomeAsyncStuff() async {
    dynamicLink = await createDynamicLink();
  }

  int _current = 0;

  Widget build(BuildContext context) {
    final List<String> imgList = [widget.assetPath];

    final List<String> imgList1 = [
      widget.assetPath,
      (widget.assetPath1 == null) ? widget.assetPath : widget.assetPath1
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    // borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroPhotoViewRouteWrapper(
                              imageProvider: NetworkImage(item),
                            ),
                          ),
                        );
                      },
                      child: Image.network(item,
                          fit: BoxFit.cover, width: 1000.0, height: 1500),
                    ),
                  ],
                )),
              ),
            ))
        .toList();

    final List<Widget> imageSliders1 = imgList1
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    // borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroPhotoViewRouteWrapper(
                              imageProvider: NetworkImage(item),
                            ),
                          ),
                        );
                      },
                      child: Image.network(item,
                          fit: BoxFit.cover, width: 1000.0, height: 1500),
                    ),
                  ],
                )),
              ),
            ))
        .toList();

    final dbRef = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: widget.category)
        .where('isValidated',isEqualTo:true)
        .get();

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
          ),
          SizedBox(height: 15.0),

          (widget.assetPath1 == 'null')
              ? CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      height: 300,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 7),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                )
              : CarouselSlider(
                  items: imageSliders1,
                  options: CarouselOptions(
                      height: 300,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 7),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);

              return Container(
                width: 5.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),

          // Hero(
          //     tag: NetworkImage(widget.assetPath),
          //     child: Image.network(widget.assetPath,
          //         height: 200.0,
          //         width: MediaQuery.of(context).size.width - 50.0,
          //         fit: BoxFit.contain)),
          SizedBox(height: 20.0),
          Center(
            child: Text(widget.name,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532))),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(widget.price + ' FCFA',
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: click
                        ? Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 30,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        click = !click;
                      });
                      // () async {
                      //  var firebaseUser = await FirebaseAuth.instance.currentUser();
                      click == false
                          ? FirebaseFirestore.instance
                              .collection('favoris')
                              .doc(widget.id)
                              .set({
                              'productId': widget.id,
                              'category': widget.category,
                              'description': widget.description,
                              'img': widget.assetPath,
                              'name': widget.name,
                              'price': widget.price,
                              'userId': id
                            }).then((value) {
                              return Fluttertoast.showToast(
                                  msg: "Ajout aux favoris",
                                  textColor: Colors.white,
                                  // gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.black,
                                  fontSize: 16);
                            })
                          : FirebaseFirestore.instance
                              .collection('favoris')
                              .doc(widget.id)
                              .delete()
                              .then((value) {
                              return Fluttertoast.showToast(
                                  msg: "Retirer des favoris",
                                  textColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  fontSize: 16);
                            });
                    }),
                Builder(
                  builder: (context) {
                    return IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 30,
                        ),
                        onPressed: () async {
                          try {
                            var request = await HttpClient()
                                .getUrl(Uri.parse(widget.assetPath));
                            var response = await request.close();
                            Uint8List bytes =
                                await consolidateHttpClientResponseBytes(
                                    response);
                            await Share.file(
                                widget.name, 'amlog.jpg', bytes, 'image/jpg',
                                text: '' +
                                    widget.name +
                                    ' ' +
                                    'à' +
                                    ' ' +
                                    widget.price +
                                    ' ' +
                                    'FCFA' +
                                    ' ' +
                                    'sur Monenou');
                          } catch (e) {
                            print('error: $e');
                          }
                        }
// }
                        );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Dans la même catégorie ',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Varela',
                    fontSize: 18.0)),
          ),
          SizedBox(height: 20.0),
          FutureBuilder(
            future: dbRef,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 280.0,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, index) {
                    return buildCard(
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
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(child: Text("No data"));
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Future<String> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // This should match firebase but without the username query param
      uriPrefix: 'https://monenou.page.link',
      // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
      link: Uri.parse('https://monenou.page.link/test'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.monenou ',
        minimumVersion: 1,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          title: widget.name,
          description:
              'Je suis intérressé par ce produit que vous avez publié sur Monenou',
          imageUrl: widget.assetPath),
    );
    final link = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      link,
      DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
    );
    final Uri shortUrl = shortenedLink.shortUrl;

    return dynamicLink = "https://monenou.page.link" + shortUrl.path;
  }
}
class HeroPhotoViewRouteWrapper extends StatelessWidget {
  HeroPhotoViewRouteWrapper({
    this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}
