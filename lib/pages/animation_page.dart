import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/animation_page/button_section.dart';
import 'package:food_delivery_app/widgets/animation_page/image_section.dart';
import 'package:food_delivery_app/widgets/animation_page/text_section.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff492e9e),
        body: SingleChildScrollView(
          child: Center(
            heightFactor: 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageSection(),
                SizedBox(
                  height: 40,
                ),
                TextSection(text: "Enjoy"),
                SizedBox(
                  height: 20,
                ),
                TextSection(text: "Your Food"),
                SizedBox(
                  height: 20,
                ),
                ButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
