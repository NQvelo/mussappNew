import 'package:flutter/material.dart';

class notifications extends StatefulWidget {
  const notifications({key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: getNotifications(),
    );
  }

  getNotifications() {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter, //(
      child: SafeArea(
        child: Container(
          height: 60,
          width: size.width - 20,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
