import 'package:flutter/material.dart';

class NotificationIcon extends Image {
  NotificationIcon({Key? key})
      : super.asset(
          'assets/icons/bell.png',
          key: key,
          width: 24,
          height: 24,
        );
}
