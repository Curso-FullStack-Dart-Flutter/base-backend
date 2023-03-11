import '../../models/user.dart';

abstract class UserService {
  Future<List<User>> getAllUsers();

  Future<bool> saveUser(User user);
}
