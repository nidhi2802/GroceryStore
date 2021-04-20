import 'package:cloud_firestore/cloud_firestore.dart';

class Product_Model{

  static const BRAND = "brand";
  static const AVAILABLE = "available";
  static const CATEGORY = "category";
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const UNIT = "unit";
  static const FEATURED = "featured";

  //private variables
  String _brand;
  String _category;
  String _id;
  String _name;
  String _picture;
  String _quantity;
  double _price;
  int _unit;
  List _available;
  bool _featured;

  //getters
String get brand => _brand;
String get category => _category;
List get available => _available;
String get id => _id;
String get name => _name;
String get picture => _picture;
double get price => _price;
String get quantity => _quantity;
int get unit => _unit;
bool get featured => _featured;

Product_Model.fromSnapShot(DocumentSnapshot snapshot){
  Map data = snapshot.data();

  _brand = data[BRAND];
  _category = data[CATEGORY];
  _id = data[ID];
  _name = data[NAME];
  _picture = data[PICTURE];
  _price = data[PRICE];
  _available = data[AVAILABLE];
  _quantity = data[QUANTITY];
  _unit = data[UNIT];
  _featured = data[FEATURED];
}

}