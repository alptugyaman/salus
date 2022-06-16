import 'package:flutter/material.dart';
import 'package:salus/core/components/container/online.dart';

class Status extends Row {
  final bool? status;
  Status({Key? key, this.status = false})
      : super(
          key: key,
          children: [
            Online(status: status),
            const SizedBox(width: 8),
            Text(
              status! ? 'Çevrimiçi' : 'Çevrimdışı',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
}
