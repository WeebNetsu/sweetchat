import 'package:flutter/material.dart';

class ChatPreview extends StatelessWidget {
  const ChatPreview({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.profilePicture,
    required this.newMessageCount,
  }) : super(key: key);
  final String name, lastMessage, profilePicture;
  final int newMessageCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/chat"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  onPressed: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      profilePicture,
                      width: 55,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        lastMessage,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (newMessageCount > 0)
              Container(
                height: 18,
                constraints: const BoxConstraints(minWidth: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: ColoredBox(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        "$newMessageCount",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
