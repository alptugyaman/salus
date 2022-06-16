import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class MessageChip extends Container {
  final int count;

  MessageChip({Key? key, required this.count})
      : super(
          key: key,
          width: 24,
          height: 16,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.primary800,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
}
