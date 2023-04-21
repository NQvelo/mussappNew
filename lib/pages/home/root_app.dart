import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../search/search_page.dart';
import '../library/library_page.dart';
import '../profile/profile_page.dart';
import 'home_page.dart';

import 'dart:io';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  get primary => Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [homepage(), libraryPage(), searchPage(), profilebody()],
    );
  }

  Widget getFooter() {
    // ignore: non_constant_identifier_names
    List Items = [
      FeatherIcons.home,
      FeatherIcons.book,
      FeatherIcons.search,
      FeatherIcons.user,
    ];
    return Container(
      height: Platform.isIOS ? 90 : 60,
      decoration: const BoxDecoration(
        color: Color(0xff1B1A1C),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(Items.length, (index) {
            return IconButton(
              icon: Icon(
                Items[index],
                color: activeTab == index ? primary : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
