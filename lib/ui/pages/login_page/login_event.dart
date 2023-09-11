import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class SignInEvent extends LoginEvent{
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends LoginEvent{
  @override
  List<Object?> get props => [];
}