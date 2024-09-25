import 'package:flutter/material.dart';

class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
          ),
          // style: CustomTextStyles.labelLargeGray500.copyWith(
          //   color: appTheme.gray500,
          // ),
        ),
      ),
    );
  }
}
