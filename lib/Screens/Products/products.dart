// import 'addproduct.dart';
// import 'package:flutter/material.dart';
// import 'package:monenou/views/addproduct.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';

// class Products extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final products = Provider.of<List<Product>>(context);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Products'),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.add,
//                 size: 30.0,
//               ),
//               onPressed: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => EditProduct()));
//               },
//             )
//           ],
//         ),
//         body: (products != null)
//             ? ListView.builder(
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(products[index].productName ),
//                     trailing: Text(products[index].productPrice.toString()),
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => EditProduct(products[index])));
//                     },
//                   );
//                 })
//             : Center(child: CircularProgressIndicator()));
//   }
// }