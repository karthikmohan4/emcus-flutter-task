part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String? email;
  final String? password;
  final bool? rememberMe;
  LoginEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

class RegisterUserEvent extends AuthEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? confirmPassword;
  final String? companyName;
  final bool? isAgreedTerms;

  RegisterUserEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
    required this.companyName,
    required this.isAgreedTerms
  });
}

class LogoutEvent extends AuthEvent {}
