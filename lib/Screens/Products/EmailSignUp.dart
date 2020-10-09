import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/EmailLogIn.dart';
// import 'package:monenou/views/Home.dart';
// import 'package:monenou/views/SignUp.dart';
// import 'package:monenou/views/phonelogin.dart';
// import 'package:monenou/views/home_page.dart';
// import 'package:monenou/views/myproduct.dart';
import 'package:monenou_web/Screens/Products/EmailLogIn.dart';
import 'package:monenou_web/Screens/Products/SignUp.dart';
import 'package:monenou_web/Screens/Products/phonelogin.dart';
import 'package:monenou_web/constant.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

final _formKey = GlobalKey<FormState>();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore _db = FirebaseFirestore.instance;
// DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordController1 = TextEditingController();

TextEditingController telnumber = TextEditingController();

class _EmailSignUpState extends State<EmailSignUp> {
  final themeColor = Color(0xfff5a623);
  final primaryColor = Color(0xff203152);
  final greyColor = Color(0xffaeaeae);
  final greyColor2 = Color(0xffE8E8E8);
  bool passwordVisible;
  bool passwordVisible1;
  bool isLoading = false;
  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<Null> openDialog() async {
    FirebaseAuth.instance.authStateChanges().listen((currentUser) {
      if (currentUser != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                contentPadding: EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                children: <Widget>[
                  Container(
                    color: orango,
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    height: 100.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.exit_to_app,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.only(bottom: 10.0),
                        ),
                        Text(
                          'Voulez vous annuler l´opération ?',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.cancel,
                            color: primaryColor,
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                        ),
                        Text(
                          'NON',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      try {
                        FirebaseAuth.instance.currentUser
                            .delete()
                            .then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => SignUp()),
                              (Route<dynamic> route) => false);
                        });
                      } catch (e) {
                        if (e.code == 'requires-recent-login') {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => SignUp()),
                              (Route<dynamic> route) => false);
                        }
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                        ),
                        Text(
                          'OUI',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              );
            });
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignUp()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void initState() {
    passwordVisible = true;
    passwordVisible1 = true;

    super.initState();
  }

  bool _rememberMe = false;
  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nom',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.name,

            controller: nameController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),

            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Entrer votre nom',
              hintStyle: kHintTextStyle,
            ),

            // The validator receives the text that the user has entered.

            validator: (value) {
              if (value.isEmpty) {
                return 'Entrer votre nom';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: emailController,

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Entrer votre email',
              hintStyle: kHintTextStyle,
            ),

            // The validator receives the text that the user has entered.

            validator: (value) {
              if (value.isEmpty) {
                return 'Entrer votre email';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

  // Widget _buildTel() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         'Numéro de téléphone',
  //         style: kLabelStyle,
  //       ),
  //       SizedBox(height: 10.0),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: kBoxDecorationStyle,
  //         height: 60.0,
  //         child: TextFormField(
  //           controller: telnumber,

  //           keyboardType: TextInputType.phone,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontFamily: 'OpenSans',
  //           ),
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.only(top: 14.0),
  //             prefixIcon: Icon(
  //               Icons.phone,
  //               color: Colors.white,
  //             ),
  //             hintText: 'Enter your number',
  //             hintStyle: kHintTextStyle,
  //           ),

  //           // The validator receives the text that the user has entered.

  //           validator: (value) {
  //             if (value.isEmpty) {
  //               return 'Enter your number';
  //             }

  //             return null;
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            obscureText: passwordVisible,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Entrer votre mot de passe',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(
                    // Based on passwordVisible state choose the icon
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Entrer votre mot de passe';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmation de mot de passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            obscureText: passwordVisible1,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController1,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Réécrivez votre mot de passe',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    passwordVisible1 = !passwordVisible1;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value != passwordController.text) {
                return 'Les mots de passes ne sont pas identiques';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié ?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        // onPressed: () => print('Login Button Pressed'),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            registerToFb();
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Créer un compte',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EmailLogIn()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Vous avez déjà un compte ? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Se connecter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onBackPress,
        child: Stack(
          children: [
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Form(
                  key: _formKey,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFEAA651),
                              Color(0xFFEFA142),
                              Color(0xFFF49C33),
                              Color(0xFFFA9720),
                            ],
                            stops: [0.1, 0.4, 0.7, 0.9],
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 120.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'S\'inscrire',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              _buildName(),

                              SizedBox(height: 30.0),

                              _buildEmailTF(),

                              SizedBox(
                                height: 30.0,
                              ),

                              // _buildTel(),

                              // SizedBox(

                              //   height: 30.0,

                              // ),

                              _buildPasswordTF(),

                              SizedBox(
                                height: 30.0,
                              ),

                              _buildPasswordTF1(),

                              // _buildForgotPasswordBtn(),

                              // _buildRememberMeCheckbox(),

                              _buildLoginBtn(),

                              // _buildSignInWithText(),

                              // _buildSocialBtnRow(),

                              _buildSignupBtn(),
                            ],
                          ),
                        ),
                      )
                    ],
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
            )
          ],
        ),
      ),
    );
  }

  void registerToFb() {
    setState(() {
      isLoading = true;
    });

    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) async {
      // _db.collection('Users').doc(result.user.uid).set({
      //   "userId": result.user.uid,
      //   "email": emailController.text,
      //   "name": nameController.text,
      //   'phone_number': telnumber.text,
      //   'photoUrl': 'null'

      // })
      // .then((res) {
      try {
        await result.user.sendEmailVerification();

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: orango,
                  contentTextStyle: TextStyle(color: Colors.white),
                  title: Center(
                    child: Text('Monenou',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Roboto')),
                  ),
                  content: Column(
                    children: [
                      Center(
                        child: Expanded(
                          child: Text(
                              'Un email de vérification vous a été envoyé , cliquez sur le lien contenu dedans pour activer votre compte ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Roboto')),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text("Continuez",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Roboto')),
                          textColor: Colors.black,
                          padding: EdgeInsets.all(16),
                          onPressed: () async {
                            User user = FirebaseAuth.instance.currentUser;
                            user.reload();

                            if (user.emailVerified) {
                              _db.collection('Users').doc(result.user.uid).set({
                                "userId": result.user.uid,
                                "email": emailController.text,
                                "name": nameController.text,
                                'phone_number': telnumber.text,
                                'photoUrl': 'null'
                              }).then((value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhoneVef(id: result.user.uid)),
                                );
                              });
                            } else {
                              // Fluttertoast.showToast(
                              //     msg: "Vous n´avez pas vérifié votre compte",
                              //     textColor: Colors.white,
                              //     backgroundColor: Colors.black,
                              //     fontSize: 16);
                            }
                            // Navigator.of(context).pop();
                          },
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ));
      } catch (e) {
        print(
            "Une erreur est survenue en tentant de vous envoyez un email de vérification");
        print(e.message);
      }
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
//       email-already-in-use:
// Thrown if there already exists an account with the given email address.
// invalid-email:
// Thrown if the email address is not valid.
// operation-not-allowed:
// Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
// weak-password:
// Thrown if the password is not strong enough
      if (err.code == 'weak-password') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Erreur"),
                content:
                    Text('Le mot de passe doit être au moins de 6 caractères'),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      } else if (err.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Erreur"),
                content: Text('Cet adresse email est déjà utilisé'),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      } else if (err.code == 'invalid-email') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Erreur"),
                content: Text('Cet adresse email est invalide'),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    });
  }
}
