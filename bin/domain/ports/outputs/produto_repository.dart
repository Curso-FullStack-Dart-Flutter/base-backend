import '../../models/categoria.dart';
import '../../models/produto.dart';

abstract class ProdutoRepository {
  Future<List<Produto>> getProdutos();
}
