import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';
import 'package:grocery_store/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:grocery_store/models/appProvider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Apples",
      "picture": "assets/products/apples.jpg",
      "price": 90,
      "unit": "1 kg",
      "description": "Considered as the most commonly grown apples in India, these apples have light red skin, juicy and crunchy flesh. We source the best apples with residue and wax free peel from trusted growers.",
      "brand":"GroceryStore"
    },
    {
      "name": "Coriander",
      "picture": "assets/products/coriander.jpg",
      "price": 50,
      "unit": "500 gm",
      "description": "Coriander is an herb that's commonly used to flavor international dishes. It comes from the Coriandrum sativum plant and is related to parsley, carrots, and celery.",
      "brand":"GroceryStore"
    },
    {
      "name": "Lays Wafers",
      "picture": "assets/products/wafers.jpg",
      "price": 35,
      "unit": "1",
      "description": "Relish delectable combination of sour and cream perfectly blended with herb and onion flavour.",
      "brand":"Lays"
    },
    {
      "name": "Amul Butter",
      "picture": "assets/products/butter.jpg",
      "price": 90,
      "unit": "500 gm",
      "description": "The Amul butter is smooth and creamy in texture. You can find the butter in two varieties; salted and unsalted. ",
      "brand":"Amul"
    },
    {
      "name": "Amul Ghee",
      "picture": "assets/products/ghee.jpg",
      "price": 540,
      "unit": "500 ml",
      "description": "Amul Ghee is made from fresh cream and it has typical rich aroma and granular texture · Amul Ghee is an ethnic product made by dairies with decades of years.",
      "brand":"Amul"
    },
    {
      "name": "Odonil Freshner",
      "picture": "assets/products/hgiene1.jpg",
      "price": 120,
      "unit": "1",
      "description": "Odonil Room Freshening Gel offers a fine selection of nature-inspired scents to keep your room fresh and fragrant.",
      "brand":"Godrej"
    },
    {
      "name": "Aier Room Freshner",
      "picture": "assets/products/hgiene2.jpg",
      "price": 300,
      "unit": "1",
      "description": "Godrej AER offers a wide range of air freshener fragrances for home, bathroom & car air fresheners.",
      "brand":"Godrej"
    },
    {
      "name": "No.1 Coconut Soap",
      "picture": "assets/products/household1.jpg",
      "price": 60,
      "unit": "120 gm",
      "description":"Godrej No.1 Coconut and Neem soap packs the benefits of two great natural ingredients into one.",
      "brand":"Godrej"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<AppProvider>(context);

    /*return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: productProvider.products
                .map((item) => GestureDetector(
                      child: Single_prod(
                        product: item,
                      ),
                    ))
                .toList(),),);},);*/
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Single_prod(
            product_name: products_list[index]['name'],
            product_picture: products_list[index]['picture'],
            product_price: products_list[index]['price'],
            product_unit: products_list[index]['unit'],
            product_desc: products_list[index]['description'],
            product_brand: products_list[index]['brand']
          ),
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  //final Product_Model product;
  //const Single_prod({Key key, this.product}) : super(key: key);

  final product_name;
  final product_picture;
  final product_price;
  final product_unit;
  final product_desc;
  final product_brand;

  Single_prod(
      {
      this.product_name,
      this.product_picture,
      this.product_price,
      this.product_unit,
      this.product_desc,
      this.product_brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Hero(
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new ProductDetails(
                    product_detail_name: product_name,
                    product_detail_picture: product_picture,
                    product_detail_price: product_price,
                    product_detail_unit: product_unit,
                product_detail_desc: product_desc,
                product_detail_brand: product_brand,
                  ))),
          child: GridTile(
            footer: Container(
              color: Colors.white,
              /*child: ListTile(
                title: Text(
                  product_name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text("\Rs${product_price}",
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                    )),
              ),*/
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
      //),
    );
  }
}
