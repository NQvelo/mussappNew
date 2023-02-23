import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../json/songs_json.dart';
import 'home/bodyhome.dart';
import 'music_detail_page.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;

  const AlbumPage({Key? key, this.song}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

var buttonText = 'Follow';

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.song['title'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonText = 'Following';
                        });
                      },
                      child: Text(
                        (buttonText),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 49, 108, 51),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 131, 225, 134),
                        onPrimary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7), // <-- Radius
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              musichorisontal(context),
              const SizedBox(height: 60),
              const columnMusic(),
            ],
          ),
          SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Null;
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

musichorisontal(BuildContext context) {
  var size = MediaQuery.of(context).size;
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
                      child: MusicDetailPage(
                        title: songs[index]['title'],
                        color: songs[index]['color'],
                        descriprion: songs[index]['description'],
                        img: songs[index]['img'],
                        songUrl: songs[index]['song_url'],
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
                  width: size.width - 240,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        songs[index]['song_count'],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        songs[index]['date'],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      })));
}

// ignore: camel_case_types
class columnMusic extends StatefulWidget {
  const columnMusic({Key? key}) : super(key: key);

  @override
  State<columnMusic> createState() => _columnMusicState();
}

// ignore: camel_case_types
class _columnMusicState extends State<columnMusic> {
  @override
  Widget build(BuildContext context) {
    List songAlboms = songs;
    print(songAlboms);
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(
        songAlboms.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: (size.width - 60) * 0.77,
                    child: Text(
                      "${index + 1}   " + songAlboms[index]['title'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: (size.width - 60) * 0.23,
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Text(
                          //   songAlboms[index]['duration'],
                          //   style: const TextStyle(color: Colors.grey),
                          // ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 119, 212, 122),
                                shape: BoxShape.circle),
                            child: const Center(
                              child:
                                  Icon(Icons.play_arrow, color: Colors.black),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
