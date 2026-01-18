import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  static final List<Map<String, dynamic>> _sampleOrders = [
    {
      'id': 'ORD-1001',
      'date': '2026-01-10',
      'items': 3,
      'amount': 499.00,
    },
    {
      'id': 'ORD-1002',
      'date': '2026-01-11',
      'items': 1,
      'amount': 199.00,
    },
    {
      'id': 'ORD-1003',
      'date': '2026-01-12',
      'items': 2,
      'amount': 349.50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color(0xff462B9C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _sampleOrders.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final o = _sampleOrders[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xff462B9C),
              child: const Icon(Icons.receipt_long, color: Colors.white),
            ),
            title: Text('${o['id']}  •  ${o['date']}'),
            subtitle: Text('${o['items']} item(s)'),
            trailing: Text('₹${(o['amount'] as double).toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Order ${o['id']}'),
                  content: Text(
                      'Date: ${o['date']}\nItems: ${o['items']}\nAmount: ₹${(o['amount'] as double).toStringAsFixed(2)}'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
