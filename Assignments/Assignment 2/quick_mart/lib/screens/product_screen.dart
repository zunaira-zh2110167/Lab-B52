// screens/product_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/itemprovider.dart';
import '../screens/product_details_screen.dart';
import '../models/item.dart';

class ItemsScreen extends ConsumerStatefulWidget {
  const ItemsScreen({super.key});

  @override
  ItemsScreenState createState() => ItemsScreenState();
}

class ItemsScreenState extends ConsumerState<ItemsScreen> {
  String selectedCategory = 'All Categories'; // Initialize with a default category
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemNotifierProvider); // Use watch to rebuild on changes

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Products',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    ref.watch(itemNotifierProvider.notifier).searchQuery(''); // Clear search
                  },
                ),
              ),
              onChanged: (value) {
                ref.watch(itemNotifierProvider.notifier).searchQuery(value); // Update search query
              },
            ),
          ),

          // Category dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: DropdownButton<String>(
              value: selectedCategory == 'All Categories' ? null : selectedCategory,
              items: ['All Categories', 'Dairy', 'Fruit', 'Vegetable', 'Bakery','Meat','Vegan']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value == 'All Categories' ? null : value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value ?? 'All Categories'; // Default to 'All Categories' if null
                  ref.watch(itemNotifierProvider.notifier).searchByCategory(selectedCategory);
                });
              },
              hint: const Text('Select Category'),
            ),
          ),

          // Items grid
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ItemCard(item: item);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends ConsumerWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDetailsScreen(item: item)),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/images/${item.imageName}'),
            Text(item.title),
            Text('\$${item.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
