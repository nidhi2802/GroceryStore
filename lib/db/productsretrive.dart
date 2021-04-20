import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/models/product_model.dart';

class Product_Service{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "products";


  Future<List<Product_Model>> getProducts() async =>
      _firestore.collection(collection).where('feature', isEqualTo: true).get().then((QuerySnapshot querySnapshot) {
        List<Product_Model> products = [];
        querySnapshot.docs.map((snapshot) => products.add(Product_Model.fromSnapShot(snapshot)));
        return products;
      });
}