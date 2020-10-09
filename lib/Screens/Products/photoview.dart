// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/views/photobar.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:photo_view_example/screens/common/app_bar.dart';

// class HeroExample extends StatefulWidget {
//   @override
//   _HeroExampleState createState() => _HeroExampleState();
// }

// class _HeroExampleState extends State<HeroExample> {
//    String _message = '';

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   _register() {
//     _firebaseMessaging.getToken().then((token) => print(token));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getMessage();
//   }
  
//   void getMessage(){
//    _firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//       print('on message $message');
//       setState(() => _message = message["notification"]["title"]);
//     }, onResume: (Map<String, dynamic> message) async {
//       print('on resume $message');
//       setState(() => _message = message["notification"]["title"]);
//     }, onLaunch: (Map<String, dynamic> message) async {
//       print('on launch $message');
//       setState(() => _message = message["notification"]["title"]);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     // return ExampleAppBarLayout(
//     //   title: "Messages",
//     //   showGoBack: true,
//     //   child: Center(
//     //     child: Container(
//     //       child: Text('Pas de nouveaux messages',
//     //       style: TextStyle(
//     //           color: Colors.black,
//     //           fontFamily: 'OpenSans',
//     //         ),
//     //       )
//     //     ),
//     //   ),
//     // );
//      return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Message: $_message"),
//             // OutlineButton(
//             //   child: Text("Register My Device"),
//             //   onPressed: () {
//             //     _register();
//             //   },
//             // ),
//             // Text("Message: $message")
//             ListTile(
//   title: Text("Launch Web Page"),
//   onTap: () async {
//     const url = 'https://paygateglobal.com/v1/page?token=71f1ca4d-daf6-4d44-925d-77b05f46b78d&amount=300&description=test&identifier=110';
//     if (await canLaunch(url)) {
//       await launch(url, forceSafariVC: false);
//     } else {
//       throw 'Could not launch $url';
//     }
//   },
// ),
//           ]),
//         ),
//       ),
//     );
//   }
//   }


