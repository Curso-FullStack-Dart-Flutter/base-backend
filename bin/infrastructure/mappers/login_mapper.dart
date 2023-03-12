import '../../core/database/mapper.dart';
import '../../domain/models/login.dart';

class LoginMapper implements Mapper<Login> {
  @override
  Login toDomain(Map map) => Login(
        map['email'],
        map['senha'],
        map['role'],
        map['documento'],
      );
}
