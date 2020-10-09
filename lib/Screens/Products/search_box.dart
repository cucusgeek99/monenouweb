// import 'package:flutter/material.dart';
// import 'package:monenou/views/firestore_search.dart';

// class SearchBox extends StatelessWidget {
//   final ValueChanged<String> onChanged;
//   const SearchBox({
//     Key key,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Color(0xFFCC8053),
//       margin: EdgeInsets.all(20),
//       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         border: Border.all(
//           color: Colors.white,
//         ),
//       ),
//       child: TextField(
//         onTap:() {Navigator.push(context, MaterialPageRoute<void>(
//                   builder: (BuildContext context) {
//                     return CloudFirestoreSearch();
//                   },
//                 ));
//         },

//         onChanged: onChanged,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           // icon: SvgPicture.asset("assets/icons/search.svg"),
//           // icon: Icon(Icons.search ),
//           prefixIcon: Icon(Icons.format_list_bulleted),
//           hintText: "Rechercher sur Monenou",
//           hintStyle: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
