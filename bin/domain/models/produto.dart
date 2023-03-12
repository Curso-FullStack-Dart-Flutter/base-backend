import 'categoria.dart';
import 'estabelecimento.dart';

class Produto {
  final String nome;
  final String descrico;
  final double valor;
  final String status;
  final Estabelecimento estabelecimento;
  final Categoria categoria;
  final int? id;

  Produto(
    this.nome,
    this.descrico,
    this.valor,
    this.status,
    this.estabelecimento,
    this.categoria, [
    this.id,
  ]);
}
