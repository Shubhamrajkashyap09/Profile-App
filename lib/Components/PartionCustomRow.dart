import 'package:flutter/material.dart';

class PartionCustomRow extends StatelessWidget {
  final String inputText;

  PartionCustomRow(this.inputText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Row(
        children: [
          Text(
            inputText,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7E8C),
            ),
          ),
          // Add more widgets as needed
        ],
      ),
    );
  }
}
