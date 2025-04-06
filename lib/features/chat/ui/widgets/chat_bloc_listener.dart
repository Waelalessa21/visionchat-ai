import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/chat_bloc.dart';
import '../../logic/chat_state.dart';
import 'empty_chat.dart';
import 'message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatMessagesView extends StatefulWidget {
  final List<Message> messages;

  const ChatMessagesView({super.key, required this.messages});

  @override
  State<ChatMessagesView> createState() => _ChatMessagesViewState();
}

class _ChatMessagesViewState extends State<ChatMessagesView> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      setState(() {
        _showScrollToBottom =
            maxScroll > 400 && (maxScroll - currentScroll) > 200;
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Widget _buildLoadingBubble(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isRTL = l10n.localeName == 'ar';

    return Align(
      alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.7),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPulsatingDot(colorScheme.primary.withOpacity(0.6)),
            const SizedBox(width: 4),
            _buildPulsatingDot(
              colorScheme.primary.withOpacity(0.8),
              delay: 200,
            ),
            const SizedBox(width: 4),
            _buildPulsatingDot(colorScheme.primary, delay: 400),
          ],
        ),
      ),
    );
  }

  Widget _buildPulsatingDot(Color color, {int delay = 0}) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.5, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      builder: (context, double value, child) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color.withOpacity(value),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatLoading) {
          setState(() {
            widget.messages.removeWhere((msg) => msg.text == '...');
            widget.messages.add(const Message(text: '...', isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        } else if (state is ChatLoaded) {
          setState(() {
            widget.messages.removeWhere((msg) => msg.text == '...');
            widget.messages.add(Message(text: state.response, isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        } else if (state is ChatError) {
          setState(() {
            widget.messages.removeWhere((msg) => msg.text == '...');
            widget.messages.add(Message(text: state.error, isUser: false));
          });
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        }
      },
      child: Expanded(
        child: Stack(
          children: [
            widget.messages.isEmpty
                ? const Opacity(opacity: 0.8, child: EmptyChat())
                : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 20, top: 12),
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.messages.length,
                  itemBuilder: (context, index) {
                    final message = widget.messages[index];

                    if (message.text == '...' && !message.isUser) {
                      return _buildLoadingBubble(context);
                    }

                    return message;
                  },
                ),

            if (_showScrollToBottom)
              Positioned(
                right: 16,
                bottom: 16,
                child: FloatingActionButton.small(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  elevation: 2,
                  onPressed: _scrollToBottom,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
