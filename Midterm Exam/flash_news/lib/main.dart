import 'package:flash_news/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main(){
  runApp(ProviderScope(child: FlashNewsApp()));
}
class FlashNewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title:'FlashNews',
      routerConfig: AppRouter.router,
      theme:ThemeData(
        primarySwatch: Colors.green
      )
    );
  }
}
