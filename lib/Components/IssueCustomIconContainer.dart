import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IssueCustomIconContainer extends StatelessWidget {
  final String? iconPath;
  final String? name;
  final VoidCallback? onTap;
  final VoidCallback? onCrossPressed;
  final File? Image;
  // File? pic;
  // final ImagePicker picker;

  IssueCustomIconContainer({
    this.iconPath,
    this.name,
    this.onTap,
    this.onCrossPressed,
    this.Image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Pass the onTap callback to the GestureDetector
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Image != null)
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                      image: DecorationImage(
                        image: FileImage(Image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (Image != null)
                    Positioned(
                      top: 1,
                      right: 1,
                      child: GestureDetector(
                        onTap: onCrossPressed,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            if (iconPath != null)
              SvgPicture.asset(
                iconPath!,
                width: 22,
                height: 22,
              ),
            if (name != null) SizedBox(height: 6),
            if (name != null)
              Text(
                name!,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
