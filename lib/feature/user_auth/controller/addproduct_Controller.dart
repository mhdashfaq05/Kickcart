import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../model/addproduct_model.dart';
import '../repository/addproduct_Repository.dart';

final CategoriesControllerProvider = Provider((ref) => CategoriesController(
    categoriesRepostory: ref.watch(addproductRepostoryProvider)));

final StreamDataProvider = StreamProvider(
        (ref) => ref.watch(CategoriesControllerProvider).stremData());

class CategoriesController {
  final addproductRepostory _categoriesRepostory;
  CategoriesController({required addproductRepostory categoriesRepostory})
      : _categoriesRepostory = categoriesRepostory;

  Stream stremData() {
    return _categoriesRepostory.StremingCategories();
  }

  addItem(AddProductModel categry){
    _categoriesRepostory.addItem(categry);
  }

  deleteProduct(AddProductModel detail){
    _categoriesRepostory.deleteProduct(detail);

  }


}