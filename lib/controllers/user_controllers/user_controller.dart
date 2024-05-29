import 'package:may29/models/user_models/user_model.dart';
import 'package:may29/services/user_services/user_service.dart';

class UserController {
  final usersHttpServiced = UserHttpService();

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = await usersHttpServiced.fetchCategories();
    return users;
  }
}