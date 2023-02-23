import 'package:flutter/material.dart';
import '../home/bodyhome.dart';
import '../settings/settings_page.dart';

// ignore: camel_case_types
class getprofilebody extends StatefulWidget {
  const getprofilebody({Key? key}) : super(key: key);

  @override
  State<getprofilebody> createState() => _getprofilebodyState();
}

// ignore: camel_case_types
class _getprofilebodyState extends State<getprofilebody> {
  @override
  Widget build(BuildContext context) {
    return profileBody(context);
  }
}

profileBody(BuildContext context) {
  return SingleChildScrollView(
      child: Align(
    alignment: Alignment.center,
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(child: Column()),
      ),
      const SizedBox(
        height: 40,
      ),
      Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          ),
          borderRadius: BorderRadius.all(Radius.circular(90)),
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      const Text(
        'Qvelo',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: const BorderSide(width: 1, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const settingsPage()),
          );
        },
        child: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              Text(
                '23',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                'followers',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '203',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                'following',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 40)),
    ]),
  ));
}
