import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/extra_item_section.dart';
import 'package:go_router/go_router.dart';

class SecondContainerSection extends StatefulWidget {
  final Product product;

  SecondContainerSection({super.key, required this.product});

  @override
  State<SecondContainerSection> createState() => _SecondContainerSectionState();
}

class _SecondContainerSectionState extends State<SecondContainerSection> {
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
    return Positioned(
      top: MediaQuery.of(context).size.height / 2.5,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(110, 60),
                        backgroundColor: Color(0xff472C9D)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/img/Star.png',
                          height: 20,
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
                    "\$${widget.product.price}",
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
                    widget.product.title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
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
                        fontSize: 20,
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Delicious ${widget.product.title} with fresh ingredients!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff595959),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
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
              height: 20,
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: InkWell(
                onTap: () {
                  context.go(MyRoutes.itempage);
                },
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
    );
  }
}
