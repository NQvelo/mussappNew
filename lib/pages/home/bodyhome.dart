import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musapp/pages/home/firstview.dart';
import '../../json/songs_json.dart';
import 'package:http/http.dart' as http;

int activeMenu1 = 0;
int activeMenu2 = 0;
get primary => Colors.green;

String? stringResponse;
Map? mapResponse;
Map? dataResponse;

// ignore: camel_case_types
class bodypage extends StatefulWidget {
  const bodypage({Key? key}) : super(key: key);

  @override
  _bodypageState createState() => _bodypageState();
}

// ignore: camel_case_types
class _bodypageState extends State<bodypage> {
  Future getMusic() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
    // if (response.statusCode == 200) {
    // stringResponse = response.body;
    if (response.body.isNotEmpty) {
      json.decode(response.body);
    }
    mapResponse = json.decode(response.body);
    dataResponse = mapResponse!["data"];
  }

  @override
  Widget build(BuildContext context) {
    getMusic();
    return getBody();
  }

  getBody() {
    return SingleChildScrollView(
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
            Container(
              child: mapResponse == null
                  ? Container()
                  : Text(stringResponse.toString()),
            )
          ],
        ),
      ],
    ));
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
