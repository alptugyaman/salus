import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class TimeList extends Text {
  final String time;

  const TimeList({Key? key, required this.time})
      : super(
          time,
          key: key,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.neutral500,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        );
}
