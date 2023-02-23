import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musapp/pages/notifications.dart';
import '../settings/settings_page.dart';
import 'bodyhome.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

String greetings() {
  final hour = TimeOfDay.now().hour;

  if (hour <= 12) {
    return 'Good Morning';
  } else if (hour <= 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  int activeMenu1 = 0;

  get primary => Colors.green;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color(0xff1B1A1C),
      // ignore: prefer_const_constructors
      appBar: getAppBar(context),
      body: const bodypage(),
    );
  }
}

getAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    elevation: 0,
    title: SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          flex: 1,
          child: Text(
            greetings(),
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // const Padding(padding: EdgeInsets.only(left: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                iconSize: 19,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const notifications()),
                  );
                },
                icon: const Icon(FeatherIcons.bell)),
            IconButton(
                iconSize: 19,
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.clock,
                  color: Colors.white,
                )),
            IconButton(
                iconSize: 19,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const settingsPage()),
                  );
                },
                icon: const Icon(
                  FeatherIcons.settings,
                )),
          ],
        ),
      ]),
    ),
  );
}
