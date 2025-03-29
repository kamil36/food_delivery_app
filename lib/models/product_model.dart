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
