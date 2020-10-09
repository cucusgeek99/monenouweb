import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monenou_web/Screens/Home/app_bar.dart';
import 'package:monenou_web/Screens/Home/component/seach_box.dart';
import 'package:monenou_web/constant.dart';

import 'ticket_cards.dart';
import 'raw_data.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getDataFromUi();
  }

  getDataFromUi() async {
    loading = false;

    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dbRefer = FirebaseFirestore.instance
        .collection('products')
        .where('isValidated', isEqualTo: true)
        .orderBy('saveDate', descending: true)
        .get();

    final dbPremiums = FirebaseFirestore.instance
        .collection('products')
        .where('isValidated', isEqualTo: true)
        .where('isPremium', isEqualTo: true)
        .get();

    print(MediaQuery.of(context).size.height);
    return Scaffold(
      //  appBar:
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          widthFactor: 100,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(child: CustomAppBar()),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.blue,
                  // height: 100,
                  // width: 200,
                  child: SearchBox(),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Premiums',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontFamily: 'Varela'),
                ),
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder(
                    future: dbPremiums,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return _buildPremiumCard(
                                snapshot.data.docs[index].get('productId'),
                                snapshot.data.docs[index].get('name'),
                                snapshot.data.docs[index].get('userId'),
                                snapshot.data.docs[index]
                                    .get('price')
                                    .toInt()
                                    .toString(),
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: FutureBuilder(
                    future: dbRefer,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.docs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 1300
                                    ? 4
                                    : 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width < 1300
                                    ? 0.6
                                    : 0.65,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return _ProductCard(
                                snapshot.data.docs[index].get('productId'),
                                snapshot.data.docs[index].get('name'),
                                snapshot.data.docs[index]
                                    .get('price')
                                    .toInt()
                                    .toString(),
                                snapshot.data.docs[index].get('userId'),
                                snapshot.data.docs[index].get('img'),
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
              ),
              // SliverGrid(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 4 : 3,
              //     childAspectRatio:
              //         MediaQuery.of(context).size.width < 1300 ? 0.6 : 0.65,
              //     mainAxisSpacing: 10,
              //   ),
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //       return Card(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5.0),
              //         ),
              //         elevation: 2,
              //         margin:
              //             EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
              //         child: Container(
              //           padding: EdgeInsets.all(12),
              //           child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Image.network(
              //                   'https://placeimg.com/640/480/nature/grayscale',
              //                   fit: BoxFit.fill,
              //                 ),
              //                 Container(
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                     children: <Widget>[
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           "Beautiful Nature",
              //                           style: TextStyle(
              //                             fontSize: 16,
              //                             fontFamily: 'HelveticaNeue',
              //                           ),
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           '''The place is close to Metro Station and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Milan.''',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                             fontSize: 14,
              //                             fontWeight: FontWeight.bold,
              //                             fontFamily: 'HelveticaNeue',
              //                           ),
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceAround,
              //                           children: <Widget>[
              //                             Text(
              //                               "800/night",
              //                               style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold,
              //                                 fontFamily: 'HelveticaNeue',
              //                               ),
              //                             ),
              //                             Row(
              //                               children: <Widget>[
              //                                 Icon(Icons.location_on),
              //                                 Text(
              //                                   "Milan, Italy",
              //                                   style: TextStyle(
              //                                     fontSize: 12,
              //                                     fontWeight: FontWeight.bold,
              //                                     fontFamily: 'HelveticaNeue',
              //                                   ),
              //                                 )
              //                               ],
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         height: 8,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ]),
              //         ),
              //       );
              //     },
              //     childCount: 8,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      String id,
      String name,
      String price,
      String sellerId,
      String imgPath,
      bool state,
      String description,
      String category,
      String condition,
      context,
      index) {
    //      var newProduct = Product(
    //     productId: id,
    //     productName: name,
    //     imgurl:  imgPath,
    //     productDescription: description,
    //     category: category,
    //     productPrice: double.parse(price),
    //     userId: sellerId,
    //     // saveDate: saveDate
    //     );
    // final products = Provider.of<List<Product>>(context);
    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 0.1, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) =>
            //     //  Updateproduct(
            //     //       sellerid: sellerId,
            //     //       id: id,
            //     //       name: name,
            //     //       description: description,
            //     //       assetPath: imgPath,
            //     //       state: condition,
            //     //       price: price,
            //     //       category: category,
            //     //     )
            //     EditProduct(newProduct)
            //         ));
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
                    color: Colors.orange, fontFamily: 'Varela', fontSize: 14.0),
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
                            color: Colors.orange,
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

  Widget _ProductCard(
      String id,
      String name,
      String price,
      String sellerId,
      String imgPath,
      bool state,
      String description,
      String category,
      String condition,
      context,
      index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
      margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
      child: InkWell(
        child: Container(
          // padding: EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              imgPath,
              fit: BoxFit.fill,
              width: 200,
              height: 300,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'HelveticaNeue',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HelveticaNeue',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'HelveticaNeue',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildPremiumCard(
      String id,
      String name,
      String sellerId,
      String price,
      String imgPath,
      String imgPath1,
      bool state,
      String description,
      String category,
      String condition,
      context,
      index) {
    // final products = Provider.of<List<Product>>(context);

    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductDetail(
            //           sellerid: sellerId,
            //           id: id,
            //           name: name,
            //           description: description,
            //           assetPath: imgPath,
            //           assetPath1: imgPath1,
            //           state: condition,
            //           category: category,
            //           price: price,
            //         )));
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
                tag: NetworkImage(imgPath),
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
              name.length <= 5
                  ? Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0))
                  : Text(name.substring(0, 6) + '...',
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
            ]),
          ),
        ));
  }
}
