import 'package:flutter/material.dart';
import 'package:grocery_store/constants.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'About App',
          style: TextStyle(fontSize: 15),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            "The app provides you with all your basic neccessities for the household and grocery items. Select product of your choice, add to cart and order the items.",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
