import 'package:aichatbot/features/chat/logic/chat_bloc.dart';
import 'package:aichatbot/features/chat/logic/chat_event.dart';
import 'package:aichatbot/features/chat/ui/widgets/chat_bloc_listener.dart';
import 'package:aichatbot/features/chat/ui/widgets/chat_input_field.dart';
import 'package:aichatbot/features/chat/ui/widgets/message.dart';
import 'package:aichatbot/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  late String userId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      userId = authProvider.currentUser?.uid ?? 'anonymous';
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text: text, isUser: true));
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final currentUserId = authProvider.currentUser?.uid ?? 'anonymous';

    context.read<ChatBloc>().add(
      SendMessage(userId: currentUserId, message: text),
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            ChatMessagesView(messages: _messages),
            ChatInputField(
              textController: _controller,
              onSubmitted: _sendMessage,
              onSendPressed: () => _sendMessage(_controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
