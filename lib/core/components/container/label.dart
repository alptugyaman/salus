import 'package:flutter/material.dart';

class Label extends Container {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  Label({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  }) : super(
          key: key,
          height: 24,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        );
}
