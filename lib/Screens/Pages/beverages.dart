import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/constants.dart';

import 'components/beverages_products.dart';

class Beverages extends StatefulWidget {
  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryLightColor,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Dashboard_Screen()));
          },

          child: Text(
            'Beverages',
            style: TextStyle(fontSize: 15),
          ),
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

      body: new Beverages_Products(),
    );
  }
}
