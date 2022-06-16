import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class MessageShort extends Text {
  final bool? read;
  final String? text;
  MessageShort({
    Key? key,
    this.read,
    required this.text,
  }) : super(
          text ?? 'Herhangi bir mesaj bulunmuyor.',
          key: key,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: read ?? false ? AppColors.neutral500 : AppColors.neutral900,
            fontWeight: read ?? false ? FontWeight.w400 : FontWeight.w600,
            letterSpacing: 0.4,
          ),
        );
}
