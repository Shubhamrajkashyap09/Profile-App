import 'package:flutter/material.dart';

class PartionCustomRow2 extends StatelessWidget {
  final String inputText;
  final TextStyle? textStyle;
  final String? inputText2;
  final TextStyle? textStyle2;

  PartionCustomRow2({
    Key? key,
    required this.inputText,
    this.textStyle,
    this.inputText2,
    this.textStyle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Row(
        children: [
          Row(children: [
            Text(
              inputText,
              style: textStyle ??
                  TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              inputText2!,
              style: textStyle2 ??
                  TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ])
          // Add more widgets as needed
        ],
      ),
    );
  }
}
