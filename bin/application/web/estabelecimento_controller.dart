import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/ports/inputs/estabelecimento_service.dart';
import '../dtos/estabelecimento_dto.dart';

class EstabelecimentoController extends Controller {
  final EstabelecimentoService _estabelecimentoService;
  EstabelecimentoController(this._estabelecimentoService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/estabelecimentos', (Request req) async {
      List<Estabelecimento> estabelecimentos =
          await _estabelecimentoService.getAllEstabelecimentos();

      List<Map> estabelecimentosMap =
          estabelecimentos.map((e) => EstabelecimentoDto.toMap(e)).toList();

      return Response.ok(
        jsonEncode(estabelecimentosMap),
        headers: {'content-type': 'application/json'},
      );
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
