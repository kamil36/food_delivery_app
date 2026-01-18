import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/pages/addtocart_page.dart';
import 'package:food_delivery_app/pages/animation_page.dart';
import 'package:food_delivery_app/pages/forgot_password_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/items_page.dart';
import 'package:food_delivery_app/pages/login.dart';
import 'package:food_delivery_app/pages/order_history_page.dart';
import 'package:food_delivery_app/pages/payment_methods_page.dart';
import 'package:food_delivery_app/pages/profile.dart';
import 'package:food_delivery_app/pages/search_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/pages/signup.dart';
import 'package:food_delivery_app/razorpay/razorpay.dart';
import 'package:food_delivery_app/widgets/home_page/bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static String animationpage = "/";
  static String homepage = "/home";
  static String loginpage = "/login";
  static String signuppage = "/signup";
  static String addtocart = "/add";
  static String itempage = "/item";
  static String razorpay = "/razorpay";
  static String profile = "/profile";
  static String navigate = "/nav";
  static String forgotpasswordpage = "/forgotpassword";
  static String searchpage = "/search";


  late final GoRouter router;
  final _firebaseauth = FirebaseAuth.instance;

  MyRoutes() {
    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: MyRoutes.animationpage,
            builder: (context, state) {
              return AnimationPage();
            }),
        GoRoute(
            path: MyRoutes.signuppage,
            builder: (context, state) {
              return SignUpPage();
            }),
        GoRoute(
            path: MyRoutes.loginpage,
            builder: (context, state) {
              return LoginPage();
            }),
        GoRoute(
          path: MyRoutes.homepage,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: MyRoutes.addtocart,
          builder: (context, state) {
            final product = state.extra as Product?;
            if (product == null) {
              return Scaffold(
                body: Center(
                  child: Text(
                    "Error: No product data found!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              );
            }

            return AddtoCartPage(product: product);
          },
        ),
        GoRoute(
          path: MyRoutes.itempage,
          builder: (context, state) => ItemPage(),
        ),
        GoRoute(
          path: MyRoutes.razorpay,
          builder: (context, state) => RazorpayPage(),
        ),
        GoRoute(
          path: '/order_history',
          builder: (context, state) => const OrderHistoryPage(),
        ),
        GoRoute(
          path: '/payment_methods',
          builder: (context, state) => const PaymentMethodsPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: MyRoutes.profile,
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: MyRoutes.navigate,
          builder: (context, state) => NavigationPage(),
        ),
        GoRoute(
          path: MyRoutes.forgotpasswordpage,
          builder: (context, state) => ForgotPasswordPage(),
        ),
          GoRoute(
            path: MyRoutes.searchpage,
            builder: (context, state) {
              return SearchPage();
            }),
      ],
      redirect: (context, state) {
        final isAuthenticated = _firebaseauth.currentUser != null;
        final isAuthRoute = state.matchedLocation == signuppage ||
            state.matchedLocation == animationpage;

        if (!isAuthenticated && !isAuthRoute) {
          return loginpage;
        }
        if (isAuthenticated && isAuthRoute) {
          return navigate;
        }
        return null;
      },
      errorBuilder: (context, state) {
        return Text(
          "Error: ${state.error}",
        );
      },
    );
  }
}
