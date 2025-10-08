import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  LoginViewModel();

  String _cpf = '';
  String _password = '';

  bool get isFormValid => validateCredentials();

  bool validateCredentials() =>
      validatePassword(_password) == null && validateCpf(_cpf) == null;

  void onCpfChanged(String value) {
    _cpf = value;
    validateCpf(value);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _password = value;
    validatePassword(value);
    notifyListeners();
  }

  String? validateCpf(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório.';
    }
    if (value.length != 11 || !RegExp(r'^\d{11}$').hasMatch(value)) {
      return 'CPF inválido. Deve conter 11 dígitos numéricos.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória.';
    }
    if (value.length < 6) {
      return 'Senha inválida. Deve conter pelo menos 6 caracteres.';
    }
    return null;
  }
}
