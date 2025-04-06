import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/chat_bloc.dart';
import '../../logic/chat_state.dart';
import 'empty_chat.dart';
import 'message.dart';

class ChatMessagesView extends StatefulWidget {
  final List<Message> messages;

  const ChatMessagesView({super.key, required this.messages});

  @override
  State<ChatMessagesView> createState() => _ChatMessagesViewState();
}

class _ChatMessagesViewState extends State<ChatMessagesView> {
  // Scroll controller to handle automatic scrolling
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll to bottom when new messages arrive
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatLoading) {
          setState(() {
            widget.messages.add(const Message(text: '...', isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        } else if (state is ChatLoaded) {
          setState(() {
            if (widget.messages.isNotEmpty &&
                widget.messages.last.text == '...') {
              widget.messages.removeLast();
            }
            widget.messages.add(Message(text: state.response, isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        } else if (state is ChatError) {
          setState(() {
            if (widget.messages.isNotEmpty &&
                widget.messages.last.text == '...') {
              widget.messages.removeLast();
            }
            widget.messages.add(Message(text: state.error, isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        }
      },
      child: Expanded(
        child:
            widget.messages.isEmpty
                ? const Opacity(opacity: 0.6, child: EmptyChat())
                : ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.messages.length,
                  itemBuilder: (context, index) => widget.messages[index],
                ),
      ),
    );
  }
}
