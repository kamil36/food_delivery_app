import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _searchController = TextEditingController();

final List<Map<String, String>> products = [
  {"image": "assets/img/plate.png", "title": "Veg Plate", "price": "\$60"},
  {"image": "assets/img/burger.png", "title": "Beef Burger", "price": "\$90"},
  {"image": "assets/img/pizza.png", "title": "Pizza", "price": "\$80"},
  {
    "image": "assets/img/pizza_fries.png",
    "title": "Pizza Fries",
    "price": "\$120"
  },
];
int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      )),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/img/profile.jpeg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xffefeeee),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
                style: TextStyle(height: 1),
                cursorHeight: 20,
                controller: _searchController,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        ListTileHome(
                          link: Image.asset(
                            "assets/img/plate.png",
                            scale: 1,
                            fit: BoxFit.contain,
                            height: 50,
                          ),
                          text: 'All',
                          color1: Color(0xff462B9C),
                          color2: Color(0xff462B9C),
                        ),
                        ListTileHome(
                          link: Image.asset(
                            'assets/img/burger.png',
                            scale: 1,
                            fit: BoxFit.contain,
                            height: 50,
                          ),
                          text: 'Burger',
                          color1: Color(0xffEBE8E8),
                          color2: Color(0xffEBE8E8),
                        ),
                        ListTileHome(
                          link: Image.asset(
                            'assets/img/pizza.png',
                            scale: 1,
                            fit: BoxFit.contain,
                            height: 50,
                          ),
                          text: 'Pizza',
                          color1: Color(0xffEBE8E8),
                          color2: Color(0xffEBE8E8),
                        ),
                        ListTileHome(
                          link: Image.asset(
                            'assets/img/dessert.png',
                            scale: 1,
                            fit: BoxFit.contain,
                            height: 50,
                          ),
                          text: 'Dessert',
                          color1: Color(0xffEBE8E8),
                          color2: Color(0xffEBE8E8),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Promotions",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xff101010),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
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
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xff101010),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: 4, // Total number of items
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: GridTile(
                      link: Image.asset(products[index]["image"]!, height: 80),
                      title: products[index]["title"]!,
                      price: products[index]["price"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff462B9C),
        unselectedItemColor: Color(0xff000000),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({
    super.key,
    required this.link,
    required this.title,
    required this.price,
  });
  final Image link;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffEBE8E8),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              link,
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Color(0xff101010),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xffC9AA05),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
              )
            ],
          ),
        ));
  }
}

class ListTileHome extends StatelessWidget {
  const ListTileHome({
    super.key,
    required this.link,
    required this.text,
    required this.color1,
    required this.color2,
  });
  final Image link;
  final String text;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: color1,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: link,
          ),
          Text(
            text,
            style: TextStyle(
                color: color2, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
