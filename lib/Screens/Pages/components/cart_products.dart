import 'package:flutter/material.dart';
import 'package:grocery_store/components/text_field_container.dart';
import 'package:grocery_store/constants.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var products_on_cart = [
    {
      "name": "Apples",
      "picture": "assets/products/apples.jpg",
      "price": 90,
      "packets": 2,
      "quantity": "2 kg"
    },
    {
      "name": "Coriander",
      "picture": "assets/products/coriander.jpg",
      "price": 50,
      "packets": 2,
      "quantity": "1 kg"
    },
    {
      "name": "Lays Wafers",
      "picture": "assets/products/wafers.jpg",
      "price": 35,
      "packets": 3,
      "quantity": "350 gm"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
              cart_prod_name: products_on_cart[index]["name"],
              cart_prod_picture: products_on_cart[index]["picture"],
              cart_prod_price: products_on_cart[index]["price"],
              cart_prod_packet: products_on_cart[index]["packets"],
              cart_prod_qty: products_on_cart[index]["quantity"]);
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_packet;
  final cart_prod_qty;

  const Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_packet,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture, width: 80, height: 80,),
        title: Text(cart_prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Packets:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "$cart_prod_packet",
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Quantity:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    cart_prod_qty,
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Rs. ${cart_prod_price}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryLightColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0,0.0,0.0,0.0),
                      child: IconButton(icon: Icon(Icons.indeterminate_check_box, color: kPrimaryLightColor,), onPressed: (){},),
                    ),
                    Text("$cart_prod_packet"),
                    IconButton(icon: Icon(Icons.add_box_rounded, color: kPrimaryLightColor), onPressed: (){},)
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }

}
