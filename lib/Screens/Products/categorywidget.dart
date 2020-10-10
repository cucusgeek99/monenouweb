import 'package:flutter/material.dart';

import 'package:monenou_web/Screens/Products/product_category.dart';
import 'package:monenou_web/constant.dart';

class CategoryW extends StatefulWidget {
  @override
  _CategoryWState createState() => _CategoryWState();
}

class _CategoryWState extends State<CategoryW> {
  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: <Widget>[
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Electroniques',
                      )));
            },
            child: Text('Electroniques',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')
            ),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Vêtements',
                      )));
            },
            child: Text('Vêtements',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Pour la maison',
                      )));
            },
            child: Text('Pour la maison',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Mode & Beauté',
                      )));
            },
            child: Text('Mode & Beauté',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Immobilier',
                      )));
            },
            child: Text('Immobilier',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Electroménagers',
                      )));
            },
            child: Text('Electroménagers',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
      SizedBox(width: 20),
      Container(
          // padding: ContainerBoxParentData(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
              color: orango,
              width: 2,
            ),
          ),
          height: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductCategory(
                        category: 'Autres',
                      )));
            },
            child: Text('Autres',
            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto')),
          )),
    ]);
  }
}
