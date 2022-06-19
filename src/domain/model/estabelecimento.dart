class Estabelecimento {
  String nome;
  String cnpj;
  Estabelecimento({
    required this.nome,
    required this.cnpj,
  });

  @override
  String toString() => 'Estabelecimento(nome: $nome, cnpj: $cnpj)';
}
