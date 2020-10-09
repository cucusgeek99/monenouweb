import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:monenou_web/constant.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneVef extends StatefulWidget {
  final id;
  final ScaffoldState scaffold;

  PhoneVef({Key key, this.id, this.scaffold}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<PhoneVef> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _codeController = TextEditingController();
  String _message = '';
  String _verificationId;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Form(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Vérification du numéro de téléphone",
                          style: TextStyle(
                              color: orango,
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Container(child: Text('+228'),),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: '+228',
                            // prefixIcon:Icon( Icons.add_alert_outlined ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Colors.grey[200])),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Colors.grey[300])),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Numéro de téléphone",
                            labelText: 'Numéro de téléphone (xxx-xxx-xxxx)'),
                        controller: _phoneController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Numéro de téléphone ( xxx-xxx-xxxx)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Colors.grey[200])),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: Colors.grey[300])),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Code de vérification",
                            labelText: 'Code de vérification (eg: 123456)'),
                        controller: _codeController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Entrer le code envoyé';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text("Envoyer le code"),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          onPressed: () async {
                            _verifyPhoneNumber();
                          },
                          color: orango,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text("Vérifier"),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          onPressed: () async {
                            _signInWithPhoneNumber();
                          },
                          color: orango,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
      );
    }));
  }

  // Future<bool> loginUser(String phone, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;

  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         // Navigator.of(context).pop();

  //         // AuthResult result = await _auth.signInWithCredential(credential);
  //         FirebaseFirestore.instance.collection('Users').doc(widget.id).update({
  //           'phone_number': _phoneController.text,
  //         }).then((value) {
  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => Myproduct(id: widget.id)));
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         print(exception);
  //       },
  //       codeSent: (String verificationId, int forceResendingToken) {
  //         showDialog(
  //             context: context,
  //             barrierDismissible: false,
  //             builder: (context) {
  //               return AlertDialog(
  //                 title: Text("Give the code?"),
  //                 content: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     TextField(
  //                       controller: _codeController,
  //                     ),
  //                   ],
  //                 ),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     child: Text("Confirm"),
  //                     textColor: Colors.white,
  //                     color: orango,
  //                     onPressed: () async {
  //                       final code = _codeController.text.trim();
  //                       PhoneAuthCredential credential =
  //                           PhoneAuthProvider.credential(
  //                               verificationId: verificationId, smsCode: code);

  //                       // UserCredential result =
  //                       //     await _auth.signInWithCredential(credential);

  //                       // User user = result.user;

  //                       // if (user != null) {
  //                       // Navigator.push(context, MaterialPageRoute(
  //                       //     builder: (context) => HomeScreen(user: user,)
  //                       // ));
  //                       Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) =>
  //                                   Myproduct(id: widget.id)));
  //                       // } else {
  //                       //   print("Error");
  //                       // }
  //                     },
  //                   )
  //                 ],
  //               );
  //             });
  //       },
  //       codeAutoRetrievalTimeout: null);
  // }

  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    setState(() {
      isLoading = true;
    });

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      // widget.scaffold.showSnackBar(SnackBar(
      //   content: Text(
      //       "Phone number automatically verified and user signed in: ${phoneAuthCredential}"),
      // ));
      FirebaseFirestore.instance.collection('Users').doc(widget.id).update({
        'phone_number': '+228' + _phoneController.text,
      }).then((value) {
        setState(() {
          isLoading = false;
        });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => IntroScreen()));
          //   Navigator.of(context).pushAndRemoveUntil(
          // MaterialPageRoute(builder: (context) => IntroScreen()),
          // (Route<dynamic> route) => false);
      });
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      // widget.scaffold.showSnackBar(const SnackBar(
      //   content: Text('Please check your phone for the verification code.'),
      // ));
      _verificationId = verificationId;
      // showDialog(
      //     context: context,
      //     barrierDismissible: true,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text("Entrer le code  , sinon patientez"),
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             TextField(
      //               controller: _codeController,
      //             ),
      //           ],
      //         ),
      //         actions: <Widget>[
      //           FlatButton(
      //             child: Text("Comfirmer"),
      //             textColor: Colors.white,
      //             color: orango,
      //             onPressed: () async {
      //               _signInWithPhoneNumber();
      //               // final code = _codeController.text.trim();
      //               // PhoneAuthCredential credential =
      //               //     PhoneAuthProvider.credential(
      //               //         verificationId: verificationId, smsCode: code);

      //               // UserCredential result =
      //               //     await _auth.signInWithCredential(credential);

      //               // User user = result.user;

      //               // if (user != null) {
      //               // Navigator.push(context, MaterialPageRoute(
      //               //     builder: (context) => HomeScreen(user: user,)
      //               // ));

      //               // } else {
      //               //   print("Error");
      //               // }
      //             },
      //           )
      //         ],
      //       );
      //     });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+228' + _phoneController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      widget.scaffold.showSnackBar(SnackBar(
        content: Text("Failed to Verify Phone Number: ${e}"),
      ));
    }
  }

  void _signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _codeController.text,
      );
      // final User user = (await _auth.signInWithCredential(credential)).user;

      // widget.scaffold.showSnackBar(SnackBar(
      //   content: Text("Successfully signed "),
      // ));
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => IntroScreen()),
      //     (Route<dynamic> route) => false);
    } catch (e) {
      print(e);
      widget.scaffold.showSnackBar(SnackBar(
        content: Text("Failed to sign in"),
      ));
    }
  }
}
