import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  UserInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }
}
