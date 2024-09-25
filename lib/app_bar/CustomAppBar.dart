import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final VoidCallback? onLeadingTap;
  final IconData? icon1; // Callback for leading icon tap
  final VoidCallback? onIcon1Pressed;

  const CustomAppBar({
    Key? key,
    required this.leading,
    required this.title,
    this.onLeadingTap,
    this.icon1,
    this.onIcon1Pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      leading: GestureDetector(
        onTap: onLeadingTap, // Assign onTap callback to the leading icon
        child: leading,
      ),
      title: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Inter', // Set text color to black
          fontWeight: FontWeight.w400, // Optionally, set font weight
          fontSize: 18.0, // Optionally, set font size
        ),
        child: title,
      ),
      iconTheme:
          const IconThemeData(color: Colors.black), // Set icon color to black
      actions: [
        IconButton(
          icon: Icon(icon1), // Replace 'Icons.settings' with your desired icon
          onPressed: () {
            if (onIcon1Pressed != null) {
              onIcon1Pressed!();
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
