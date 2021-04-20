import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';

  Future<List<DocumentSnapshot>> getFeaturedProducts() => _firestore.collection(collection).where('featured', isEqualTo: true).getDocuments().then((snap){
    return snap.documents;
  });

}