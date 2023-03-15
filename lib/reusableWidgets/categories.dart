import 'package:flutter/material.dart';
import 'package:musapp/pages/home/bodyhome.dart';
import '../../json/songs_json.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget(List sublist, {Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _categoriesState();
}

// ignore: camel_case_types
class _categoriesState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return categoriesWidget(Colors.grey);
  }

  Widget categoriesWidget(
    Color fontColor,
    // String songType,
    // List song_type_1,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 20),
        child: Row(
          children: List.generate(song_type_1.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
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
                      // songType,
                      style: TextStyle(
                          color: activeMenu1 == index ? primary : fontColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    activeMenu1 == index
                        ? Container(
                            width: 30,
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
