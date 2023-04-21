import 'package:flutter/material.dart';
import 'package:musapp/pages/home/bodyhome.dart';
import 'package:musapp/reusableWidgets/categories.dart';
import 'package:page_transition/page_transition.dart';
import '../../json/songs_json.dart';
import '../album_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()

// ignore: camel_case_types
class firstscrollview extends StatefulWidget {
  const firstscrollview(List sublist, {Key? key}) : super(key: key);

  @override
  State<firstscrollview> createState() => _firstscrollviewState();
}

// ignore: camel_case_types
class _firstscrollviewState extends State<firstscrollview> {
  List _loadedPhotos = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CategoriesWidget(Colors.accents),
          const SizedBox(
            height: 10,
          ),
          const firstmusicview(),
          const SizedBox(
            height: 40,
          ),
          const CategoriesWidget(Colors.accents),
          SizedBox(
              height: 1000,
              child: _loadedPhotos.isEmpty
                  ? Center(
                      child: ElevatedButton(
                        onPressed: _fetchData,
                        child: const Text('Load Photos'),
                      ),
                    )

                  // The ListView that displays photos
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 100,
                      itemBuilder: (BuildContext ctx, index) {
                        return ListTile(
                          leading: Image.network(
                            _loadedPhotos[index]["thumbnailUrl"],
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            _loadedPhotos[index]['title'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Photo ID: ${_loadedPhotos[index]["id"]}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    )),
        ]);
  }
}

//   ],
// );

// ignore: camel_case_types
class firstmusicview extends StatefulWidget {
  const firstmusicview({Key? key}) : super(key: key);

  @override
  State<firstmusicview> createState() => _firstmusicviewState();
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
                      type: PageTransitionType.bottomToTop));
            },
            child: Column(
              children: [
                Container(
                  width: 154,
                  height: 154,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(songs[index]['img']),
                          fit: BoxFit.cover),
                      color: primary,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  songs[index]['title'],
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 140,
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
