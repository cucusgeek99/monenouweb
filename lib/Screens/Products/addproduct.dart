// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:monenou/models/product.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/add_image.dart';
// import 'package:monenou/views/into_screen.dart';
// import 'package:monenou/views/myproduct.dart';
// import 'package:monenou_web/Screens/Products/into_screen.dart';
// import 'package:monenou_web/constant.dart';
// import 'package:provider/provider.dart';
// import '../providers/product_provider.dart';

// class EditProduct extends StatefulWidget {
//   final Product product;

//   EditProduct([this.product]);

//   @override
//   _EditProductState createState() => _EditProductState();
// }

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// // final _formKey = GlobalKey<FormState>();
// TextEditingController nameController = TextEditingController();
// TextEditingController descriptionController = TextEditingController();
// TextEditingController priceController = TextEditingController();
// String _categoryController;

// class _EditProductState extends State<EditProduct> {
//   var storage = FirebaseStorage.instance;
//   File _image;
//   File _image1;
//   // String imageurl;
//   String imgurl;
//   String imgurl1;
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
//     if (widget.product == null) {
//       //New Record

//       nameController.text = "";
//       priceController.text = "";
//       descriptionController.text = "";
//       // _categoryController = "";
//       new Future.delayed(Duration.zero, () {
//         final productProvider =
//             Provider.of<ProductProvider>(context, listen: false);
//         productProvider.loadValues(Product());
//       });
//     } else {
//       //Controller Update
//       nameController.text = widget.product.productName;
//       _categoryController = widget.product.category;
//       descriptionController.text = widget.product.productDescription;
//       priceController.text = widget.product.productPrice.toInt().toString();
//       // _image= widget.product.imgurl;
//       //State Update
//       new Future.delayed(Duration.zero, () {
//         final productProvider =
//             Provider.of<ProductProvider>(context, listen: false);
//         productProvider.loadValues(widget.product);
//       });
//     }

//     super.initState();
//     // Widget
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     //  final FirebaseAuth auth = FirebaseAuth.instance;

//     FirebaseAuth.instance.authStateChanges().listen((res) {
//       var id = res.uid;
//       productProvider.changeUserId(id);
//     });
//     // productProvider.changeImg(imgurl);
//     // productProvider.changeImg(EditProduct().imgurl);

//     var now = DateTime.now();
//     productProvider.changeSaveDate(now.toString());
//     productProvider.changeValidated(false);
//     productProvider.changePremium(true);


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
//             productProvider.changeImg(downloadUrl);
//           }).then((data) async {
//             setState(() {
//               isloading = false;
//                             Navigator.pop(context);

//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('Ce fichier n´est pas une image');
//         }
//       });
//     }

//     Future getImage2() async {
//       final pickedFile = await picker.getImage(source: ImageSource.camera);

//       setState(() {
//         _image1 = File(pickedFile.path);
//         isloading = true;
//       });

//       String fileName = _image1.path.split('/').last;

//       // StorageTaskSnapshot snapshot = await storage
//       //     .ref()
//       //     .child("images/$fileName")
//       //     .putFile(_image)
//       //     .onComplete
//       //     .whenComplete((value) {
//       StorageReference reference =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       StorageUploadTask uploadTask = reference.putFile(_image1);
//       StorageTaskSnapshot storageTaskSnapshot;
//       uploadTask.onComplete.then((value) async {
//         if (value.error == null) {
//           storageTaskSnapshot = value;
//           await storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//             productProvider.changeImg1(downloadUrl);
//           }).then((data) async {
//             setState(() {
//               isloading = false;
//                             Navigator.pop(context);

//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('Ce fichier n´est pas une image');
//         }
//       });
//     }

//     Future getImage3() async {
//       final pickedFile = await picker.getImage(source: ImageSource.gallery);

//       setState(() {
//         _image1 = File(pickedFile.path);
//         isloading = true;
//       });

//       String fileName = _image1.path.split('/').last;

//       // StorageTaskSnapshot snapshot = await storage
//       //     .ref()
//       //     .child("images/$fileName")
//       //     .putFile(_image)
//       //     .onComplete
//       //     .whenComplete((value) {
//       StorageReference reference =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       StorageUploadTask uploadTask = reference.putFile(_image1);
//       StorageTaskSnapshot storageTaskSnapshot;
//       uploadTask.onComplete.then((value) async {
//         if (value.error == null) {
//           storageTaskSnapshot = value;
//           await storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//             productProvider.changeImg1(downloadUrl);
//           }).then((data) async {
//             setState(() {
//               isloading = false;
//                             Navigator.pop(context);

//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('Ce fichier n´est pas une image');
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
//               Navigator.pop(context);
//             });
//           });
//         } else {
//           print(
//               'Error from image repo ${storageTaskSnapshot.error.toString()}');
//           throw ('Ce fichier n´est pas une image');
//         }
//       });
//     }

