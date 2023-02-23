import 'package:flutter/material.dart';
import 'package:musapp/pages/home/bodyhome.dart';
import 'package:page_transition/page_transition.dart';
import '../../json/songs_json.dart';
import '../album_page.dart';

// ignore: camel_case_types
class firstscrollview extends StatefulWidget {
  const firstscrollview(List sublist, {Key? key}) : super(key: key);

  @override
  State<firstscrollview> createState() => _firstscrollviewState();
}

// ignore: camel_case_types
class _firstscrollviewState extends State<firstscrollview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        categoriesview(),
        SizedBox(
          height: 20,
        ),
        firstmusicview(),
      ],
    );
  }
}

// ignore: camel_case_types
class firstmusicview extends StatefulWidget {
  const firstmusicview({Key? key}) : super(key: key);

  @override
  State<firstmusicview> createState() => _firstmusicviewState();
}

// ignore: camel_case_types
class categoriesview extends StatefulWidget {
  const categoriesview({Key? key}) : super(key: key);

  @override
  State<categoriesview> createState() => _categoriesviewState();
}

// ignore: camel_case_types
class _categoriesviewState extends State<categoriesview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 20),
        child: Row(
          children: List.generate(song_type_1.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 40),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu1 = index;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song_type_1[index],
                      style: TextStyle(
                          color: activeMenu1 == index ? primary : Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    activeMenu1 == index
                        ? Container(
                            width: 15,
                            height: 1,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(5)),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _firstmusicviewState extends State<firstmusicview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(songs.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.bottomCenter,
                      child: AlbumPage(
                        song: songs[index],
                      ),
                      type: PageTransitionType.scale));
            },
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(songs[index]['img']),
                          fit: BoxFit.cover),
                      color: primary,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  songs[index]['title'],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    songs[index]['description'],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
