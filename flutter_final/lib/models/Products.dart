import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  final String name;
  final String description;
  final String idOrder;
  final String category;
  final String price;
  final String documentId;

  Products({
    required this.name,
    required this.description,
    required this.idOrder,
    required this.category,
    required this.price,
    required this.documentId,
  });

  factory Products.fromMap(Map<String, dynamic> data, String documentId) {
    return Products(
      name: data['name'],
      description: data['description'],
      idOrder: data['idOrder'] ?? '',
      category: data['category'] ?? '',
      price: (data['price']),
      documentId: documentId,
    );
  }}