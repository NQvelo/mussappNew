import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musapp/components/button.dart';
import 'package:musapp/pages/home/firstview.dart';
import '../../json/songs_json.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth.dart';

int activeMenu1 = 0;
int activeMenu2 = 0;
get primary => Colors.green;

// ignore: camel_case_types
class bodypage extends StatefulWidget {
  const bodypage({Key? key}) : super(key: key);

  @override
  _bodypageState createState() => _bodypageState();
}

// ignore: camel_case_types
class _bodypageState extends State<bodypage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Future<void> signOut() async {
    await auth().signout();
  }

  getBody() {
    return RefreshIndicator(
        edgeOffset: 10,
        displacement: 10,
        color: primary,
        backgroundColor: Colors.black,
        onRefresh: _refresh,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn2RXAFnIdjwFwqaSItMcSXsYEjLmPVq1X2g&usqp=CAU")))),
                  const SizedBox(
                    height: 20,
                  ),
                  firstscrollview(songs.sublist(4)),
                ],
              ),
            ])));
  }
}

Future<void> _refresh() async {
  return Future.delayed(const Duration(seconds: 6));
}

indicator(BuildContext context) {
  return const CupertinoActivityIndicator(
    color: Colors.white,
    animating: true,
    radius: 10,
  );
}
