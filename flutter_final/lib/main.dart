import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Login.dart';
import 'firebase_options.dart';
import 'SignUp.dart';
import 'Q2.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Check if Firebase apps are already initialized
//   if (Firebase.apps.isEmpty) {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
  
//   runApp(const MyApp());
// }

// void main() async {
//   runApp(const MyApp());
// }

// Future<void> initializeFirebase() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(
    const ProviderScope(
      child: 
      MyApp(),
    ),
  );
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:  SignUp(),
    );
  }
}



/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model for Product
class Product {
  final String name;
  final String category;
  final String image;
  final double price;
  final String orderId;
  final String status;

  Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.orderId,
    required this.status,
  });
}

// Provider for managing products and categories
class CategoryProvider with ChangeNotifier {
  String _selectedCategory = 'A';

  List<Product> _products = [
    Product(name: 'XT-04 OG', category: 'A', image: 'path/to/image', price: 2509000, orderId: 'BGS08975201', status: 'Finished'),
    Product(name: 'ODYSSEY ELMT', category: 'B', image: 'path/to/image', price: 2599000, orderId: 'BGS08988673', status: 'Finished'),
    Product(name: 'SPEEDCROSS 3', category: 'C', image: 'path/to/image', price: 2700000, orderId: 'BGS08999999', status: 'Finished'),
  ];

  String get selectedCategory => _selectedCategory;

  List<Product> get products =>
      _products.where((product) => product.category == _selectedCategory).toList();

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<String> categories = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    provider.selectCategory(categories[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: provider.selectedCategory == categories[index]
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.name),
                  subtitle: Text('Rp ${product.price.toString()}'),
                  trailing: Text(product.status),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



*/ 

/*

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
      price: (data['proce']),
      documentId: documentId,
    );
  }}


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
        return Products.fromMap(data, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }





  import 'package:flutter_final/models/Products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/Products.dart';
import '../repo/category_repo.dart'; // Update this import

part 'category_provider.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(); // Update the function name
}

@riverpod
class TransNotifier extends _$TransNotifier {
  late final CategoryRepository repository; // Update the variable name

  @override
  AsyncValue<List<Products>> build() {
    repository = ref.watch(categoryRepositoryProvider); // Update the provider name
    _loadCategory();
    return const AsyncValue.loading();
  }

  Future<void> _loadCategory() async {
    try {
      final Products = await repository.getCategory();
      state = AsyncValue.data(Products);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

}





 */