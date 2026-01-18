import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/api services/api_services.dart';
import 'package:food_delivery_app/API/products models/api_model.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService _api = ApiService();
  List<Product> _allProducts = [];
  List<Product> _results = [];
  bool _loading = true;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    try {
      final products = await _api.fetchProducts();
      if (mounted) {
        setState(() {
          _allProducts = products;
          _results = products;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _onSearchChanged(String q) {
    _query = q.trim();
    if (_query.isEmpty) {
      setState(() => _results = _allProducts);
      return;
    }

    final filtered = _allProducts.where((p) {
      return p.title.toLowerCase().contains(_query.toLowerCase());
    }).toList();

    setState(() => _results = filtered);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _loading
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : _results.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              _query.isEmpty
                                  ? 'No products available'
                                  : 'No results for "$_query"',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: _results.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final p = _results[index];
                              return ListTile(
                                leading: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    p.thumbnail,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Image.asset(
                                        'assets/img/pizza_fries.png'),
                                  ),
                                ),
                                title: Text(
                                  p.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle:
                                    Text('₹${p.price.toStringAsFixed(2)}'),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // Navigate to Add to Cart page with product
                                    context.go(MyRoutes.addtocart, extra: p);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff462B9C),
                                  ),
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
