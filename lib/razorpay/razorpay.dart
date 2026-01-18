import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:food_delivery_app/services/cart_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/razorpay/razorpay_config.dart';

class RazorpayPage extends StatefulWidget {
  const RazorpayPage({super.key});

  @override
  _RazorpayPageState createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  late Razorpay _razorpay;
  bool _isProcessing = false;
  bool _razorpayAvailable = true;

  @override
  void initState() {
    super.initState();
    // Razorpay plugin is not supported on web. Guard initialization.
    if (kIsWeb) {
      _razorpayAvailable = false;
    } else {
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      _razorpayAvailable = true;
    }
  }

  void _openCheckout() {
    final cartManager = CartManager();

    if (cartManager.items.isEmpty) {
      _showDialog(
          "Empty Cart", "Please add items to your cart before ordering.");
      return;
    }

    // Check platform availability
    if (!_razorpayAvailable) {
      _showDialog("Unsupported Platform",
          "Razorpay is not supported on this platform (web). Use a mobile device.");
      return;
    }

    // Validate key
    if (kRazorpayKey.isEmpty || kRazorpayKey.contains('REPLACE')) {
      _showDialog("Payment Key Missing",
          "Razorpay key is not configured. Please set the live key in razorpay_config.dart.");
      return;
    }

    final totalAmount = (cartManager.totalPrice * 100).toInt(); // paise
    if (totalAmount <= 0) {
      _showDialog(
          "Invalid Amount", "Cart total must be greater than 0 to proceed.");
      return;
    }

    setState(() => _isProcessing = true);

    var options = {
      'key': kRazorpayKey,
      'amount': totalAmount,
      'name': 'Food Delivery App',
      'description': '${cartManager.items.length} items from your cart',
      'prefill': {
        'contact': '9876543210',
        'email': 'customer@example.com',
      },
      'theme': {'color': '#462B9C'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => _isProcessing = false);
      _showDialog("Error", "Failed to initiate payment: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() => _isProcessing = false);

    final cartManager = CartManager();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✓ Payment successful! Order placed.'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );

    // Clear cart after successful payment
    cartManager.clearCart();

    // Navigate to home page after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(MyRoutes.homepage);
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() => _isProcessing = false);

    _showDialog(
      "Payment Failed",
      "Error: ${response.message}\n\nPlease try again.",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    setState(() => _isProcessing = false);

    _showDialog(
      "External Wallet",
      "Selected: ${response.walletName}\n\nProceeding with payment...",
    );
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_razorpayAvailable) {
      _razorpay.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartManager = CartManager();
    final itemCount = cartManager.items.length;

    final double subtotal = cartManager.totalPrice;
    final double tax = subtotal * 0.1; // 10%
    final double delivery = 0.0; // keep delivery if needed later
    final double totalAmountDouble = subtotal + tax + delivery;

    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: _isProcessing
            ? null
            : BackButton(
                onPressed: () => context.go(MyRoutes.itempage),
              ),
        title: const Text(
          "Order Summary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff462B9C),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: cartManager.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => context.go(MyRoutes.itempage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff462B9C),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Back to Cart",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Order Items
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Order Items",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff462B9C),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "$itemCount item${itemCount != 1 ? 's' : ''}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        ...List.generate(
                          cartManager.items.length,
                          (index) {
                            final item = cartManager.items[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Qty: ${item.quantity}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "₹${(item.product.price * item.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff462B9C),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Price Breakdown
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildPriceRow(
                          "Subtotal",
                          "₹${subtotal.toStringAsFixed(2)}",
                        ),
                        const SizedBox(height: 8),
                        _buildPriceRow(
                          "Delivery",
                          "₹${delivery.toStringAsFixed(2)}",
                          isDelivery: true,
                        ),
                        const SizedBox(height: 8),
                        _buildPriceRow(
                          "Tax",
                          "₹${tax.toStringAsFixed(2)}",
                          isTax: true,
                        ),
                        const Divider(height: 16),
                        _buildPriceRow(
                          "Total Amount",
                          "₹${totalAmountDouble.toStringAsFixed(2)}",
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Prominent payable amount
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Payable Amount',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '₹${totalAmountDouble.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff462B9C),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Payment Button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isProcessing ? null : _openCheckout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff462B9C),
                        disabledBackgroundColor: Colors.grey[400],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: _isProcessing
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Icon(Icons.payment),
                      label: Text(
                        _isProcessing ? "Processing..." : "Pay Now",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String amount, {
    bool isDelivery = false,
    bool isTax = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isDelivery || isTax ? Colors.green : Colors.black87,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? const Color(0xff462B9C) : Colors.black87,
          ),
        ),
      ],
    );
  }
}
