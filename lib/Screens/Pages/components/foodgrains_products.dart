import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';

class Foodgrains_Products extends StatefulWidget {
  @override
  _Foodgrains_ProductsState createState() => _Foodgrains_ProductsState();
}

class _Foodgrains_ProductsState extends State<Foodgrains_Products> {
  var products_on_cart = [
    {
      "name": "Saffola Oil",
      "picture": "assets/products/foodoil.jpg",
      "price": 560,
      "quantity": "5 litre",
      "description":"Saffola Active oil also contains Saffola Rice bran oil and soyabean oil. It also contains Omega 3, Oryzanol and Vitamin E.",
      "brand": "Saffola"
    },
    {
      "name": "Ramdev Hing",
      "picture": "assets/products/hing.jpg",
      "price": 65,
      "quantity": "50 gm",
      "description": "An inseparable spice of Indian cuisine, asafoetida or Strong Hing Powder, is a gum obtained from a type of giant fennel.",
      "brand": "Ramdev"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_foodgrain_product(
              cart_prod_name: products_on_cart[index]["name"],
              cart_prod_picture: products_on_cart[index]["picture"],
              cart_prod_price: products_on_cart[index]["price"],
              cart_prod_qty: products_on_cart[index]["quantity"],
              cart_prod_desc: products_on_cart[index]["description"],
              cart_prod_brand: products_on_cart[index]["brand"]);
        });
  }
}

class Single_foodgrain_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;
  final cart_prod_desc;
  final cart_prod_brand;


  const Single_foodgrain_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_qty,
        this.cart_prod_desc,
        this.cart_prod_brand});

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
                      product_detail_desc: cart_prod_desc,
                      product_detail_brand: cart_prod_brand,
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
