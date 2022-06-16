import 'package:flutter/material.dart';
import 'package:salus/core/components/container/label.dart';
import 'package:salus/core/constant/enum/label_enum.dart';
import 'package:salus/core/theme/color_theme.dart';

class MessageLabel extends StatelessWidget {
  final MessageState state;
  const MessageLabel({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case MessageState.NEW:
        return Label(
          text: 'Yeni Eşleşme',
          textColor: AppColors.systemGreen700,
          backgroundColor: AppColors.systemGreen100,
        );

      case MessageState.WAITING:
        return Label(
          text: 'Randevu Bekliyor',
          textColor: AppColors.systemYellow700,
          backgroundColor: AppColors.systemYellow100,
        );

      case MessageState.MEETING:
        return Label(
          text: 'Randevu Ayarlandı',
          textColor: AppColors.neutral500,
          backgroundColor: AppColors.neutral200,
        );
      case MessageState.JOURNEY:
        return Label(
          text: 'Yolculuk Atandı',
          textColor: AppColors.neutral500,
          backgroundColor: AppColors.neutral200,
        );
      case MessageState.CAREING:
        return Label(
          text: 'Terapist Atandı',
          textColor: AppColors.neutral500,
          backgroundColor: AppColors.neutral200,
        );

      default:
        return Container();
    }
  }
}
