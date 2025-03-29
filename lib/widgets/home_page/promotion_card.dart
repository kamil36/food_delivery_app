import 'package:flutter/material.dart';

class PromotionCardSection extends StatelessWidget {
  const PromotionCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: Color(0xff9577F2),
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today’s Offer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Free box of Fries",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "on all orders above \$150",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/img/french_fries.png',
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
