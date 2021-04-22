import 'package:flutter/material.dart';
import 'package:grocery_store/constants.dart';

/*class Cart_Products extends StatefulWidget {

  final add_prod_name;
  final add_prod_picture;
  final add_prod_price;
  final add_prod_packet;
  final add_prod_qty;

  const Cart_Products(
      {this.add_prod_name,
      this.add_prod_picture,
      this.add_prod_price,
      this.add_prod_packet,
      this.add_prod_qty});

  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  /*var products_on_cart = [
    {
      "name": "Apples",
      "picture": "assets/products/apples.jpg",
      "price": 90,
      "packets": 2,
      "quantity": "2 kg",
      "description": "Considered as the most commonly grown apples in India, these apples have light red skin, juicy and crunchy flesh. We source the best apples with residue and wax free peel from trusted growers."
    },
    {
      "name": "Coriander",
      "picture": "assets/products/coriander.jpg",
      "price": 50,
      "packets": 2,
      "quantity": "1 kg",
      "description": "Coriander is an herb that's commonly used to flavor international dishes. It comes from the Coriandrum sativum plant and is related to parsley, carrots, and celery."
    },
    {
      "name": "Lays Wafers",
      "picture": "assets/products/wafers.jpg",
      "price": 35,
      "packets": 3,
      "quantity": "350 gm",
      "description": "Relish delectable combination of sour and cream perfectly blended with herb and onion flavour."
    },
  ];*/
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        //itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
              cart_prod_name: widget.add_prod_name,
              cart_prod_picture: widget.add_prod_picture,
              cart_prod_price: widget.add_prod_price,
              cart_prod_packet: widget.add_prod_packet,
              cart_prod_qty: widget.add_prod_qty);
        });
  }
}*/

class Single_cart_product extends StatefulWidget {
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
  _Single_cart_productState createState() => _Single_cart_productState();
}

class _Single_cart_productState extends State<Single_cart_product> {
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(widget.cart_prod_picture, width: 80, height: 80,),
        title: Text(widget.cart_prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
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
                    "${widget.cart_prod_packet}",
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
                    widget.cart_prod_qty,
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
                      "Rs. ${widget.cart_prod_price}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryLightColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0,0.0,0.0,0.0),
                      child: IconButton(icon: Icon(Icons.indeterminate_check_box, color: kPrimaryLightColor,),
                        onPressed: (){
                        setState((){
                          if(count>1){
                            count--;
                          }
                        });
                      },),
                    ),
                    Text("$count"),
                    //Text("${widget.cart_prod_packet}"),
                    IconButton(icon: Icon(Icons.add_box_rounded, color: kPrimaryLightColor), onPressed: (){
                      setState(() {
                        count++;
                      });
                    },)
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
