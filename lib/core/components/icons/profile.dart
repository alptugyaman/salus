import 'package:flutter/material.dart';

class ProfileIcon extends Image {
  ProfileIcon({Key? key})
      : super.asset(
          'assets/icons/profile.png',
          key: key,
          width: 24,
          height: 24,
        );
}
