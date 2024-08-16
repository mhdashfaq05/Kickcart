

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/Provider/provider.dart';
import '../../../model/getUserModel.dart';

final addUserRepositoryProvider= Provider((ref) => AddUserRepository(firestore: ref.watch(firestoreprovider)),);

class AddUserRepository{
  final FirebaseFirestore _firestore ;
  AddUserRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _user => _firestore.collection("Users");
streamUserData(){
return _user.snapshots().map((event) => event.docs.map((e) => AddUserModel.fromJson(e.data() as Map<String,dynamic>)).toList());
}
deleteUser(String id){
  _user.doc(id).delete();

}
}
