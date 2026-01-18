import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class SearchFieldSection extends StatelessWidget {
  const SearchFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
          color: Color(0xffefeeee),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        style: TextStyle(height: 1),
        cursorHeight: 20,
        controller: _searchController,
        textAlign: TextAlign.justify,
        readOnly: true,
        onTap: () => context.push(MyRoutes.searchpage),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
        ),
      ),
    );
  }
}
