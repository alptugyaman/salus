import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salus/core/components/icons/notification.dart';
import 'package:salus/core/components/icons/profile.dart';

class MessageAppBar extends AppBar {
  MessageAppBar({Key? key})
      : super(
          key: key,
          title: const Text('Mesajlarım'),
          actions: [
            ProfileIcon(),
            SizedBox(width: 0.066.sw),
            NotificationIcon(),
            SizedBox(width: 0.05.sw)
          ],
        );
}
