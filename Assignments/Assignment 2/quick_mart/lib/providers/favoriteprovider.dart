import '../models/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FavoriteNotifier extends StateNotifier<List<Item>>{
  FavoriteNotifier():super([]);
  void toggleFavorite(Item item){
    if(state.contains(item)){
      state=state.where((i)=>i.id!=item.id).toList();
    }
    else{
      state=[...state,item];
    }
  }
  bool isFavorite(Item item){
    return state.contains(item);
  }
}
final favoriteNotifierProvider=StateNotifierProvider<FavoriteNotifier,List<Item>>((ref){
  return FavoriteNotifier();
});