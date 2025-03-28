import 'package:flutter/material.dart';

class AddtoCartPage extends StatefulWidget {
  const AddtoCartPage({super.key});

  @override
  State<AddtoCartPage> createState() => _AddtoCartPageState();
}

class _AddtoCartPageState extends State<AddtoCartPage> {
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                colors: [
                  Color(0xff959595B8),
                  Color(0xff462B9C),
                ],
                radius: 0.6,
                stops: [
                  0.3,
                  0.9,
                ],
                tileMode: TileMode.clamp,
                center: Alignment.center,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/img/burger.png',
                        height: 140,
                        fit: BoxFit.contain,
                      ))
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.8,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(103, 50),
                                backgroundColor: Color(0xff472C9D)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/img/Star.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$20",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffC9AA05),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Beef Burger",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Big juicy beef burger with cheese, lettuce, tomato, onions and special sauce !",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff595959),
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Add Ons",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ExtraItem(
                          img: "assets/img/bread.png",
                        ),
                        ExtraItem(
                          img: "assets/img/souce_bottle.png",
                        ),
                        ExtraItem(
                          img: "assets/img/souce_plate.png",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff462B9C),
                          ),
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 27,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtraItem extends StatelessWidget {
  const ExtraItem({
    super.key,
    required this.img,
  });
  final String img;
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
            child: Image.asset(
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
