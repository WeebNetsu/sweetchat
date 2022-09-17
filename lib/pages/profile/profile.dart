import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(windowWidth),
              child: Image.asset(
                "assets/images/profile4.jpg",
                width: windowWidth / 2.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "@LillyPilly",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(" - "),
                Text(
                  "Live for yourself, and only yourself",
                ),
                SizedBox(width: 20),
                Icon(Icons.edit, size: 18),
              ],
            ),
          ),
          const Text(
            "+27 67 687 7632",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
