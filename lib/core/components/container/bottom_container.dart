import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class BottomContainer extends Container {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  BottomContainer({
    Key? key,
    required this.child,
    this.color = AppColors.neutral200,
    this.padding,
  }) : super(key: key, color: color, padding: padding, child: child);
}
