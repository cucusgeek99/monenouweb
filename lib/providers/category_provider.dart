import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:monenou_web/models/category.dart';
import 'package:monenou_web/models/product.dart';
import 'package:monenou_web/services/firestore_service.dart';

import 'package:uuid/uuid.dart';

class CategoryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _name;
  double _price;
  String _productId;
  String _img;
  String _img1;
  String _description;
  String _category;
  String _userid;
  String _saveDate;

  String get name => _name;
  double get price => _price;
  String get img => _img;
  String get img1 => _img1;

  String get description => _description;
  String get category => _category;
  String get userid => _userid;
  String get saveDate => _saveDate;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  changeCategory(String value) {
    _category = value;
    notifyListeners();
  }

  changeImg(String value) {
    _img = value;
    notifyListeners();
  }

  changeImg1(String value) {
    _img1 = value;
    notifyListeners();
  }

  changeUserId(String value) {
    _userid = value;
    notifyListeners();
    return value;
  }

  changeSaveDate(String value) {
    _saveDate = value;
    notifyListeners();
  }

  loadValues(CategoryProd product) {
    _name = product.productName;
    _price = product.productPrice;
    _description = product.productDescription;
    _img = product.imgurl;
    _img1 = product.imgurl1;

    _category = product.category;

    _userid = product.userId;
    _saveDate = product.saveDate;
  }

  SaveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(
          productName: name,
          imgurl: img,
          imgurl1: img1,
          productDescription: description,
          category: category,
          productPrice: price,
          userId: userid,
          saveDate: saveDate);

      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = Product(
          productId: _productId,
          productName: _name,
          imgurl: img,
          imgurl1: img1,
          productDescription: _description,
          category: _category,
          productPrice: _price,
          saveDate: _saveDate);

      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
