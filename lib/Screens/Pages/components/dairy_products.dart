import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';

class Dairy_Products extends StatefulWidget {
  @override
  _Dairy_ProductsState createState() => _Dairy_ProductsState();
}

class _Dairy_ProductsState extends State<Dairy_Products> {
  var products_on_cart = [
    {
      "name": "Amul Ghee",
      "picture": "assets/products/ghe.jpg",
      "price": 540,
      "quantity": "500 ml"
    },
    {
      "name": "Amul Butter",
      "picture": "assets/products/butter.jpg",
      "price": 90,
      "quantity": "500 gm"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_Dairy_Product(
              cart_prod_name: products_on_cart[index]["name"],
              cart_prod_picture: products_on_cart[index]["picture"],
              cart_prod_price: products_on_cart[index]["price"],
              cart_prod_qty: products_on_cart[index]["quantity"]);
        });
  }
}

class Single_Dairy_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  const Single_Dairy_Product(
      {this.cart_prod_name,
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
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => ProductDetails(
                      product_detail_name: cart_prod_name,
                      product_detail_picture: cart_prod_picture,
                      product_detail_price: cart_prod_price,
                      product_detail_unit: cart_prod_qty,
                    ))),
            child: ListTile(
              leading: Image.asset(
                cart_prod_picture,
                width: 100,
                height: 100,
              ),
              title: Text(
                cart_prod_name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                     Text("Quantity:"),
                    Text(
                          cart_prod_qty,
                          style: TextStyle(color: kPrimaryLightColor),
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
                        TextButton(onPressed: (){},
                            child: Text("Add", style: TextStyle(color: kPrimaryLightColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
