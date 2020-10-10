// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:monenou/providers/product_provider.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou_web/constant.dart';
// import 'package:provider/provider.dart';

// class Updateproduct extends StatefulWidget {
//   final id, assetPath, price, sellerid, name, description, category, state;

//   const Updateproduct(
//       {Key key,
//       this.id,
//       this.assetPath,
//       this.price,
//       this.sellerid,
//       this.name,
//       this.description,
//       this.category,
//       this.state})
//       : super(key: key);
//   @override
//   _UpdateproductState createState() => _UpdateproductState();
// }

// final _form = GlobalKey<FormState>();
// TextEditingController nameController = TextEditingController();
// TextEditingController descriptionController = TextEditingController();
// TextEditingController priceController = TextEditingController();
// String _categoryController;

// class _UpdateproductState extends State<Updateproduct> {
//   var storage = FirebaseStorage.instance;
//   File _image;
//   // String imageurl;
//   String imgurl;
//   bool isloading = false;

//   final picker = ImagePicker();

// //      final FirebaseAuth auth = FirebaseAuth.instance;

// //  void inputData() async {
// //     final FirebaseUser user = await auth.currentUser();
// //     final uid = user.uid;
// //     final productProvider = Provider.of<ProductProvider>(context);
// //     productProvider.changeUserId(uid);

// //     // here you write the codes to input the data into firestore
// //   }

// //     uploadImage(File image) async {
// //     StorageReference reference =
// //              FirebaseStorage.instance.ref().child(image.path.toString());
// //     StorageUploadTask uploadTask = reference.putFile(_image);

// //     StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

// //     String url = (await downloadUrl.ref.getDownloadURL());

// // }

//   @override
//   // void dispose() {
//   //   nameController.dispose();
//   //   priceController.dispose();
//   //   descriptionController.dispose();
//   //   // _categoryController. dispose();
//   //   super.dispose();
//   // }

//   @override
//   void initState() {
//     // if (widget.product == null) {
//     //   //New Record

//     //   nameController.text = "";
//     //   priceController.text = "";
//     //   descriptionController.text = "";
//     //   // _categoryController = "";
//     //   new Future.delayed(Duration.zero, () {
//     //     final productProvider =
//     //         Provider.of<ProductProvider>(context, listen: false);
//     //     productProvider.loadValues(Product());
//     //   });
//     // }

//     //Controller Update#
//     imgurl = widget.assetPath;
//     _categoryController = widget.category;
//     nameController.text = widget.name;
//     // _categoryController = widget.product.category;
//     descriptionController.text = widget.description;
//     priceController.text = widget.price.toString();
//     //State Update
//     new Future.delayed(Duration.zero, () {
//       final productProvider =
//           Provider.of<ProductProvider>(context, listen: false);
//       // productProvider.loadValues(widget.product);
//     });

//     super.initState();
//     // Widget
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     //  final FirebaseAuth auth = FirebaseAuth.instance;
//     //   FirebaseAuth.instance
//     // .authStateChanges()
//     // .listen((user) {
//     //   var id = user.uid;

//     // });
//     productProvider.changeUserId(widget.sellerid);
//     productProvider.changeProductId(widget.id);
//     productProvider.changeImg(widget.assetPath);
//     productProvider.changeName(widget.name);
//     productProvider.changePrice(widget.price);
//     productProvider.changeDescription(widget.description);
//     productProvider.changeCategory(widget.category);
//     // FirebaseAuth.instance.userChanges() instance.currentUser().then((res) async {

//     //   // var uid = id.toString();

//     // });
//     // productProvider.changeImg(imgurl);
//     // productProvider.changeImg(EditProduct().imgurl);

//     var now = DateTime.now();
//     productProvider.changeSaveDate(now.toString());
//     // productProvider.changeImg(imageurl);

//     // Imgurl(String url){
//     //   productProvider.changeImg(url);

//     // }
//     Future getImage() async {
//       final pickedFile = await picker.getImage(source: ImageSource.camera);

//       setState(() {
//         _image = File(pickedFile.path);
//         isloading = true;
//       });

//       String fileName = _image.path.split('/').last;

