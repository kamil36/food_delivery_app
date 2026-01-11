import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({
    super.key,
    required this.title,
    this.shape,
  });
  final String title;
  final OutlinedBorder? shape;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isSelected1 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: widget.shape,
          side: BorderSide(color: Colors.grey.shade300),
          value: isSelected1,
          hoverColor: Colors.transparent,
          fillColor:
              WidgetStatePropertyAll(isSelected1 ? Colors.blue : Colors.white),
          onChanged: (value) {
            setState(() {
              isSelected1 = !isSelected1;
            });
          },
        ),
        Text(
          widget.title,
          style: CustomStyle.normalbold.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
