import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/venda.dart';
import '../../domain/ports/inputs/vendas_service.dart';
import '../dtos/venda_dto.dart';

class VendaController extends Controller {
  final VendaService _vendaService;
  VendaController(this._vendaService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/vendas', (Request req) async {
      List<Venda> vendas = await _vendaService.getAllVendas();

      List<Map> vendasMap = vendas.map((v) => VendaDto.toMap(v)).toList();

      return Response.ok(
        jsonEncode(vendasMap),
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
