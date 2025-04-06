import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class SendMessage extends ChatEvent {
  final String userId;
  final String message;

  const SendMessage({required this.userId, required this.message});

  @override
  List<Object> get props => [userId, message];
}

class ResetChat extends ChatEvent {
  final String userId;

  const ResetChat({required this.userId});

  @override
  List<Object> get props => [userId];
}
