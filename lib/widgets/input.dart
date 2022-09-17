import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.title,
    this.password = false,
    this.contollerItem,
  });

  final String title;
  final bool? password;
  final TextEditingController? contollerItem;

  @override
  State<Input> createState() => _Input();
}

class _Input extends State<Input> {
  @override
  Widget build(BuildContext context) {
    var showPassword = widget.password != null && widget.password == true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            obscureText: showPassword,
            controller: widget.contollerItem,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.title,
            ),
          ),
        ),
      ),
    );
  }
}
