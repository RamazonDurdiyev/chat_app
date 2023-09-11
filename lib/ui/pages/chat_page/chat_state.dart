import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {}

class Initial extends ChatState {
  @override
  List<Object?> get props => [];
}

class PickImageState extends ChatState {
  final State state;

  PickImageState({required this.state});
  @override
  List<Object?> get props => [state];
}

enum State { initial, loading, loaded, error }
