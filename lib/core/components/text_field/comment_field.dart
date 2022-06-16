import 'package:flutter/material.dart';
import 'package:salus/config/global.dart';
import 'package:salus/core/theme/color_theme.dart';

class CommentField extends TextFormField {
  final TextEditingController controller;
  final Function()? onRightPressed;
  final Function()? onLeftPressed;

  CommentField({
    Key? key,
    required this.controller,
    required this.onRightPressed,
    this.onLeftPressed,
  }) : super(
          autofocus: true,
          autocorrect: false,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            isDense: true,
            fillColor: Theme.of(Global.context).scaffoldBackgroundColor,
            hintText: 'Mesajınızı Giriniz...',
            hintStyle: TextStyle(color: AppColors.neutral800),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral100),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral100),
                borderRadius: BorderRadius.circular(8)),
            filled: true,
            suffixIcon: IconButton(
              onPressed: onRightPressed,
              color: AppColors.neutral800,
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColors.neutral900,
                size: 28,
              ),
            ),
            prefixIcon: onLeftPressed != null
                ? IconButton(
                    onPressed: onLeftPressed,
                    color: AppColors.neutral800,
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: AppColors.neutral900,
                      size: 28,
                    ),
                  )
                : null,
          ),
          validator: (value) => value!.isEmpty ? 'Mesajınızı Giriniz.' : null,
        );
}
