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
        height: 20,
       
        child: FlatButton(
          onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Electroniques',
                    )));},
          child: Text('Electroniques'),
          
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
        height: 20,
        child: FlatButton(
           onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Vêtements',
                    )));},
          child: Text('Vêtements'),
          
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
        height: 20,
        child: FlatButton(
           onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Pour la maison',
                    )));},
          child: Text('Pour la maison'),
          
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
        height: 20,
        
        child: FlatButton(
           onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Mode & Beauté',
                    )));},
          child: Text('Mode & Beauté'),
          
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
        height: 20,
        child: FlatButton(
           onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Immobilier',
                    )));},
          child: Text('Immobilier'),
          
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
        height: 20,
        child: FlatButton(
          onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Electroménagers',
                    )));},
          child: Text('Electroménagers'),
          
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
        height: 20,
        child: FlatButton(
          onPressed:(){  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductCategory(
                      category:'Autres',
                    )));},
          child: Text('Autres'),
          
        )),
  ]);
}}
