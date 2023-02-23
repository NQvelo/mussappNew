import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../search/searchfield.dart';
import '../profile/profile_page.dart';
import 'library_body.dart';

// ignore: camel_case_types
class libraryPage extends StatefulWidget {
  const libraryPage({Key? key}) : super(key: key);

  @override
  State<libraryPage> createState() => _libraryPageState();
}

// ignore: camel_case_types
class _libraryPageState extends State<libraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getappBar(context),
      body: libraryBodypage(),
    );
  }
}

getappBar(BuildContext context) {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profilebody()),
              );
            }, //
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://images.squarespace-cdn.com/content/v1/5446f93de4b0a3452dfaf5b0/1626904421257-T6I5V5IQ4GI2SJ8EU82M/Above+Avalon+Neil+Cybart"))))),
        const Padding(padding: EdgeInsets.only(left: 5)),
        const Text('Your Library',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w700)),
        const Padding(padding: EdgeInsets.only(left: 50)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const searchfieldBody()),
              );
            },
            icon: const Icon(FeatherIcons.search)),
        IconButton(
            onPressed: () {
              Navigator.of(context).restorablePush(_modalBuilder);
            },
            icon: const Icon(FeatherIcons.plus)),
      ],
    ),
  );
}

Route<void> _modalBuilder(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: const Text(
          'Add Music Albom Directly From This Page!',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        message: const Text(
            'Add Music Albom Directly From This Page!Add Music Albom Directly From This Page!Add Music Albom Directly From This Page!Add Music Albom Directly From This Page!Add Music Albom Directly From This Page!Add Music Albom Directly From This Page!'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
