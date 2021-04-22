import 'package:flutter/material.dart';
import 'package:grocery_store/db/productsretrive.dart';
import 'package:grocery_store/models/product_model.dart';

class AppProvider with ChangeNotifier{

    Product_Service _productService = Product_Service();

    List<Product_Model> products = [];
    List<Product_Model> productSearched = [];


    AppProvider.initialize(){
        loadProducts();
    }

    loadProducts() async{
        products = await _productService.getData();
        notifyListeners();
    }

}