import 'produto.dart';
import 'user.dart';

class Venda {
  final String status;
  final DateTime dtVenda;
  final User usuario;
  final Produto produto;

  Venda(this.status, this.dtVenda, this.usuario, this.produto);
}
