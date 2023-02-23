import 'package:flutter/material.dart';
import '../../json/songs_json.dart';
import '../home/bodyhome.dart';

class libraryBodypage extends StatefulWidget {
  libraryBodypage({Key? key}) : super(key: key);

  @override
  State<libraryBodypage> createState() => _librarybody();
}

class _librarybody extends State<libraryBodypage> {
  @override
  Widget build(BuildContext context) {
    return libraryBody();
  }

  libraryBody() {
    return Column(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: List.generate(library_menu.length, (index) {
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
                        library_menu[index],
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
                              width: 20,
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
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(114, 255, 255, 255),
            ),
            width: MediaQuery.of(context).size.width / 2.2,
            height: 150,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(114, 255, 255, 255),
            ),
            width: MediaQuery.of(context).size.width / 2.2,
            height: 150,
          ),
        ],
      ),
    ]);
  }
}
