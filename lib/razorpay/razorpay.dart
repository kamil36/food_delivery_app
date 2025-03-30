import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyRazorPay extends StatefulWidget {
  const MyRazorPay({super.key});

  @override
  State<MyRazorPay> createState() => _MyRazorPayState();
}

class _MyRazorPayState extends State<MyRazorPay> {
  late Razorpay _razorpay;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
          content: Text(
              "Congratulations! Payment Successful: ${response.paymentId}")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
          content:
              Text("Payment Error: ${response.code} - ${response.message}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text("External Wallet: ${response.walletName}")),
    );
  }

  void _startPayment() {
    var options = {
      'key': 'rzp_test_cw47EurKaxSKe4',
      'amount': 200 * 100,
      'name': 'Flipkart',
      'description': 'Test Payment',
      'timeout': 60,
      'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 70), backgroundColor: Colors.grey[800]),
            onPressed: _startPayment,
            child: Text(
              "Pay",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
