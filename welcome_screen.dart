import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart'; // To access flutterLocalNotificationsPlugin

class WelcomeScreen extends StatelessWidget {
  final String email;
  const WelcomeScreen({super.key, required this.email});

  Future<void> showSystemNotification(String email) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'main_channel', // channel id
      'App Notifications', // channel name
      channelDescription: 'This channel is for app notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformDetails =
    NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      'Hello, $email 👋', // title
      'This is a notification in status bar!', // body
      platformDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          elevation: 10,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline_rounded,
                    size: 52, color: Colors.green),
                const SizedBox(height: 18),
                Text('Welcome!',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  email,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo),
                ),
                const SizedBox(height: 14),
                Text('Login successful.', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.notifications_active_rounded),
                    label: const Text("Show Notification"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      shadowColor: Colors.indigo.shade200,
                    ),
                    onPressed: () => showSystemNotification(email),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
