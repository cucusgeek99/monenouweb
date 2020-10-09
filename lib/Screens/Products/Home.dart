// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// // import './widgets/product_card.dart';
// // import './widgets/product_icon.dart';
// import './widgets/extentions.dart';
// import 'package:monenou/views/light_color.dart';
// import 'package:monenou/views/theme.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Widget _icon(IconData icon, {Color color = Colors.white}) {
//     return Scaffold(
//       body:
//          Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(13)),
//           color: Theme.of(context).backgroundColor,
//           boxShadow: AppTheme.shadow),
//       child: Icon(
//         icon,
//         color: color,
//       ),
//     ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))));
//   }

//   Widget _categoryWidget() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: AppTheme.fullWidth(context),
//       height: 80,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//          children: [
//         //  ? Container(width: 5)
//          Container(
  
//               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  
//               child: Container(
  
//                 padding: AppTheme.hPadding,
  
//                 alignment: Alignment.center,
  
//                 decoration: BoxDecoration(
  
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
  
//                   color: 
  
//                        LightColor.background,
  
//                       // : Colors.transparent,
  
//                   border: Border.all(
  
//                     color: LightColor.orange,
  
//                     width:  2 ,
  
//                   ),
  
//                   boxShadow: <BoxShadow>[
  
//                     BoxShadow(
  
//                       color: Color(0xfffbf2ef) ,
  
//                       blurRadius: 10,
  
//                       spreadRadius: 5,
  
//                       offset: Offset(5, 5),
  
//                     ),
  
//                   ],
  
//                 ),
  
//                 // child: Row(
  
//                 //   children: <Widget>[
  
//                 //     model.image != null ? Image.asset(model.image) : SizedBox(),
  
//                 //     model.name == null
  
//                 //          Container( child: ,)
  
//                 //         // : Container(
  
//                 //         //     child: TextStyle(
  
//                 //         //       text: model.name,
  
//                 //         //       fontWeight: FontWeight.w700,
  
//                 //         //       fontSize: 15,
  
//                 //         //     ),
  
//                 //         //   )
  
//                 //   ],
  
//                 // ),
  
//               ).ripple(
  
//                 () {
  
                  
  
//                 },
  
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
  
//               ),
  
//             ),
// ])
        
      
//       );
    
//   }

//   Widget _productWidget() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: AppTheme.fullWidth(context),
//       height: AppTheme.fullWidth(context) * .7,
//       child: GridView(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//             childAspectRatio: 4 / 3,
//             mainAxisSpacing: 30,
//             crossAxisSpacing: 20),
//         padding: EdgeInsets.only(left: 20),
//         scrollDirection: Axis.horizontal,
//         // children: AppData.productList
//         //     .map(
//         //       (product) => ProductCard(
//         //         product: product,
//         //         onSelected: (model) {
//         //           setState(() {
//         //             AppData.productList.forEach((item) {
//         //               item.isSelected = false;
//         //             });
//         //             model.isSelected = true;
//         //           });
//         //         },
//         //       ),
//         //     )
//         //     .toList(),
//       ),
//     );
//   }

//   Widget _search() {
//     return Container(
//       margin: AppTheme.padding,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               height: 40,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: LightColor.lightGrey.withAlpha(100),
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: "Search Products",
//                     hintStyle: TextStyle(fontSize: 12),
//                     contentPadding:
//                         EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
//                     prefixIcon: Icon(Icons.search, color: Colors.black54)),
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           _icon(Icons.filter_list, color: Colors.black54)
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height - 210,
//       child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         dragStartBehavior: DragStartBehavior.down,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             _search(),
//             _categoryWidget(),
//             _productWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }