import '../../models/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  bool saveUser(User user);
  User getUserById(int id);
  User getUserByEmail(String email);
}
