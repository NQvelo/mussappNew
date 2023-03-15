import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musapp/components/button.dart';
import '../../services/auth.dart';
import '../home/bodyhome.dart';
import '../settings/settings_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class getprofilebody extends StatefulWidget {
  const getprofilebody({Key? key}) : super(key: key);

  @override
  State<getprofilebody> createState() => _getprofilebodyState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

User? user = FirebaseAuth.instance.currentUser;

// ignore: camel_case_types
class _getprofilebodyState extends State<getprofilebody> {
  @override
  Widget build(BuildContext context) {
    return profileBody(context);
  }
}

Future<void> signOut() async {
  await auth().signout();
}

profileBody(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff00667B),
            Color(0xff002F38),
            Color(0xff1B1A1C),
          ]),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(child: Column()),
        ),
        const SizedBox(
          height: 30,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            )),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          "${user?.email}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),

        Row(
          children: [
            const Spacer(),
            myButton("Edit Profile", const Color(0xff3E3F3F), Colors.white,
                const Color(0xff3E3F3F), (() => print('onpress')), 110, 37),
            const SizedBox(
              width: 20,
            ),
            myButton(
                "Sign Out",
                const Color.fromARGB(255, 97, 50, 45),
                Colors.white,
                const Color.fromARGB(255, 97, 50, 45),
                (() => signOut()),
                110,
                37),
            const Spacer(flex: 1),
          ],
        ),

        // OutlinedButton(
        //   style: OutlinedButton.styleFrom(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20.0),
        //     ),
        //     side: const BorderSide(width: 1, color: Colors.white),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const settingsPage()),
        //     );
        //   },
        //   child: const Text(
        //     'Edit Profile',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text(
                  '23',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'PLAYLISTS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 10),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  '203',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'FOLLOWERS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 10),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  '223',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'FOLLOWING',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 40)),
      ]),
    ),
  );
}
