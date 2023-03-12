import '../../domain/models/venda.dart';
import 'produto_dto.dart';

class VendaDto extends Venda {
  VendaDto(super.status, super.dtVenda, super.usuario, super.produto);

  static Map toMap(Venda venda) {
    return {
      'vendaStatus': venda.status,
      'vendaData': venda.dtVenda.toIso8601String(),
      'produto': ProdutoDto.toMap(venda.produto),
      'comprador': {
        'nome': venda.usuario.nome,
        'sobrenome': venda.usuario.sobrenome,
        'dtNasc': venda.usuario.dtNascimento.toIso8601String(),
        'status': venda.usuario.status,
        'documento': venda.usuario.documento,
        'email': venda.usuario.email,
        'cidade': venda.usuario.cidade,
      }
    };
  }
}
