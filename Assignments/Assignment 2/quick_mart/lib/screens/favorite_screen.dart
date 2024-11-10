import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/product_details_screen.dart';
import '../providers/favoriteprovider.dart';
class FavoriteScreen extends ConsumerWidget{
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final favorites=ref.watch(favoriteNotifierProvider);
    return Scaffold(
      appBar: AppBar(title:const Text('Favorites')),
      body:favorites.isEmpty?const Text('No favorites added yet!'):GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3), 
        itemCount: favorites.length,
        itemBuilder: (context,index){
          final item=favorites[index];
          return Column(
            children: [
             Image.asset('assets/images/${item.imageName}'),
             Text(item.title),
             Text(item.category),
             Text('\$${item.price.toStringAsFixed(2)}'),
             IconButton(onPressed:(){
                    ref.watch(favoriteNotifierProvider.notifier).toggleFavorite(item);
                  }, 
                  icon: const Icon(
                    Icons.delete,color:Colors.red
                    )
                  ),
                  GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>ItemDetailsScreen(item: item))
                    );
                  }
                  ),
            ],
            );
        })
      );
  }
  }