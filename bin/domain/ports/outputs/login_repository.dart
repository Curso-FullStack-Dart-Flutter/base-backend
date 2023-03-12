import '../../models/login.dart';

abstract class LoginRepository {
  Future<Login?> findByEmail(String email);
}
