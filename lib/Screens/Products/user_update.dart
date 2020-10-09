import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_demo/const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monenou_web/Screens/Products/myproduct.dart';
import 'package:monenou_web/constant.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserUpdate extends StatefulWidget {
  final name;
  final phoneNumber;
  final photourl;

  const UserUpdate({Key key, this.name, this.phoneNumber, this.photourl})
      : super(key: key);
  @override
  _UserUpdateState createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
  // @override
  TextEditingController controllerNickname = TextEditingController();
  TextEditingController controllerAboutMe = TextEditingController();

  SharedPreferences prefs;

  String id;
  String nickname;
  String phoneNumber;
  String photoUrl;

  bool isLoading = false;
  File avatarImageFile;
  final picker = ImagePicker();

  final FocusNode focusNodeNickname = FocusNode();
  final FocusNode focusNodeAboutMe = FocusNode();

  @override
  void initState() {
    // readLocal();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      id = user.uid;
    });
    // FirebaseAuth.instance.currentUser().then((res) async {

    // });
    photoUrl = widget.photourl;
    controllerNickname.text = widget.name;
    controllerAboutMe.text = widget.phoneNumber;
    // Firestore.instance.collection('Users').document(id).get().then((value) {
    //   controllerNickname = TextEditingController(text: value.data['name']);
    //   controllerAboutMe =
    //       TextEditingController(text: value.data['phone_number']);
    //   photoUrl = value.data['photoUrl'];
    // });
    super.initState();
  }
  // void readLocal() async {
  //   prefs = await SharedPreferences.getInstance();
  //   id = prefs.getString('id') ?? '';
  //   nickname = prefs.getString('nickname') ?? '';
  //   phoneNumber = prefs.getString('phoneNumber') ?? '';
  //   photoUrl = prefs.getString('photoUrl') ?? '';

  //   controllerNickname = TextEditingController(text: nickname);
  //   controllerAboutMe = TextEditingController(text: phoneNumber);

  //   // Force refresh input
  //   setState(() {});
  // }

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        avatarImageFile = File(image.path);
        isLoading = true;
      });
    }
    uploadFile();
  }
//  String fileName = _image.path.split('/').last;

//       StorageTaskSnapshot snapshot = await storage
//           .ref()
//           .child("images/$fileName")
  Future uploadFile() async {
    String fileName = avatarImageFile.path.split('/').last;
    StorageReference reference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then((value) {
      if (value.error == null) {
        storageTaskSnapshot = value;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          photoUrl = downloadUrl;
          FirebaseFirestore.instance.collection('Users').doc(id).update({
            'name': controllerNickname.text,
            'phone_number': controllerAboutMe.text,
            'photoUrl': photoUrl
          }).then((data) async {
            await prefs.setString('photoUrl', photoUrl);
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: "Mis à jour réussie",textColor: Colors.white,backgroundColor: Colors.black,fontSize: 16);
          }).catchError((err) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: err.toString(),textColor: Colors.black);
          });
        }, onError: (err) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: 'Ce fichier n´est pas une image',textColor: Colors.white,backgroundColor: Colors.black,fontSize: 16);
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: 'Ce fichier n´est pas une image',textColor: Colors.black);
      }
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: err.toString(),textColor: Colors.black);
    });
  }

  void handleUpdateData() {
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();

    setState(() {
      isLoading = true;
    });

    FirebaseFirestore.instance.collection('Users').doc(id).update({
      'name': controllerNickname.text,
      'phone_number': controllerAboutMe.text,
      'photoUrl': photoUrl
    }).then((data) async {
      // await prefs.setString('nickname', controllerNickname.text);
      // await prefs.setString('aboutMe', controllerAboutMe.text.toString());
      // await prefs.setString('photoUrl', photoUrl);

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Mis à jour réussie",textColor: Colors.white,
      backgroundColor: Colors.black,fontSize: 16
      
      ).then((value) {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Myproduct(id: id);
          },
        ));
      });
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString(),textColor: Colors.black);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETTINGS',
          style: TextStyle(color: orango, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Avatar
                Container(
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        (avatarImageFile == null)
                            ? (photoUrl != 'null'
                                ? Material(
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      placeholder: (context, url) => Container(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                        width: 90.0,
                                        height: 90.0,
                                        padding: EdgeInsets.all(20.0),
                                      ),
                                      imageUrl: photoUrl,
                                      width: 90.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(45.0)),
                                    clipBehavior: Clip.hardEdge,
                                  )
                                : Icon(
                                    Icons.account_circle,
                                    size: 90.0,
                                    color: Colors.grey,
                                  ))
                            : Material(
                                child: Image.file(
                                  avatarImageFile,
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                                clipBehavior: Clip.hardEdge,
                              ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: orango.withOpacity(0.5),
                          ),
                          onPressed: getImage,
                          padding: EdgeInsets.all(30.0),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.grey,
                          iconSize: 30.0,
                        ),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.all(20.0),
                ),

                // Input
                Column(
                  children: <Widget>[
                    // Username
                    Container(
                      child: Text(
                        'Nom',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: orango),
                      ),
                      margin:
                          EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                    ),
                    Container(
                      child: Theme(
                        data: Theme.of(context).copyWith(primaryColor: orango),
                        child: TextFormField(
                          // initialValue: widget.name,

                          decoration: InputDecoration(
                            hintText: 'Nom',
                            contentPadding: EdgeInsets.all(5.0),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: controllerNickname,
                          validator: (value) {
                            value.isEmpty ? 'Entrer un nom' : null;
                          },
                          onChanged: (value) {
                            controllerNickname.text;
                          },
                          focusNode: focusNodeNickname,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    ),

                    // About me
                    Container(
                      child: Text(
                        'Numéro',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: orango),
                      ),
                      margin:
                          EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                    ),
                    Container(
                      child: Theme(
                        data: Theme.of(context).copyWith(primaryColor: orango),
                        child: TextFormField(
                          // initialValue: widget.phoneNumber ,
                          decoration: InputDecoration(
                            hintText: 'Numéro whatsapp eg:+228 99999999',
                            contentPadding: EdgeInsets.all(5.0),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: controllerAboutMe,
                          onChanged: (value) {
                            controllerAboutMe.text;
                          },
                          focusNode: focusNodeAboutMe,
                          validator: (value) {
                            value.isEmpty ? 'Entrer un numéro' : null;
                          },
                        ),
                      ),
                      margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),

                // Button
                Container(
                  child: FlatButton(
                    onPressed: handleUpdateData,
                    child: Text(
                      'Mettre à jour',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    color: orango,
                    highlightColor: Color(0xff8d93a0),
                    splashColor: Colors.transparent,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  ),
                  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
          ),

          // Loading
          Positioned(
            child: isLoading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue)),
                    ),
                    color: Colors.white.withOpacity(0.8),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
