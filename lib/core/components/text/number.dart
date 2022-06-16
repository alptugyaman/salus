import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class HashtagNumber extends Text {
  final String text;

  const HashtagNumber({Key? key, required this.text})
      : super(
          text,
          key: key,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
        );
}
