import 'package:flutter/material.dart';

import '../models/notifications_model.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int notification_count = 4;
  List<NotificationModel> notifications = [];
  final dateFormatter = DateFormat('MM/dd/yy');

  void _getInitState() {
    notifications = NotificationModel.getNotifications();
  }
  @override
  Widget build(BuildContext context) {
    _getInitState();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated( // should be sorted so most recent notifications are first
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: notifications[index].isRead ? Color(0xFFF6F7F9) : Color(0x15888BF4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(notifications[index].pfp, width: 30, height:30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 214,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          Text(notifications[index].person, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("${notifications[index].action}: '${notifications[index].postName}'", style: TextStyle(fontSize: 12)),
                          Text(dateFormatter.format(notifications[index].date), style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 10))
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 75,
                      child: Image.asset(notifications[index].imagePath))
                  ],),
              )
            );
          }
        ),
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
            tooltip: 'Show settings',
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Activity Feed', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 335,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F7F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Comment Likes'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/icons/toggle.png', width: 42, height: 30),
                                    )
                                ],)
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: 335,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F7F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Follows'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/icons/toggle.png', width: 42, height: 30),
                                    )
                                ],)
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: 335,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F7F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Likes'),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/icons/toggle.png', width: 42, height: 30),
                                    )
                                ],)
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              
              );
            }
          )
          
        ),
      ],
    );
  }
}