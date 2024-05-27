class Products {
  final String name;
  final String description;
  final String idOrder;
  final String category;
  final String price;
  final String documentId;
  final String picture;
  final String totalItem;

  Products({
    required this.name,
    required this.description,
    required this.idOrder,
    required this.category,
    required this.price,
    required this.documentId,
    required this.picture,
    required this.totalItem,
  });

  factory Products.fromMap(Map<String, dynamic> data, String documentId) {
    return Products(
      name: data['name'] ?? 'Unknown',  
      description: data['description'] ?? 'No description',  
      idOrder: data['idOrder']?.toString() ?? '', 
      category: data['category'] ?? 'Uncategorized', 
      price: data['price']?.toString() ?? '0',  
      picture: data['picture']?.toString() ?? '',  
      totalItem: data['totalItem']?.toString() ?? '0', 
      documentId: documentId,
    );
  }
}
