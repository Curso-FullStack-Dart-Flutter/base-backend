import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/produto.dart';
import '../../domain/ports/inputs/produto_service.dart';
import '../dtos/produto_dto.dart';

class ProdutoController extends Controller {
  final ProdutoService _produtoService;
  ProdutoController(this._produtoService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/produtos', (Request req) async {
      List<Produto> produtos = await _produtoService.getAllProdutos();

      List<Map> produtosMap =
          produtos.map((produto) => ProdutoDto.toMap(produto)).toList();

      return Response.ok(
        jsonEncode(produtosMap),
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
