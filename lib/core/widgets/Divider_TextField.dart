import 'package:flutter/material.dart';

class DividerTextField extends StatelessWidget {
  const DividerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: const Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'أدخل نصك هنا',
              border: OutlineInputBorder(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 12,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
