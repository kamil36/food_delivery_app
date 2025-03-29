import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const GridTileWidget({super.key, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xffEBE8E8), borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(image, height: 80),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Poppins')),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xffC9AA05))),
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(radius: 10, backgroundColor: Color(0xff0E803C), child: Icon(Icons.add, size: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
