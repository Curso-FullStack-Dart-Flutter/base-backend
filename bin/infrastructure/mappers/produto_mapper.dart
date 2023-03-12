import '../../core/database/mapper.dart';
import '../../domain/models/categoria.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/models/produto.dart';
import '../../domain/models/user.dart';

class ProdutoMapper implements Mapper<Produto> {
  @override
  Produto toDomain(Map map) => Produto(
        map['produtoNome'],
        map['produtoDescricao'],
        map['produtoValor'],
        map['produtoStatus'],
        Estabelecimento(
          map['estabelecimentoNome'],
          map['estabelecimentoCnpj'],
          map['estabelecimentoTelefone'],
          map['estabelecimentoDescricao'],
          map['estabelecimentoImg'],
          map['estabelecimentoLatitude'],
          map['estabelecimentoLongitude'],
          map['estabeleciementoEndereco'],
          map['estabelecimentoNumero'],
          map['estabelecimentoEnderecoOpcional'],
          map['estabelecimentoStatus'],
          User(
            map['usuarioNome'],
            map['usuarioSobrenome'],
            map['usuarioDtNasc'],
            map['usuarioStatus'],
            map['usuarioDocumento'],
            map['usuarioEmail'],
            map['usuarioCidade'],
          ),
        ),
        Categoria(
          map['categoriaNome'],
          map['categoriaDescricao'],
        ),
      );
}
