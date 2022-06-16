import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class TimeSolo extends Container {
  final String time;
  final bool sender;
  TimeSolo({
    Key? key,
    required this.time,
    required this.sender,
  }) : super(
          key: key,
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(
            right: sender ? 8 : 0,
            left: sender ? 0 : 8,
            bottom: 8,
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral500,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        );
}
