class User {
  final String nome;
  final String sobrenome;
  final DateTime dtNascimento;
  final String status;
  final String documento;
  final String email;
  final String cidade;
  User(
    this.nome,
    this.sobrenome,
    this.dtNascimento,
    this.status,
    this.documento,
    this.email,
    this.cidade,
  );

  @override
  String toString() {
    return 'User(nome: $nome, sobrenome: $sobrenome, dtNascimento: $dtNascimento, status: $status, documento: $documento, email: $email, cidade: $cidade)';
  }
}
