
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../repository/user_Repository.dart';

final UsersControllerProvider=Provider((ref) => usersController(addUserRepository: ref.watch(addUserRepositoryProvider)));

final streamDataProvider=StreamProvider((ref) => ref.watch(UsersControllerProvider).streamData());

class usersController{
  final AddUserRepository _addUserRepository;
  usersController({required AddUserRepository addUserRepository}):_addUserRepository=addUserRepository;

  Stream streamData(){
    return _addUserRepository.streamUserData();
  }
   deleteUsers(String id){
    _addUserRepository.deleteUser(id);
   }
}