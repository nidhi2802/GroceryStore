import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
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
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Dashboard_Screen()));
          },

          child: Text(
            'My Grocery Store',
            style: TextStyle(fontSize: 15),
          ),
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
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                  return new AlertDialog(
                    title: new Text("Packet Size"),
                    content: new Text("Select the quantity"),
                    actions: <Widget>[
                      new MaterialButton(onPressed: (){
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                      )
                    ],
                  );
                    });
              },
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
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Packets"),
                        content: new Text("Select the total packets"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Close"),
                          )
                        ],
                      );
                    });
              },
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
          ),

          Divider(),

          new ListTile(
            title: new Text("Description"),
            subtitle: new Text("Considered as the most commonly grown apples in India, these apples have light red skin, juicy and crunchy flesh. We source the best apples with residue and wax free peel from trusted growers."),
          ),
          Divider(),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product Name", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Brand", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand Name"),),
            ],
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("Similar Products"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
