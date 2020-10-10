
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByField(String searchField) {
    return Firestore.instance
        .collection('products')
        .where('category', isEqualTo: searchField.substring(0, 1))
        .getDocuments();
  }
}