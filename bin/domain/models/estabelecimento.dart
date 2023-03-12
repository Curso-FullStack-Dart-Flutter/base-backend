import 'user.dart';

class Estabelecimento {
  final String nome;
  final String cnpj;
  final String telefone;
  final String descricao;
  final String imagemUrl;
  final String latitude;
  final String longitude;
  final String endereco;
  final String enderecoNumero;
  final String? complemento;
  final String status;
  final User proprietario;

  Estabelecimento(
    this.nome,
    this.cnpj,
    this.telefone,
    this.descricao,
    this.imagemUrl,
    this.latitude,
    this.longitude,
    this.endereco,
    this.enderecoNumero,
    this.complemento,
    this.status,
    this.proprietario,
  );

  @override
  String toString() {
    return 'Estabelecimento(nome: $nome, cnpj: $cnpj, telefone: $telefone, descricao: $descricao, imagemUrl: $imagemUrl, latitude: $latitude, longitude: $longitude, endereco: $endereco, enderecoNumero: $enderecoNumero, complemento: $complemento, status: $status, proprietario: $proprietario)';
  }
}
