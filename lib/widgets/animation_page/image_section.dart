import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 140.5,
      backgroundImage: AssetImage(
        "assets/img/plate.png",
      ),
    );
  }
}