//       // StorageTaskSnapshot snapshot = await storage
//       //     .ref()
//       //     .child("images/$fileName")
//       //     .putFile(_image)
//       //     .onComplete
//       //     .whenComplete((value) {
//       StorageReference reference =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       StorageUploadTask uploadTask = reference.putFile(_image);
//       StorageTaskSnapshot storageTaskSnapshot;
//       uploadTask.onComplete.then((value) async {
//         if (value.error == null) {
//           storageTaskSnapshot = value;
//           await storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//             setState(() {
//               // imgurl = downloadUrl;
//               productProvider.changeImg(downloadUrl);
//             });
//           }).then((data) async {
//             setState(() {
//               isloading = false;
//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('This file is not an image');
//         }
//       });
//     }

//     Future getImage1() async {
//       final pickedFile = await picker.getImage(source: ImageSource.gallery);

//       setState(() {
//         _image = File(pickedFile.path);
//         isloading = true;
//       });

//       String fileName = _image.path.split('/').last;

//       // StorageTaskSnapshot snapshot = await storage
//       //     .ref()
//       //     .child("images/$fileName")
//       //     .putFile(_image)
//       //     .onComplete
//       //     .whenComplete((value) {
//       StorageReference reference =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       StorageUploadTask uploadTask = reference.putFile(_image);
//       StorageTaskSnapshot storageTaskSnapshot;
//       uploadTask.onComplete.then((value) async {
//         if (value.error == null) {
//           storageTaskSnapshot = value;
//           await storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//             productProvider.changeImg(downloadUrl);
//           }).then((data) async {
//             setState(() {
//               isloading = false;
//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('This file is not an image');
//         }
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Product')),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView(
//               children: <Widget>[
//                 // TextFormField(
//                 //   controller: nameController,
//                 //   keyboardType: TextInputType.text,
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Nom du produit',
//                 //     hintText: 'Entrez le nom du produit',
//                 //     contentPadding: EdgeInsets.all(15.0),
//                 //     filled: true,
//                 //     // fillColor: Colors.blue,
//                 //   ),
//                 //   validator: (value) {
//                 //     if (value.isEmpty) {
//                 //       return 'Entrer le nom du produit';
//                 //     }

