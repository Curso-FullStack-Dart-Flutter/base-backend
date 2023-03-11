import '../../domain/models/user.dart';

class UserDto extends User {
  final int id;
  final String password;
  final String deviceToken;

  UserDto(
    super.nome,
    super.sobrenome,
    super.dtNascimento,
    super.status,
    super.documento,
    super.email,
    super.cidade,
    this.password,
    this.deviceToken, [
    this.id = 0,
  ]);

  //TODO: Refatorar aqui
  static Map toMap(User user) => {
        'nome': user.nome,
        'sobrenome': user.sobrenome,
        'nomeCompleto': user.nome + " " + user.sobrenome,
        'dtNascimento': user.dtNascimento.toIso8601String()
      };

  static UserDto fromRequest(Map map) => UserDto(
        map['nome'],
        map['sobrenome'],
        DateTime.parse(map['dtNascimento']),
        map['status'],
        map['documento'],
        map['email'],
        map['cidade'],
        map['password'],
        map['deviceToken'],
      );
}
