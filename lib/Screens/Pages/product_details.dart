import 'package:flutter/material.dart';
import 'package:grocery_store/constants.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;
  final product_detail_unit;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_picture,
      this.product_detail_price,
      this.product_detail_unit});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'My Grocery Store',
          style: TextStyle(fontSize: 15),
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
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Rs${widget.product_detail_price}", style: TextStyle(color: Colors.black),)),
                      Expanded(
                          child: new Text("${widget.product_detail_unit}", style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryLightColor),)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
              color: Colors.white,
              textColor: Colors.grey,
                elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Packet Sizes")),
                  Expanded(
                      child: new Icon(Icons.arrow_drop_down)),
                ],
              ),)),
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text("Quantity")),
                    Expanded(
                        child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),))
            ],
          ),


          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                color: kPrimaryLightColor,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Order Now"),)),

              new IconButton(icon: Icon(Icons.add_shopping_cart, color: kPrimaryLightColor,), onPressed: (){}),

              new IconButton(icon: Icon(Icons.favorite_border, color: kPrimaryLightColor,), onPressed: (){}),
            ],
          )
        ],
      ),
    );
  }

}
