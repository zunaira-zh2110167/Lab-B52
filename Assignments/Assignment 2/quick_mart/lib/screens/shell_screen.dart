import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/cart_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/product_screen.dart';
class ShellScreen extends StatefulWidget{
  const ShellScreen({super.key});

  @override
  ShellScreenState createState()=>ShellScreenState();
  }
  class ShellScreenState extends State<ShellScreen>{
    int selectedindex=0;
    final List<Widget>screens=[
      const ItemsScreen(),
      CartScreen(),
      FavoriteScreen()
    ];
    void onItemTapped(int index){
      setState((){
      selectedindex=index;
      });
    }
    @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap:onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store),label:'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label:'Favorites')
        ]
        ),
    );
  }
  }