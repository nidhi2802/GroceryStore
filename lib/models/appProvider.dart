import 'package:flutter/material.dart';
import 'package:grocery_store/db/productsretrive.dart';
import 'package:grocery_store/models/product_model.dart';

class AppProvider with ChangeNotifier{
    List<Product_Model> _featureProducts = [];
    Product_Service _productService = Product_Service();

    AppProvider(){
        _getFeaturedProducts();
    }
    //getter
List<Product_Model> get featureProducts => _featureProducts;

//methods
void _getFeaturedProducts() async{
    _featureProducts = await _productService.getProducts();
    notifyListeners();
}

}