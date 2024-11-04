import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../model/article.dart';

class ArticleRepository {
  Future<List<Article>>  getArticles() async {
    var response = await rootBundle.loadString('assets/data/articles.json');
    var articlesList=jsonDecode(response);
    List<Article>articles=[];
    for(var articleMap in articlesList){
      articles.add(Article.fromJson(articleMap));
    }
    
    return articles;
  }

}