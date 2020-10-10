import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:monenou_web/models/product.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Product product) {
    _db.collection('products').doc(product.productId).set(product.toMap());
  }

  Future<void> updateProduct(Product product) {
    _db.collection('products').doc(product.productId).update(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return _db
        .collection('products')
        .where('isValidated', isEqualTo: true)
        .orderBy('saveDate',descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Product.fromFirestore(document.data()))
            .toList());
  }

  // Stream<List<Product>> getCustomProducts() {
  //   return _db
  //       .collection('products')
  //       // .where('userId' ,isEqualTo: 'lOVGOL0nr7VYAgnBE1bkPrV0KbG2')
  //       .snapshots()
  //       .map((snapshot) => snapshot.documents
  //           .map((document) => Product.fromFirestoree(document.data))
  //           .toList());
  // }

  Future<void> removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }

//  Stream<User> getUserData()  {
//     var firebaseUser =  FirebaseAuth.instance.currentUser();
//     _db.collection("users").document(firebaseUser.uid).get().then((value){
//       User.fromFirestore(value.data);
//     });
// }
}
