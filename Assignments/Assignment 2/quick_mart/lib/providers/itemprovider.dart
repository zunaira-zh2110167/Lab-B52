import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';
import '../models/item.dart';

class ItemNotifier extends Notifier<List<Item>> {
  ItemNotifier() : super();

  @override
  List<Item> build() {
    state=[];
    loadItems();
    return state;
  }

  Future<void> loadItems() async {
    try {
      // Load JSON data from assets
      final contents = await rootBundle.loadString('assets/data/products.json');
      final itemList = jsonDecode(contents) as List;
      // Map each item to an Item object and set the state
      state = itemList.map((item) => Item.fromJson(item)).toList();
      print(state);
    } catch (e) {
      print('Error loading items: $e');
      state = [];
    }
  }
  

  void addItem(Item item) {
    // Add a new item to the state
    state = [...state, item];
  }

  List<Item> searchQuery(String query) {
    if (query.isEmpty) {
      return state;
    }
    return state.where((item) {
      final matchesName = item.title.toLowerCase().contains(query.toLowerCase());
      return matchesName;
    }).toList();
  }

  List<Item> searchByCategory(String category) {
    if (category.isEmpty) {
      return state;
    }
    return state.where((item) {
      final matchesCategory = item.category.toLowerCase().contains(category.toLowerCase());
      return matchesCategory;
    }).toList();
  }
}

final itemNotifierProvider = NotifierProvider<ItemNotifier, List<Item>>(ItemNotifier.new);
