import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/cartdetails.dart';
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
      "quantity": "120 gm",
      "unit": 1,
      "description":"Godrej No.1 Coconut and Neem soap packs the benefits of two great natural ingredients into one.",
      "brand":"Godrej"
    },
    {
      "name": "Head & Shoulders Conditioner",
      "picture": "assets/products/household2.jpg",
      "price": 120,
      "quantity": "500 ml",
      "unit": 1,
      "description":"Head & Shoulders Smooth & Silky Dandruff Conditioner is formulated with added moisturizers to restore dry, frizzy hair by helping to lock in dandruff-fighting power.",
      "brand":"Head & Shoulders"
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
              cart_prod_qty: products_on_cart[index]["quantity"],
              cart_prod_desc: products_on_cart[index]["description"],
              cart_prod_brand: products_on_cart[index]["brand"],
              cart_prod_quant: products_on_cart[index]["unit"]);
        });
  }
}

class Single_Hygiene_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;
  final cart_prod_desc;
  final cart_prod_brand;
  final cart_prod_quant;

  const Single_Hygiene_Product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty,
    this.cart_prod_desc,
    this.cart_prod_brand,
    this.cart_prod_quant});
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
              product_detail_desc: cart_prod_desc,
              product_detail_brand: cart_prod_brand,
              product_detail_quant: cart_prod_quant,
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
                onPressed: (){
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>CartDetails(
                    cart_prod_name: cart_prod_name,
                    cart_prod_qty: cart_prod_qty,
                    cart_prod_packet: cart_prod_quant,
                    cart_prod_price: cart_prod_price,
                    cart_prod_picture: cart_prod_picture,
                  )));
                },
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

