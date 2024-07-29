import 'package:flutter/material.dart';

import '../models/notifications_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int notification_count = 3;
  List<NotificationModel> notifications = [];

  void _getInitState() {
    notifications = NotificationModel.getNotifications();
  }
  @override
  Widget build(BuildContext context) {
    _getInitState();
    return Scaffold(
      appBar: appBar(context),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            width: 300,
            color: notifications[index].isRead ? Color(0xFFF6F7F9) : Color(0xFFF1F1FE),
          );
        }
      )
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('Activity', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(width: 5),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFF5151C6), Color(0xFF888BF4)],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                '(${notification_count})',
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Image.asset('assets/icons/settings.png', width: 25, height: 25),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ),
      ],
    );
  }
}