import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatResetting extends ChatState {}

class ChatResetSuccess extends ChatState {}

class ChatLoaded extends ChatState {
  final String response;

  const ChatLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class ChatError extends ChatState {
  final String error;

  const ChatError(this.error);

  @override
  List<Object> get props => [error];
}
