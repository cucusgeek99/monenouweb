import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


import 'package:google_sign_in/google_sign_in.dart';

import 'package:monenou_web/Screens/Products/phonelogin.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   // Create a new credential
//   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

// Future<String> signInWithGoogle(BuildContext context) async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult = await _auth.signInWithCredential(credential);
//   final User user = authResult.user;
//   final snapShot =
//       await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();

//    if (snapShot.exists){
//         //it exists
//           Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PhoneVef(id: user.uid ),
//         ));
//    }
//    else{
//   // not exists

//   await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
//     "userId": user.uid,
//     "email": user.email,
//     "name": user.displayName,
//     'phone_number': user.phoneNumber,
//     'photoUrl': 'null'
//   }).whenComplete(() {
//     Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PhoneVef(id: user.uid),
//         ));
//   });

//    }
  // assert(!user.isAnonymous);
  // assert(await user.getIdToken() != null);

  // final FirebaseUser currentUser = await _auth.currentUser();
  // assert(user.uid == currentUser.uid);

  // return 'signInWithGoogle succeeded: $user';
// }
Future<UserCredential> signInWithGoogle(BuildContext context) async {
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

String your_client_id = "680039652850480";
String your_redirect_url =
    "https://www.facebook.com/connect/login_success.html";

FirebaseAuth auth = FirebaseAuth.instance;
User user;



// Future<UserCredential> signInWithFacebook(BuildContext context) async {
//   // Trigger the sign-in flow
//   final LoginResult result = await FacebookAuth.instance.login();
// try {
  
//       final facebookAuthCred =
//           FacebookAuthProvider.credential( result.accessToken.token);
//       final user = await auth.signInWithCredential(facebookAuthCred);
//       final snapShot = await FirebaseFirestore.instance
//           .collection('Users')
//           .doc(user.user.uid)
//           .get();

//       if (snapShot == null) {
//         await FirebaseFirestore.instance
//             .collection('Users')
//             .doc(user.user.uid)
//             .set({
//           "userId": user.user.uid,
//           "email": user.user.email,
//           "name": user.user.displayName,
//           'phone_number': user.user.phoneNumber,
//           'photoUrl': 'null'
//         }).whenComplete(() {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PhoneVef(id: user.user.uid),
//               ));
//         });
//       } else {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PhoneVef(id: user.user.uid),
//             ));
//       }
//     } catch (e) {}
//   // Create a credential from the access token
//   final FacebookAuthCredential facebookAuthCredential =
//     FacebookAuthProvider.credential(result.accessToken.token);

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }


// loginWithFacebook(BuildContext context) async {
//   String result = await Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => CustomWebView(
//         selectedUrl:
//             'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
//       ),
//       maintainState: true,
//     ),
//   );
//   if (result != null) {
//     try {
//       final facebookAuthCred =
//           FacebookAuthProvider.credential( result);
//       final user = await auth.signInWithCredential(facebookAuthCred);
//       final snapShot = await FirebaseFirestore.instance
//           .collection('Users')
//           .doc(user.user.uid)
//           .get();

//       if (snapShot == null) {
//         await FirebaseFirestore.instance
//             .collection('Users')
//             .doc(user.user.uid)
//             .set({
//           "userId": user.user.uid,
//           "email": user.user.email,
//           "name": user.user.displayName,
//           'phone_number': user.user.phoneNumber,
//           'photoUrl': 'null'
//         }).whenComplete(() {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PhoneVef(id: user.user.uid),
//               ));
//         });
//       } else {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PhoneVef(id: user.user.uid),
//             ));
//       }
//     } catch (e) {}
//   }
// }

Future<UserCredential> signInWithFacebook(BuildContext context) async {
  // Create a new provider
  FacebookAuthProvider facebookProvider = FacebookAuthProvider();

  facebookProvider.addScope('email');
  facebookProvider.setCustomParameters({
    'display': 'popup',
  });

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(facebookProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
}

class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  CustomWebView({this.selectedUrl});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.selectedUrl,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 103, 178, 1),
          title: new Text("Facebook login"),
        ));
  }
}
