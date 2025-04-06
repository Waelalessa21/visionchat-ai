import 'package:aichatbot/features/chat/data/chat_repositoy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;

  ChatBloc(this.repository) : super(ChatInitial()) {
    on<SendMessage>((event, emit) async {
      emit(ChatLoading());
      try {
        final res = await repository.fetchResponse(event.userId, event.message);
        emit(ChatLoaded(res));
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });

    on<ResetChat>((event, emit) async {
      emit(ChatResetting());
      try {
        await repository.resetChat(event.userId);
        emit(ChatResetSuccess());
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });
  }
}
