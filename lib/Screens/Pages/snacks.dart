import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/Screens/Pages/components/snack_products.dart';
import 'package:grocery_store/constants.dart';

class Snacks extends StatefulWidget {
  @override
  _SnacksState createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
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
            'Snacks',
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

      body: Snack_Products(),
    );
  }
}
