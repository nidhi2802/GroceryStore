import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/Screens/Pages/cartdetails.dart';
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
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartDetails(
                      cart_prod_qty: "2 kg",
                      cart_prod_packet: 1,
                      cart_prod_price: 90,
                      cart_prod_picture: "assets/products/apples.jpg",
                      cart_prod_name: "Apples",
                    )));
              })
        ],
      ),

      body: new Foodgrains_Products(),
    );
  }
}
