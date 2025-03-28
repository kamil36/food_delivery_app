import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/addtocart_page.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

int _selectedIndex = 0;

class _ItemPageState extends State<ItemPage> {
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "2 Items in cart",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Color(0xffe6e6e6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        'assets/img/pizza_fries.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Pizza Fries",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$20",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xffC9AA05),
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
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
                    IconButton(
                      onPressed: increment,
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Color(0xffFF000F),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Color(0xffe6e6e6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        'assets/img/burger.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Pizza Fries",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$20",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xffC9AA05),
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
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
                    IconButton(
                      onPressed: increment,
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Color(0xffFF000F),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Payment Method",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffe6e6e6),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/visa.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Payment Method",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "0274 7414 ***",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff6F6D6D),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                SizedBox(
                  height: 10,
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
                          "Order",
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Back to Menu",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff303030),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff462B9C),
          unselectedItemColor: Color(0xff000000),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 1 ? Icons.search_outlined : Icons.search),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 2
                    ? Icons.shopping_cart_rounded
                    : Icons.shopping_cart_outlined),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 3
                    ? Icons.person
                    : Icons.person_2_outlined),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
