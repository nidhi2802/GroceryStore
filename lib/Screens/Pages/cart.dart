import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/components/cart_products.dart';
import 'package:grocery_store/constants.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'My Cart',
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

      body: new Cart_Products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
                  title: new Text("Total Amount: "),
                   subtitle: new Text("Rs 500"),
            )),
            Expanded(child: new MaterialButton(
              onPressed: () {},
                  child: Text("Check out", style: TextStyle(color: Colors.white),),
                    color: kPrimaryLightColor,))
          ],
        ),
      ),
    );
  }
}
