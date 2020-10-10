// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/models/user.dart';
// import 'package:monenou/services/firestore_service.dart';
// import 'package:uuid/uuid.dart';

// class UserProvider with ChangeNotifier {
//     var storage = FirebaseStorage.instance;

//   final firestoreService = FirestoreService();

//   var uuid = Uuid();
//   String _name;
//   String _email;
//   String _phone_number;
  
 

//   String get name => _name;
//   String get email => _email;
//   String get phone_number => _phone_number;




//   //Setters
//   changeName(String value) {
//     _name = value;
//     notifyListeners();
//   }

//   changeEmail(String value) {
//     _email = value;
//     notifyListeners();
//   }

//   changeDescription(String value) {
//     _phone_number = value;
//     notifyListeners();
//   }



//   loadValues(User user){
//     _name=user.name ;
//     _email=user.email;
//     _phone_number=user.phoneNumber;
    
   
//   }

// //   SaveProduct( ) {

// //     print(_productId);
// //     if (_productId == null) {
// //     var newProduct = Product(
// //         productId: uuid.v4(),
// //         productName: name,
// //         imgurl:  img,       
// //         productDescription: description,
// //         category: category,
// //         productPrice: price,
// //         userId: userid,
// //         saveDate: saveDate
// //         );

// //     firestoreService.saveProduct(newProduct);
// //   }
// //   else
// // {  //Update
// //       var updatedProduct = Product(
// //         productId: _productId ,
// //         productName: _name ,
// //         imgurl: img,
// //         productDescription: _description,
// //         category: _category,
// //         productPrice: _price,
// //         saveDate: _saveDate
// //         );

// //       firestoreService.saveProduct(updatedProduct);
// //     }
// //   }

//   // removeProduct(String productId){
//   //   firestoreService.removeProduct(productId);
//   // }

// }