import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/user.dart';
import '../../domain/ports/inputs/user_service.dart';
import '../dtos/user_dto.dart';

class UserController extends Controller {
  final UserService _userService;
  UserController(this._userService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/users', (Request req) async {
      List<User> users = await _userService.getAllUsers();
      List<Map> usersMap =
          users.map((User user) => UserDto.toMap(user)).toList();
      return Response.ok(
        jsonEncode(usersMap),
        headers: {'content-type': 'application/json'},
      );
    });

    router.post('/user', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      UserDto dto = UserDto.fromRequest(jsonDecode(body));
      var result = await _userService.saveUser(dto);
      return Response(result ? 201 : 500);
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
