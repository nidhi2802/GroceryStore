import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/Screens/Pages/components/foodgrains_products.dart';
import 'package:grocery_store/constants.dart';

class Foodgrains extends StatefulWidget {
  @override
  _FoodgrainsState createState() => _FoodgrainsState();
}

class _FoodgrainsState extends State<Foodgrains> {
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
            'Foodgrains',
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

      body: new Foodgrains_Products(),
    );
  }
}
