import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/models/product_model.dart';

class Product_Service{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "products";


  /*Future<List<Product_Model>> getProducts() async =>
      _firestore.collection(collection).get().then((QuerySnapshot querySnapshot) {
        List<Product_Model> products = [];
        querySnapshot.docs.forEach((value) => {
        products.add(Product_Model.fromSnapShot(value))
        });
        //for (DocumentSnapshot product in result.docs) {
          //products.add(Product_Model.fromSnapShot(product));
        //}
        return products;
      });*/

/*  Future<List<Product_Model>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<Product_Model> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product_Model.fromSnapShot(product));
        }
        return products;
      });*/

//var firestore = FirebaseFirestore.instance.collection("products").snapshots();
  Future<List<Product_Model>> getProducts() async =>
      _firestore.collection(collection).where('feature', isEqualTo: true).get().then((QuerySnapshot querySnapshot) {
        List<Product_Model> products = [];
        querySnapshot.docs.map((DocumentSnapshot documentSnapshot) => products.add(Product_Model.fromSnapShot(documentSnapshot)));
        return products;
      });


}
