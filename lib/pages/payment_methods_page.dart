import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  final List<Map<String, String>> _methods = [
    {'type': 'Card', 'label': 'Visa •••• 4242'},
  ];

  void _addMethod() async {
    final typeController = TextEditingController();
    final labelController = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Payment Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: typeController,
              decoration: const InputDecoration(hintText: 'Type (Card/UPI)'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: labelController,
              decoration: const InputDecoration(
                  hintText: 'Label (e.g. Visa •••• 4242)'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                if (typeController.text.isNotEmpty &&
                    labelController.text.isNotEmpty) {
                  _methods.add({
                    'type': typeController.text,
                    'label': labelController.text
                  });
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Add'))
        ],
      ),
    );

    if (result == true) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Methods',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xff462B9C),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: _addMethod, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _methods.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final m = _methods[index];
          return Dismissible(
            key: ValueKey(m['label']! + index.toString()),
            background: Container(
                color: Colors.red,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(Icons.delete, color: Colors.white)))),
            secondaryBackground: Container(
                color: Colors.red,
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete, color: Colors.white)))),
            onDismissed: (_) {
              setState(() {
                _methods.removeAt(index);
              });
            },
            child: ListTile(
              leading: Icon(
                  m['type'] == 'Card'
                      ? Icons.credit_card
                      : Icons.account_balance_wallet,
                  color: const Color(0xff462B9C)),
              title: Text(m['label'] ?? ''),
              subtitle: Text(m['type'] ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
