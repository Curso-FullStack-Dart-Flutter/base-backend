import '../../models/login.dart';

abstract class LoginService {
  Future<Login?> authenticate(String email, String pass);
}
