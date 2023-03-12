import '../../domain/models/estabelecimento.dart';

class EstabelecimentoDto extends Estabelecimento {
  EstabelecimentoDto(
    super.nome,
    super.cnpj,
    super.telefone,
    super.descricao,
    super.imagemUrl,
    super.latitude,
    super.longitude,
    super.endereco,
    super.enderecoNumero,
    super.complemento,
    super.status,
    super.proprietario,
  );

  static Map toMap(Estabelecimento estabelecimento) => {
        'nomeEstabelecimento': estabelecimento.nome,
        'cnpj': estabelecimento.cnpj,
        'telefone': estabelecimento.telefone,
        'descricao': estabelecimento.descricao,
        'imagemUrl': estabelecimento.imagemUrl,
        'latitude': estabelecimento.latitude,
        'longitude': estabelecimento.longitude,
        'endereco': estabelecimento.endereco,
        'enderecoNumero': estabelecimento.enderecoNumero,
        'complemento': estabelecimento.complemento,
        'status': estabelecimento.status,
        'proprietario': {
          'nome': estabelecimento.proprietario.nome,
          'sobrenome': estabelecimento.proprietario.sobrenome,
          'dataNasc':
              estabelecimento.proprietario.dtNascimento.toIso8601String(),
          'documento': estabelecimento.proprietario.documento,
          'email': estabelecimento.proprietario.email,
          'cidade': estabelecimento.proprietario.cidade,
          'status': estabelecimento.proprietario.status
        }
      };
}
