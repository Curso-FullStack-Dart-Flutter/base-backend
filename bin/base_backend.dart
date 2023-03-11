import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:mysql1/mysql1.dart';

import 'package:commons_core/commons_core.dart';

import 'application/web/UserController.dart';
import 'core/database/database.dart';
import 'core/database/database_mysql_adpter.dart';
import 'core/database/mapper.dart';
import 'domain/ports/inputs/user_service.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'infrastructure/mappers/user_mapper.dart';

void main(List<String> arguments) async {
  // await DatabaseMySqlAdpter()
  //     .query("insert into tb_permissoes(nome, status) values ('ADMIN', 'A')");
  // print(await DatabaseMySqlAdpter().query('select * from tb_permissoes'));

  // await serve(
  //   (Request req) => Response(200,
  //       body: 'Olá Mundo', headers: {'content-type': 'application/json'}),
  //   'localhost',
  //   8080,
  // );

  final Mapper _userMapper = UserMapper();
  final Database _database = DatabaseMySqlAdpter();
  final UserRepository _userRepository =
      UserRepositoryImp(_database, _userMapper);
  final UserService _userService = UserServiceImp(_userRepository);
  final UserController _userController = UserController(_userService);

  _userController.getUsers();
}
