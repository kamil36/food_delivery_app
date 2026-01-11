import 'package:flutter/material.dart';

class ItemSection extends StatefulWidget {
  const ItemSection(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final int price;

  @override
  State<ItemSection> createState() => _ItemSectionState();
}

class _ItemSectionState extends State<ItemSection> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 90,
          decoration: BoxDecoration(
              color: Color(0xffe6e6e6),
              borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            widget.image,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Text(
              "\$${widget.price}",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xffC9AA05),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: decrement,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Color(0xff472C9D),
                    size: 20,
                  ),
                ),
                Text(
                  counter.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff472C9D),
                  ),
                ),
                IconButton(
                  onPressed: increment,
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Color(0xff472C9D),
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.cancel_outlined,
            color: Color(0xffFF000F),
            size: 20,
          ),
        ),
      ],
    );
  }
}
