
import 'package:flash_news/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/article_provider.dart';
import '../routes/app_routes.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  ArticleScreen({super.key});
  
  @override
  ConsumerState<ArticleScreen> createState() => ArticleScreenState();
}

class ArticleScreenState extends ConsumerState<ArticleScreen> {
  Article?article;
   String selectedCategory='All';
  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(articleNotifierProvider);
    return Column(
     children:[
     const Text(
          'Flash News',
        ),
 Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: DropdownButton<String>(
              value: selectedCategory == 'All' ? null : selectedCategory,
              items: ['All', 'Business', 'Politics', 'Technology', 'Health','Science']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value == 'All Categories' ? null : value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value ?? 'All Categories'; // Default to 'All Categories' if null
                  ref.watch(articleNotifierProvider.notifier).searchByCategory(selectedCategory);
                });
              },
              hint: const Text('Select Category'),
            ),
          ),

        
       
        Expanded(
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
          elevation: 3,
          child: ListTile(
            title: Text(articles[index].headline),
            subtitle: Text(articles[index].writer),
            trailing: Text(articles[index].content)
        )
              );
            },
          
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
              onPressed: () {
                context.pushNamed(AppRouter.newNews.name);
                 
              },
              child:Icon(Icons.add)
          )
        ),

     ]
    );
  }
}


