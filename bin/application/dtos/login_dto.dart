class LoginDto {
  final String email;
  final String password;
  LoginDto(this.email, this.password);

  static LoginDto fromRequest(Map map) =>
      LoginDto(map['email'], map['password']);
}
