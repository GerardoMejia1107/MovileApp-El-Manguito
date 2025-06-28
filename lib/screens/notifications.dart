import 'package:el_mango/util/notifications.dart';
import 'package:el_mango/widgets/notification_item.dart';

import '../util/foods.dart';
import '../widgets/food_item.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Notificaciones",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications == null ? 0 : notifications.length,
              itemBuilder: (BuildContext context, int index) {
                Map notification = notifications[index];
                return NotificationItem(
                  icono: notification["icon"],
                  sms: notification["sms"],
                  reaction: notification["reaction"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
