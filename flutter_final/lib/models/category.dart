import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromMap(Map<String, dynamic> data, String documentId) {
    return Category(
      name: data['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
