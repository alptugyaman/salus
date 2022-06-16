import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class Online extends Container {
  final bool? status;
  Online({Key? key, this.status = false})
      : super(
          key: key,
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: status! ? AppColors.systemGreen50 : Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
        );
}
