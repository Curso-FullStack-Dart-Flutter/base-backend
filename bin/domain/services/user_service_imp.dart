import '../models/user.dart';
import '../ports/inputs/user_service.dart';
import '../ports/outputs/user_repository.dart';

class UserServiceImp implements UserService {
  final UserRepository _userRepository;
  UserServiceImp(this._userRepository);

  @override
  Future<List<User>> getAllUsers() {
    return _userRepository.getUsers();
  }

  @override
  Future<bool> saveUser(User user) {
    return _userRepository.saveUser(user);
  }
}
