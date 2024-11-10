import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
import '../providers/cartprovider.dart';
import '../providers/favoriteprovider.dart';

class ItemDetailsScreen extends ConsumerWidget {
  final Item item;
  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteNotifierProvider.notifier).isFavorite(item);
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Column(
        children: [
          Image.asset('assets/images/${item.imageName}'), // Correct use of Image.asset
          Column(
            children: [
              Text(item.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(item.category, style: TextStyle(fontSize: 18, color: Colors.grey)),
              Text('\$${item.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, color: Colors.green)),
            ],
          ),
          const SizedBox(height: 20), // Adds space between sections
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(cartNotifierProvider.notifier).addToCart(item); // Use ref.read for actions
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added item to cart')),
                  );
                },
                child: const Text('Add to Cart!'),
              ),
              IconButton(
                onPressed: () {
                  ref.read(favoriteNotifierProvider.notifier).toggleFavorite(item); // Use ref.read here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isFavorite ? 'Removed from favorites' : 'Added to favorites',
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
