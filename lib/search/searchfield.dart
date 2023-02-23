import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../json/songs_json.dart';
import '../pages/album_page.dart';

class searchfieldBody extends StatefulWidget {
  const searchfieldBody({Key? key}) : super(key: key);

  @override
  _searchstatePage createState() => _searchstatePage();
}

// ignore: camel_case_types
class _searchstatePage extends State<searchfieldBody> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/songs_json.dart');
    // final data = await json.decode(response);
  }

  List _founditems = []; //found items are here
  @override
  initState() {
    // at the beginning, all users are shown
    _founditems = songs;

    super.initState();
  }

  void _filter(String enteredKeyword) {
    List res = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      res = songs;
    } else {
      res = songs
          .where((users) => users["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _founditems = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              IconButton(
                  onPressed: () {
                    _founditems = songs;
                  },
                  icon: const Icon(FeatherIcons.camera)),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                child: CupertinoSearchTextField(
                  onChanged: (value) => _filter(value),
                  padding: const EdgeInsets.only(left: 10),
                  autofocus: true,
                  itemSize: 25,
                  itemColor: const Color.fromARGB(185, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _founditems.isNotEmpty
                ? ListView.builder(
                    itemCount: _founditems.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                song: _founditems[index],
                              ),
                              type: PageTransitionType.scale,
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromARGB(46, 255, 255, 255)),
                        // key: ValueKey(songs[index]["title"]),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       PageTransition(
                                //         alignment: Alignment.bottomCenter,
                                //         child: AlbumPage(
                                //           song: _founditems[index],
                                //         ),
                                //         type: PageTransitionType.scale,
                                //       ));
                                // },
                                child: Image.asset(
                                  _founditems[index]["img"],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          title: Text(
                            _founditems[index]['title'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/6195/6195678.png',
                          width: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No results found',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
