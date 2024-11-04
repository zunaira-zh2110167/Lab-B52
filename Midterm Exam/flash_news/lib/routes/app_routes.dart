import 'package:flash_news/screens/add_news_article_form.dart';
import 'package:go_router/go_router.dart';

import '../screens/news_list_screen.dart';
import '../screens/shell_screen.dart';

class AppRouter {
  static const news = (name: 'news', path: '/');
  
  static const newNews =
      (name: 'newNews', path: '/news/newNews');
 

  /*
      ShellRouter(
      routes : [],
      builder : (context , state , child) => ShellScreen(child : state.child)
      
      )
  */

  static final router = GoRouter(
    initialLocation: news.path,
    routes: [
      GoRoute(
            name: news.name,
            path: news.path,
            builder: (context, state) => ShellScreen(),  
            routes: [
              GoRoute(
                path: newNews.path,
                name: newNews.name,
                builder: (context, state) => AddNewsArticleForm(),
              ),
              
            ],
          ),
        ],
      );
}

