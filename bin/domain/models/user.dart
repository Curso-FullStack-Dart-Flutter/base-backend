// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class Permissao {
  final String nome;
  final String status;

  Permissao(this.nome, this.status);

  @override
  String toString() => 'Permissao(nome: $nome, status: $status)';
}

class UserPermission {
  final User user;
  final Permissao permissao;

  UserPermission(this.user, this.permissao);

  @override
  String toString() => 'UserPermission(user: $user, permissao: $permissao)';
}
