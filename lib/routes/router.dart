import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/addtocart_page.dart';
import 'package:food_delivery_app/pages/animation_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/item_page.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static String animationpage = "/";
  static String homepage = "/home";
  static String addtocart = "/add";
  static String itempage = "/item";

  late final GoRouter router;

  MyRoutes() {
    router = GoRouter(
      initialLocation: "/home",
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
          builder: (context, state) => AddtoCartPage(),
        ),
        GoRoute(
          path: MyRoutes.itempage,
          builder: (context, state) => ItemPage(),
        ),
      ],
      errorBuilder: (context, state) {
        return Text("Error: ${state.error}");
      },
    );
  }
}
