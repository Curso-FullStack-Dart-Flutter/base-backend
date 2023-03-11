import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'package:commons_core/commons_core.dart';

import 'application/dtos/user_dto.dart';
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
  final Mapper _userMapper = UserMapper();
  final Database _database = DatabaseMySqlAdpter();
  final UserRepository _userRepository =
      UserRepositoryImp(_database, _userMapper);
  final UserService _userService = UserServiceImp(_userRepository);
  final UserController _userController = UserController(_userService);

  _userService
      .saveUser(UserDto(
        'Teste Final',
        'SobreNome',
        DateTime.utc(1944, 6, 6),
        'A',
        'documento123',
        'falhaminha@cicrano.com',
        'cidade',
        'password123',
        'token45435',
      ))
      .then((value) => print(value));

  var cascadeHandler = Cascade().add(_userController.getHandler()).handler;
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  shelf_io.serve(
    handler,
    await CustomEnv.get<String>(key: 'server_ip'),
    await CustomEnv.get<int>(key: 'server_port'),
  );
}
