import 'package:flutter/material.dart';

class ExtraItem extends StatelessWidget {
  final String img;
  final bool isNetworkImage;
  const ExtraItem({super.key, required this.img, this.isNetworkImage = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xffe6e6e6),
                borderRadius: BorderRadius.circular(20)),
            height: 70,
            width: 70,
            child: isNetworkImage
                ? Image.network(
                    img,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/img/bread.png',
                      fit: BoxFit.contain,
                    ),
                  )
                : Image.asset(
                    img,
                    fit: BoxFit.contain,
                  ),
          ),
          Positioned(
            left: 60,
            top: 50,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xff0E803C),
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
