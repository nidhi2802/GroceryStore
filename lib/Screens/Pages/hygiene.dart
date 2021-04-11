import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/components/hygiene_products.dart';
import 'package:grocery_store/constants.dart';

class Hygiene extends StatefulWidget {
  @override
  _HygieneState createState() => _HygieneState();
}

class _HygieneState extends State<Hygiene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'Hygiene',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      body: Hygiene_Products(),
    );
  }
}
