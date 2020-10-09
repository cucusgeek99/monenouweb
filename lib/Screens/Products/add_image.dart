// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/addproduct.dart';

// class addImg extends StatefulWidget {
//   @override
//   _addImgState createState() => _addImgState();
// }

// class _addImgState extends State<addImg> {
//   var storage = FirebaseStorage.instance;
//   File _image;
//   var imageurl;

//   final picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     Future getImage() async {
//       final pickedFile = await picker.getImage(source: ImageSource.gallery);

//       setState(() {
//         _image = File(pickedFile.path);
//       });

//       String fileName = _image.path.split('/').last;

//       StorageTaskSnapshot snapshot = await storage
//           .ref()
//           .child("images/$fileName")
//           .putFile(_image)
//           .onComplete;
//       if (snapshot.error == null) {
//         final String downloadUrl = await snapshot.ref.getDownloadURL();
        
//         // EditProduct().imgurl=downloadUrl;
//         // Navigator.push(context, MaterialPageRoute<void>(
//         //           builder: (BuildContext context) {
                    
//         //             return EditProduct(null,downloadUrl.toString());
//         //           },
//         //         ));

//       } else {
//         print('Error from image repo ${snapshot.error.toString()}');
//         throw ('This file is not an image');
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Row(
//           children: <Widget>[
//             Center(
//               child: Container(
//                 height: 170,
//                 width: 170,
//                 child: _image == null
//                     ? Text('No image selected.')
//                     : Image.file(_image),
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: RaisedButton(
                
//                 color: orango,
//                 onPressed: getImage,
//                 child: Text('Ajouter une image'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
