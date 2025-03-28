import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff492e9e),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 140.5,
                backgroundImage: NetworkImage(
                  "https://s3-alpha-sig.figma.com/img/3ade/703c/b69e6941f3db24e678e597d76ad85c98?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Ba3NRhLbWkWCPi8jd33RpavECBFtmAc6c5Y~LzC6FUOaD9rsrSovE6a~LGXzVXeWNBp23ccLpK2lpV1I3tCsrCZ7j2MOm~XdNALE48MguLqpQ7TQaYJ2CcrKUCYThT7qBGO9pDhy14t8D8ReCmVVWjgBR7sY8E1EX3OskAsrgr9Cch9VRZCIu2J6AS49KhIkN6mwmd0iI0JNXYTsOaplAQwdY7sfLpg-4dERLIrqGQCZfSbC4RbWCZKORT1YF4Lt3JtQ7IDWT0mVaVdG-MeAw-CDw2B0jCZoD6rCimDUDkUtwSS1OijTHbNIExnBvZaw7vU8rzNwzOX19zWYFGwSHQ__",
                  scale: 1,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Enjoy",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your Food",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff462B9C),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
