import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class Initial extends LoginState {
  @override
  List<Object?> get props => [];
}

class SignInState extends LoginState {
  final State state;

  SignInState({required this.state});
  @override
  List<Object?> get props => [];
}

class SignUpState extends LoginState {
  final State state;

  SignUpState({required this.state});
  @override
  List<Object?> get props => [];
}

enum State { initial, loading, loaded, error }
