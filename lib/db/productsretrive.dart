import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/models/product_model.dart';

class Product_Service{

  CollectionReference _collectionReference = FirebaseFirestore.instance.collection("products");
  Future<List<Product_Model>> getData() async{
    QuerySnapshot querySnapshot = await _collectionReference.get();
    List<Product_Model> products = [];
    querySnapshot.docs.forEach((element) => products.add(Product_Model.fromSnapShot(element)));
    return products;
  }
}
