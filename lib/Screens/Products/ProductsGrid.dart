import 'package:flutter/material.dart';
import 'package:monenou_web/Screens/Home/Body.dart';
import 'package:monenou_web/Screens/Home/app_bar.dart';
import 'package:monenou_web/Screens/Products/GridBody.dart';

class ProductsGrid extends StatefulWidget {
  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:
        Container(
      height: size.height,
      width: size.width,
//       decoration: BoxDecoration(
// image: DecorationImage(
//   image: AssetImage('assets/images/cover.jpg'),
//   fit: BoxFit.cover
// )

//       ),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(),
            Spacer(),
            // It will cover 1/3 of free spaces
            GridBody(),
            Spacer(
              flex: 2,
            ),
            // it will cover 2/3 of free spaces
          ],
        ),
      
    )
      
      
    );
  }
}