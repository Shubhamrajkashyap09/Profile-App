import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomOutlinedButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final String text;

  const CustomOutlinedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.alignment,
    this.height,
    this.width,
    this.margin,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget(),
          )
        : buildOutlinedButtonWidget();
  }

  Widget buildOutlinedButtonWidget() {
    return Container(
      height: this.height ?? 40,
      width: this.width ?? double.maxFinite,
      margin: margin,
      decoration: decoration,
      child: OutlinedButton(
        style: buttonStyle,
        onPressed: isDisabled ?? false ? null : onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            Text(
              text,
              style: buttonTextStyle,
            ),
            rightIcon ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
