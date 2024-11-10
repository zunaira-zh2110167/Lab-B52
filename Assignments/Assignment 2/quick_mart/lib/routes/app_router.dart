import 'package:go_router/go_router.dart';
import '../screens/cart_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/shell_screen.dart';

class AppRouter{
  static GoRouter router=GoRouter(
    initialLocation: '/',
    routes:[
      GoRoute(
        path:'/',
        name:'ItemsScreen',
         builder:(context,state)=>ShellScreen(),
         routes:[
         GoRoute(
        path:'/cart',
        name:'CartScreen',
         builder:(context,state)=>CartScreen(),
         ),
         GoRoute(
        path:'/favorites',
        name:'FavoriteScreen',
         builder:(context,state)=>FavoriteScreen(),
         )
         ]
         )
    ] 
  );
}
