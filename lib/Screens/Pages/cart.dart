import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/components/cart_products.dart';
import 'package:grocery_store/constants.dart';

class Cart extends StatefulWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_packet;
  final cart_prod_qty;


  const Cart(
      {this.cart_prod_name,
        this.cart_prod_picture,
        this.cart_prod_price,
        this.cart_prod_packet,
        this.cart_prod_qty});

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

      body: new Single_cart_product(
        cart_prod_name: widget.cart_prod_name,
        cart_prod_picture: widget.cart_prod_picture,
        cart_prod_price: widget.cart_prod_price,
        cart_prod_packet: widget.cart_prod_packet,
        cart_prod_qty: widget.cart_prod_qty,
      ),

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
