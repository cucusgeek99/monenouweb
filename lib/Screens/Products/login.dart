// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/home_page.dart';
// import 'package:monenou/views/phonelogin.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// final _formKey = GlobalKey<FormState>();
// FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// FirebaseFirestore _db = FirebaseFirestore.instance;
// // DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
// TextEditingController emailController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController passwordController = TextEditingController();

// class _LoginScreenState extends State<LoginScreen> {
  
//   bool _rememberMe = false;
//   Widget _buildName() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Nom',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             keyboardType: TextInputType.name,

//             controller: nameController,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),

//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.perm_identity,
//                 color: Colors.white,
//               ),
//               hintText: 'Entrer votre nom',
//               hintStyle: kHintTextStyle,
//             ),

//             // The validator receives the text that the user has entered.

//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Entrer votre nom';
//               }

//               return null;
//             },
//           ),

//           //  TextField(
//           //   keyboardType: TextInputType.emailAddress,
//           //   style: TextStyle(
//           //     color: Colors.white,
//           //     fontFamily: 'OpenSans',
//           //   ),
//           //   decoration: InputDecoration(
//           //     border: InputBorder.none,
//           //     contentPadding: EdgeInsets.only(top: 14.0),
//           //     prefixIcon: Icon(
//           //       Icons.email,
//           //       color: Colors.white,
//           //     ),
//           //     hintText: 'Enter your Email',
//           //     hintStyle: kHintTextStyle,
//           //   ),
//           // ),
//         ),
//       ],
//     );
//   }

//   Widget _buildEmailTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             controller: emailController,

//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),

//             // The validator receives the text that the user has entered.

//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Enter email';
//               }

//               return null;
//             },
//           ),

//           //  TextField(
//           //   keyboardType: TextInputType.emailAddress,
//           //   style: TextStyle(
//           //     color: Colors.white,
//           //     fontFamily: 'OpenSans',
//           //   ),
//           //   decoration: InputDecoration(
//           //     border: InputBorder.none,
//           //     contentPadding: EdgeInsets.only(top: 14.0),
//           //     prefixIcon: Icon(
//           //       Icons.email,
//           //       color: Colors.white,
//           //     ),
//           //     hintText: 'Enter your Email',
//           //     hintStyle: kHintTextStyle,
//           //   ),
//           // ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             keyboardType: TextInputType.visiblePassword,

//             controller: passwordController,

//             decoration: InputDecoration(
//               labelText: "Enter Password",
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),

//             // The validator receives the text that the user has entered.

//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Enter password';
//               }

//               return null;
//             },
//           ),

//           // TextField(
//           //   obscureText: true,
//           //   style: TextStyle(
//           //     color: Colors.white,
//           //     fontFamily: 'OpenSans',
//           //   ),
//           //   decoration: InputDecoration(
//           //     border: InputBorder.none,
//           //     contentPadding: EdgeInsets.only(top: 14.0),
//           //     prefixIcon: Icon(
//           //       Icons.lock,
//           //       color: Colors.white,
//           //     ),
//           //     hintText: 'Enter your Password',
//           //     hintStyle: kHintTextStyle,
//           //   ),
//           // ),
//         ),
//       ],
//     );
//   }

//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         onPressed: () => print('Forgot Password Button Pressed'),
//         padding: EdgeInsets.only(right: 0.0),
//         child: Text(
//           'Forgot Password?',
//           style: kLabelStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildRememberMeCheckbox() {
//     return Container(
//       height: 20.0,
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(unselectedWidgetColor: Colors.white),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.green,
//               activeColor: Colors.white,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value;
//                 });
//               },
//             ),
//           ),
//           Text(
//             'Se souvenir de moi',
//             style: kLabelStyle,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         // onPressed: () => print('Login Button Pressed'),
//         onPressed: () {
//           if (_formKey.currentState.validate()) {
//             registerToFb();
//           }
//         },
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         color: Colors.white,
//         child: Text(
//           'Se connecter',
//           style: TextStyle(
//             color: Color(0xFF527DAA),
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'OpenSans',
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget _buildSignInWithText() {
//   //   return Column(
//   //     children: <Widget>[
//   //       Text(
//   //         '- OR -',
//   //         style: TextStyle(
//   //           color: Colors.white,
//   //           fontWeight: FontWeight.w400,
//   //         ),
//   //       ),
//   //       SizedBox(height: 20.0),
//   //       Text(
//   //         'Sign in with',
//   //         style: kLabelStyle,
//   //       ),
//   //     ],
//   //   );
//   // }

//   // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Container(
//   //       height: 60.0,
//   //       width: 60.0,
//   //       decoration: BoxDecoration(
//   //         shape: BoxShape.circle,
//   //         color: Colors.white,
//   //         boxShadow: [
//   //           BoxShadow(
//   //             color: Colors.black26,
//   //             offset: Offset(0, 2),
//   //             blurRadius: 6.0,
//   //           ),
//   //         ],
//   //         image: DecorationImage(
//   //           image: logo,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget _buildSocialBtnRow() {
//   //   return Padding(
//   //     padding: EdgeInsets.symmetric(vertical: 30.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       children: <Widget>[
//   //         _buildSocialBtn(
//   //           () => print('Login with Facebook'),
//   //           AssetImage(
//   //             'assets/logos/facebook.jpg',
//   //           ),
//   //         ),
//   //         _buildSocialBtn(
//   //           () => print('Login with Google'),
//   //           AssetImage(
//   //             'assets/logos/google.jpg',
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _buildSignupBtn() {
//     return GestureDetector(
//       onTap: () => print('Sign Up Button Pressed'),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: 'Vous n´avez pas de compte ? ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             TextSpan(
//               text: 'S´inscrire',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Form(
//                           key: _formKey,

//                       child: Stack(
//               children: <Widget>[
//                 Container(
//                   height: double.infinity,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color(0xFF73AEF5),
//                         Color(0xFF61A4F1),
//                         Color(0xFF478DE0),
//                         Color(0xFF398AE5),
//                       ],
//                       stops: [0.1, 0.4, 0.7, 0.9],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   child: SingleChildScrollView(
//                     physics: AlwaysScrollableScrollPhysics(),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40.0,
//                       vertical: 120.0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'Se connecter',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'OpenSans',
//                             fontSize: 30.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         _buildName(),
//                         SizedBox(height: 30.0),
//                         _buildEmailTF(),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         _buildPasswordTF(),
//                         _buildForgotPasswordBtn(),
//                         _buildRememberMeCheckbox(),
//                         _buildLoginBtn(),
//                         // _buildSignInWithText(),
//                         // _buildSocialBtnRow(),
//                         _buildSignupBtn(),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void registerToFb() {
//     firebaseAuth
//         .createUserWithEmailAndPassword(
//             email: emailController.text, password: passwordController.text)
//         .then((result) {
//       _db.collection('Users').doc(result.user.uid).set({
//         "userId": result.user.uid,
//         "email": emailController.text,
//         "name": nameController.text,
//         "photoUrl":'null'
//       }).then((res) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PhoneVef(id: result.user.uid,)),
//         );
//       });
//     }).catchError((err) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Error"),
//               content: Text(err.message),
//               actions: [
//                 FlatButton(
//                   child: Text("Ok"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             );
//           });
//     });
//   }
// }
