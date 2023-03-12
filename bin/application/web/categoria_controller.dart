import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/categoria.dart';
import '../../domain/ports/inputs/categoria_service.dart';
import '../dtos/categoria_dto.dart';

class CategoriaController extends Controller {
  final CategoriaService _categoriaService;
  CategoriaController(this._categoriaService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/categorias', (Request req) async {
      List<Categoria> categorias = await _categoriaService.getAllCategorias();

      List<Map> categoriasMap =
          categorias.map((categoria) => CategoriaDto.toMap(categoria)).toList();

      return Response.ok(
        jsonEncode(categoriasMap),
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
