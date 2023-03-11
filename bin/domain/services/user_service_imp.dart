import '../models/user.dart';
import '../ports/inputs/user_service.dart';
import '../ports/outputs/user_repository.dart';

class UserServiceImp implements UserService {
  final UserRepository _userRepository;
  UserServiceImp(this._userRepository);

  @override
  Future<List<User>> getAllUsers() async {
    return _userRepository.getUsers();
  }
}
