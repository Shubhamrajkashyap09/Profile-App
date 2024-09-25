import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;
  final String label;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final Color backgroundColor;
  final double cornerRadius;
  final Color iconColor;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.icon,
    required this.label,
    this.textStyle,
    this.width = 120.0,
    this.height = 40.0,
    this.backgroundColor = Colors.blue,
    this.cornerRadius = 8.0,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              IconTheme(
                data: IconThemeData(color: iconColor),
                child: icon!,
              ),
            SizedBox(
                width: icon != null
                    ? 8.0
                    : 0), // Adjust spacing based on icon presence
            Text(
              label,
              style: textStyle ?? const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
