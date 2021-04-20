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
                          child: new Text("Rs ${widget.product_detail_price}", style: TextStyle(color: Colors.black),)),
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
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("More Products"),
              ),
         Container(
           height: 360.0,
           child: Similar_products(),
         )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var products_list = [
    {
      "name": "Apples",
      "picture": "assets/products/apples.jpg",
      "price": 90,
      "unit": "1 kg",
    },
    {
      "name": "Coriander",
      "picture": "assets/products/coriander.jpg",
      "price": 50,
      "unit": "500 gm",
    },
    {
      "name": "Lays Wafers",
      "picture": "assets/products/wafers.jpg",
      "price": 35,
      "unit": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Similar_single_prod(
          product_name: products_list[index]['name'],
          product_picture: products_list[index]['picture'],
          product_price: products_list[index]['price'],
          product_unit: products_list[index]['unit'],
        );
      },
    );
  }

}

class Similar_single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;
  final product_unit;

  Similar_single_prod(
      {
        this.product_name,
        this.product_picture,
        this.product_price,
        this.product_unit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("Hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails(
                  product_detail_name: product_name,
                  product_detail_picture: product_picture,
                  product_detail_price: product_price,
                  product_detail_unit: product_unit,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold))),
                    new Text("\Rs$product_price", style: TextStyle(
                      color: kPrimaryLightColor, fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),
              child: Image.asset(
                product_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}