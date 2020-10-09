// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monenou_web/Screens/Home/Home_screen.dart';
import 'package:monenou_web/Screens/Products/dashboard.dart';
import 'package:monenou_web/constant.dart';

void main()  {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => HomeScreen(),
      '/home': (BuildContext context) => Dashboard(),
    };
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(fontFamily: 'HelveticaNeue'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
    // return MaterialApp(
    //   title: 'Monenou',
    //   theme: ThemeData(
    //     primaryColor: orango ,
      
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: HomeScreen(),
    // );
  }
}



