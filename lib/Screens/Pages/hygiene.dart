import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/Screens/Pages/cart.dart';
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
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Dashboard_Screen()));
          },
          child: Text(
            'Hygiene',
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
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),

      body: Hygiene_Products(),
    );
  }
}
