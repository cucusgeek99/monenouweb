import 'package:flutter/material.dart';

import 'package:monenou_web/Screens/Products/product_detail.dart';
import 'package:monenou_web/constant.dart';

Widget buildCard(
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
    index
    ) {
  // final products = Provider.of<List<Product>>(context);
  return Padding(
      padding: EdgeInsets.only(top: 0.5, bottom: 0.1, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(
                    sellerid: sellerId,
                    id: id,
                    name: name,
                    description: description,
                    assetPath: imgPath,
                    assetPath1: imgPath1,
                    state: condition,
                    price: price,
                    category: category,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 1.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.all(5.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     // children: <Widget>[
            //     //   isFavorite
            //     //       ? Icon(Icons.favorite, color: Color(0xFFEF7532))
            //     //       : Icon(Icons.favorite_border, color: Color(0xFFEF7532))
            //     // ],
            //   ),
            // ),
            Hero(
              tag: imgPath,
              child: Container(
                  height: 95.0,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imgPath), fit: BoxFit.cover))),
            ),
            SizedBox(
              height: 7.0,
            ),

            // Text(name,
            //     style: TextStyle(
            //         color: Color(0xFF575E67),
            //         fontFamily: 'Varela',
            //         fontSize: 14.0)),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Color(0xFFEBEBEB),
                height: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   name.length <= 5
                  ? Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0))
                  : Text(name.substring(0, 6)+'...' ,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  
                  Text(
                    price.toString()+'  '+'FCFA',
                    style: TextStyle(
                        color: orango, fontFamily: 'Varela', fontSize: 14.0),
                  ),
                ],
              ),
            )
          ]),
        ),
      ));
}
