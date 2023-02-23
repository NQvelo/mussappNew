import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../json/songs_json.dart';

// ignore: camel_case_types
class getsettingsBody extends StatefulWidget {
  const getsettingsBody({Key? key}) : super(key: key);

  @override
  State<getsettingsBody> createState() => _getsettingsBodyState();
}

// ignore: camel_case_types
class _getsettingsBodyState extends State<getsettingsBody> {
  @override
  Widget build(BuildContext context) {
    return settingsBody();
  }
}

settingsBody() {
  return SingleChildScrollView(
    child: Column(
      children: List.generate(settings_menu.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: const Color.fromARGB(28, 255, 255, 255),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    settings_menu[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Icon(
                  FeatherIcons.arrowRight,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
