import 'package:flutter/material.dart';
import '../models/product.dart';

class CategoryProd {
  final String productName;
  final String productDescription;
  final String category;
  final String imgurl;
  final String imgurl1;

  final double productPrice;
  final String userId;
  final String saveDate;

  CategoryProd(
      {this.productName,
      this.productDescription,
      this.category,
      this.imgurl,
      this.imgurl1,
      this.productPrice,
      this.userId,
      this.saveDate});

  Map<String, dynamic> toMap() {
    return {
      'name': productName,
      'price': productPrice,
      'img': imgurl,
      'description': productDescription,
      'category': category,
      'userId': userId,
      'saveDate': saveDate
    };
  }

  CategoryProd.fromFirestore(Map<String, dynamic> firestore)
      : productName = firestore['name'],
        productPrice = firestore['price'],
        imgurl = firestore['img'],
        imgurl1 = firestore['img1'],
        productDescription = firestore['description'],
        category = firestore['category'],
        userId = firestore['userId'],
        saveDate = firestore['saveDate'];
}