//                 //     return null;
//                 //   },
//                 //   onChanged: (value) => productProvider.changeName(value),
//                 // ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Nom de l´article',
//                       style: kLabelStyle,
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextFormField(
//                         keyboardType: TextInputType.name,
//                         // initialValue: widget.name,
//                         controller: nameController,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),

//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.article_rounded,
//                             color: Colors.white,
//                           ),
//                           hintText: 'Entrer le nom de l´article',
//                           hintStyle: kHintTextStyle,
//                         ),

//                         // The validator receives the text that the user has entered.

//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Entrer le nom de l´article';
//                           }

//                           return null;
//                         },
//                         onChanged: (value) => productProvider.changeName(value),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // TextFormField(
//                 //   controller: descriptionController,
//                 //   keyboardType: TextInputType.multiline,
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Desciption du produit',
//                 //     hintText: 'Entrez la description du produit',
//                 //     contentPadding: EdgeInsets.all(15.0),
//                 //     filled: true,
//                 //     // fillColor: Colors.blue,
//                 //   ),
//                 //   validator: (value) {
//                 //     if (value.isEmpty) {
//                 //       return 'Entrer la description du produit';
//                 //     }
//                 //     return null;
//                 //   },
//                 //   onChanged: (value) =>
//                 //       productProvider.changeDescription(value),
//                 // ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Description de l´article',
//                       style: kLabelStyle,
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextFormField(
//                         keyboardType: TextInputType.multiline,
// // initialValue: widget.description,
//                         controller: descriptionController,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),

//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.article_rounded,
//                             color: Colors.white,
//                           ),
//                           hintText: 'Description de l´article',
//                           hintStyle: kHintTextStyle,
//                         ),

//                         // The validator receives the text that the user has entered.

//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Entrer une description de l´article';
//                           }

//                           return null;
//                         },
//                         onChanged: (value) =>
//                             productProvider.changeDescription(value),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // TextFormField(
//                 //   controller: priceController,
//                 //   keyboardType: TextInputType.number,
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Prix du produit',
//                 //     hintText: 'Entrez le prix du produit',
//                 //     contentPadding: EdgeInsets.all(15.0),
//                 //     filled: true,
//                 //     // fillColor: Colors.blue,
//                 //   ),
//                 //   onChanged: (value) => productProvider.changePrice(value),
//                 // ),

//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Prix de l´article',
//                       style: kLabelStyle,
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
// // initialValue: widget.price,
//                         controller: priceController,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),

//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.article_rounded,
//                             color: Colors.white,
//                           ),
//                           hintText: 'Prix de l´article',
//                           hintStyle: kHintTextStyle,
//                         ),

//                         // The validator receives the text that the user has entered.

//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Entrer un prix pour l´article';
//                           }

//                           return null;
//                         },
//                         onChanged: (value) =>
//                             productProvider.changePrice(value),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Description de l´article',
//                       style: kLabelStyle,
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: kBoxDecorationStyle,
//                         height: 60.0,
//                         child: DropdownButtonFormField<String>(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 14.0),
//                             prefixIcon: Icon(
//                               Icons.article_rounded,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Catégorie de l´article',
//                             hintStyle: kHintTextStyle,
//                           ),
//                           value: _categoryController,
//                           items: [
//                             'Vêtements',
//                             'Electroniques',
//                             'Pour la maison',
//                             'Mode & Beauté',
//                             'Immobiliers',
//                             'Electroménagers',
//                           ]
//                               .map((label) => DropdownMenuItem(
//                                     child: Text(label.toString()),
//                                     value: label,
//                                   ))
//                               .toList(),
//                           hint: Text('Catégorie'),
//                           onChanged: (value) {
//                             setState(() {
//                               _categoryController = value;
//                             });
//                             productProvider.changeCategory(value);
//                           },
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Sélectionner une catégorie';
//                             }

//                             return null;
//                           },
//                         ))
//                   ],
//                 ),

//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text('Ajouter une image'),
//                     Center(
//                         child: IconButton(
//                             icon: Icon(Icons.add_a_photo),
//                             onPressed: getImage)),
//                     Center(
//                         child: IconButton(
//                             icon: Icon(Icons.add_photo_alternate),
//                             onPressed: getImage1))
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       height: 70,
//                       width: 70,
//                       child: _image == null
//                           ? Image.network(widget.assetPath)
//                           : Image.file(_image),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 // RaisedButton(
//                 //   onPressed: () {
//                 //     // showDialog(
//                 //     //     context: context,
//                 //     //     builder: (context) => AlertDialog(
//                 //     //           title: Center(
//                 //     //             child: Text('Enrégistrement'),
//                 //     //           ),
//                 //     //           content: LinearProgressIndicator(
//                 //     //             value: 7,
//                 //     //           ),
//                 //     //         ),
//                 //     //     barrierDismissible: false);
//                 //     // uploading(_image).whenComplete(() {
//                 //       if(_formKey.currentState.validate()){
//                 //     productProvider.SaveProduct();
//                 //     Navigator.of(context).pop();}
//                 //     // });
//                 //     // productProvider.SaveProduct();
//                 //     // Navigator.of(context).pop();
//                 //   },
//                 //   child: Text('Ajouter'),
//                 // ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 25.0),
//                   width: double.infinity,
//                   child: RaisedButton(
//                     elevation: 5.0,
//                     // onPressed: () => print('Login Button Pressed'),
//                     onPressed: () {
//                       // if (_form.currentState.validate()) {
//                       productProvider.SaveProduct();
//                       // FirebaseFirestore.instance
//                       //     .collection('products')
//                       //     .doc(widget.id)
//                       //     .update({
//                       //       'category': nameController.text,
//                       //       'description': descriptionController.text,
//                       //       'img':imgurl,
//                       //       'name':nameController.text,
//                       //       'price' :int.parse(priceController.text) ,
//                       //       'productId':widget.id,
//                       //       'saveDate':now.toString(),
//                       //       'userId':widget.sellerid
//                       // });
//                       Navigator.of(context).pop();
//                     },

//                     padding: EdgeInsets.all(15.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     color: Colors.white,
//                     child: Text(
//                       'Ajouter',
//                       style: TextStyle(
//                         color: Color(0xFF527DAA),
//                         letterSpacing: 1.5,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'OpenSans',
//                       ),
//                     ),
//                   ),
//                 ),

//                 RaisedButton(
//                   color: Colors.red,
//                   textColor: Colors.white,
//                   child: Text('Delete'),
//                   onPressed: () {
//                     productProvider.removeProduct(widget.id);
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             child: isloading
//                 ? Container(
//                     child: Center(
//                       child: CircularProgressIndicator(
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.blue)),
//                     ),
//                     color: Colors.white.withOpacity(0.8),
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }
