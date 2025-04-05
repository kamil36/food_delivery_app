class Product {
  final String image;
  final String title;
  final String price;

  Product({
    required this.image,
    required this.title,
    required this.price,
  });

  // Convert from Map (useful for JSON parsing)
  factory Product.fromMap(Map<String, String> map) {
    return Product(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? '',
    );
  }

  // Convert to Map (useful for serialization)
  Map<String, String> toMap() {
    return {
      'image': image,
      'title': title,
      'price': price,
    };
  }
}

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

final List<Map<String, String>> items = [
  {"image": "assets/img/plate.png", 'title': 'All'},
  {"image": "assets/img/burger.png", 'title': 'Burger'},
  {"image": "assets/img/pizza.png", 'title': 'Pizza'},
  {"image": "assets/img/dessert.png", 'title': 'Dessert'},
];
