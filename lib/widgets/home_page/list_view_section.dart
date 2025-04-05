import 'package:flutter/material.dart';

final List<Map<String, String>> items = [
  {"image": "assets/img/plate.png", 'title': 'All'},
  {"image": "assets/img/burger.png", 'title': 'Burger'},
  {"image": "assets/img/pizza.png", 'title': 'Pizza'},
  {"image": "assets/img/dessert.png", 'title': 'Dessert'},
];

class ListViewSection extends StatelessWidget {
  final Function(int) onTileTapped;
  final int selectedTileIndex;

  const ListViewSection(
      {super.key, required this.onTileTapped, required this.selectedTileIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: SizedBox(
        height: 100,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () => onTileTapped(index),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedTileIndex == index
                          ? Color(0xff462B9C)
                          : Color(0xffEBE8E8),
                    ),
                    child: Image.asset(items[index]["image"]!, height: 50),
                  ),
                  Text(
                    items[index]["title"].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: selectedTileIndex == index
                          ? Color(0xff462B9C)
                          : Color(0xff868585),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
