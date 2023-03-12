import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/security/security_service.dart';
import '../../core/web/controller.dart';
import '../../domain/ports/inputs/login_service.dart';
import '../dtos/login_dto.dart';

class LoginController extends Controller {
  final LoginService _loginService;
  final SecurityService _securityService;
  LoginController(this._loginService, this._securityService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.post('/login', (Request req) async {
      var body = await req.readAsString();
      var loginDto = LoginDto.fromRequest(jsonDecode(body));

      var login =
          await _loginService.authenticate(loginDto.email, loginDto.password);
      if (login != null) {
        var jwt = await _securityService.generateJWT(
          login.document,
          login.permission,
        );
        return Response.ok(jsonEncode({'token': jwt}));
      } else {
        return Response(401);
      }
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
