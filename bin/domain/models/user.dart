class User {
  final int id;
  final String nome;
  final String sobrenome;
  final DateTime dtNascimento;
  final String status;
  final String documento;
  final String email;
  final String cidade;
  User({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.dtNascimento,
    required this.status,
    required this.documento,
    required this.email,
    required this.cidade,
  });

  @override
  String toString() {
    return 'User(id: $id, nome: $nome, sobrenome: $sobrenome, dtNascimento: $dtNascimento, status: $status, documento: $documento, email: $email, cidade: $cidade)';
  }
}
