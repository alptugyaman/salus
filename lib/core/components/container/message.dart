import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salus/core/theme/color_theme.dart';

class Message extends Align {
  final String text;
  final bool sender;
  Message({
    Key? key,
    required this.text,
    required this.sender,
  }) : super(
          key: key,
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: .66.sw),
            child: MessageDecoration(
              text: text,
              sender: sender,
            ),
          ),
        );
}

class MessageDecoration extends DecoratedBox {
  final String text;
  final bool sender;
  MessageDecoration({
    Key? key,
    required this.text,
    required this.sender,
  }) : super(
          key: key,
          decoration: BoxDecoration(
            color: sender ? AppColors.primary50 : AppColors.systemGreen100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: sender ? AppColors.neutral900 : AppColors.systemGreen700,
              ),
            ),
          ),
        );
}
