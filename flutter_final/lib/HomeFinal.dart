import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/category_provider.dart';

class HomeFinal extends ConsumerStatefulWidget {
  @override
  _HomeFinalState createState() => _HomeFinalState();
}

class _HomeFinalState extends ConsumerState<HomeFinal> {
  final user = FirebaseAuth.instance.currentUser!;
  String selectedCategory = 'All'; 

  @override
  Widget build(BuildContext context) {
    final ProductState = ref.watch(categoryNotifierProvider);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(),
      body: ProductState.when(
        data: (ProductsList) {
          if (ProductsList.isEmpty) {
            return Center(child: Text('No Products available'));
          }

          final filteredProducts = selectedCategory == 'All'
              ? ProductsList
              : ProductsList.where((product) => product.category == selectedCategory).toList();

          return Column(
            children: [
              Container(
                color: Color(0xFFF5F5F5),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'hi',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _CategoryOnTap('A'),
                        _CategoryOnTap('B'),
                        _CategoryOnTap('C'),
                        _CategoryOnTap('D'),
                        _CategoryOnTap('E'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ListTile(
                      
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        product.picture.toString()),
                                    radius: 18,
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Text(product.name),
                                      SizedBox(height: 5,),
                                      Text(product.description),
                                      SizedBox(height: 5,),
                                      Text(product.price),
                                    ],
                                  )
                                ]
                               ),
                               Row(
                                children: [
                                  Text('Id order'),
                                  SizedBox(width: 100),
                                  Text(product.idOrder)
                                ],
                               ),
                               SizedBox(height: 10),
                               Row(
                                children: [
                                  Text('Total Item'),
                                  SizedBox(width: 100),
                                  Text(product.totalItem)
                                ],
                               ),
                               Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius:0.5,
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.chat_bubble),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'View Reviews'
                                      )
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    color: Colors.orange,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Buy Again',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ),
                                  ),
                                ],
                               ),
                            ]
                          ),
                      ),
                    
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _CategoryOnTap(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
