import 'package:flutter/material.dart';

class CountrySelection extends StatefulWidget {
  @override
  _CountrySelectionState createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEAA651),
            Color(0xFFEFA142),
            Color(0xFFF49C33),
            Color(0xFFFA9720),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text("Sélectionner un pays",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Roboto')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              )
            ]),
      ),
    ));
  }
}
