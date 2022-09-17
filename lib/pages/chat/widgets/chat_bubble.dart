import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
    this.text, {
    Key? key,
    this.userMessage = false,
  }) : super(key: key);
  final String text;

  /// if the current user sent the message
  final bool userMessage;

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment:
          userMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: windowWidth * (80 / 100)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: ColoredBox(
                color: userMessage ? Colors.blueAccent : Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: Text(text),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
