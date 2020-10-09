import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GridBody extends StatefulWidget {
  @override

  
  _GridBodyState createState() => _GridBodyState();
  

}

class _GridBodyState extends State<GridBody> {

  @override
  void initState() { 
    super.initState();
    
  }
       final dbRefer = FirebaseFirestore.instance.collection('products').get();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return CustomScrollView(
      slivers: <Widget>[
        // SliverList(
        //   delegate: SliverChildListDelegate([
        //     Container(
        //       margin: EdgeInsets.only(top: 12),
        //       // child: Column(
        //       //   children: <Widget>[
        //       //     MediaQuery.of(context).size.width < 1300
        //       //         ? Column(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       //             children: List<Widget>.generate(4, (i) {
        //       //               return tickets(colors[i], context, icons[i],
        //       //                   randomNumbers[i], newTexts[i]);
        //       //             }),
        //       //           )
        //       //         : Row(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       //             children: List<Widget>.generate(4, (i) {
        //       //               return tickets(colors[i], context, icons[i],
        //       //                   randomNumbers[i], newTexts[i]);
        //       //             })),
        //       //     SizedBox(
        //       //       height: 16,
        //       //     ),
        //       //     loading
        //       //         ? tableCard(
        //       //             context,
        //       //             ApiData.githubTrendingModel,
        //       //           )
        //       //         : Center(
        //       //             child: CircularProgressIndicator(),
        //       //           ),
        //       //   ],
        //       // ),
        //     ),
        //   ]),
        // ),
        SliverToBoxAdapter(
          child: FutureBuilder(
            future: dbRefer,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 1300 ? 4 : 3,
                    childAspectRatio:
                        MediaQuery.of(context).size.width < 1300 ? 0.6 : 0.65,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return _ProductCard(
                        snapshot.data.docs[index].get('productId'),
                        snapshot.data.docs[index].get('name'),
                        snapshot.data.docs[index]
                            .get('price')
                            .toInt()
                            .toString(),
                        snapshot.data.docs[index].get('userId'),
                        snapshot.data.docs[index].get('img'),
                        false,
                        snapshot.data.docs[index].get('description'),
                        snapshot.data.docs[index].get('category'),
                        'Good',
                        context,
                        index);
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(child: Text("No get(field)"));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 4 : 3,
            childAspectRatio:
                MediaQuery.of(context).size.width < 1300 ? 0.6 : 0.65,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 2,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://placeimg.com/640/480/nature/grayscale',
                          fit: BoxFit.fill,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Beautiful Nature",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '''The place is close to Metro Station and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Milan.''',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "800/night",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on),
                                        Text(
                                          "Milan, Italy",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'HelveticaNeue',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            },
            childCount: 8,
          ),
        )
      ],
    );
    // Size size = MediaQuery.of(context).size;

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         width: size.width - 150,
    //         child: Container(
    //           margin: EdgeInsets.all(20),
    //           padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    //           decoration: BoxDecoration(
    //                           color: Colors.orange,

    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //             border: Border.all(
    //               color: Colors.white,
    //             ),
    //           ),
    //           child: TextField(
    //             onTap: () {
    //               // Navigator.push(context, MaterialPageRoute<void>(
    //               //         builder: (BuildContext context) {
    //               //           return CloudFirestoreSearch();
    //               //         },
    //               //       ));
    //             },

    //             // onChanged: onChanged,
    //             decoration: InputDecoration(
    //               border: InputBorder.none,
    //               // icon: SvgPicture.asset("assets/icons/search.svg"),
    //               // icon: Icon(Icons.search ),
                  
    //               prefixIcon: Icon(Icons.format_list_bulleted,
    //               color: Colors.black,
    //               ),
    //               hintText: "Rechercher sur Monenou",
    //               hintStyle: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ),
    //       ),
    //       // CustomScrollView(
    //       //   slivers: <Widget>[
    //         // GridView(gridDelegate: null)
    //          GridView(
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 4 : 3,
    //         childAspectRatio:
    //             MediaQuery.of(context).size.width < 1300 ? 0.6 : 0.65,
    //         mainAxisSpacing: 10,
    //       ),
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, int index) {
    //           return Card(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5.0),
    //             ),
    //             elevation: 2,
    //             margin:
    //                 EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
    //             child: Container(
    //               padding: EdgeInsets.all(12),
    //               child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Image.network(
    //                       'https://placeimg.com/640/480/nature/grayscale',
    //                       fit: BoxFit.fill,
    //                     ),
    //                     Container(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         //  mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: <Widget>[
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Text(
    //                               "Beautiful Nature",
    //                               style: TextStyle(
    //                                 fontSize: 16,
    //                                 fontFamily: 'HelveticaNeue',
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Text(
    //                               '''The place is close to Metro Station and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Milan.''',
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 fontSize: 14,
    //                                 fontWeight: FontWeight.bold,
    //                                 fontFamily: 'HelveticaNeue',
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceAround,
    //                               children: <Widget>[
    //                                 Text(
    //                                   "800/night",
    //                                   style: TextStyle(
    //                                     fontSize: 12,
    //                                     fontWeight: FontWeight.bold,
    //                                     fontFamily: 'HelveticaNeue',
    //                                   ),
    //                                 ),
    //                                 Row(
    //                                   children: <Widget>[
    //                                     Icon(Icons.location_on),
    //                                     Text(
    //                                       "Milan, Italy",
    //                                       style: TextStyle(
    //                                         fontSize: 12,
    //                                         fontWeight: FontWeight.bold,
    //                                         fontFamily: 'HelveticaNeue',
    //                                       ),
    //                                     )
    //                                   ],
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 8,
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ]),
    //             ),
    //           );
    //         },
    //         childCount: 8,
    //       ),
    //     // )
    //     //     ],
    //       ),
        
    //     ],
    //   ),
    // );
  }
  Widget _ProductCard(
      String id,
      String name,
      String price,
      String sellerId,
      String imgPath,
      bool state,
      String description,
      String category,
      String condition,
      context,
      index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            
            imgPath,
            fit: BoxFit.fill,
            width: 200,
            height: 200,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        price.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'HelveticaNeue',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HelveticaNeue',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}