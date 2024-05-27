import 'package:cloud_firestore/cloud_firestore.dart';

class Trans {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String documentId;

  Trans({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.documentId,
  });

  factory Trans.fromMap(Map<String, dynamic> data, String documentId) {
    return Trans(
      id: data['id'] ?? '',
      category: data['category'] ?? '',
      amount: (data['amount'] as num).toDouble(),
      date: (data['date'] as Timestamp).toDate(),
      documentId: documentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
      'date': date,
    };
  }
}
