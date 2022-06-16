import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class ChatDate extends Container {
  final String date;

  ChatDate({
    Key? key,
    required this.date,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral500,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        );
}
