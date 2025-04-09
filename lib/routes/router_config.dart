import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/addtocart_page.dart';
import 'package:food_delivery_app/pages/animation_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/items_page.dart';
import 'package:food_delivery_app/pages/profile.dart';
import 'package:food_delivery_app/razorpay/razorpay.dart';
import 'package:food_delivery_app/widgets/home_page/bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static String animationpage = "/";
  static String homepage = "/home";
  static String addtocart = "/add";
  static String itempage = "/item";
  static String razorpay = "/razorpay";
  static String profile = "/profile";
  static String navigate = "/nav";

  late final GoRouter router;

  MyRoutes() {
    router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            path: MyRoutes.animationpage,
            builder: (context, state) {
              return AnimationPage();
            }),
        GoRoute(
          path: MyRoutes.homepage,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: MyRoutes.addtocart,
          builder: (context, state) {
            final productMap = state.extra as Map<String, String>?;
            if (productMap == null) {
              return Scaffold(
                body: Center(
                    child: Text(
                  "Error: No product data found!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                )),
              );
            }
            final product = Product.fromMap(productMap);

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
          path: MyRoutes.profile,
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: MyRoutes.navigate,
          builder: (context, state) => NavigationPage(),
        ),
      ],
      errorBuilder: (context, state) {
        return Text(
          "Error: ${state.error}",
        );
      },
    );
  }
}
