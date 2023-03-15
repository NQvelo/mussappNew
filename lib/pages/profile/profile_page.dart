import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musapp/pages/profile/profile_body.dart';

import '../settings/settings_page.dart';

// ignore: camel_case_types
class profilebody extends StatefulWidget {
  const profilebody({Key? key}) : super(key: key);

  @override
  State<profilebody> createState() => _profilepageState();
}

// ignore: camel_case_types
class _profilepageState extends State<profilebody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1A1C),
      appBar: getAppBar(context),
      body: profileBody(context),
    );
  }
}

getAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xff00667B),
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settingsPage()),
              );
            },
            icon: const Icon(FeatherIcons.arrowLeft)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settingsPage()),
              );
            },
            icon: const Icon(FeatherIcons.moreHorizontal)),
      ],
    ),
  );
}
