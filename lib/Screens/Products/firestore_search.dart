// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/views/product_detail.dart';

// class CloudFirestoreSearch extends StatefulWidget {
//   @override
//   _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
// }

// class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
//   String name = "";
//   // final _screenSize = MediaQuery.of(context).size;
//   @override
//   Widget build(BuildContext context) {
//     final _screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Card(
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search), hintText: 'Rechercher...'),
//             onChanged: (val) {
//               setState(() {
//                 name = val;
//               });
//             },
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: (name != "" && name != null)
//             ? FirebaseFirestore.instance
//                 .collection('products')
//                 .where('name', isGreaterThanOrEqualTo: name)
//                 .snapshots()
//             : FirebaseFirestore.instance.collection("products").snapshots(),
//         builder: (context, snapshot) {
//           return (snapshot.connectionState == ConnectionState.waiting)
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: snapshot.data.docs.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot data = snapshot.data.docs[index];
//                     return Card(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => ProductDetail(
//                                     sellerid: data.get('userId'),
//                                     id: data.get('productId'),
//                                     name: data.get('name'),
//                                     description: data.get('description'),
//                                     assetPath: data.get('img'),
//                                     assetPath1: data.get('img1'),
//                                     state: data.get('img'),
//                                     price: data.get('price').toInt().toString(),
//                                     category: data.get('category'),
//                                   )));
//                         },
//                         child: Row(
//                           children: <Widget>[
//                             Image.network(
//                               data.get('img'),
//                               width: 80,
//                               height: 70,
//                               fit: BoxFit.fill,
//                             ),
//                             SizedBox(
//                               width: 25,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 data.get('name'),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
