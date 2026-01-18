import 'package:flutter/material.dart';

class TotalSection extends StatelessWidget {
  final String totalAmount;

  const TotalSection({super.key, this.totalAmount = "0"});

  @override
  Widget build(BuildContext context) {
    double subtotal = double.tryParse(totalAmount) ?? 0;
    double tax = subtotal * 0.1; // 10% tax
    double total = subtotal + tax;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Subtotal",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff6F6D6D),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              "₹${subtotal.toStringAsFixed(2)}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff868585),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tax 10%",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff6F6D6D),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              "₹${tax.toStringAsFixed(2)}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff868585),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff303030),
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            Text(
              "₹${total.toStringAsFixed(2)}",
              style: const TextStyle(
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
