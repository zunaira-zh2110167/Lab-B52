import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../routes/app_router.dart';
void main(){
  runApp(ProviderScope(child: QuickMartApp()));
}
class QuickMartApp extends StatelessWidget{
  const QuickMartApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title:'Quick Mart',
      routerConfig: AppRouter.router,
      theme:ThemeData(
        primarySwatch: Colors.green
      )
    );
  }
}
