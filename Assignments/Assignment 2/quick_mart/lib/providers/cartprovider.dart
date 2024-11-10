import '../models/cartitem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
class CartNotifier extends StateNotifier<List<CartItem>>{
  CartNotifier():super([]);
  void addToCart(Item item){
    state=[...state,CartItem(item: item)];
  }
  void updateQuantity(CartItem item, int quantity){
    item.quantity=quantity;
    state=[...state];
  }
  double get totalPrice=>state.fold(0,(sum,item)=>sum+item.totalPrice);
 }
final cartNotifierProvider=StateNotifierProvider<CartNotifier,List<CartItem>>((ref){
  return CartNotifier();
});