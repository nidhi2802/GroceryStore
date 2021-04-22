import 'package:flutter/material.dart';
import 'package:grocery_store/constants.dart';

class CartDetails extends StatefulWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_packet;
  final cart_prod_qty;

  const CartDetails({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_packet, this.cart_prod_qty});

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  int count=1;
  int amount=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Card(
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
                              amount = widget.cart_prod_price*count;
                            }
                          });
                        },),
                    ),
                    Text("$count"),
                    //Text("${widget.cart_prod_packet}"),
                    IconButton(icon: Icon(Icons.add_box_rounded, color: kPrimaryLightColor), onPressed: (){
                      setState(() {
                        count++;
                        amount = widget.cart_prod_price*count;
                      });
                    },)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
                  title: new Text("Total Amount: "),
                  subtitle: new Text("${amount}"),
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
