import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/product_details.dart';
import 'package:grocery_store/constants.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Apples",
      "picture": "assets/products/apples.jpg",
      "price": "90",
      "unit": "1 kg",
    },
    {
      "name": "Coriander",
      "picture": "assets/products/coriander.jpg",
      "price": "50",
      "unit": "500 gm",
    },
    {
      "name": "Lays Wafers",
      "picture": "assets/products/wafers.jpg",
      "price": "35",
      "unit": "1",
    },
    {
      "name": "Amul Butter",
      "picture": "assets/products/butter.jpg",
      "price": "90",
      "unit": "500 gm",
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
        return Single_prod(
          product_name: products_list[index]['name'],
          product_picture: products_list[index]['picture'],
          product_price: products_list[index]['price'],
          product_unit: products_list[index]['unit'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;
  final product_unit;

  Single_prod(
      {
      this.product_name,
      this.product_picture,
      this.product_price,
      this.product_unit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
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
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    '\Rs$product_price',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    product_unit,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
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
