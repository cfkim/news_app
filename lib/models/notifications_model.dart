import 'package:flutter/material.dart';

class NotificationModel {
  final String person;
  final DateTime date;
  final String action; // "liked", "commented", or "posted"
  final String imagePath; // Path to the image related to the notification
  bool isRead;

  NotificationModel({
    required this.person,
    required this.date,
    required this.action,
    required this.imagePath,
    required this.isRead,
  });

  // Factory method to create a list of dummy notifications
  static List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        person: 'Alice',
        date: DateTime.now().subtract(Duration(minutes: 5)),
        action: 'liked',
        imagePath: 'assets/images/post1.png',
        isRead: true,
      ),
      NotificationModel(
        person: 'Bob',
        date: DateTime.now().subtract(Duration(hours: 1)),
        action: 'commented',
        imagePath: 'assets/images/post2.png',
        isRead: false,
      ),
      NotificationModel(
        person: 'Charlie',
        date: DateTime.now().subtract(Duration(days: 1)),
        action: 'posted',
        imagePath: 'assets/images/post3.png',
        isRead: true,
      ),
      NotificationModel(
        person: 'David',
        date: DateTime.now().subtract(Duration(days: 2)),
        action: 'liked',
        imagePath: 'assets/images/post4.png',
        isRead: false,
      ),
    ];
  }
}
