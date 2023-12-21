import 'package:flutter/material.dart';

import '../../data/notification_service.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show notifications'),
          onPressed: () {
            NotificationService().showNotification(
                title: 'SHALABY', body: 'It works successfully 👍🏼');
          },
        ),
      ),
    );
  }
}