//     Future _newTaskModalBottomSheet(context) {
//       showModalBottomSheet(
//           context: context,
//           builder: (BuildContext bc) {
//             return Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.add_photo_alternate),
//                       title: new Text('Sélectionner une photo de la galerie'),
//                       onTap: () => {getImage1()}),
//                   new ListTile(
//                     leading: new Icon(Icons.add_a_photo_outlined),
//                     title: new Text('Prendre une nouvelle photo'),
//                     onTap: () => {getImage()},
//                   ),
//                 ],
//               ),
//             );
//           });
//     }

//     Future _newTaskModalBottomSheet1(context) {
//       showModalBottomSheet(
//           context: context,
//           builder: (BuildContext bc) {
//             return Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.add_photo_alternate),
//                       title: new Text('Sélectionner une photo de la galerie'),
//                       onTap: () => {getImage3()}),
//                   new ListTile(
//                     leading: new Icon(Icons.add_a_photo_outlined),
//                     title: new Text('Prendre une nouvelle photo'),
//                     onTap: () => {getImage2()},
//                   ),
//                 ],
//               ),
//             );
//           });
//     }

//     return Scaffold(
//       // appBar: AppBar(title: Text('Edit Product')),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: _formKey,
//               child: ListView(
//                 children: <Widget>[
//                   // TextFormField(
//                   //   controller: nameController,
//                   //   keyboardType: TextInputType.text,
//                   //   decoration: InputDecoration(
//                   //     labelText: 'Nom du produit',
//                   //     hintText: 'Entrez le nom du produit',
//                   //     contentPadding: EdgeInsets.all(15.0),
//                   //     filled: true,
//                   //     // fillColor: Colors.blue,
//                   //   ),
//                   //   validator: (value) {
//                   //     if (value.isEmpty) {
//                   //       return 'Entrer le nom du produit';
//                   //     }

//                   //     return null;
//                   //   },
//                   //   onChanged: (value) => productProvider.changeName(value),
//                   // ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Nom de l´article',
//                         style: kLabelStyle,
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: kBoxDecorationStyle,
//                         height: 60.0,
//                         child: TextFormField(
//                           keyboardType: TextInputType.name,

//                           controller: nameController,
//                           style: TextStyle(
//                             // color: Colors.white,
//                             fontFamily: 'OpenSans',
//                           ),

//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 14.0),
//                             prefixIcon: Icon(
//                               Icons.article_rounded,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Entrer le nom de l´article',
//                             hintStyle: kHintTextStyle,
//                           ),

//                           // The validator receives the text that the user has entered.

//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Entrer le nom de l´article';
//                             }

//                             return null;
//                           },
//                           onChanged: (value) =>
//                               productProvider.changeName(value),
//                         ),
//                       ),
//                     ],
//                   ),

//                   // TextFormField(
//                   //   controller: descriptionController,
//                   //   keyboardType: TextInputType.multiline,
//                   //   decoration: InputDecoration(
//                   //     labelText: 'Desciption du produit',
//                   //     hintText: 'Entrez la description du produit',
//                   //     contentPadding: EdgeInsets.all(15.0),
//                   //     filled: true,
//                   //     // fillColor: Colors.blue,
//                   //   ),
//                   //   validator: (value) {
//                   //     if (value.isEmpty) {
//                   //       return 'Entrer la description du produit';
//                   //     }
//                   //     return null;
//                   //   },
//                   //   onChanged: (value) =>
//                   //       productProvider.changeDescription(value),
//                   // ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Description de l´article',
//                         style: kLabelStyle,
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: kBoxDecorationStyle,
//                         height: 100.0,
//                         child: TextFormField(
//                           keyboardType: TextInputType.multiline,

//                           controller: descriptionController,
//                           style: TextStyle(
//                             // color: Colors.white,
//                             fontFamily: 'OpenSans',
//                           ),

//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 14.0),
//                             prefixIcon: Icon(
//                               Icons.article_rounded,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Description de l´article',
//                             hintStyle: kHintTextStyle,
//                           ),

//                           // The validator receives the text that the user has entered.

//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Entrer une description de l´article';
//                             }

//                             return null;
//                           },
//                           onChanged: (value) =>
//                               productProvider.changeDescription(value),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // TextFormField(
//                   //   controller: priceController,
//                   //   keyboardType: TextInputType.number,
//                   //   decoration: InputDecoration(
//                   //     labelText: 'Prix du produit',
//                   //     hintText: 'Entrez le prix du produit',
//                   //     contentPadding: EdgeInsets.all(15.0),
//                   //     filled: true,
//                   //     // fillColor: Colors.blue,
//                   //   ),
//                   //   onChanged: (value) => productProvider.changePrice(value),
//                   // ),

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Prix de l´article',
//                         style: kLabelStyle,
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: kBoxDecorationStyle,
//                         height: 60.0,
//                         child: TextFormField(
//                           keyboardType: TextInputType.number,

