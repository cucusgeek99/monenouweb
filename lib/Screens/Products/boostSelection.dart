import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monenou_web/Screens/Products/payment.dart';
import 'package:monenou_web/constant.dart';


class BoostList extends StatefulWidget {
  final userid;

  const BoostList({Key key, this.userid}) : super(key: key);
  @override
  _BoostListState createState() => _BoostListState();
}

class _BoostListState extends State<BoostList> {
  @override
  Widget build(BuildContext context) {
    final dbProduct = FirebaseFirestore.instance
        .collection('products')
        .where('userId', isEqualTo: widget.userid)
        .where('isValidated', isEqualTo: true)
        .get();
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverToBoxAdapter(
          child: FutureBuilder(
            future: dbProduct,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
                        snapshot.data.docs[index].get('isPremium'),
                        context,
                        index);
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(child: Text("No get(field)"));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
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
      bool isPremium,
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
    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 0.1, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => BoostPayment(
                        productId: id,
                        userId: sellerId,
                      )),
            );
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
                     isPremium == true
                      ? Icon(
                          Icons.monetization_on_outlined,
                          size: 20,
                        )
                      : Container(),
                       
                    Center(
                      child: Text(
                        'Booster',
                        style: TextStyle(
                            color: orango,
                            fontFamily: 'Varela',
                            fontSize: 16.0),
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
