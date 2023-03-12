import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/login.dart';
import '../../domain/ports/outputs/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final Database _database;
  final Mapper _mapper;
  LoginRepositoryImp(this._database, this._mapper);

  @override
  Future<Login?> findByEmail(String email) async {
    final String _sql = '''
      SELECT
          u.email,
          u.senha,
          p.nome as role,
          u.documento
      FROM tb_usuarios u
      INNER JOIN tb_usuario_permissao up on up.idUsuario = u.id
      INNER JOIN tb_permissoes p on p.id = up.idPermissao
      WHERE u.email = ? and u.status = 'A'
    ''';
    var queryResult = await _database.query(_sql, [email]);

    List<Login> list = queryResult
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Login>();
    return list.isNotEmpty ? list.first : null;
  }
}
