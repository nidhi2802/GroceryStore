import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';

class Beverages_Products extends StatefulWidget {
  @override
  _Beverages_ProductsState createState() => _Beverages_ProductsState();
}

class _Beverages_ProductsState extends State<Beverages_Products> {
  var products_on_cart = [
    {
      "name": "Pepsi",
      "picture": "assets/products/beverages1.jpg",
      "price": 75,
      "quantity": "1 litre"
    },
    {
      "name": "Amul Kool Kesar",
      "picture": "assets/products/beverages2.jpg",
      "price": 30,
      "quantity": "30 ml"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_Beverage_Product(
              cart_prod_name: products_on_cart[index]["name"],
              cart_prod_picture: products_on_cart[index]["picture"],
              cart_prod_price: products_on_cart[index]["price"],
              cart_prod_qty: products_on_cart[index]["quantity"]);
        });
  }
}

class Single_Beverage_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  const Single_Beverage_Product({
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
