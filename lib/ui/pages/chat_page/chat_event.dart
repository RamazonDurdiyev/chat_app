import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable{}

class PickImageEvent extends ChatEvent{
  @override
  List<Object?> get props => [];
}