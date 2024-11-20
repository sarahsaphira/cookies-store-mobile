import 'package:flutter/material.dart';
import 'package:cookies_store/models/item_entry.dart';

class ItemDetailPage extends StatelessWidget {
  final ItemEntry item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.fields.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Price: ${item.fields.price}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              item.fields.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
