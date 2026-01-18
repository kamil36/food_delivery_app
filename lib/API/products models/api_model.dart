class Product {
  final int id;
  final String title;
  final double price;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    this.images = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images'] ?? [json['thumbnail']]),
    );
  }
}

class ProductResponse {
  final List<Product> products;

  ProductResponse({required this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: List<Product>.from(
        json['products'].map((p) => Product.fromJson(p)),
      ),
    );
  }
}
