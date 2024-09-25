import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.maxLines,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFECF6FF),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0xFFF8F8F8)),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none)),
        textInputAction: textInputAction,
        maxLines: maxLines,
      ),
    );
  }
}
