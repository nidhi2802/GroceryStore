import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/components/dairy_products.dart';
import 'package:grocery_store/constants.dart';

class Dairy extends StatefulWidget {
  @override
  _DairyState createState() => _DairyState();
}

class _DairyState extends State<Dairy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'Dairy',
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

    body: new Dairy_Products(),
    );
  }
}
