import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String? gender;
  final bool acceptTerms;

  AuthSignUpRequested({
    required this.email,
    required this.password,
    required this.fullName,
    this.gender,
    required this.acceptTerms,
  });

  @override
  List<Object?> get props => [email, password, fullName, gender, acceptTerms];
}

class AuthLogoutRequested extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthForgotPasswordRequested extends AuthEvent {
  final String email;

  AuthForgotPasswordRequested({required this.email});

  @override
  List<Object?> get props => [email];
}
