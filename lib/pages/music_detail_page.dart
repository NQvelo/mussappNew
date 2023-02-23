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
      backgroundColor: Colors.black,
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
    return AppBar(backgroundColor: Colors.black, elevation: 0, actions: const [
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: widget.color,
                        blurRadius: 30,
                        spreadRadius: 5,
                        offset: const Offset(-2, 40))
                  ], color: primary, borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      color: primary,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: size.width - 80,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FeatherIcons.folder,
                  color: Colors.white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.descriprion,
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  FeatherIcons.moreHorizontal,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Slider(
              activeColor: primary,
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

          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Feather.tv,
                color: primary,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Chromecast is ready',
                style: TextStyle(color: primary, fontSize: 18),
              )
            ],
          )
        ],

        ///dcdjchdcdbhdhcdc
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
              color: primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: Icon(
              isPlaying ? (Icons.stop) : (Icons.play_arrow),
              size: 35,
              color: Colors.white,
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
