import 'package:food_delivery_app/API/products%20models/api_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;
}

class CartManager {
  static final CartManager _instance = CartManager._internal();
  final List<CartItem> _items = [];

  CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addItem(Product product, int quantity) {
    final existingIndex =
        _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(int productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
    }
  }

  void clearCart() {
    _items.clear();
  }

  bool isEmpty() => _items.isEmpty;

  int getItemCount() => _items.length;

  CartItem? getItem(int productId) {
    try {
      return _items.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }
}
