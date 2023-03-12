import '../../domain/models/produto.dart';

class ProdutoDto extends Produto {
  ProdutoDto(
    super.nome,
    super.descrico,
    super.valor,
    super.status,
    super.estabelecimento,
    super.categoria,
  );

  static Map toMap(Produto produto) => {
        'nome': produto.nome,
        'descricao': produto.descrico,
        'valor': produto.valor,
        'produtoStatus': produto.status,
        'estabelecimento': {
          'nome': produto.estabelecimento.nome,
          'cnpj': produto.estabelecimento.cnpj,
          'telefone': produto.estabelecimento.telefone,
          'descricao': produto.estabelecimento.descricao,
          'imagemUrl': produto.estabelecimento.imagemUrl,
          'latitude': produto.estabelecimento.latitude,
          'longitude': produto.estabelecimento.longitude,
          'endereco': produto.estabelecimento.endereco,
          'enderecoNumero': produto.estabelecimento.enderecoNumero,
          'enderecoOpcional': produto.estabelecimento.complemento,
          'status': produto.estabelecimento.status,
          'proprietario': {
            'nome': produto.estabelecimento.proprietario.nome,
            'sobrenome': produto.estabelecimento.proprietario.sobrenome,
            'dtNasc': produto.estabelecimento.proprietario.dtNascimento
                .toIso8601String(),
            'status': produto.estabelecimento.proprietario.status,
            'documento': produto.estabelecimento.proprietario.documento,
            'email': produto.estabelecimento.proprietario.email,
            'cidade': produto.estabelecimento.proprietario.cidade,
          },
        },
        'categoria': {
          'nome': produto.categoria.nome,
          'descricao': produto.categoria.descricao,
        },
      };
}
