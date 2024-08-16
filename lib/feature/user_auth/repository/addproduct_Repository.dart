
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/Provider/provider.dart';
import '../../../model/addproduct_model.dart';

final addproductRepostoryProvider = Provider(
        (ref) => addproductRepostory(firestore: ref.watch(firestoreprovider)));

class addproductRepostory {
  final FirebaseFirestore _firestore;

  addproductRepostory({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _Categories => _firestore.collection("Products");

  StremingCategories() {
    return _Categories.where("delete", isEqualTo: false).snapshots().map(
            (event) => event.docs.map((e) => AddProductModel.fromMap(e.data() as Map<String, dynamic>))
            .toList());
  }


  addItem(AddProductModel categry) {
    _Categories.add(categry.toMap())
        .then((value) => value.update(categry.copyWith(id: value.id).toMap()));
  }

  deleteProduct(AddProductModel details) {
    _Categories.doc(details.id).update({"delete": true});
  }
}