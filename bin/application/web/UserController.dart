import '../../domain/ports/inputs/user_service.dart';

class UserController {
  final UserService _userService;

  UserController(this._userService);

  getUsers() {
    _userService.getAllUsers().then((value) => value.forEach(print));
  }
}
