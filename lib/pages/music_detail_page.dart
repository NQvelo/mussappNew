import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'home/bodyhome.dart';

double _currentsliderValue = 20;
bool isPlaying = true;

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String descriprion;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage(
      {Key? key,
      required this.title,
      required this.descriprion,
      required this.color,
      required this.img,
      required this.songUrl})
      : super(key: key);

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  //audio player is here
  // late AudioPlayer advancedplayer;
  // late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
  }

  getAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              FeatherIcons.share,
              color: Colors.white,
            ),
          ),
        ]);
  }

  getBody() {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [widget.color, const Color(0xff1B1A1C)]),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                //   child: Container(
                //     width: size.width - 100,
                //     height: size.width - 100,
                //     decoration: BoxDecoration(
                //         boxShadow: [],
                //         color: primary,
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 30, right: 30),
                  child: Container(
                    width: size.width - 60,
                    height: size.width - 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img), fit: BoxFit.cover),
                        color: primary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width - 60,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Icon(
                  //   FeatherIcons.folder,
                  //   color: Colors.white,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.descriprion,
                          style: const TextStyle(color: Colors.grey),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    FeatherIcons.heart,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Slider(
                activeColor: Colors.white,
                min: 0,
                max: 100,
                value: _currentsliderValue,
                onChanged: (value) {
                  setState(() {
                    _currentsliderValue = value;
                  });
                }),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '1:50',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '1:50',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //fiveicon widget is here
            iconbuttons(context),

            const SizedBox(height: 40),
            Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(74, 255, 255, 255),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Feather.cast,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Chromecast is ready',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            )
          ],

          ///dcdjchdcdbhdhcdc
        ),
      ),
    );
  }
}

//fiveIcon widget
iconbuttons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: null,
            icon: Icon(
              FeatherIcons.shuffle,
              color: Colors.white.withOpacity(0.8),
              size: 25,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              FeatherIcons.skipBack,
              color: Colors.white.withOpacity(0.8),
              size: 25,
            )),
        IconButton(
          hoverColor: Colors.grey,
          iconSize: 60,
          onPressed: () {
            // if (isPlaying) {
            //   stopSound(widget.songUrl);
            //   setState(() {
            //     isPlaying = false;
            //   });
            // } else {
            //   isPlaying = true;
            // }
          },
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: Icon(
              isPlaying ? (Icons.play_arrow) : (Icons.stop),
              size: 35,
              color: Colors.black,
            )),
          ),
        ),
        IconButton(
            onPressed: null,
            icon: Icon(
              FeatherIcons.skipForward,
              color: Colors.white.withOpacity(0.8),
              size: 25,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              FeatherIcons.repeat,
              color: Colors.white.withOpacity(0.8),
              size: 25,
            )),
      ],
    ),
  );
}
