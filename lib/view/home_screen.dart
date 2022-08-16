import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterLocalNotificationsPlugin? localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: prefer_const_constructors
    var androidInitialize = AndroidInitializationSettings('ic_launcher');

    var iOSIntialize = const IOSInitializationSettings();
    var initialzationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSIntialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification!.initialize(initialzationSettings);
  }

  Future _showNotification() async {
    log("Notification wohoöooo");
    var androidDetails = const AndroidNotificationDetails(
        "Notification", "Work update",
        importance: Importance.high);
    var iOSDetails = const IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await localNotification?.show(
        0,
        "Work Time",
        "You have a pending work please complete it",
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 196, 176, 0)),
              onPressed: _showNotification,

              // => NotificationApi.showNotification(
              //     title: "Work Time",
              //     body: "You have a pending work to complete"),
              child: const Text("Send Notification"),
            )
          ],
        ),
      ),
    );
  }
}
