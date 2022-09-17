import 'package:flutter/material.dart';
import 'package:sweetchat/pages/chat/widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Mike Wowzowski',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7, 5, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ChatBubble("Hello Jack!"),
                            ChatBubble(
                              "Hello Mike, what brings you to me?",
                              userMessage: true,
                            ),
                            ChatBubble(
                              "I finally found a job! After years of searching! Who would've guessed!",
                            ),
                            ChatBubble(
                              "Lol, not me, you lazy slug",
                              userMessage: true,
                            ),
                            ChatBubble(
                              "On that note, could you maybe drive me to work for the next few weeks, "
                              "gas prices have been skyrocketing, I can't keep up anymore",
                            ),
                            ChatBubble(
                              "Sure bud",
                              userMessage: true,
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              left: 10,
              right: 10,
              top: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextField(
                        // controller: widget.contollerItem,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter message",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: ColoredBox(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