//                           controller: priceController,
//                           style: TextStyle(
//                             // color: Colors.white,
//                             fontFamily: 'OpenSans',
//                           ),

//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 14.0),
//                             prefixIcon: Icon(
//                               Icons.article_rounded,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Prix de l´article',
//                             hintStyle: kHintTextStyle,
//                           ),

//                           // The validator receives the text that the user has entered.

//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Entrer un prix pour l´article';
//                             }

//                             return null;
//                           },
//                           onChanged: (value) =>
//                               productProvider.changePrice(value),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Catégorie de l´article',
//                         style: kLabelStyle,
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                           alignment: Alignment.centerLeft,
//                           decoration: kBoxDecorationStyle,
//                           height: 60.0,
//                           child: DropdownButtonFormField<String>(
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(top: 14.0),
//                               prefixIcon: Icon(
//                                 Icons.article_rounded,
//                                 color: Colors.white,
//                               ),
//                               hintText: 'Catégorie de l´article',
//                               hintStyle: kHintTextStyle,
//                             ),
//                             value: _categoryController,
//                             items: [
//                               'Vêtements',
//                               'Electroniques',
//                               'Pour la maison',
//                               'Mode & Beauté',
//                               'Immobiliers',
//                               'Electroménagers',
//                               'Autres'
//                             ]
//                                 .map((label) => DropdownMenuItem(
//                                       child: Text(
//                                         label.toString(),
//                                         style: TextStyle(
//                                           fontFamily: 'OpenSans',
//                                         ),
//                                       ),
//                                       value: label,
//                                     ))
//                                 .toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 _categoryController = value;
//                               });
//                               productProvider.changeCategory(value);
//                             },
//                             validator: (value) {
//                               if (value==null) {
//                                 return 'Sélectionner une catégorie';
//                               }

//                               return null;
//                             },
//                           ))
//                     ],
//                   ),

//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Ajouter une image',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: 'OpenSans',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height:15)
//                       // Center(
//                       //     child: IconButton(
//                       //         icon: Icon(Icons.add_a_photo),
//                       //         onPressed:(){ _newTaskModalBottomSheet(context);})),
//                       // Center(
//                       //     child: IconButton(
//                       //         icon: Icon(Icons.add_photo_alternate),
//                       //         onPressed: getImage1))
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                       (widget.product == null)
//                           ? Container(
//                               height: 70,
//                               width: 70,
//                               child: _image == null
//                                   ? Container(
//                                       height: 70,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         border: Border.all(
//                                           color: Colors.black,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                       child: IconButton(
//                                         icon: Icon(
//                                           Icons.camera_alt,
//                                           color: orango.withOpacity(0.5),
//                                         ),
//                                         onPressed: ()  {
//                                         _newTaskModalBottomSheet(context);
//                                           // Navigator.pop(context);
//                                         },
//                                         padding: EdgeInsets.all(30.0),
//                                         splashColor: Colors.transparent,
//                                         highlightColor: Colors.grey,
//                                         iconSize: 30.0,
//                                       ),
//                                     )
//                                   : Image.file(_image),
//                             )
//                           : Container(
//                               height: 70,
//                               width: 70,
//                               child: _image == null
//                                   ? Image.network(widget.product.imgurl)
//                                   : Image.file(_image),
//                             ),
//                       SizedBox(width: 50),
//                       (widget.product == null || widget.product.imgurl1=='null'|| widget.product.imgurl1==null)
//                           ? Container(
//                               height: 70,
//                               width: 70,
//                               child: _image1 == null
//                                   ? Container(
//                                       height: 70,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         border: Border.all(
//                                           color: Colors.black,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                       child: IconButton(
//                                         icon: Icon(
//                                           Icons.camera_alt,
//                                           color: orango.withOpacity(0.5),
//                                         ),
//                                         onPressed: () {
//                                           _newTaskModalBottomSheet1(context);
//                                           // Navigator.of(context).pop();
//                                         },
//                                         padding: EdgeInsets.all(30.0),
//                                         splashColor: Colors.transparent,
//                                         highlightColor: Colors.grey,
//                                         iconSize: 30.0,
//                                       ))
//                                   : Image.file(_image1),
//                             )
//                           : Container(
//                               height: 70,
//                               width: 70,
//                               child: _image1 == null
//                                   ? Image.network(widget.product.imgurl1)
//                                   : Image.file(_image1),
//                             )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   // RaisedButton(
//                   //   onPressed: () {
//                   //     // showDialog(
//                   //     //     context: context,
//                   //     //     builder: (context) => AlertDialog(
//                   //     //           title: Center(
//                   //     //             child: Text('Enrégistrement'),
//                   //     //           ),
//                   //     //           content: LinearProgressIndicator(
//                   //     //             value: 7,
//                   //     //           ),
//                   //     //         ),
//                   //     //     barrierDismissible: false);
//                   //     // uploading(_image).whenComplete(() {
//                   //       if(_formKey.currentState.validate()){
//                   //     productProvider.SaveProduct();
//                   //     Navigator.of(context).pop();}
//                   //     // });
//                   //     // productProvider.SaveProduct();
//                   //     // Navigator.of(context).pop();
//                   //   },
//                   //   child: Text('Ajouter'),
//                   // ),
//                   (widget.product == null)
//                       ? Container(
//                           padding: EdgeInsets.symmetric(vertical: 25.0),
//                           width: double.infinity,
//                           child: RaisedButton(
//                             elevation: 5.0,
//                             // onPressed: () => print('Login Button Pressed'),
//                             onPressed: () {
//                               if (_formKey.currentState.validate()) {
//                                 if (_image != null) {
//                                   productProvider.SaveProduct();
//                                   Fluttertoast.showToast(
//                                       msg: "Ajouter avec succès",
//                                       textColor: Colors.white,
//                                       backgroundColor: Colors.black,
//                                       fontSize: 16);
//                                   Navigator.of(context).pop();
//                                 } else {
//                                   Fluttertoast.showToast(
//                                       msg: "Veuillez ajouter une image",
//                                       textColor: Colors.white,
//                                       backgroundColor: Colors.black,
//                                       fontSize: 16);
//                                 }
//                               }
//                             },

