import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';

class UserMapper implements Mapper<User> {
  @override
  User toDomain(Map map) => User(
        id: map['id'],
        nome: map['nome'],
        sobrenome: map['sobrenome'],
        dtNascimento: map['dataNasc'],
        status: map['status'],
        documento: map['documento'],
        email: map['email'],
        cidade: map['cidade'],
      );
}
