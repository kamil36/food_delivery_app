import 'dart:convert';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productResponse = ProductResponse.fromJson(jsonData);
      return productResponse.products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
