import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/news_list_screen.dart';
class ShellScreen extends StatefulWidget{
  @override
  ShellScreenState createState()=>ShellScreenState();
  }
  class ShellScreenState extends State<ShellScreen>{
    int selectedindex=0;
    final List<Widget>screens=[
     ArticleScreen()
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
      
    );
  }
  }
