import 'package:flutter/material.dart';

class TotalSection extends StatelessWidget {
  const TotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff6F6D6D),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              "\$52",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff868585),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax 10%",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff6F6D6D),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              "\$5",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff868585),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff303030),
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            Text(
              "\$57",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xffC9AA05),
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
