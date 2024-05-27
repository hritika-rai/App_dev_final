import 'package:flutter_final/models/Products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/Products.dart';
import '../repo/category_repo.dart'; 

part 'category_provider.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(); 
}

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  late final CategoryRepository repository; 

  @override
  AsyncValue<List<Products>> build() {
    repository = ref.watch(categoryRepositoryProvider); 
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
