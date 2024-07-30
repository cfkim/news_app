import 'package:flutter/material.dart';

class NotificationModel {
  String person;
  String pfp;
  DateTime date;
  String action; // "liked", "commented", or "posted"
  String postName;
  String imagePath; // Path to the image related to the notification
  bool isRead;

  NotificationModel({
    required this.person,
    required this.pfp,
    required this.date,
    required this.action,
    required this.postName,
    required this.imagePath,
    required this.isRead,
  });

  // Factory method to create a list of dummy notifications
  static List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        person: 'Alice',
        pfp: 'assets/images/pfp.png',
        date: DateTime.now().subtract(Duration(minutes: 5)),
        action: 'liked',
        postName: 'Autumn in my heart',
        imagePath: 'assets/images/feed_image.png',
        isRead: true,
      ),
      NotificationModel(
        person: 'Alice',
        pfp: 'assets/images/pfp.png',
        date: DateTime.now().subtract(Duration(hours: 1)),
        action: 'commented',
        postName: 'Autumn in my heart',
        imagePath: 'assets/images/feed_image.png',
        isRead: false,
      ),
      NotificationModel(
        person: 'Charlie',
        pfp: 'assets/images/pfp2.png',
        date: DateTime.now().subtract(Duration(days: 1)),
        action: 'posted',
        postName: 'Autumn in my heart',
        imagePath: 'assets/images/feed_image.png',
        isRead: true,
      ),
      NotificationModel(
        person: 'David',
        date: DateTime.now().subtract(Duration(days: 2)),
        pfp: 'assets/images/pfp1.png',
        action: 'liked',
        postName: 'Autumn in my heart',
        imagePath: 'assets/images/feed_image.png',
        isRead: false,
      ),
    ];
  }
}
