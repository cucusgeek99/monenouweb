// import 'package:flutter/material.dart';
// import 'package:monenou/utilities/constants.dart';
// import 'package:monenou/views/home_page.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:async';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BottomBarCustom extends StatefulWidget {
//   final num;

//   const BottomBarCustom({Key key, this.num}) : super(key: key);
//   @override
//   _BottomBarCustomState createState() => _BottomBarCustomState();
// }

// class _BottomBarCustomState extends State<BottomBarCustom> {
//   Future<void> _launched;

//   // phone= widget.num;
//   @override
//   void initState() {
//     super.initState();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  setState(() {
//     //    phone=widget.num;
//     //  });
//     String _phone = widget.num;
//     return BottomAppBar(
//       elevation: 10,
//       child: Container(
//         // color: Colors.greenAccent,
//         height: 50,
//         child: new Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: Colors.white,
//                   // border: Border.all(
//                   //   color: Colors.black,
//                   //   width: 2,
//                   // ),
//                 ),
//                 child: IconButton(
//                   highlightColor: Colors.deepOrangeAccent,
//                   // color: Colors.blue,
//                   onPressed: () => setState(() {
//                     _launched = _launchSMS();
//                   }),
//                   icon: FaIcon(FontAwesomeIcons.sms),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: Colors.white,
//                   // border: Border.all(
//                   //   color: Colors.black,
//                   //   width: 2,
//                   // ),
//                 ),
//                 child: IconButton(
//                   onPressed: () => setState(() {
//                     _launched = _launchWhatsApp();
//                   }),
//                   icon: FaIcon(FontAwesomeIcons.whatsappSquare),
//                   // label: Text('Whats')
//                 ),
//               ),
//             ),
//             Expanded(
//                 child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 color: Colors.white,
//                 // border: Border.all(
//                 //   color: Colors.black,
//                 //   width: 2,
//                 // ),
//               ),
//               child: IconButton(
//                 onPressed: () => setState(() {
//                   _launched = _makePhoneCall('tel:$_phone');
//                 }),
//                 icon: FaIcon(FontAwesomeIcons.phoneVolume),
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _launchWhatsApp() async {
//     String phoneNumber = widget.num;
//     String message = 'Bonjour, je voudrais avoir un peu plus de renseignements sur votre article publié sur Monenou';
//     var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
//     if (await canLaunch(whatsappUrl)) {
//       await launch(whatsappUrl);
//     } else {
//       throw 'Could not launch $whatsappUrl';
//     }
//   }

//   Future<void> _launchSMS() async {
//     String phoneNumber = widget.num;

//     String message = 'Bonjour, je voudrais avoir un peu plus de renseignements sur votre article publié sur Monenou';
//     var url = "sms:$phoneNumber?body=$message";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Future<void> _makePhoneCall(String url) async {
//     // String url = widget.num;
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
