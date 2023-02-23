import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../json/songs_json.dart';
import '../search/searchfield.dart';

// ignore: camel_case_types
class getsearchbody extends StatefulWidget {
  const getsearchbody({Key? key}) : super(key: key);

  @override
  State<getsearchbody> createState() => _searchbodyState();
}

// ignore: camel_case_types
class _searchbodyState extends State<getsearchbody> {
  @override
  Widget build(BuildContext context) {
    return bodySearch(context);
  }
}

bodySearch(BuildContext context) {
  return SingleChildScrollView(
    child: Column(children: [
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    autofocus: false,
                    onChanged: (value) {},
                    padding: const EdgeInsets.only(left: 10),
                    itemSize: 25,
                    itemColor: const Color.fromARGB(185, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: const searchfieldBody(),
                              type: PageTransitionType.fade));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 40)),
      const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Your top genres',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: List.generate(song_type_1.length - 3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(179, 76, 151, 78),
                  ),
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    song_type_1[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
          Column(
            children: List.generate(song_type_1.length - 3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(179, 76, 151, 78),
                  ),
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    song_type_1[index + 3],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 40)),
      const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Browse all',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: List.generate(song_type_2.length - 3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(96, 205, 205, 205),
                  ),
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    song_type_2[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
          Column(
            children: List.generate(song_type_2.length - 3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(96, 205, 205, 205),
                  ),
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    song_type_2[index + 3],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    ]),
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    // ignore: avoid_types_as_parameter_names
    pageBuilder: (context, animation, FadeTransition) => searchfieldBody(),
    transitionsBuilder: (context, animation, FadeTransition, child) {
      return child;
    },
  );
}
