import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cartprovider.dart';
import 'product_details_screen.dart';
class CartScreen extends ConsumerWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final cartitems=ref.watch(cartNotifierProvider);
    final totalPrice=ref.watch(cartNotifierProvider.notifier).totalPrice;
    return Scaffold(
      appBar: AppBar(title:const Text('Cart')),
      body:Column(
        children:[
        Expanded(
        child: cartitems.isEmpty?const Text('Nothing added to cart yet!'):GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3), 
        itemCount: cartitems.length,
        itemBuilder: (context,index){
          final cartitem=cartitems[index];
          return Column(
            children: [
             Image.asset('assets/images/${cartitem.item.imageName}'),
             Text(cartitem.item.title),
             Text(cartitem.item.category),
             Text('\$${cartitem.item.price.toStringAsFixed(2)}'),
                  GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>ItemDetailsScreen(item: cartitem.item))
                    );
                  }
                  ),
            ],
            );
           
        }),
        ),
        Padding(
          padding:const EdgeInsets.all(8.0),
        child: Column(children: [
               Text('\$${totalPrice.toStringAsFixed(2)}'),
               ElevatedButton(onPressed: (){
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Proceeding to checkout')));
               }, 
               child: const Text('Checkout')
               )
            ],
            )
        ),
        ]
      )
      
      );
  }
  }
