import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final/models/Products.dart';
import '../models/Products.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Products>> getCategory() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Products').get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print(data);
        return Products.fromMap(data, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }

  // getCategory() {}

  // Future<void> addTrans(Trans trans) async {
  //   try {
  //     await _firestore.collection('transactions').add(trans.toMap());
  //   } catch (e) {
  //     throw Exception('Failed to add transaction: $e');
  //   }
  // }

  // Future<void> updateTrans(Trans trans) async {
  //   try {
  //     await _firestore.collection('transactions').doc(trans.documentId).update(trans.toMap());
  //   } catch (e) {
  //     throw Exception('Failed to update transaction: $e');
  //   }
  // }

  //  Future<void> deleteTrans(String documentId) async {
  //   try {
  //     await _firestore.collection('transactions').doc(documentId).delete();
  //   } catch (e) {
  //     throw Exception('Failed to delete transaction: $e');
  //   }
  // }

  
}
