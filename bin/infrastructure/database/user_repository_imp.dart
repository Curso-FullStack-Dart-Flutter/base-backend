import '../../application/dtos/user_dto.dart';
import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';
import '../../domain/ports/outputs/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final Mapper _mapper;
  final Database _database;
  UserRepositoryImp(this._database, this._mapper);

  @override
  User getUserByEmail(String email) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  User getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final String _sql = '''
            SELECT 
              id,
                nome,
                sobrenome,
                dataNasc,
                documento,
                email,
                cidade,
                status
            FROM tb_usuarios;
    ''';
    var result = await _database.query(_sql);
    List<User> users =
        result.map((row) => _mapper.toDomain(row.fields)).toList().cast<User>();
    return users;
  }

  @override
  Future<bool> saveUser(User user) async {
    user as UserDto;
    final String _sql = '''
      INSERT INTO tb_usuarios 
        (nome, sobrenome, dataNasc, documento, email, senha, deviceToken, cidade, status)
      VALUES 
        (?, ?, ?, ?, ?, ?, ?, ?, ?);
    ''';
    var result = await _database.query(_sql, [
      user.nome,
      user.sobrenome,
      user.dtNascimento.toUtc(),
      user.documento,
      user.email,
      user.password,
      user.deviceToken,
      user.cidade,
      user.status,
    ]);

    return result.affectedRows > 0;
  }
}
