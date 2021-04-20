import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';

class Hygiene_Products extends StatefulWidget {
  @override
  _Hygiene_ProductsState createState() => _Hygiene_ProductsState();
}

class _Hygiene_ProductsState extends State<Hygiene_Products> {
  var products_on_cart = [
    {
      "name": "No.1 Coconut Soap",
      "picture": "assets/products/household1.jpg",
      "price": 60,
      "quantity": "120 gm"
    },
    {
      "name": "Head & Shoulders Conditioner",
      "picture": "assets/products/household2.jpg",
      "price": 120,
      "quantity": "500 ml"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_Hygiene_Product(
              cart_prod_name: products_on_cart[index]["name"],
              cart_prod_picture: products_on_cart[index]["picture"],
              cart_prod_price: products_on_cart[index]["price"],
              cart_prod_qty: products_on_cart[index]["quantity"]);
        });
  }
}

class Single_Hygiene_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  const Single_Hygiene_Product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("Hero no 1"),
        child: Material(
          child: InkWell(
            onTap: () =>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ProductDetails(
              product_detail_name: cart_prod_name,
              product_detail_picture: cart_prod_picture,
              product_detail_price: cart_prod_price,
              product_detail_unit: cart_prod_qty,
            ))),
            child: ListTile(
              leading: Image.asset(
                cart_prod_picture,
                width: 80,
                height: 80,
              ),
              title: Text(
                cart_prod_name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,8.0,0.0,8.0),
                        child: Text("Quantity:"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,8.0,0.0,8.0),
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
                      ],
                    ),
                  ),
                ],
              ),
              trailing: TextButton(
                onPressed: (){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kPrimaryLightColor)),
                child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

