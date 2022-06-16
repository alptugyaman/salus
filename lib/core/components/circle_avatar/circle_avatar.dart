import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class Avatar extends CircleAvatar {
  final String? capitals;
  final String? imageUrl;

  Avatar({Key? key, this.capitals, this.imageUrl})
      : super(
          key: key,
          radius: 28,
          backgroundColor: AppColors.primary50,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: imageUrl == null && capitals != null
              ? Text(
                  capitals,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .15,
                  ),
                )
              : null,
        );
}