//                             padding: EdgeInsets.all(15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                             color: Colors.white,
//                             child: Text(
//                               'Ajouter',
//                               style: TextStyle(
//                                 color: Color(0xFF527DAA),
//                                 letterSpacing: 1.5,
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'OpenSans',
//                               ),
//                             ),
//                           ),
//                         )
//                       : Container(
//                           padding: EdgeInsets.symmetric(vertical: 25.0),
//                           width: double.infinity,
//                           child: RaisedButton(
//                             elevation: 5.0,
//                             // onPressed: () => print('Login Button Pressed'),
//                             onPressed: () {
//                               if (_formKey.currentState.validate()) {
//                                 productProvider.SaveProduct();
//                                 Fluttertoast.showToast(
//                                     msg: "Modifier avec succès",
//                                     textColor: Colors.white,
//                                     backgroundColor: Colors.black,
//                                     fontSize: 16);
//                                 Navigator.pushReplacement(context,
//                                     MaterialPageRoute<void>(
//                                   builder: (BuildContext context) {
//                                     return IntroScreen();
//                                   },
//                                 ));
//                               }
//                             },

//                             padding: EdgeInsets.all(15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                             color: Colors.white,
//                             child: Text(
//                               'Modifier',
//                               style: TextStyle(
//                                 color: Color(0xFF527DAA),
//                                 letterSpacing: 1.5,
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'OpenSans',
//                               ),
//                             ),
//                           ),
//                         ),
//                   if (widget.product != null)
//                     // RaisedButton(
//                     //         color: Colors.red,
//                     //         textColor: Colors.white,
//                     //         child: Text('Delete'),
//                     //         onPressed: () {
//                     //           productProvider
//                     //               .removeProduct(widget.product.productId);
//                     //           Navigator.of(context).pop();
//                     //         }

//                     //       ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 25.0),
//                       width: double.infinity,
//                       child: RaisedButton(
//                         elevation: 5.0,
//                         // onPressed: () => print('Login Button Pressed'),
//                         onPressed: () {
//                           productProvider
//                               .removeProduct(widget.product.productId);
//                           Fluttertoast.showToast(
//                               msg: "Supprimer avec succès",
//                               textColor: Colors.white,
//                               backgroundColor: Colors.black,
//                               fontSize: 16);
//                                 Navigator.pushReplacement(context,
//                                     MaterialPageRoute<void>(
//                                   builder: (BuildContext context) {
//                                     return IntroScreen();
//                                   },
//                                 ));
                        
//                         },

//                         padding: EdgeInsets.all(15.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         color: Colors.red,
//                         child: Text(
//                           'Supprimer',
//                           style: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1.5,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'OpenSans',
//                           ),
//                         ),
//                       ),
//                     )
//                   // RaisedButton(
//                   //   color: Colors.red,
//                   //   textColor: Colors.white,
//                   //   child: Text('Delete'),
//                   //   onPressed: () {

//                   //   },
//                   // )

//                   else
//                     Container()
//                 ],
//               ),
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
// // String setImageUrl(imgurl){

// //    imageurl=imgurl;

// // }
