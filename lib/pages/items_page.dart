import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/cart_manager.dart';
// navigation handled by BottomTextSection; avoid PopScope here
import 'package:food_delivery_app/widgets/items_page/bottom_text_section.dart';
import 'package:food_delivery_app/widgets/items_page/item_button_section.dart';
import 'package:food_delivery_app/widgets/items_page/item_title.dart';
import 'package:food_delivery_app/widgets/items_page/payment_card_section.dart';
import 'package:food_delivery_app/widgets/items_page/string_section.dart';
import 'package:food_delivery_app/widgets/items_page/total_section.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late CartManager _cartManager;

  @override
  void initState() {
    super.initState();
    _cartManager = CartManager();
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
                const SizedBox(height: 20),
                StringSection(itemCount: _cartManager.items.length),
                const SizedBox(height: 20),
                if (_cartManager.items.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'No items in cart',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartManager.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = _cartManager.items[index];
                      return Column(
                        children: [
                          CartItemRow(
                            cartItem: cartItem,
                            onQuantityChanged: (newQuantity) {
                              setState(() {
                                _cartManager.updateQuantity(
                                  cartItem.product.id,
                                  newQuantity,
                                );
                              });
                            },
                            onRemove: () {
                              setState(() {
                                _cartManager.removeItem(cartItem.product.id);
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                const ItemTitleSection(title: "Payment Method"),
                const SizedBox(height: 10),
                const PaymentCardSection(),
                const SizedBox(height: 20),
                TotalSection(
                  totalAmount: _cartManager.totalPrice.toStringAsFixed(2),
                ),
                const SizedBox(height: 30),
                const ItemButtonSection(),
                const SizedBox(height: 20),
                const BottomTextSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemRow extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final Function() onRemove;

  const CartItemRow({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffe6e6e6)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
              color: const Color(0xffe6e6e6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              cartItem.product.thumbnail,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/img/pizza_fries.png',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${cartItem.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffC9AA05),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total: ₹${cartItem.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff472C9D),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: cartItem.quantity > 1
                          ? () => onQuantityChanged(cartItem.quantity - 1)
                          : onRemove,
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xff472C9D),
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      cartItem.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff472C9D),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => onQuantityChanged(cartItem.quantity + 1),
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Color(0xff472C9D),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
