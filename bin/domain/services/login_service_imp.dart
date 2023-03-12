import 'dart:developer';

import 'package:password_dart/password_dart.dart';

import '../models/login.dart';
import '../ports/inputs/login_service.dart';
import '../ports/outputs/login_repository.dart';

class LoginServiceImp implements LoginService {
  final LoginRepository _loginRepository;
  LoginServiceImp(this._loginRepository);

  @override
  Future<Login?> authenticate(String email, String pass) async {
    try {
      var login = await _loginRepository.findByEmail(email);
      if (login == null) return null;
      return Password.verify(pass, login.password) ? login : null;
    } catch (e) {
      log('[ERROR] -> in Authenticate method by email $email');
    }
    return null;
  }
}
